CREATE
DATABASE TicketBooth;
GO

USE TicketBooth;
GO

-- Tạo bảng khách hàng (Customer)
CREATE TABLE Customer
(
    CustomerID INT IDENTITY(1,1),
    Fullname   NVARCHAR(100) NOT NULL,
    Gender     NVARCHAR(10),
    Phone      VARCHAR(20),
    Email      VARCHAR(255),
    DOB        DATE,

    CONSTRAINT PK_Customer PRIMARY KEY (CustomerID),

    CONSTRAINT UQ_Customer_Phone UNIQUE (Phone),
    CONSTRAINT UQ_Customer_Email UNIQUE (Email)
);
GO

--Tạo bảng phòng chiếu (Hall)
CREATE TABLE Hall
(
    HallID       INT IDENTITY(1,1),
    Name         NVARCHAR(100) NOT NULL,
    RowNumber    INT NOT NULL,
    ColumnNumber INT NOT NULL,

    CONSTRAINT PK_Hall PRIMARY KEY (HallID)
);
GO

--Tạo bảng loại ghế (SeatType)
CREATE TABLE SeatType
(
    SeatTypeID  INT IDENTITY(1,1),
    TypeName    NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),

    CONSTRAINT PK_SeatType PRIMARY KEY (SeatTypeID)
);
GO

--Tạo bảng chỗ ngồi (Seat)
CREATE TABLE Seat
(
    Position   VARCHAR(3) NOT NULL,
    HallID     INT        NOT NULL,
    SeatTypeID INT        NOT NULL,

    CONSTRAINT PK_Seat PRIMARY KEY (Position, HallID),
    CONSTRAINT FK_Seat_Hall FOREIGN KEY (HallID)
        REFERENCES Hall (HallID),
    CONSTRAINT FK_Seat_SeatType FOREIGN KEY (SeatTypeID)
        REFERENCES SeatType (SeatTypeID)
);
GO

--Tạo bảng thể loại phim (Gerne)
CREATE TABLE Genre
(
    GenreID   INT IDENTITY(1,1),
    GenreName NVARCHAR(100) NOT NULL,

    CONSTRAINT PK_Genre PRIMARY KEY (GenreID)
);

--Tạo bảng phim (Movie)
CREATE TABLE Movie
(
    MovieId     INT IDENTITY(1,1),
    MovieName   NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    Duration    INT,
    ReleaseDate DATE,
    CloseDate   DATE,
    TrailerPath VARCHAR(500),
    PosterPath  VARCHAR(500),
    GenreID     INT NOT NULL,

    CONSTRAINT PK_Movie PRIMARY KEY (MovieId),

    CONSTRAINT FK_Movie_Genre FOREIGN KEY (GenreID)
        REFERENCES Genre (GenreID)
);
GO

--Tạo bảng suất chiếu (Show)
CREATE TABLE Show
(
    ShowID   INT IDENTITY(1,1),
    MovieId  INT NOT NULL,
    HallID   INT NOT NULL,
    ShowTime TIME,
    ShowDate DATE,

    CONSTRAINT PK_Show PRIMARY KEY (ShowID),

    CONSTRAINT FK_Show_Movie FOREIGN KEY (MovieId)
        REFERENCES Movie (MovieId),
    CONSTRAINT FK_Show_Hall FOREIGN KEY (HallID)
        REFERENCES Hall (HallID),

    CONSTRAINT UQ_Show_Hall_Time UNIQUE (HallID, ShowTime, ShowDate)
);
GO

--Tạo bảng đơn vé (Order)
CREATE TABLE [Order]
(
    OrderID
    INT
    IDENTITY
(
    1,
    1
),
    CustomerID INT NOT NULL,
    OrderTime DATETIME,
    CONSTRAINT PK_Order PRIMARY KEY
(
    OrderID
),
    CONSTRAINT FK_Order_Customer FOREIGN KEY
(
    CustomerID
)
    REFERENCES Customer
(
    CustomerID
)
    );
GO

--Tạo bảng thanh toán (Payment)
CREATE TABLE Payment
(
    PaymentID   INT IDENTITY(1,1),
    OrderID     INT NOT NULL,
    PaymentTime DATETIME,
    Status      NVARCHAR(50),

    CONSTRAINT PK_Payment PRIMARY KEY (PaymentID),

    CONSTRAINT FK_Payment_Order FOREIGN KEY (OrderID)
        REFERENCES [Order](OrderID),

    CONSTRAINT UQ_Payment_Order UNIQUE (OrderID)
);
GO

--Tạo bảng vé (Ticket)
CREATE TABLE Ticket
(
    TicketID INT IDENTITY(1,1),
    OrderID  INT        NOT NULL,
    ShowID   INT        NOT NULL,
    HallID   INT        NOT NULL,
    Position VARCHAR(3) NOT NULL,
    Price    DECIMAL(10, 2),

    CONSTRAINT PK_Ticket PRIMARY KEY (TicketID),

    CONSTRAINT FK_Ticket_Order FOREIGN KEY (OrderID)
        REFERENCES [Order](OrderID),

    CONSTRAINT FK_Ticket_Seat FOREIGN KEY (Position, HallID)
        REFERENCES Seat (Position, HallID),

    CONSTRAINT FK_Ticket_Show FOREIGN KEY (ShowID)
        REFERENCES Show (ShowID),

    CONSTRAINT UQ_Ticket_Show_Seat UNIQUE (ShowID, HallID, Position)
);
GO

--Tạo bảng đánh giá (Review)
CREATE TABLE Review
(
    CustomerID INT NOT NULL,
    MovieId    INT NOT NULL,
    Rating     INT NOT NULL,
    Comment    NVARCHAR(MAX),
    ReviewTime DATETIME,

    CONSTRAINT PK_Review PRIMARY KEY (CustomerID, MovieId),

    CONSTRAINT FK_Review_Customer FOREIGN KEY (CustomerID)
        REFERENCES Customer (CustomerID),

    CONSTRAINT FK_Review_Movie FOREIGN KEY (MovieId)
        REFERENCES Movie (MovieId),

    CONSTRAINT CK_Review_Rating CHECK (Rating BETWEEN 1 AND 5)
);
GO

--Tạo bảng thanh toán qua ví điện tử (EWalletPayment)
CREATE TABLE EWalletPayment
(
    PaymentID      INT,
    WalletProvider NVARCHAR(100) NOT NULL,
    PaymentPath    VARCHAR(500),

    CONSTRAINT PK_EWalletPayment PRIMARY KEY (PaymentID),
    CONSTRAINT FK_EWalletPayment_Payment FOREIGN KEY (PaymentID)
        REFERENCES Payment (PaymentID)
        ON DELETE CASCADE
);

--Tạo bảng thanh toán bằng tiền mặt (CashPayment)
CREATE TABLE CashPayment
(
    PaymentID INT,

    CONSTRAINT PK_CashPayment PRIMARY KEY (PaymentID),
    CONSTRAINT FK_CashPayment_Payment FOREIGN KEY (PaymentID)
        REFERENCES Payment (PaymentID)
        ON DELETE CASCADE
);

--Tạo bảng thanh toán bằng thẻ tín dụng (CreditCardPayment)
CREATE TABLE CreditCardPayment
(
    PaymentID INT,
    CardType  NVARCHAR(50),
    CardToken VARCHAR(255) NOT NULL,

    CONSTRAINT PK_CreditCardPayment PRIMARY KEY (PaymentID),
    CONSTRAINT FK_CreditCardPayment_Payment FOREIGN KEY (PaymentID)
        REFERENCES Payment (PaymentID)
        ON DELETE CASCADE
);
