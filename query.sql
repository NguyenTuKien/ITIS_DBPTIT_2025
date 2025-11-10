-- 1. Phim còn đang chiếu (điều kiện đơn giản trên 1 bảng Movie)
SELECT MovieId, MovieName, Duration, ReleaseDate, CloseDate
FROM Movie
WHERE CloseDate >= CAST(GETDATE() AS DATE);
GO

-- 2. Phim thỏa nhiều điều kiện (nhiều điều kiện trên 1 bảng Movie)
SELECT MovieId, MovieName, Duration, ReleaseDate, CloseDate
FROM Movie
WHERE Duration BETWEEN 90 AND 150
  AND ReleaseDate >= DATEADD(MONTH,-6,CAST(GETDATE() AS DATE))
  AND CloseDate > ReleaseDate;
GO

-- 3. Top 10 phim mới nhất (sắp xếp trên 1 bảng Movie)
SELECT TOP 10 MovieId, MovieName, ReleaseDate, Duration
FROM Movie
ORDER BY ReleaseDate DESC, Duration DESC;
GO

-- 4. Liệt kê phim và thể loại (INNER JOIN 2 bảng Movie + Genre)
SELECT m.MovieId, m.MovieName, g.GenreName
FROM Movie m
JOIN Genre g ON m.GenreID = g.GenreID;
GO

-- 5. Số vé bán theo suất (LEFT JOIN 2 bảng Show + Ticket)
SELECT s.ShowID, s.ShowDate, s.ShowTime, COUNT(t.TicketID) AS TicketsSold
FROM Show s
LEFT JOIN Ticket t ON s.ShowID = t.ShowID
GROUP BY s.ShowID, s.ShowDate, s.ShowTime
ORDER BY s.ShowDate DESC, s.ShowTime DESC;
GO

-- 6. Hợp danh sách tên (UNION 2 bảng Genre + SeatType)
SELECT GenreName AS Name, N'Genre' AS Source
FROM Genre
UNION
SELECT TypeName AS Name, N'SeatType' AS Source
FROM SeatType;
GO

-- 7. Khách hàng có đánh giá (INTERSECT Customer + Review)
SELECT CustomerID
FROM Customer
WHERE Email IS NOT NULL
INTERSECT
SELECT CustomerID
FROM Review;
GO

-- 8. Khách hàng chưa từng đặt đơn (EXCEPT Customer + Order)
SELECT CustomerID, Fullname
FROM Customer
EXCEPT
SELECT c.CustomerID, c.Fullname
FROM Customer c
JOIN [Order] o ON c.CustomerID = o.CustomerID;
GO

-- 9. Lịch sử đặt vé chi tiết khách hàng (Customer + Order + Ticket + Show + Movie + Hall + Payment)
DECLARE @CustomerID INT = 1;
SELECT c.CustomerID, c.Fullname, o.OrderID, o.OrderTime,
       m.MovieName, s.ShowDate, s.ShowTime, h.Name AS HallName,
       t.Position AS SeatPosition, t.Price, p.Status AS PaymentStatus
FROM Customer c
JOIN [Order] o ON c.CustomerID = o.CustomerID
JOIN Ticket t ON o.OrderID = t.OrderID
JOIN Show s ON t.ShowID = s.ShowID
JOIN Movie m ON s.MovieId = m.MovieId
JOIN Hall h ON t.HallID = h.HallID
JOIN Payment p ON o.OrderID = p.OrderID
WHERE c.CustomerID = @CustomerID
ORDER BY o.OrderTime DESC;
GO

-- 10. Top 10 phim doanh thu + đánh giá (Movie + Genre + Show + Ticket + Review)
SELECT TOP 10 m.MovieId, m.MovieName, g.GenreName,
       COUNT(DISTINCT s.ShowID) AS TotalShows,
       COUNT(t.TicketID) AS TicketsSold,
       ISNULL(SUM(t.Price),0) AS Revenue,
       AVG(CAST(r.Rating AS FLOAT)) AS AvgRating,
       COUNT(r.CustomerID) AS ReviewCount
FROM Movie m
JOIN Genre g ON m.GenreID = g.GenreID
LEFT JOIN Show s ON m.MovieId = s.MovieId
LEFT JOIN Ticket t ON s.ShowID = t.ShowID
LEFT JOIN Review r ON m.MovieId = r.MovieId
GROUP BY m.MovieId, m.MovieName, g.GenreName
ORDER BY Revenue DESC, AvgRating DESC;
GO

-- 11. Doanh thu theo phương thức thanh toán (Payment + Order + Ticket + EWalletPayment + CashPayment + CreditCardPayment)
SELECT CASE
           WHEN ew.PaymentID IS NOT NULL THEN N'Ví điện tử'
           WHEN cp.PaymentID IS NOT NULL THEN N'Tiền mặt'
           WHEN cc.PaymentID IS NOT NULL THEN N'Thẻ tín dụng'
           ELSE N'Khác' END AS PaymentMethod,
       COUNT(p.PaymentID) AS Transactions,
       SUM(t.Price) AS Revenue,
       AVG(t.Price) AS AvgValue
