-- Insert dữ liệu vào bảng Customer (Khách hàng)
INSERT INTO Customer (Fullname, Gender, Phone, Email, DOB)
VALUES (N'Nguyễn Văn An', N'Nam', '0901234567', 'nguyenvanan@gmail.com', '1990-05-15'),
       (N'Trần Thị Bình', N'Nữ', '0902345678', 'tranthibinh@gmail.com', '1992-08-20'),
       (N'Lê Hoàng Cường', N'Nam', '0903456789', 'lehoangcuong@gmail.com', '1988-03-10'),
       (N'Phạm Thị Dung', N'Nữ', '0904567890', 'phamthidung@gmail.com', '1995-11-25'),
       (N'Hoàng Văn Em', N'Nam', '0905678901', 'hoangvanem@gmail.com', '1993-07-08'),
       (N'Vũ Thị Phương', N'Nữ', '0906789012', 'vuthiphuong@gmail.com', '1991-12-30'),
       (N'Đỗ Minh Giang', N'Nam', '0907890123', 'dominggiang@gmail.com', '1989-04-18'),
       (N'Bùi Thị Hoa', N'Nữ', '0908901234', 'buithihoa@gmail.com', '1994-09-22'),
       (N'Phan Văn Inh', N'Nam', '0909012345', 'phanvaninh@gmail.com', '1987-01-14'),
       (N'Lý Thị Kim', N'Nữ', '0910123456', 'lythikim@gmail.com', '1996-06-05'),
       (N'Trương Văn Long', N'Nam', '0911234567', 'truongvanlong@gmail.com', '1990-10-12'),
       (N'Ngô Thị Mai', N'Nữ', '0912345678', 'ngothimai@gmail.com', '1993-02-28');
GO



-- Insert dữ liệu vào bảng Genre (Thể loại phim)
INSERT INTO Genre (GenreName) VALUES
    (N'Hành động'),
    (N'Hài kịch'),
    (N'Kinh dị'),
    (N'Lãng mạn'),
    (N'Khoa học viễn tưởng'),
    (N'Phiêu lưu'),
    (N'Hoạt hình'),
    (N'Tâm lý'),
    (N'Tài liệu'),
    (N'Chiến tranh'),
    (N'Thriller'),
    (N'Gia đình');
GO

-- Insert dữ liệu vào bảng Movie (Phim)
INSERT INTO Movie (MovieName, Description, Duration, ReleaseDate, CloseDate, TrailerPath, PosterPath, GenreID) VALUES
    (N'Người Nhện: Không Còn Nhà', N'Peter Parker phải đối mặt với hậu quả khi danh tính bị tiết lộ', 148, '2024-01-15', '2024-03-15', '/trailers/spiderman.mp4', '/posters/spiderman.jpg', 1),
    (N'Cua Lại Vợ Bầu', N'Câu chuyện hài hước về một ông chồng cố gắng giành lại trái tim người vợ bầu', 110, '2024-02-01', '2024-04-01', '/trailers/cualai.mp4', '/posters/cualai.jpg', 2),
    (N'Ma Da', N'Phim kinh dị về những bí ẩn đáng sợ trong một ngôi làng cổ', 95, '2024-01-20', '2024-03-20', '/trailers/mada.mp4', '/posters/mada.jpg', 3),
    (N'Đào, Phở và Piano', N'Câu chuyện tình yêu lãng mạn trong bối cảnh Hà Nội xưa', 122, '2024-02-10', '2024-04-10', '/trailers/dao.mp4', '/posters/dao.jpg', 4),
    (N'Avatar: The Way of Water', N'Jake Sully và gia đình khám phá thế giới đại dương của Pandora', 192, '2024-01-05', '2024-03-05', '/trailers/avatar.mp4', '/posters/avatar.jpg', 5),
    (N'Indiana Jones 5', N'Cuộc phiêu lưu cuối cùng của nhà khảo cổ huyền thoại', 154, '2024-02-15', '2024-04-15', '/trailers/indiana.mp4', '/posters/indiana.jpg', 6),
    (N'Turning Red', N'Cô gái biến thành gấu trúc đỏ khi xúc động', 100, '2024-01-25', '2024-03-25', '/trailers/turning.mp4', '/posters/turning.jpg', 7),
    (N'The Fabelmans', N'Câu chuyện trưởng thành của một nhà làm phim trẻ', 151, '2024-02-20', '2024-04-20', '/trailers/fabelmans.mp4', '/posters/fabelmans.jpg', 8),
    (N'Mai', N'Phim tâm lý về một người phụ nữ tìm lại chính mình', 131, '2024-02-25', '2024-04-25', '/trailers/mai.mp4', '/posters/mai.jpg', 8),
    (N'Dune: Part Two', N'Hành trình của Paul Atreides tiếp tục trên hành tinh sa mạc', 166, '2024-03-01', '2024-05-01', '/trailers/dune.mp4', '/posters/dune.jpg', 5),
    (N'Oppenheimer', N'Câu chuyện về người cha của bom nguyên tử', 180, '2024-01-10', '2024-03-10', '/trailers/oppenheimer.mp4', '/posters/oppenheimer.jpg', 10),
    (N'Barbie', N'Barbie rời Barbieland để khám phá thế giới thực', 114, '2024-02-05', '2024-04-05', '/trailers/barbie.mp4', '/posters/barbie.jpg', 2);
