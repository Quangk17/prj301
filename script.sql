USE [master]
GO
drop database UserManagement
go

CREATE DATABASE [UserManagement] 
go
USE [UserManagement]
GO

delete tblUsers  where 1=1
go


CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[isDeleted] [int] NULL
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[tblUsers]
ADD [address] [nvarchar](100) NULL,
    [NameOnCard] [nvarchar](50) NULL,
    [cardNumber] [nvarchar](16) NULL,
    [cardMonth] [nvarchar](2) NULL,
    [cardYear] [nvarchar](4) NULL,
    [cardCode] [nvarchar](3) NULL;

GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE172445', N'LE MINH KHOA', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'ad', N'admin', N'1', N'AD', 1)

INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES 
(N'SE140345', N'Thanh Nguyen', N'1', N'US', 1),
(N'SE140567', N'Hieu Tran', N'1', N'AD', 1),
(N'SE140789', N'Anh Le', N'1', N'US', 1),
(N'SE140901', N'Phuong Nguyen', N'1', N'AD', 1),
(N'SE141023', N'Tuan Pham', N'1', N'US', 1),
(N'SE141345', N'Khanh Do', N'1', N'AD', 1),
(N'SE141567', N'Hoa Vo', N'1', N'US', 1),
(N'SE141789', N'Thanh Le', N'1', N'AD', 1),
(N'SE141901', N'Nam Tran', N'1', N'US', 1),
(N'SE142023', N'Phuong Nguyen', N'1', N'AD', 1),
(N'SE142345', N'Anh Le', N'1', N'US', 1),
(N'SE142567', N'Thao Tran', N'1', N'AD', 1),
(N'SE142789', N'Huy Le', N'1', N'US', 1),
(N'SE142901', N'Tuan Nguyen', N'1', N'AD', 1),
(N'SE143023', N'Phuc Vo', N'1', N'US', 1),
(N'SE143345', N'Thien Nguyen', N'1', N'AD', 1),
(N'SE143567', N'Hung Tran', N'1', N'US', 1),
(N'SE143789', N'Quang Le', N'1', N'AD', 1),
(N'SE143901', N'Tu Nguyen', N'1', N'US', 1),
(N'SE144023', N'Thi Vo', N'1', N'AD', 1),
(N'SE144345', N'Cuong Nguyen', N'1', N'US', 1),
(N'SE144567', N'Tuan Tran', N'1', N'AD', 1),
(N'SE144789', N'Duc Le', N'1', N'US', 1),
(N'SE144901', N'Hien Nguyen', N'1', N'AD', 1),
(N'SE145023', N'Thuy Vo', N'1', N'US', 1),
(N'SE145345', N'Phuong Nguyen', N'1', N'AD', 1),
(N'SE145567', N'Quang Tran', N'1', N'US', 1),
(N'SE145789', N'Cuong Le', N'1', N'AD', 1),
(N'SE145901', N'Thien Nguyen', N'1', N'US', 1),
(N'SE146023', N'Hung Vo', N'1', N'AD', 1)

CREATE TABLE tblOrders (
  orderID INT PRIMARY KEY,
  userID [nvarchar](50) REFERENCES tblUsers(userID),
  orderDate DATE,
  total DECIMAL(16),
);

CREATE TABLE tblProducts (
  productID [nvarchar](50) PRIMARY KEY,
  [name] [nvarchar](50),
  price DECIMAL(16),
  quantity int,
  [imageUrl] [nvarchar](500),
  [isDeleted] int default 0
);

Create table tblOrderDetails(
	orderDetailID INT PRIMARY KEY,
	orderID INT REFERENCES tblOrders(orderID),
	productID [nvarchar](50) REFERENCES tblProducts(productID),
	price DECIMAL(16),
	quantity int
) 

INSERT INTO tblOrders (orderID, userID, orderDate, total)
VALUES
  (1, 'admin', '2023-06-01', 100.00),
  (2, 'admin', '2023-06-02', 75.50),
  (3, 'admin', '2023-06-03', 200.00),
  (4, 'admin', '2023-06-04', 50.25),
  (5, 'admin', '2023-06-05', 300.75),
  (6, 'admin', '2023-06-06', 150.50),
  (7, 'admin', '2023-06-07', 80.00),
  (8, 'admin', '2023-06-08', 120.25),
  (9, 'admin', '2023-06-09', 250.00),
  (10, 'admin', '2023-06-10', 180.50);


-- Adding data to tblOrderDetails
INSERT INTO tblOrderDetails (orderDetailID, orderID, productID, price, quantity)
VALUES
  (1, 1, 1, 10.99, 2),
  (2, 1, 2, 20.49, 1),
  (3, 2, 3, 15.75, 3),
  (4, 2, 4, 5.99, 2),
  (5, 3, 5, 12.50, 4),
  (6, 3, 6, 8.99, 3),
  (7, 4, 7, 18.25, 1),
  (8, 4, 8, 14.50, 2),
  (9, 5, 9, 9.99, 2),
  (10, 5, 10, 7.99, 3);

  INSERT INTO [tblProducts] ([productID], [name], [quantity], [price], [imageUrl])
VALUES 
  ('P1', 'Dell XPS 13', 10, 999.99, N'https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc3/qPVnzr8umKIJxQy8z7Cc4C0Gg9jv5TXipHRZnxuyUsU96G8LvU91KS44Yn_eLF1sOspiO8QwScBsPb_fQboBUWefxE39vTwyFttpjaE8YithcCdhVBnQNSVAVz_aseo2hD1Sbbhy4gq8XbSsjVb7ZYY76.jpg'),
  ('P2', 'Asus ROG Strix G15', 5, 1499.99, N'https://cdn.tgdd.vn/Products/Images/44/299263/asus-rog-strix-gaming-g513rm-r7-hq055w-1.jpg'),
  ('P3', 'Dell Inspiron 15', 7, 899.99, N'https://laptopcare.vn/upload/news/inspiron-15-3511.jpg'),
  ('P4', 'Asus ZenBook Pro', 3, 1199.99, N'https://bizweb.dktcdn.net/100/329/122/products/laptop-asus-zenbook-pro-14-oled-ux6404vv-p4069w-1.jpg?v=1684919889177'),
  ('P5', 'Dell Latitude 14', 12, 1299.99, N'https://cdn.ben.com.vn/Content/Images/Products/208641.5.png'),
  ('P6', 'Asus VivoBook 15', 8, 799.99, N'https://bizweb.dktcdn.net/100/440/968/products/22827-laptop-asus-vivobook-pro-15-oled-a1505va-l1114w-7-jpg-v-1680675976340.jpg?v=1681693347623'),
  ('P7', 'Dell G3 15', 15, 1399.99, N'https://fptshop.com.vn/Uploads/Originals/2020/9/9/637352595658403786_dell-g3500-den-1.png'),
  ('P8', 'Asus TUF Gaming A15', 4, 1099.99, N'https://anphat.com.vn/media/product/43381_laptop_asus_tuf_gaming_a15_fa506icb_hn355w__1_.jpg'),
  ('P9', 'Dell Precision 15', 9, 999.99, N'https://product.hstatic.net/1000374492/product/1_f020073143d742edb9789934361b68b8_grande.jpg'),
  ('P10', 'Asus ROG Zephyrus G14', 6, 1499.99, N'https://xgear.net/wp-content/uploads/2022/12/2199w-2.png');