FROM Payment p
LEFT JOIN EWalletPayment ew ON p.PaymentID = ew.PaymentID
LEFT JOIN CashPayment cp ON p.PaymentID = cp.PaymentID
LEFT JOIN CreditCardPayment cc ON p.PaymentID = cc.PaymentID
JOIN [Order] o ON p.OrderID = o.OrderID
JOIN Ticket t ON o.OrderID = t.OrderID
WHERE p.Status = N'Hoàn thành'
GROUP BY CASE
             WHEN ew.PaymentID IS NOT NULL THEN N'Ví điện tử'
             WHEN cp.PaymentID IS NOT NULL THEN N'Tiền mặt'
             WHEN cc.PaymentID IS NOT NULL THEN N'Thẻ tín dụng'
             ELSE N'Khác' END
ORDER BY Revenue DESC;
GO

-- 12. Tỷ lệ lấp đầy phòng chiếu (Hall + Show + Ticket)
SELECT h.HallID, h.Name AS HallName,
       COUNT(DISTINCT s.ShowID) AS TotalShows,
       (h.RowNumber * h.ColumnNumber) AS SeatsPerShow,
       COUNT(t.TicketID) AS TicketsSold,
       (h.RowNumber * h.ColumnNumber * COUNT(DISTINCT s.ShowID)) AS TotalCapacity,
       CAST( COUNT(t.TicketID) * 100.0 /
             NULLIF(CAST(h.RowNumber * h.ColumnNumber * COUNT(DISTINCT s.ShowID) AS DECIMAL(18,2)),0)
           AS DECIMAL(5,2)) AS OccupancyRate
FROM Hall h
LEFT JOIN Show s ON h.HallID = s.HallID
LEFT JOIN Ticket t ON s.ShowID = t.ShowID
GROUP BY h.HallID, h.Name, h.RowNumber, h.ColumnNumber
ORDER BY OccupancyRate DESC;
GO

-- 13. Top khách hàng chi tiêu (Customer + Order + Ticket + Payment)
SELECT TOP 10 c.CustomerID, c.Fullname, c.Email, c.Phone,
       COUNT(DISTINCT o.OrderID) AS TotalOrders,
       COUNT(t.TicketID) AS TotalTickets,
       SUM(t.Price) AS TotalSpent,
       MAX(o.OrderTime) AS LastOrderTime
FROM Customer c
JOIN [Order] o ON c.CustomerID = o.CustomerID
JOIN Payment p ON o.OrderID = p.OrderID AND p.Status = N'Hoàn thành'
JOIN Ticket t ON o.OrderID = t.OrderID
GROUP BY c.CustomerID, c.Fullname, c.Email, c.Phone
ORDER BY TotalSpent DESC;
GO

-- 14. Doanh thu theo nhóm tuổi (Customer + Order + Ticket + Payment)
SELECT CASE
           WHEN DATEDIFF(YEAR, c.DOB, GETDATE()) < 18 THEN N'Dưới 18'
           WHEN DATEDIFF(YEAR, c.DOB, GETDATE()) BETWEEN 18 AND 25 THEN N'18-25'
           WHEN DATEDIFF(YEAR, c.DOB, GETDATE()) BETWEEN 26 AND 35 THEN N'26-35'
           WHEN DATEDIFF(YEAR, c.DOB, GETDATE()) BETWEEN 36 AND 50 THEN N'36-50'
           ELSE N'Trên 50' END AS AgeGroup,
       COUNT(DISTINCT c.CustomerID) AS Customers,
       COUNT(t.TicketID) AS Tickets,
       SUM(t.Price) AS Revenue,
       AVG(t.Price) AS AvgSpending
FROM Customer c
JOIN [Order] o ON c.CustomerID = o.CustomerID
JOIN Payment p ON o.OrderID = p.OrderID AND p.Status = N'Hoàn thành'
JOIN Ticket t ON o.OrderID = t.OrderID
WHERE c.DOB IS NOT NULL
GROUP BY CASE
             WHEN DATEDIFF(YEAR, c.DOB, GETDATE()) < 18 THEN N'Dưới 18'
             WHEN DATEDIFF(YEAR, c.DOB, GETDATE()) BETWEEN 18 AND 25 THEN N'18-25'
             WHEN DATEDIFF(YEAR, c.DOB, GETDATE()) BETWEEN 26 AND 35 THEN N'26-35'
             WHEN DATEDIFF(YEAR, c.DOB, GETDATE()) BETWEEN 36 AND 50 THEN N'36-50'
             ELSE N'Trên 50' END
ORDER BY Revenue DESC;
GO

-- 15. Trạng thái ghế một suất chiếu (Seat + SeatType + Ticket + Show + Hall + Movie)
DECLARE @ShowID INT = 1;
SELECT seat.Position,
       st.TypeName,
       m.MovieName,
       s.ShowDate,
       s.ShowTime,
       h.Name AS HallName,
       CASE WHEN t.TicketID IS NULL THEN N'Còn trống' ELSE N'Đã đặt' END AS SeatStatus
FROM Show s
JOIN Movie m ON s.MovieId = m.MovieId
JOIN Hall h ON s.HallID = h.HallID
JOIN Seat seat ON h.HallID = seat.HallID
JOIN SeatType st ON seat.SeatTypeID = st.SeatTypeID
LEFT JOIN Ticket t ON t.ShowID = s.ShowID AND t.HallID = h.HallID AND t.Position = seat.Position
WHERE s.ShowID = @ShowID
ORDER BY seat.Position;
GO