GO



-- Insert dữ liệu vào bảng Hall (Phòng chiếu)
INSERT INTO Hall (Name, RowNumber, ColumnNumber) VALUES
    (N'Phòng VIP 1', 8, 10),
    (N'Phòng VIP 2', 8, 10),
    (N'Phòng Standard 1', 10, 12),
    (N'Phòng Standard 2', 10, 12),
    (N'Phòng Standard 3', 10, 12),
    (N'Phòng IMAX', 12, 15),
    (N'Phòng 4DX', 8, 10),
    (N'Phòng Deluxe 1', 9, 11),
    (N'Phòng Deluxe 2', 9, 11),
    (N'Phòng Standard 4', 10, 12),
    (N'Phòng Couple', 6, 8),
    (N'Phòng Premium', 8, 12);
GO


-- Insert dữ liệu vào bảng SeatType (Loại ghế)
INSERT INTO SeatType (TypeName, Description) VALUES
    (N'VIP', N'Ghế VIP cao cấp, rộng rãi với chất liệu da'),
    (N'Standard', N'Ghế tiêu chuẩn thoải mái'),
    (N'Couple', N'Ghế đôi dành cho cặp đôi'),
    (N'IMAX', N'Ghế chuyên dụng cho phòng IMAX'),
    (N'4DX', N'Ghế chuyển động đặc biệt cho trải nghiệm 4DX'),
    (N'Deluxe', N'Ghế cao cấp với tựa đầu điều chỉnh'),
    (N'Premium', N'Ghế hạng sang với massage'),
    (N'Economy', N'Ghế phổ thông giá rẻ'),
    (N'Sweetbox', N'Ghế đôi riêng tư cho cặp đôi'),
    (N'Recliner', N'Ghế ngả điện thoải mái'),
    (N'Kids', N'Ghế thiết kế cho trẻ em'),
    (N'Wheelchair', N'Vị trí dành cho người khuyết tật');
GO


-- Insert dữ liệu vào bảng Seat (Ghế ngồi) - Mẫu cho phòng 1
INSERT INTO Seat (Position, HallID, SeatTypeID) VALUES
    ('A1', 1, 1), ('A2', 1, 1), ('A3', 1, 1), ('A4', 1, 1), ('A5', 1, 1),
    ('B1', 1, 1), ('B2', 1, 1), ('B3', 1, 1), ('B4', 1, 1), ('B5', 1, 1),
    ('C1', 2, 2), ('C2', 2, 2), ('C3', 2, 2), ('C4', 2, 2), ('C5', 2, 2),
    ('D1', 3, 2), ('D2', 3, 2), ('D3', 3, 2), ('D4', 3, 2), ('D5', 3, 2),
    ('E1', 4, 3), ('E2', 4, 3), ('E3', 4, 3), ('E4', 4, 3), ('E5', 4, 3),
    ('F1', 5, 4), ('F2', 5, 4), ('F3', 5, 4), ('F4', 5, 4), ('F5', 5, 4),
    ('G1', 6, 4), ('G2', 6, 4), ('G3', 6, 4), ('G4', 6, 4), ('G5', 6, 4),
    ('H1', 7, 5), ('H2', 7, 5), ('H3', 7, 5), ('H4', 7, 5), ('H5', 7, 5);
GO



-- Insert dữ liệu vào bảng Show (Suất chiếu)
INSERT INTO Show (MovieId, HallID, ShowTime, ShowDate) VALUES
    (1, 1, '09:00:00', '2024-03-01'),
    (1, 2, '14:30:00', '2024-03-01'),
    (2, 3, '10:00:00', '2024-03-01'),
    (3, 4, '16:00:00', '2024-03-01'),
    (4, 5, '18:30:00', '2024-03-01'),
    (5, 6, '20:00:00', '2024-03-01'),
    (6, 1, '11:00:00', '2024-03-02'),
    (7, 2, '15:00:00', '2024-03-02'),
    (8, 3, '19:00:00', '2024-03-02'),
    (9, 4, '21:00:00', '2024-03-02'),
    (10, 5, '12:30:00', '2024-03-03'),
    (11, 6, '17:00:00', '2024-03-03'),
    (12, 1, '22:00:00', '2024-03-03');
GO



