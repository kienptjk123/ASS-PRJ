CREATE DATABASE Assignment;
USE Assignment;
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NOT NULL,
	[user_pass] [nvarchar](255) NOT NULL,
	[isAdmin] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO [dbo].[users] ([user_name], [user_email], [user_pass], [isAdmin])
VALUES ('Kien', 'nguyentrungkien12@example.com', '123', 'false');
INSERT INTO [dbo].[users] ([user_name], [user_email], [user_pass], [isAdmin])
VALUES ('trungkien', 'nguyentrungkien171004@gmail.com', '123', 'true');

INSERT INTO [dbo].[users] ([user_name], [user_email], [user_pass], [isAdmin])
VALUES ('nguyentrungkien', 'nguyentrungkien@gmail.com', '123', 'false');

INSERT INTO [dbo].[users] ([user_name], [user_email], [user_pass], [isAdmin])
VALUES ('trungkiennguyen', 'nguyentrungkien17@gmail.com', '123', 'false');

INSERT INTO [dbo].[users] ([user_name], [user_email], [user_pass], [isAdmin])
VALUES ('ng', 'nguyentrungkien111@gmail.com', '123456', 'true');

INSERT INTO [dbo].[users] ([user_name], [user_email], [user_pass], [isAdmin])
VALUES ('uyen', 'nguyentrungkien172222@gmail.com', '1234567', 'false');

INSERT INTO [dbo].[users] ([user_name], [user_email], [user_pass], [isAdmin])
VALUES ('dsdfsdfsdfuyen', 'nguyentrungkien172221232@gmail.com', '1234567123', 'false');
INSERT INTO [dbo].[users] ([user_name], [user_email], [user_pass], [isAdmin])
VALUES ('dsdfsdfsdfuyenqưe', 'nguyentrungkien17222@gmail.com', '123456712aa3', 'false');
INSERT INTO [dbo].[users] ([user_name], [user_email], [user_pass], [isAdmin])
VALUES ('dsdfqn', 'nguyentrungkien172221232@gmail.com', '123456712ww3', 'false');

CREATE TABLE [dbo].[bill](
	[bill_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[total] [money] NOT NULL,
	[address] [ntext] NOT NULL,
	[date] [date] NOT NULL,
	[phone] [bigint] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [dbo].[bill_detail](
	[detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[bill_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

select b.bill_id, b.date, b.total, b.address, b.phone from bill b where user_id = 1

CREATE TABLE Categories (
    id varchar(10) PRIMARY KEY,
    name nvarchar(max) NOT NULL,
);

INSERT INTO Categories (id, name) VALUES 
('C001', N'Đồng hồ'),
('C002', N'Áo thun'),
('C003', N'Điện thoại');

CREATE TABLE Products(
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	id varchar(10),
	[QuantityPerUnit] [nvarchar](100) NULL,
	[UnitPrice] [money] NULL,
	[QuantitySold] [int] NULL,
	[StarRating] [smallint] NULL,
	[Discontinued] [bit] NULL,
	[image] [nvarchar](max) NULL,
	[describe] [nvarchar](max) NULL,
	[releaseDate] [date] NULL,
	[Discount] [float] NULL,
	[status] bit,
	CONSTRAINT [PK_Products] PRIMARY KEY([ProductID]),
)

INSERT INTO Products (
    [ProductName], id, [QuantityPerUnit],[UnitPrice], [QuantitySold], [StarRating], [Discontinued],[image],[describe],[releaseDate],[Discount],[status]
	)
VALUES 
	--1
	(N'Điện thoại Apple iPhone 13 128GB','Dien thoai',  '20', 1030, 20 ,5, 0, 'images/products/1-1.jpg, images/products/1-2.jpg', 
	N'Thông số kỹ thuật:
	Màn hình: OLED6.1"Super Retina XDR
	Hệ điều hành: iOS 15
	Camera sau: 2 camera 12 MP
	Camera trước: 12 MP
	Chip: Apple A15 Bionic
	RAM: 4 GB
	Bộ nhớ trong: 128 GB
	SIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G
	Pin, Sạc: 20 W
	Bộ sản phẩm bao gồm: thân máy, sách hướng dẫn,...
	Thông tin bảo hành
	Bảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.', '2024-06-17',0.2, 1),  
	(N'Đồng hồ nam CRRJU CR8940 dây thép cao cấp','Dong ho',  '20', 100, 20 ,3, 0, 'images/products/18-1.jpg, images/products/18-2.jpg', 
	N'THÔNG TIN SẢN PHẨM
	Thương hiệu đồng hồ: CRRJU
	Kính thước mặt: 40mm
	Độ dày: 7mm
	Chiều dài dây: 24cm
	Chiều rộng dây: 20mm
	Bộ máy: Time Module quartz movement (Japan Made)
	Mặt kính: Hardlex
	Chống nước: 3ATM (rửa tay, đi mưa)
	Bảo hành: 12 tháng
	Lưu ý: KHÔNG nhấn nút trong nước hoặc sử dụng các hoạt động dưới nước trong thời gian dài như bơi lặn, ngâm...
	#A100', '2024-06-18',0.2, 1),


(N'Áo Polo nam HEBOZ vải cotton pha co giãn 4 chiều đẹp - 00000673','Ao thun',  '20', 223, 20 ,4, 0, 'images/products/34-1.jpg, images/products/34-2.jpg', 
	N'Áo Thun ngắn tay unisex Tie Dye, form oversize, vải cotton loang mầu 2SClothing.
Thông tin sản phẩm
- Kiểu dáng: Áo thun nam nữ oversize
- Màu sắc: Tie Dye Hồng
- Chất liệu: vải thun cotton cao cấp, độ co giãn tốt, mềm mịn, thoáng mát, không nhăn, không xù
- Đường may tỉ mỉ, chắc chắn, không chỉ thừa
- Mặc ở nhà, đi học hay đi chơi hoặc khi vận động thể thao đều siêu hợp nha. Mix cũng quần jeans, chân váy,… được ngay set đồ cá tính
- Thiết kế hiện đại, trẻ trung, năng động
Thông số chọn size:
Size S: 1m45-1m50 (41-45kg)
Size M: 1m50-1m60 (46-53kg)
Size L: 1m60-1m65 (53-62kg)
Size XL: 1m65- 1m75 (63-74kg)
(Bảng size mang tính chất tham khảo và phù hợp 80-90% sở thích mặc của bạn. Các bạn muốn chọn size phù hợp có thể inbox cho shop nhé)', '2024-06-18',0.15, 1),

--2 
(N'Điện thoại Xiaomi Redmi 9A 2GB/32GB - Hàng chính hãng','Dien thoai',  '20', 520, 20 ,4, 0, 'images/products/2-1.jpg, images/products/2-2.jpg', 
	N'Bộ sản phẩm bao gồm: Thân máy, sạc, cáp USB, sách hướng dẫn.
Camera
- 13MP camera chính
- Khẩu độ ƒ/2.2, AF
- Đèn flash đơn
- Chế độ kính vạn hoa
- 5MP camera trước
- Khẩu độ ƒ/2.2
- Chế độ chân dung
Thiết kế
- Màn hình giọt nước 6.53HD
- Sạc kèm trong hộp 10W', '2024-06-18',0.4, 1),
(N'Đồng hồ thông minh TZUZL T2pro theo dõi sức khỏe kèm phụ kiện cao cấp','Dong ho',  '20', 200, 20 ,4, 0, 'images/products/19-1.jpg, images/products/19-2.jpg', 
	N'Thông số cơ bản:
Trọng lượng: 140g
Màu sắc: Đen, vàng, trắng
Chức năng chính: Cuộc gọi Bluetooth, điều khiển bằng giọng nói, quay số tùy chỉnh, dự báo thời tiết, điều khiển âm nhạc, đếm bước, nhịp tim, giấc ngủ, ít vận động, quãng đường, oxy trong máu, huyết áp, tìm kiếm, calo, đẩy tin nhắn
Hệ thống tương thích: Android4.4 (bao gồm) ở trên,
Kích thước màn hình: 1.28 inch Thông số kết nối:
Các tính năng của phần mềm: Tải ảnh, đếm bước tìm kiếm di động, calo, Bluetooth, thông tin, chờ trong 30 ngày', '2024-06-12',0.2, 1),

(N'Áo sơ mi nam nữ tay ngắn chất nhung tăm cao cấp kiểu dáng','Ao thun',  '20', 125, 45 ,5, 0, 'images/products/35-1.jpg, images/products/35-2.jpg', 
	N'I. SHOP CAM KẾT
- Sản phẩm Áo sơ mi nhung tăm tay lỡ form rộng giống mô tả 100%
- Hình ảnh sản phẩm là ảnh thật, các hình hoàn toàn do shop tự thiết kế.
- Kiểm tra  cẩn thận trước khi gói hàng giao cho Quý Khách
- Hàng có sẵn, giao hàng ngay khi nhận được đơn 
- Hoàn tiền nếu sản phẩm không giống với mô tả
- Chấp nhận đổi hàng khi size không vừa trong 3 ngày.
II. HỖ TRỢ ĐỔI TRẢ THEO QUY ĐỊNH CỦA SHOPEE
- Điều kiện áp dụng (trong vòng 2 ngày kể từ khi nhận sản phẩm) 
- Hàng hoá bị rách, in lỗi, bung chỉ, và các lỗi do vận chuyển hoặc do nhà sản xuất.
', '2024-06-12',0.11, 1),

--3
 
(N'ĐIỆN THOẠI VSMART ACTIVE 3 6GB/64GB - HÀNG CHÍNH HÃNG','Dien thoai',  '20', 450, 20 ,3, 0, 'images/products/3-1.jpg, images/products/3-2.jpg', 
	N'Điện Thoại Vsmart Active 3 6GB/64GB - Hàng Chính Hãng
Bộ sản phẩm bao gồm: Thân máy, sạc, cáp USB, tai nghe, ốp lưng, dụng cụ lấy sim, sách hướng dẫn sử dụng.

Chất sang chảnh, chuẩn màn hình
Màn hình sống động 6.39 AMOLED tràn viền
Camera Selfie trượt 16MP ấn tượng, đầy mê hoặc
Bộ 3 Camera AI 48MP siêu chụp bóng đêm
Thiết kế mặt lưng tràn ánh sáng
Nổi bật trong đêm sắc màu. Lấy cảm hứng từ sắc đêm huyền ảo, được chế tác tinh xảo tạo nên mặt lưng 3D chuyển màu khi tương tác với ánh sáng. Với 4 màu sắc Xanh Sapphire, Xanh Lục Bảo, Tím Ngọc và Đen Thạch Anh, sẽ khiến bạn trở bạn trở thành tâm điểm của sự chú ý
Thật ấn tượng với camera selfie sẽ tự động bật lên và thu lại theo thao tác chụp ảnh selfie cùng thuật toán làm đẹp AI Beauty, ảnh selfie cực kì thú vị
Kích thước 66.25 x 75.62 x 8.83 (mm)
', '2024-06-21',0.3, 1),
(N'Đồng Hồ Thông Minh SKMEI Ip68 4G Rom + 1G Ram Có Kết Nối Bluetooth 400MAh','Dong ho',  '20', 100, 20 ,5, 0, 'images/products/20-1.jpg, images/products/20-2.jpg', 
	N'✅Chào mừng bạn đến với “Cửa hàng chính thức SKMEI ”
✅Chuyên về đồng hồ SKMEI.

✅Giao hàng: Đơn hàng sẽ được chuyển trong vòng 12h.

✅Đến: 5 đến 12 ngày làm việc sau khi giao hàng.

✅Hậu mãi: Giải pháp tốt nhất cho các vấn đề của bạn.

✅Hy vọng bạn thích mua sắm của bạn.', '2024-07-23',0.18, 1),
(N'Áo Thun Nam Nữ Raglan Phối Line Tay Hot Trend Form Rộng Tay Lỡ Unisex Top Cổ Tròn','Ao thun',  '20', 260, 20 ,3, 0, 'images/products/36-1.jpg, images/products/36-2.jpg', 
	N'Tên sản phẩm: Áo Thun Nam Nữ Raglan Phối Line Tay Hot Trend Form Rộng Tay Lỡ Unisex Top Cổ Tròn
- Áo Thun, Áo Phông Unisex tay lỡ là item không thể thiếu trong tủ đồ vì sự thoải mái, dễ chịu, lại rất dễ phối đồ.
- Áo tay lỡ được làm bằng chất liệu co giãn, cực kì đẹp, vải rất mát, sờ mịn tay.
- Áo thun tay lỡ unisex thích hợp với cả nam và nữ. Mặc làm áo thun cặp, áo nhóm rất phù hợp.
- Áo thun tay lỡ form rộng dễ dàng phối đồ, thời trang phong cách Hàn Quốc.
- Hàng sản xuất tại xưởng, đảm bảo chất lượng.
- Chất liệu: thun co giãn, vải mềm, vải mịn, thoáng mát.
- Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn.
- Phù hợp phối nhiều màu.
- Thiết kế trẻ trung, năng động.', '2024-06-20',0.15, 1),

--4
(N'CHÍNH HÃNG I14 Pro Max 256GB Hệ điều Hành Android đa Chức Năng','Dien thoai',  '20', 1250, 20 ,2, 0, 'images/products/5-1.jpg, images/products/5-2.jpg', 
	N'Thông số kỹ thuật:
	Màn hình: OLED6.1"Super Retina XDR
	Hệ điều hành: iOS 15
	Camera sau: 2 camera 12 MP
	Camera trước: 12 MP
	Chip: Apple A15 Bionic
	RAM: 4 GB
	Bộ nhớ trong: 128 GB
	SIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G
	Pin, Sạc: 20 W
	Bộ sản phẩm bao gồm: thân máy, sách hướng dẫn,...
	Thông tin bảo hành
	Bảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.', '2024-06-11',0.5, 1),

(N'Apple Watch Ultra 2 GPS + Cellular 49mm Ocean Band','Dong ho',  '20', 2395, 20 ,1, 0, 'images/products/21-1.jpg, images/products/21-2.jpg', 
	N'Chất liệu dây:
 Silicone | Dây vải chuyên biệt (Alpine Loop , Trail Loop)
Chất liệu mặt: Kính Sapphire
Chất liệu khung viền: Titanium
Độ dài dây: 13 - 20 cm
Khả năng thay dây: Có
Kích thước, khối lượng: Dài 49 mm - Ngang 44 mm - Dày 14.4 mm - Nặng 61.4 g
Sim & nghe gọi: eSIM
Nghe gọi qua eSIM (nghe gọi độc lập không cần điện thoại)
Tiện ích đặc biệt: Màn hình luôn hiển thị, Nghe nhạc, Phát hiện té ngã
Kết nối bluetooth với tai nghe
Chống nước / Kháng nước:', '2024-06-02',0.12, 1),
(N'Áo thun nam, áo phông nam tay ngắn cổ tròn chất thun lạnh co giãn 4 chiều hình thành phố alex cool','Ao thun',  '20', 300, 20 ,4, 0, 'images/products/37-1.jpg, images/products/37-2.jpg', 
N'Luôn luôn cập nhật những mẫu mã mới , đa dạng – ALEX COOL e hứa hẹn sẽ luôn đem lại cho bạn những sản phẩm thời trang ưng ý và hoàn hảo nhất.
- Về sản phẩm: Shop cam kết cả về CHẤT LIỆU cũng như HÌNH DÁNG ( đúng với những gì được nêu bật trong phần mô tả sản phẩm). 
- Về giá cả : Shop nhập với số lượng nhiều và trực tiếp nên chi phí sẽ là RẺ NHẤT nhé.-
- Thời gian chuẩn bị hàng: Hàng có sẵn, thời gian chuẩn bị tối ưu nhất. 
 Shop Buôn Sỉ Áo Thun Nam Tay Ngắn In Họa Tiết 
MÔ TẢ CHI TIẾT SẢN PHẨM
📢 Kích cỡ :* Chất Liệu :  
- Chất thun lạnh , chất vải mềm , mịn , mặc thoải mái , đường chỉ may chắc chắn , không bị giản , nhão)', '2024-04-18',0.15, 1),

--5
(N'Máy tính bảng Apple iPad mini 6 8.3-inch Wi-Fi 64GB','Dien thoai',  '20', 2300, 20 ,5, 0, 'images/products/6-1.jpg, images/products/6-2.jpg', 
	N'iPad mini mới. Thiết kế màn hình toàn phần với màn hình Liquid Retina 8.3 inch.1 Chip A15 Bionic mạnh mẽ với Neural Engine. Camera trước Ultra Wide 12MP với tính năng Trung Tâm Màn Hình. Cổng kết nối USB-C. Mạng 5G siêu nhanh (2). Ghi chú, đánh dấu tài liệu hoặc phác thảo ngay khi những ý tưởng lớn xuất hiện trong đầu với Apple Pencil (thế hệ thứ 2) có khả năng gắn kết bằng nam châm và sạc không dây (3).
Tính năng nổi bật
•	Màn hình Liquid Retina 8.3 inch tuyệt đẹp với True Tone và dải màu rộng (1)
•	Chip A15 Bionic với Neural Engine
•	Xác thực bảo mật với Touch ID
•	Camera sau Wide 12MP, camera trước Ultra Wide 12MP với tính năng Trung Tâm Màn Hình
•	Hiện có các màu tím, ánh sao, hồng và xám bạc
•	Loa stereo ở cạnh trên và cạnh dưới 
 thuyết và có thể thay đổi tùy địa điểm và nhà mạng. Để biết thông tin về hỗ trợ mạng 5G và LTE, vui lòng liên hệ nhà mạng và truy cập apple.com/ipad/cellular.', '2024-06-12',0.12, 1),

 (N'Dây đeo silicon dây đeo đại dương tương thích với apple Watch','Dong ho',  '20', 2395, 20 ,2, 0, 'images/products/22-1.jpg, images/products/22-2.jpg', 
	N'🥰Chào mừng đến với cửa hàng của chúng tôi
Nếu bạn không hài lòng với sản phẩm nhận được tại đây, bạn có thể liên hệ với chúng tôi và chúng tôi sẽ đưa ra giải pháp cho bạn trong lần đầu tiên.
✈️Về thời gian vận chuyển
1.Sản phẩm sẽ được xuất xưởng 1-2 ngày sau khi đặt hàng.
2.Nó sẽ mất khoảng 5-7 ngày để giao hàng.
- Chi tiết sản phẩm -
⚠️Lưu ý: Chúng tôi chỉ bán dây đeo đồng hồ, không bao gồm đồng hồ.
⭕Các mô hình tương thích:
Đối với iWatch 49mm ultra / ultra
Đối với iWatch 45mm (Dòng 7 8 9)
Đối với iWatch 41mm (Dòng 7 8 9)', '2024-05-18',0.12, 1),

 (N'Áo Thun Phông Nữ Nam Local Brand Form Rộng Unisex Something Tee','Ao thun',  '20', 530, 20 ,4, 0, 'images/products/38-1.jpg, images/products/38-2.jpg', 
	N'Áo Thun Phông Nữ Nam Local Brand Form Rộng Unisex Something Tee



- Chất liệu: Vải Cotton 100% 2 chiều
- Màu sắc: Đen/Trắng
- Form: Local Brand - Unisex
- Chất lượng in: In lụa dùng mực Nhật Bản chất lượng cao
- Bảo quản: Có thể giặt máy & giặt ngâm
Bảng size:
S: từ 45kg đến 55kg - 1m50 đến 1m60
M: từ 55kg đến 65kg - 1m60 đến 1m7
L: từ 65 đến 80kg - 1m70 đến 1m80
XL: từ 80kg trở lên - 1m80 trở lên
XXL: Đến 100kg', '2024-06-18',0.15, 1),

--6
(N'Máy tính bảng Apple iPad Gen 10 10.9 inch 2022 Wifi 64GB','Dien thoai',  '20', 1340, 20 ,4, 0, 'images/products/7-1.jpg, images/products/7-2.jpg', 
	N'Thiết kế trẻ trung
iPad 10 sẽ có một thiết kế khá quen thuộc khi được hoàn thiện với phần vật liệu chủ yếu là kim loại ở phần mặt lưng, các cạnh và hai mặt đều được vát phẳng để mang lại cái nhìn sang trọng. Đi kèm với đó là các góc được bo tròn giúp cho tổng thể máy tính bảng trở nên thanh thoát và hiện đại hơn thay vì vuông vức trông như một cuốn tập.
Với iPad thế hệ thứ 10 thì nhà Apple mang đến cho chúng ta 4 phiên bản với các màu sắc như: Bạc, hồng, vàng và xanh. Trong đó các tone màu của năm nay được làm đậm hơn đôi chút so với những thế hệ trước đó, đây có thể xem là đặc điểm nhận dạng giúp người dùng phân biệt iPad 10 các đàn anh của mình.
Điểm vượt trội hơn so với phiên bản iPad 9 WiFi 64GB vào năm ngoái là phần viền màn hình giờ đây đã được tối ưu và làm đều ở 4 cạnh, nó mang lại cho máy một cái nhìn cân đối và hài hòa hơn, cảm giác sử dụng cũng trở nên cực kỳ dễ chịu khi mà chúng ta nhìn vào màn hình.
', '2024-06-30',0.17, 1),

(N'Apple Watch SE GPS + Cellular Sport Loop','Dong ho',  '20', 4495, 20 ,5, 0, 'images/products/23-1.jpg, images/products/23-2.jpg', 
	N'Mô tả sản phẩm
Apple Watch SE  GPS + Cellular
* LTE and UMTS
* Vi Xử Lý: S5 SiP with 64-bit dual-core processor
* Dung Lượng: 32GB
* Chip: W3 wireless chip
* Màn hình: Retina LTPO OLED display, 1000 nits over 30 percent larger display
* Bluetooth 5.0
* Hệ Điều Hành: watchOS 7
', '2024-08-22',0.27, 1),

 (N'Áo thun phông nam đen BEEYANBUY T-shirt đẹp tay lỡ unisex 100% cotton-B0073','Ao thun',  '20', 223, 20 ,2, 0, 'images/products/39-1.jpg, images/products/39-2.jpg', 
	N'Thông tin sản phẩm Áo thun unisex BEEYANBUY tay lỡ 
- Chất liệu: Cotton 100%, vải mềm, vải mịn, thoáng mát, không xù lông.
- Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn.
- Mặc ở nhà, mặc đi chơi hoặc khi vận động thể thao. Phù hợp để phối với nhiều loại trang phục.
- Thiết kế hiện đại, trẻ trung, năng động. Dễ phối đồ.
Bảng kích thước:
Chiều dài M: 68 Ngực: 102 Chiều dài tay: 20
Chiều dài L: 70 Ngực: 106 Chiều dài tay: 21
Chiều dài XL: 72 Ngực: 110 Chiều dài tay: 22
Chiều dài 2XL: 74 Ngực: 114 Chiều dài tay: 23', '2024-01-19',0.09, 1),

--7

(N'iPad Pro M4 11 inch Standard Glass WIFI 512GB Chính hãng (ZA/A)','Dien thoai',  '20', 2500, 20 ,1, 0, 'images/products/8-1.jpg, images/products/8-2.jpg', 
	N'iPad Pro M4 11 inch Standard Glass WIFI, dòng máy tính bảng cao cấp nhất năm 2024, nổi bật với hiệu năng vượt trội nhờ chip Apple M4 9 nhân CPU, màn hình Ultra Retina XDR sắc nét và camera trước đặt ở cạnh dài tiện lợi. Với thiết kế mỏng nhẹ và thời lượng pin ấn tượng, iPad Pro M4 11 inch Standard Glass WIFI hứa hẹn là lựa chọn hoàn hảo cho người dùng yêu thích công nghệ.
Thiết kế mỏng nhẹ, cao cấp hơn này giúp cải thiện đáng kể hiệu suất hoạt động trong khi vẫn duy trì sự hiệu quả về năng lượng. Điều này đồng nghĩa rằng không chỉ các tác vụ hằng ngày mượt mà mà cả những ứng dụng đòi hỏi sức mạnh xử lý cao như đồ họa và xử lý video cũng không là vấn đề.', '2024-07-02',0.23, 1),

(N'Apple Watch Series 8 Nhôm GPS + Cellular Dây Thể Thao','Dong ho',  '20', 3289, 20 ,2, 0, 'images/products/24-1.jpg, images/products/24-2.jpg', 
	N'Bảo hành chính hãng 12 tháng.
Bộ sản phẩm gồm: đồng hồ + cáp sạc
Chọn màu:Midnight, Starlight, Silver, (PRODUCT) RED
Thương hiệuApple
Kích thước màn hình41mm
Màn hìnhCông nghệ màn hình: OLED
Kích thước mặt: 41 mm
Độ phân giải: 430 x 352 pixels
Thiết kếChất liệu mặt: Ion-X strengthened glass
Chất liệu khung viền: Hợp kim nhôm
Chất liệu dây: Silicone
Khả năng thay dây: Có
Kích thước, khối lượng: Dài 41 mm – Ngang 35 mm – Dày 10.7 mm – Nặng 32g', '2024-05-13',0.45, 1),

 (N'Áo Thun Unisex FNOS BASIC OVERSIZE TSB 100% Cotton - Local Brand Chính Hãng','Ao thun',  '20', 223, 20 ,2, 0, 'images/products/40-1.jpg, images/products/40-2.jpg', 
	N'Áo Thun ngắn tay unisex Tie Dye, form oversize, vải cotton loang mầu 2SClothing.
Thông tin sản phẩm
- Kiểu dáng: Áo thun nam nữ oversize
- Màu sắc: Tie Dye Hồng
- Chất liệu: vải thun cotton cao cấp, độ co giãn tốt, mềm mịn, thoáng mát, không nhăn, không xù
- Đường may tỉ mỉ, chắc chắn, không chỉ thừa
- Mặc ở nhà, đi học hay đi chơi hoặc khi vận động thể thao đều siêu hợp nha. Mix cũng quần jeans, chân váy,… được ngay set đồ cá tính
- Thiết kế hiện đại, trẻ trung, năng động
(Bảng size mang tính chất tham khảo và phù hợp 80-90% sở thích mặc của bạn. Các bạn muốn chọn size phù hợp có thể inbox cho shop nhé)', '2024-06-18',0.22, 1),
--8

(N'[Nhập ELSS155BU Giảm 15%] Điện thoại Samsung Galaxy Z Flip5 512GB','Dien thoai',  '20', 1560, 20 ,4, 0, 'images/products/9-1.jpg, images/products/9-2.jpg', 
	N'Thông số kỹ thuật:
	Màn hình: OLED6.1"Super Retina XDR
	Hệ điều hành: Android
	Camera sau: 2 camera 12 MP
	Camera trước: 12 MP
	Chip: SamSung A15 Bionic
	RAM: 4 GB
	Bộ nhớ trong: 128 GB
	SIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G
	Pin, Sạc: 20 W
	Bộ sản phẩm bao gồm: thân máy, sách hướng dẫn,...
	Thông tin bảo hành
	Bảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.', '2024-07-12',0.6, 1),

	(N'Apple Watch Series 9 GPS Sport Loop Chính hãng SA/A','Dong ho',  '20', 1295, 20 ,3, 0, 'images/products/25-1.jpg, images/products/25-2.jpg', 
	N'Thiết kế tinh giản, chắc chắn, dây vải mềm nhẹ
Bề ngoài của Apple Watch S9 được chăm chút tỉ mỉ đến từng chi tiết nhỏ, mang đến độ hoàn thiện cao. Khung viền hợp kim nhôm cho cấu trúc mặt đồng hồ vững chắc, đảm bảo tính thẩm mỹ và độ bền cho sản phẩm cũng như linh kiện bên trong. 
Mặt kính cường lực Ion-X với thiết kế tràn viền sang trọng, chất liệu cứng cáp, chịu lực tốt cho bạn yên tâm khi thực hiện các thao tác vuốt, chạm trên màn hình. Sử dụng loại dây vải có độ bền cao, ôm cổ tay vừa vặn mang đến cảm giác dễ chịu cho cổ tay cả ngày dài.
Phần vỏ và dây đeo của Apple Watch S9 đã đạt chuẩn trung hòa carbon', '2024-05-18',0.24, 1),

 (N'Áo thun phông nam nâu BEEYANBUY T-shirt đẹp smile unisex 100% cotton-Y0207','Ao thun',  '20', 263, 20 ,5, 0, 'images/products/41-1.jpg, images/products/41-2.jpg', 
	N'Thông tin sản phẩm Áo thun unisex BEEYANBUY tay lỡ 
- Chất liệu: Cotton 100%, vải mềm, vải mịn, thoáng mát, không xù lông.
- Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn.
- Mặc ở nhà, mặc đi chơi hoặc khi vận động thể thao. Phù hợp để phối với nhiều loại trang phục.
- Thiết kế hiện đại, trẻ trung, năng động. Dễ phối đồ.
Bảng kích thước:
Chiều dài M: 68 Ngực: 102 Chiều dài tay: 20
Chiều dài L: 70 Ngực: 106 Chiều dài tay: 21
Chiều dài XL: 72 Ngực: 110 Chiều dài tay: 22
Chiều dài 2XL: 74 Ngực: 114 Chiều dài tay: 23', '2024-01-18',0.06, 1),
--9

(N'Điện thoại Samsung Galaxy Z Fold5 5G 512GB','Dien thoai',  '20', 1580, 20 ,2, 0, 'images/products/10-1.jpg, images/products/10-2.jpg', 
	N'Thông số kỹ thuật:
	Màn hình: OLED6.1"Super Retina XDR
	Hệ điều hành: iOS 15
	Camera sau: 2 camera 12 MP
	Camera trước: 12 MP
	Chip: SamSung
	RAM: 4 GB
	Bộ nhớ trong: 128 GB
	SIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G
	Pin, Sạc: 20 W
	Bộ sản phẩm bao gồm: thân máy, sách hướng dẫn,...
	Thông tin bảo hành
	Bảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.', '2024-07-07',0.19, 1),

	(N'Đồng Hồ Thông Minh D18 Theo Dõi Sức Khỏe Kết Nối Bluetooth Apple iPhone Xiaomi','Dong ho',  '20', 3125, 20 ,3, 0, 'images/products/26-1.jpg, images/products/26-2.jpg', 
	N'Đồng hồ thông minh D18 chính hãng Chạy thể thao Bước dành cho nam giới Đồng hồ thông minh nhịp tim dành cho huyết áp Apple iPhone Xiaomi Đồng hồ thông minh Xiaomi Đồng hồ thể dục không thấm nước Đồng hồ Bluetooth không thấm nước', '2024-05-18',0.12, 1),
 
 (N'Áo thun unisex in chữ JUUXS NAD.Áo phông tay lỡ cực đẹp, form rộng chất cotton khô cao cấp','Ao thun',  '20', 30, 20 ,2, 0, 'images/products/42-1.jpg, images/products/42-2.jpg', 
	N'Áo thun unisex in chữ JUUXS phông tay lỡ cực đẹp, form rộng chất cotton khô cao cấp, đi học, đi làm, du lịch,
MÔ TẢ SẢN PHẨM
    ✪ Chất Liệu Vải :  cotton khô cao cấp 100%, co giãn 4 chiều, vải mềm, mịn, thoáng mát, không xù lông.

    ✪ Kĩ thuật may: Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn

    ✪ Hình in: Công nghệ in 5D tiên tiến đảm bảo độ bền màu và hình in ngay cả khi giặt máy.

    ✪ Kiểu Dáng: Form Rộng Thoải Mái

    ✪ Full size nam nữ : 
- Size M : dài 65cm, rộng 47cm , 40-50 kg, cao 1m50 – 1m57
- Size L : dài 69cm, rộng 51cm,  51- 65 kg, cao 1m58 – 1m70
- Size XL : dài 73cm, rộng 57cm,  66 - 85 kg, cao 1m71 – 1m83', '2024-03-18',0.04, 1),
	
	--10
	(N'Điện thoại Samsung Galaxy S24 Ultra - Hàng Chính Hãng, Mới 100%, Nguyên seal','Dien thoai',  '20', 1260, 20 ,3, 0, 'images/products/11-1.jpg, images/products/11-2.jpg', 
	N'
	Thương hiệu: SAMSUNG
	Loại bảo hành: Bảo hành nhà sản xuất
	Hạn bảo hành: 12 tháng
	Loại điện thoại: Điện thoại thông minh
	Hỗ trợ hệ điều hành: Android
	Loại cáp điện thoại: Type C
	Độ phân giải camera chính: 200MP
	Lọai sim: 1 Nano SIM & 1 eSIM
	Bộ xử lý: Snapdragon 8 Gen 3 for Galaxy
	Tình trạng: Mới
	Dung lượng pin: 5000mAh
	', '2024-08-12',0.4, 1),

	(N'Đồng Hồ Thông Minh SKYONE SK90 Lắp Sim Trẻ em, Sinh viên Định vị Wifi Gọi Điện thoại','Dong ho',  '20', 3335, 20 ,3, 0, 'images/products/27-1.jpg, images/products/27-2.jpg', 
	N'Đồng Hồ Thông Minh SKYONE SK90 Lắp Sim Trẻ em,  Sinh viên Định vị Wifi Gọi Điện thoại, Video Call Watch - CHÍNH HÃNG
Thông Tin Chi Tiết
Thời gian pin	Khoảng 24-48h
Thời gian sạc	Khoảng 2h
Chất liệu mặt	IPS
Kích thước	
Tuổi phù hợp: Từ 5 tuổi trở lên
Loại/ Công nghệ màn hình	Cảm ứng
Độ chịu nước	IP66
Kích thước mặt	1.69"
Phụ kiện đi kèm	
Đồng hồ, cáp sạc, HDSD, Hộp đựng sản phẩm
Model	C90', '2024-05-18',0.12, 1),

 (N'Áo Thun Nam Trơn Cổ Tròn Ngắn Tay ATINO In Hình Chất Liệu Vải Cotton Thoáng Mát','Ao thun',  '20', 63, 20 ,2, 0, 'images/products/43-1.jpg, images/products/43-2.jpg', 
	N'𝐂𝐡𝐢 𝐓𝐢𝐞̂́𝐭 𝐒𝐚̉𝐧 𝐏𝐡𝐚̂̉𝐦: 

Áo thun nam cổ tròn ngắn tay Basic là chiếc áo thun cơ bản mà bất cứ ai cũng cần 1 chiếc trong tủ đồ. Trẻ trung và tiện lợi, phù hợp với mọi tình huống, mọi vóc dáng và lứa tuổi

- Form Regular-Fit thoải mái, trẻ trung, dáng suông vừa phải phù hợp với mọi dáng người 

- ATINO sử dụng chất liệu vải 70% Cotton thoáng mát, ít nhăn và 30% Polyester mang lại độ bền cao thấm hút tốt và có độ co giãn vừa phải giúp cho người mặc thêm thoải mái khi vận động

- Màu sắc: Đen, Trắng, Xanh

- Size: M, L, XL, 2XL.)', '2024-04-22',0.02, 1),
	
	--11
	(N'điện thoại Oppo A77 5G 2sim ram 8+3G rom 256G máy Chính Hãng, Bảo hành 12 tháng','Dien thoai',  '20', 520, 20 ,5, 0, 'images/products/12-1.jpg, images/products/12-2.jpg', 
	N'
	Thương hiệu: OPPO
	Dung lượng lưu trữ: 256GB
	Loại bảo hành: Bảo hành quốc tế
	Hạn bảo hành: 12 tháng
	RAM: 8GB
	Số khe cắm sim: 2
	Số camera chính: 2
	Tính năng điện thoại: bộ nhớ ngoài, cảm biến vân tay, GPS, Màn hình cảm ứng, chống nước
	Loại điện thoại: Điện thoại thông minh
	Hỗ trợ hệ điều hành: Android
	Loại cáp điện thoại: Type C
	Model điện thoại: OPPO A77', '2024-06-17',0.2, 1),

	(N'Đồng Hồ Thông Minh Đổi Hình Nền, Chống Nước IP 67','Dong ho',  '20', 765, 20 ,2, 0, 'images/products/28-1.jpg, images/products/28-2.jpg', 
	N'Chào mừng bạn đến với XS Store, Cảm ơn bạn đã ghé thăm Shop
Tên Sản Phẩm: Đồng Hồ Thông Minh XS Store M7 Smart Band
Tính năng
✔️Theo dõi hoạt động cả ngày: số bước, lượng calo đốt cháy, quãng đường đi được.
✔️Nhịp tim, huyết áp
✔️Theo dõi giấc ngủ (thời gian ngủ, chất lượng giấc ngủ)
✔️Chế độ thể thao: Chạy, Ngồi lên, Skippiong dây
✔️Nhắc nhở thông minh: Nhắc nhở cuộc gọi, đẩy thông tin, nhắc nhở ít vận động
✔️ Lời nhắc tin nhắn: tin nhắn SMS, tin nhắn FB, tin nhắn Intas
✔️Các chức năng khác: Tìm vòng đeo tay, Nhắc nhở báo thức, camera từ xa, Đưa tay lên để sáng, Điều khiển âm nhạc, Thời tiết', '2024-05-18',0.18, 1),

 (N'Áo Polo Nam Nữ Thêu PASRTRO NAD Unisex - Áo Cổ Bẻ Tay Lỡ Chất Liệu Tổ Ong Dệt Trẻ Trung','Ao thun',  '20', 223, 20 ,5, 0, 'images/products/44-1.jpg, images/products/44-2.jpg', 
	N'Áo Thun ngắn tay unisex Tie Dye, form oversize, vải cotton loang mầu 2SClothing.
Thông tin sản phẩm
- Kiểu dáng: Áo thun nam nữ oversize
- Màu sắc: Tie Dye Hồng
- Chất liệu: vải thun cotton cao cấp, độ co giãn tốt, mềm mịn, thoáng mát, không nhăn, không xù
- Đường may tỉ mỉ, chắc chắn, không chỉ thừa
- Mặc ở nhà, đi học hay đi chơi hoặc khi vận động thể thao đều siêu hợp nha. Mix cũng quần jeans, chân váy,… được ngay set đồ cá tính
- Thiết kế hiện đại, trẻ trung, năng động
Thông số chọn size:
Size S: 1m45-1m50 (41-45kg)
Size M: 1m50-1m60 (46-53kg)
Size L: 1m60-1m65 (53-62kg)
(Bảng size mang tính chất tham khảo và phù hợp 80-90% sở thích mặc của bạn. Các bạn muốn chọn size phù hợp có thể inbox cho shop nhé)', '2024-06-28',0.1, 1),

--12
	(N'Nhập XM14UB giảm 12%] Điện thoại thông minh Xiaomi 14 Ultra','Dien thoai',  '20', 1200, 20 ,3, 0, 'images/products/13-1.jpg, images/products/13-2.jpg', 
	N'
	Dung lượng lưu trữ: 256GB
	Loại bảo hành: Bảo hành quốc tế
	RAM: 8GB
	Số khe cắm sim: 2
	Số camera chính: 2
	Tính năng điện thoại: bộ nhớ ngoài, cảm biến vân tay, GPS, Màn hình cảm ứng, chống nước
	Loại điện thoại: Điện thoại thông minh
	Hỗ trợ hệ điều hành: Android
	Loại cáp điện thoại: Type C', '2024-04-18',0.09, 1),

	(N'Đồng Hồ Nam HANBORO 6280 | Tặng kèm 1 bóp đựng','Dong ho',  '20', 2395, 20 ,3, 0, 'images/products/29-1.jpg, images/products/29-2.jpg', 
	N'Thương hiệu: HANBORO

Model: 9039

Loại chuyển động: Chuyển động cơ học

Chất liệu dây đeo: Silicone

Độ dày mặt số: 16 mm

Đường kính quay số: 42,5x52mm

Chất liệu khung : trong suốt bằng thủy tinh pha lê

Tính năng bổ sung: Lịch phát sáng

Độ sâu chống nước: 5ATM

Chất liệu gương đồng hồ:thủy tinh pha lê ', '2024-05-18',0.23, 1),

 (N'Áo Polo Phối Racing Karants Local Brand Streetwear Form Oversize - KR55','Ao thun',  '20', 223, 20 ,2, 0, 'images/products/45-1.jpg, images/products/45-2.jpg', 
	N'Đôi chút về Karants: 

Với sứ mệnh mang đến những sản phẩm thời trang chất lượng, mới mẻ và trendy nhất Karants luôn gửi gắm toàn bộ tâm huyết, sự sáng tạo và thổi hồn vào từng sản phẩm để gửi đến tay khách hàng.

- Cách chọn size: Karants có bảng size mẫu. Nếu chưa biết lựa size bạn có thể inbox để được Karants tư vấn.

- Lưu ý : Sản phẩm Karants là form rộng mặc thoải mái rồi không cần nhích size trừ trường hợp thích oversize size hẳn.

*Hướng dẫn sử dụng sản phẩm Karants

Nên giặt tay ở lần giặt đầu tiên, lộn bề mặt trong (mặt trái) của sản phẩm khi giặt.

Giặt ở nhiệt độ bình thường, với đồ có màu tương tự.', '2024-06-18',0.17, 1),

--13
	(N'Điện Thoại Samsung M34 5G 8GB/128GB - Hàng Chính Hãng','Dien thoai',  '20', 1754, 20 ,4, 0, 'images/products/14-1.jpg, images/products/14-2.jpg', 
	N'
	Dung lượng lưu trữ
128GB
Hạn bảo hành
12 tháng
RAM
8GB
Số khe cắm sim
2
Số camera chính
1
Tính năng điện thoại
bộ nhớ ngoài, cảm biến vân tay, GPS, Màn hình cảm ứng, Wifi
Loại điện thoại
Điện thoại thông minh
Điện thoại di động
LTE
Hỗ trợ hệ điều hành
Android
Loại cáp điện thoại
Type C
Lọai sim
Nano
Độ phân giải camera chính
50MP
Model điện thoại
Samsung M34 5G 8GB/128GB
Tình trạng
Mới
Bộ xử lý
Exynos 1280 8 nhân
Loại bảo hành
Bảo Hành Điện Tử
Dung lượng pin
6000mAh
Kích thước màn hình
6.5inches', '2024-06-17',0.26, 1),

	(N'Đồng Hồ HANBORO 980 Bầu Trời Nhiều Sao Mới 2023 (Automatic)','Dong ho',  '20', 649, 20 ,4, 0, 'images/products/30-1.jpg, images/products/30-2.jpg', 
	N'Đồng hồ đeo tay
Tự động
Kiểu đồng hồ
Thời trang, Thể thao
Loại bảo hành
Bảo hành nhà cung cấp
Đường kính vỏ đồng hồ
42mm
Chất liệu vỏ đồng hồ
Thép không gỉ
Kiểu khóa đồng hồ
Cài khóa
Chất liệu dây đeo
Silicone
Độ sâu chống nước
<30m
Kính đồng hồ
Kính Cường Lực
Xuất xứ
Trung Quốc
Hạn bảo hành
5 năm
Kiểu vỏ đồng hồ
Thùng
Mặt đồng hồ
Analog
Tính năng
Chống thâm nước', '2024-05-29',0.26, 1),

 (N'Áo thun nam nữ unisex BEEYANBUY phông tay lỡ form rộng','Ao thun',  '20', 223, 20 ,1, 0, 'images/products/46-1.jpg, images/products/46-2.jpg', 
	N'Áo Thun ngắn tay unisex Tie Dye, form oversize, vải cotton loang mầu 2SClothing.
Thông tin sản phẩm
- Kiểu dáng: Áo thun nam nữ oversize
- Màu sắc: Tie Dye Hồng
- Chất liệu: vải thun cotton cao cấp, độ co giãn tốt, mềm mịn, thoáng mát, không nhăn, không xù
- Đường may tỉ mỉ, chắc chắn, không chỉ thừa
- Mặc ở nhà, đi học hay đi chơi hoặc khi vận động thể thao đều siêu hợp nha. Mix cũng quần jeans, chân váy,… được ngay set đồ cá tính
- Thiết kế hiện đại, trẻ trung, năng động
Thông số chọn size:
Size S: 1m45-1m50 (41-45kg)
Size M: 1m50-1m60 (46-53kg)
Size L: 1m60-1m65 (53-62kg)
Size XL: 1m65- 1m75 (63-74kg)
(Bảng size mang tính chất tham khảo và phù hợp 80-90% sở thích mặc của bạn. Các bạn muốn chọn size phù hợp có thể inbox cho shop nhé)', '2024-06-18',0.14, 1),

--14
	(N'Điện thoại Samsung Galaxy S24 Ultra 12GB/512GB - Độc quyền Online','Dien thoai',  '20',1239, 20 ,5, 0, 'images/products/15-1.jpg, images/products/15-2.jpg', 
	N'	Dung lượng lưu trữ: 256GB
	Loại bảo hành: Bảo hành quốc tế
	Hạn bảo hành: 12 tháng
	RAM: 8GB
	Số khe cắm sim: 2
	Số camera chính: 2
	Tính năng điện thoại: bộ nhớ ngoài, cảm biến vân tay, GPS, Màn hình cảm ứng, chống nước
	Loại điện thoại: Điện thoại thông minh
	Hỗ trợ hệ điều hành: Android', '2024-03-27',0.25, 1),

	(N'Đồng Hồ Thông Minh Mione T900 Ultra 2 Watch Series 9 Màn Hình Lớn 2.02 Inch S8 S9 Ultra7','Dong ho',  '20', 231, 20 ,5, 0, 'images/products/31-1.jpg, images/products/31-2.jpg', 
	N'Chào mừng bạn đến với XS Store, Cảm ơn bạn đã ghé thăm Shop
Tên Sản Phẩm: Đồng Hồ Thông Minh XS Store M7 Smart Band
Tính năng
✔️Theo dõi hoạt động cả ngày: số bước, lượng calo đốt cháy, quãng đường đi được.
✔️Nhịp tim, huyết áp
✔️Theo dõi giấc ngủ (thời gian ngủ, chất lượng giấc ngủ)
✔️Chế độ thể thao: Chạy, Ngồi lên, Skippiong dây
✔️Nhắc nhở thông minh: Nhắc nhở cuộc gọi, đẩy thông tin, nhắc nhở ít vận động
✔️ Lời nhắc tin nhắn: tin nhắn SMS, tin nhắn FB, tin nhắn Intas
✔️Các chức năng khác: Tìm vòng đeo tay, Nhắc nhở báo thức, camera từ xa, Đưa tay lên để sáng, Điều khiển âm nhạc, Thời tiết', '2024-05-18',0.11, 1),

 (N'Áo thun trơn nam cao cấp BAMIHOME áo thun cổ tròn basic form vừa','Ao thun',  '20', 223, 20 ,4, 0, 'images/products/47-1.jpg, images/products/47-2.jpg', 
	N'', '2024-06-18',0.15, 1),

--15
	(N'Điện thoại Samsung Galaxy S24 5G 256GB','Dien thoai',  '20', 2644, 20 ,3, 0, 'images/products/16-1.jpg, images/products/16-2.jpg', 
	N'
	Samsung Galaxy S24 - mẫu điện thoại flagship của nhà Samsung vừa được giới thiệu tại sự kiện thường niên vào ngày 18/01. Sản phẩm lần này thu hút sự chú ý nhờ tích hợp chip mới tự hãng sản xuất, kết hợp cùng với đó là nhiều tính năng AI thông minh và những cải tiến mới cho màn hình và camera.

Cập nhật mới nhất ngày 25/01/2024

Đặc điểm nổi bật trên Samsung Galaxy S24

• Thiết kế vuông hơn, hiện đai hơn

• Camera 50 MP cho khả năng chụp ảnh sắc nét

• Tích hợp nhiều tính năng AI giúp tăng sự tiện ích khi sử dụng

• Trang bị chip nhà làm "Exynos 2400"

• Hỗ trợ quay video 8K nhằm đáp ứng tốt cho các công việc sáng tạo

Thiết kế vuông hơn, màn hình mỏng hơn', '2024-06-17',0.12, 1),

	(N'Đồng hồ FOXBOX Nam Original Chống nước Màn hình kép Sport Chronograph Quartz','Dong ho',  '20', 2395, 20 ,2, 0, 'images/products/32-1.jpg, images/products/32-2.jpg', 
	N'Chào mừng bạn đến với cửa hàng LIGE chính thức!

1. Tất cả đồng hồ trong cửa hàng của chúng tôi đều là đồng hồ chính hãng và nguyên bản của thương hiệu LIGE, và tất cả đồng hồ đều được hỗ trợ bởi chứng chỉ đủ tiêu chuẩn.

2. Cửa hàng trực tuyến cả ngày. Nếu bạn có bất kỳ câu hỏi nào, bạn có thể liên hệ với bộ phận chăm sóc khách hàng của cửa hàng bất cứ lúc nào bạn muốn, và chúng tôi sẽ giải quyết tất cả các câu hỏi của bạn cho bạn.

3. Tất cả đồng hồ được giảm giá đều có trong kho, bạn có thể đặt hàng bất cứ lúc nào, chúng tôi sẽ giao hàng cho bạn trong vòng 24 giờ sau khi bạn đặt hàng.

4. Tất cả đồng hồ trong cửa hàng của chúng tôi đều có sự đảm bảo chất lượng. Nếu bạn phát hiện thấy bất kỳ vấn đề nào về chất lượng với đồng hồ của mình sau khi mua, vui lòng liên hệ với chúng tôi kịp thời, và chúng tôi sẽ hoàn lại đầy đủ cho bạn sau khi xác nhận chất lượng của đồng hồ.', '2024-05-18',0.17, 1),

 (N'Áo Phông Rộng Tay Lỡ TEE 280GSM Cotton Oversize Áo Thun Trơn Nam Nữ Unisex','Ao thun',  '20', 223, 20 ,4, 0, 'images/products/48-1.jpg, images/products/48-2.jpg', 
	N'NATO - Thương hiệu từ Thụy Điển - đem đến cho bạn những trải nghiệm từ phong cách ăn mặc đơn giản, hiện đại và sang trọng nhất. Chi tiết mẫu áo thun form rộng unisex TEE:
   + Chất liệu 100% Cotton co giãn 4 chiều thông thoáng, thấm hút tốt.
    + Chất vải 280GSM dày dặn mịn màng, không bị bạc màu. 
    + Sợi Cotton được xử lí bề mặt giúp chống nhăn và không bị xù lông khi giặt.
    + Công nghệ in True HD Max chất lượng hình in, mạc in sắc nét, không bong tróc, phai màu.                                  
    + Kĩ thuật may thêu vi tính tinh vi, áo không bị bung chỉ và không có chỉ thừa', '2024-01-18',0.08, 1),

--16
	(N'Ốp lưng Samsung Galaxy S24 Ultra/S24 Plus/S24 RINGKE Fusion','Dien thoai',  '20', 220, 20 ,5, 0, 'images/products/17-1.jpg, images/products/17-2.jpg', 
	N'
	Ốp lưng Samsung Galaxy S24 Ultra/S24 Plus/S24 RINGKE Fusion

🔆Ưu điểm sản phẩm

✔️Kiểu dáng đẹp trong suốt dành riêng cho Samsung Galaxy S24 Ultra.

✔️Chống sốc tối đa, phân tán lực tác động tốt, đạt tiêu chuẩn chống sốc Quân đội Mỹ.

✔️Thiết kế cạnh gờ mặt lưng (vị trí camera) nhô cao 1.2mm và thiết kế cạnh viền màn hình nhô cao 1.5mm giúp chống trầy.

✔️Ốp được thiết kế 2 thành phần: mặt lưng nhựa cứng Polycarbonate và viền nhựa dẻo TPU giúp dễ dàng tháo lắp ốp

✔️Tương thích với sạc không dây wireless charging (không phải sạc MagSafe). Bạn có thể sạc mà không cần tháo rời ốp lưng.

✔️Nút bấm được bảo vệ và mang lại cảm giác bấm nhạy, các cổng kết nối thuận tiện.

✔️Kích thước lỗ xỏ dây đeo cải tiến cho phép treo (móc) được 2 phụ kiện cùng lúc. Lưu ý: dây đeo được bán riêng. Hình ảnh chỉ minh họa cách sử dụng sản phẩm.', '2024-06-17',0.13, 1),

	(N'Đồng Hồ Nam HANBORO 842-2 Vành đá | Tặng kèm 1 bộ dây và 1 bóp đựng','Dong ho',  '20', 649, 20 ,5, 0, 'images/products/33-1.jpg, images/products/33-2.jpg', 
	N'Thương hiệu: HANBORO

Model: 842-2

Bảo hành: Bảo hành tại cửa hàng

Loại chuyển động: Chuyển động cơ học

Chất liệu dây đeo: Silicon

Độ dày mặt số: 12 mm

Đường kính quay số: 42mm

Chất liệu vỏ: Thép không gỉ

Tính năng bổ sung: Lịch phát sáng

Chế độ hiển thị: Kiểu con trỏ

Kiểu khóa: Khóa bấm hai mặt

Độ sâu chống nước: 5ATM

Chất liệu gương đồng hồ: Gương sapphire tổng hợp', '2024-05-18',0.12, 1),

 (N'Áo thun Dragon Karants Local Brand Form Oversize [BST Dragon] - KR75','Ao thun',  '20', 129, 20 ,4, 0, 'images/products/49-1.jpg, images/products/49-2.jpg', 
	N'Đôi chút về Karants: 
Với sứ mệnh mang đến những sản phẩm thời trang chất lượng, mới mẻ và trendy nhất Karants luôn gửi gắm toàn bộ tâm huyết, sự sáng tạo và thổi hồn vào từng sản phẩm để gửi đến tay khách hàng.
- Cách chọn size: Karants có bảng size mẫu. Nếu chưa biết lựa size bạn có thể inbox để được Karants tư vấn.
- Lưu ý : Sản phẩm Karants là form rộng mặc thoải mái rồi không cần nhích size trừ trường hợp thích oversize size hẳn.
*Hướng dẫn sử dụng sản phẩm Karants
Nên giặt tay ở lần giặt đầu tiên, lộn bề mặt trong (mặt trái) của sản phẩm khi giặt.
Giặt ở nhiệt độ bình thường, với đồ có màu tương tự.
Không dùng hóa chất tẩy, chà lên hình in.
Hạn chế sử dụng máy sấy và ủi (nếu có) thì ở nhiệt độ thích hợp.', '2024-06-18',0.18, 1)