-- Insert dữ liệu vào bảng Order (Đơn vé)
INSERT INTO [Order] (CustomerID, OrderTime) VALUES
    (1, '2024-02-28 10:30:00'),
    (2, '2024-02-28 11:45:00'),
    (3, '2024-02-28 14:20:00'),
    (4, '2024-02-28 16:00:00'),
    (5, '2024-02-29 09:15:00'),
    (6, '2024-02-29 12:30:00'),
    (7, '2024-02-29 15:45:00'),
    (8, '2024-02-29 18:00:00'),
    (9, '2024-03-01 08:30:00'),
    (10, '2024-03-01 10:00:00'),
    (11, '2024-03-01 13:20:00'),
    (12, '2024-03-01 17:30:00');
GO


-- Insert dữ liệu vào bảng Payment (Thanh toán)
INSERT INTO Payment (OrderID, PaymentTime, Status) VALUES
    (1, '2024-02-28 10:35:00', N'Hoàn thành'),
    (2, '2024-02-28 11:50:00', N'Hoàn thành'),
    (3, '2024-02-28 14:25:00', N'Hoàn thành'),
    (4, '2024-02-28 16:05:00', N'Đang xử lý'),
    (5, '2024-02-29 09:20:00', N'Hoàn thành'),
    (6, '2024-02-29 12:35:00', N'Hoàn thành'),
    (7, '2024-02-29 15:50:00', N'Hoàn thành'),
    (8, '2024-02-29 18:05:00', N'Thất bại'),
    (9, '2024-03-01 08:35:00', N'Hoàn thành'),
    (10, '2024-03-01 10:05:00', N'Hoàn thành'),
    (11, '2024-03-01 13:25:00', N'Hoàn thành'),
    (12, '2024-03-01 17:35:00', N'Hoàn thành');
GO


-- Insert dữ liệu vào bảng Ticket (Vé)
INSERT INTO Ticket (OrderID, ShowID, HallID, Position, Price) VALUES
    (1, 1, 1, 'A1', 150000.00),
    (1, 1, 1, 'A2', 150000.00),
    (2, 2, 2, 'C1', 120000.00),
    (3, 3, 3, 'D1', 100000.00),
    (4, 4, 4, 'E1', 130000.00),
    (5, 5, 5, 'F1', 140000.00),
    (6, 6, 6, 'G1', 200000.00),
    (7, 7, 1, 'B1', 150000.00),
    (8, 8, 2, 'C2', 120000.00),
    (9, 9, 3, 'D2', 100000.00),
    (10, 10, 4, 'E2', 130000.00),
    (11, 11, 5, 'F2', 140000.00),
    (12, 12, 1, 'B2', 150000.00);
GO


-- Insert dữ liệu vào bảng Review (Đánh giá)
INSERT INTO Review (CustomerID, MovieId, Rating, Comment, ReviewTime) VALUES
    (1, 1, 5, N'Phim rất hay và cảm động', '2024-03-01 15:30:00'),
    (2, 2, 4, N'Hài hước và vui nhộn', '2024-03-01 16:00:00'),
    (3, 3, 3, N'Khá đáng sợ nhưng cốt truyện hơi yếu', '2024-03-01 18:00:00'),
    (4, 4, 5, N'Tuyệt vời! Rất lãng mạn', '2024-03-01 20:00:00'),
    (5, 5, 5, N'Hình ảnh đẹp xuất sắc', '2024-03-02 10:00:00'),
    (6, 6, 4, N'Phim phiêu lưu hấp dẫn', '2024-03-02 12:00:00'),
    (7, 7, 5, N'Phim hoạt hình ý nghĩa cho cả gia đình', '2024-03-02 14:00:00'),
    (8, 8, 4, N'Câu chuyện chạm đến trái tim', '2024-03-02 16:00:00'),
    (9, 9, 5, N'Diễn xuất xuất sắc', '2024-03-02 21:00:00'),
    (10, 10, 5, N'Bom tấn sci-fi đỉnh cao', '2024-03-03 14:00:00'),
    (11, 11, 4, N'Phim lịch sử sâu sắc', '2024-03-03 19:00:00'),
    (12, 12, 3, N'Vui nhưng hơi nhạt', '2024-03-04 10:00:00');
GO


-- Insert dữ liệu vào bảng EWalletPayment (Thanh toán ví điện tử)
INSERT INTO EWalletPayment (PaymentID, WalletProvider, PaymentPath) VALUES
    (1, N'MoMo', '/payments/ewallet/momo_001.json'),
    (2, N'ZaloPay', '/payments/ewallet/zalopay_001.json'),
    (5, N'VNPay', '/payments/ewallet/vnpay_001.json'),
    (9, N'MoMo', '/payments/ewallet/momo_002.json');
GO


-- Insert dữ liệu vào bảng CashPayment (Thanh toán tiền mặt)
INSERT INTO CashPayment (PaymentID) VALUES
    (3),
    (6),
    (10),
    (11);
GO


-- Insert dữ liệu vào bảng CreditCardPayment (Thanh toán thẻ tín dụng)
INSERT INTO CreditCardPayment (PaymentID, CardType, CardToken) VALUES
    (7, N'Visa', 'tok_visa_4532123456789012'),
    (12, N'MasterCard', 'tok_mc_5412345678901234');
GO
