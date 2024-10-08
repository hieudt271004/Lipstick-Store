USE [master]
GO
/****** Object:  Database [lipstick_store]    Script Date: 8/22/2024 10:38:01 AM ******/
CREATE DATABASE [lipstick_store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lipstick_store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\lipstick_store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'lipstick_store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\lipstick_store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [lipstick_store] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lipstick_store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lipstick_store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lipstick_store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lipstick_store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lipstick_store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lipstick_store] SET ARITHABORT OFF 
GO
ALTER DATABASE [lipstick_store] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [lipstick_store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lipstick_store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lipstick_store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lipstick_store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lipstick_store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lipstick_store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lipstick_store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lipstick_store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lipstick_store] SET  ENABLE_BROKER 
GO
ALTER DATABASE [lipstick_store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lipstick_store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lipstick_store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lipstick_store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lipstick_store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lipstick_store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lipstick_store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lipstick_store] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [lipstick_store] SET  MULTI_USER 
GO
ALTER DATABASE [lipstick_store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lipstick_store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lipstick_store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lipstick_store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [lipstick_store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [lipstick_store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [lipstick_store] SET QUERY_STORE = ON
GO
ALTER DATABASE [lipstick_store] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [lipstick_store]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[brand_id] [bigint] IDENTITY(1,1) NOT NULL,
	[brand_name] [nvarchar](150) NULL,
	[brand_description] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [bigint] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](150) NULL,
	[category_description] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[order_status_id] [bigint] NULL,
	[order_shipped_date] [datetime2](6) NULL,
	[order_created_at] [datetime2](6) NOT NULL,
	[order_discount] [float] NOT NULL,
	[order_total_amount] [decimal](18, 0) NOT NULL,
	[order_note] [nvarchar](1500) NULL,
	[receiver_name] [nvarchar](100) NOT NULL,
	[receiver_mobile] [varchar](12) NOT NULL,
	[shipping_address] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [bigint] NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[product_color] [nvarchar](255) NOT NULL,
	[product_image] [varchar](255) NOT NULL,
	[product_price] [decimal](18, 0) NOT NULL,
	[quantity] [int] NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[order_status_id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[product_color] [nvarchar](255) NULL,
	[product_image] [varchar](255) NULL,
	[product_price] [decimal](18, 0) NULL,
	[product_quantity] [int] NULL,
	[product_short_description] [nvarchar](500) NULL,
	[product_description] [nvarchar](max) NULL,
	[category_id] [bigint] NULL,
	[brand_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_image]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_image](
	[product_image_id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_image] [varchar](255) NULL,
	[product_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPRING_SESSION]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPRING_SESSION](
	[PRIMARY_ID] [char](36) NOT NULL,
	[SESSION_ID] [char](36) NOT NULL,
	[CREATION_TIME] [bigint] NOT NULL,
	[LAST_ACCESS_TIME] [bigint] NOT NULL,
	[MAX_INACTIVE_INTERVAL] [int] NOT NULL,
	[EXPIRY_TIME] [bigint] NOT NULL,
	[PRINCIPAL_NAME] [varchar](100) NULL,
 CONSTRAINT [SPRING_SESSION_PK] PRIMARY KEY CLUSTERED 
(
	[PRIMARY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPRING_SESSION_ATTRIBUTES]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPRING_SESSION_ATTRIBUTES](
	[SESSION_PRIMARY_ID] [char](36) NOT NULL,
	[ATTRIBUTE_NAME] [varchar](200) NOT NULL,
	[ATTRIBUTE_BYTES] [image] NOT NULL,
 CONSTRAINT [SPRING_SESSION_ATTRIBUTES_PK] PRIMARY KEY CLUSTERED 
(
	[SESSION_PRIMARY_ID] ASC,
	[ATTRIBUTE_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[created_at] [datetime2](6) NOT NULL,
	[status] [int] NOT NULL,
	[deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_address]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_address](
	[user_address_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[receiver_name] [nvarchar](100) NOT NULL,
	[receiver_mobile] [varchar](12) NOT NULL,
	[user_address_detail] [nvarchar](255) NOT NULL,
	[user_address_wards] [nvarchar](100) NOT NULL,
	[user_address_districts] [nvarchar](100) NOT NULL,
	[user_address_provinces] [nvarchar](100) NOT NULL,
	[default_address] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_detail]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_detail](
	[user_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[gender] [int] NULL,
	[dob] [varchar](11) NULL,
	[mobile] [varchar](15) NULL,
	[email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 8/22/2024 10:38:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[user_role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[role_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([brand_id], [brand_name], [brand_description]) VALUES (1, N'Chanel', N'<p><span class="fw-medium">Thương hiệu Chanel</span> là một thương hiệu được thành lập từ những năm 1909 – 1910 do Gabrielle “Coco” Chanel sáng lập. Chanel là một thương hiệu thời trang, mỹ phẩm cao cấp hàng đầu nước Pháp, mang trọn vẹn những tinh hoa, nét đẹp của đất nước này.</p>
<p>Nhắc tới Chanel là nhắc tới thương hiệu thời trang, mỹ phẩm đẳng cấp có tiếng trong giới. <span class="fw-medium">Son Chanel</span> nói riêng và mỹ phẩm Chanel nói chung đều là những sản phẩm chất lượng và giá thành tương xứng.</p>')
INSERT [dbo].[brand] ([brand_id], [brand_name], [brand_description]) VALUES (2, N'Dior', N'<p><span class="fw-medium">Dior</span> là một thương của Pháp thành lập vào năm 1946 bởi Christian Dior thuộc kiểm soát của LVMH cùng một công ty với Fendi. Ngoài mảng chủ đạo là thời thì hãng còn nổi tiếng về các dòng mỹ phẩm. Mỹ phẩm của Dior được biết đến với chất lượng đi đôi cùng với vẻ ngoài sang trọng, nhã nhặn.</p>
<p>Khi nhắc đến son Dior người ta nhắc đến vẻ ngoài sang trọng cùng với chất lượng tuyệt vời mà nó mang lại với 4 dòng son môi: Dior Addict, Dior Addict Lip Glow, Dior Rouge và Diorific.</p>
<p>Những thỏi son của Dior được nhiều người lựa chọn cũng bởi chính chất lượng tuyệt vời của chúng. Trước hết là ở thiết kế vô cùng đẳng cấp. Khác biệt của Dior với những dòng son môi khác cùng phân khúc high-end như YSL, Chanel...</p>')
INSERT [dbo].[brand] ([brand_id], [brand_name], [brand_description]) VALUES (3, N'Gucci', N'<p><span class="fw-medium">Thương hiệu Gucci</span>  được thành lập từ năm 1921,Gucci là một thương hiệu thời trang Ý. Tiếp nối thành công với các sản phẩm thời trang, Gucci cho ra đời các sản phẩm mỹ phẩm cao cấp dành cho giới thượng lưu.</p>
<p>Son Gucci xuất hiện trên thị trường một lần nữa đã khẳng định đẳng cấp là một trong những thương hiệu đắt giá nhất thế giới. Gucci không chỉ thành công trong mảng thời trang mà còn gây tiếng vang lớn với các sản phẩm mỹ phẩm, đặc biệt là son. Son Gucci là dòng sản phẩm mà từ các tiểu thư, sao hạng A đều săn đón và trở thành món đồ không thể thiếu. Với hơn 60 màu son trong bảng màu son Gucci đã chinh phục được mọi trái tim các cô gái.</p>')
INSERT [dbo].[brand] ([brand_id], [brand_name], [brand_description]) VALUES (4, N'YSL', N'<p><span class="fw-medium">YSL</span> là tên viết tắt của thương hiệu <span class="fw-medium">Yves Saint Laurent</span>, một thương hiệu về thời trang và mỹ phẩm cao cấp nổi tiếng đến từ Pháp, được thành lập vào năm 1961 bởi nhà thiết kế Yves Saint Laurent và Pierre Bergé.</p>
<p>Đến nay, YSL vẫn là một thương hiệu dẫn đầu tạo ra xu hướng hiện đại, sang trọng, thanh lịch. Bên canh đó, thương hiệu còn mở rộng sang các thị trường khác như giày dép, túi xách, phụ kiện thời trang... và luôn được đông đảo mọi người ủng hộ.</p>')
INSERT [dbo].[brand] ([brand_id], [brand_name], [brand_description]) VALUES (5, N'Louboutin', N'<p><span class="fw-medium">Son Christian Louboutin</span> là thỏi son đáng mơ ước của mọi cô gái, chúng được ví như những món trang sức thần kỳ “hô biến” nhan sắc của bạn trở nên lộng lẫy và kiêu sa; bởi vậy dù có mức giá khá đắt nhưng son Louboutin vẫn khiến các nàng phải mê mệt và mơ ước được sở hữu thỏi son này. </p>
<p>Louboutin được thành lập bởi nhà thiết kế tài ba cùng tên người Pháp, Nhà thiết kế tài ba cùng tên người Pháp, Christian Louboutin đã làm nên cuộc cách mạng tuyệt vời cho phái đẹp bằng những đôi giày đế đỏ vào thế kỷ 20. Đó cũng là lý do đến tận hôm nay, thương hiệu này vẫn được gọi với cái tên đầy kiêu hãnh – “Giày đế đỏ”.</p>
<p>Từ năm 2015 đến nay, thương hiệu này liên tục cho ra mắt các dòng son với thiết kế độc đáo. Trong đó có không ít dòng son đã đi vào lịch sử ngành mỹ phẩm như một hiện tượng, tạo sức hấp dẫn đến từ Christian Louboutin mà không ai có thể xem thường.</p>')
INSERT [dbo].[brand] ([brand_id], [brand_name], [brand_description]) VALUES (6, N'MAC', N'<p><span class="fw-medium">Son MAC</span> là dòng son cao cấp, được các chuyên gia trang điểm nổi tiếng và các sao trên toàn thế giới tin dùng. Với đa đạng về màu sắc và kiểu cách son MAC thích hợp với nhiều đối tượng mang đến cho người dùng sự gợi cảm, sang trọng và quyến rũ giúp bạn nỗi bật dưới mọi ánh nhìn.</p>')
INSERT [dbo].[brand] ([brand_id], [brand_name], [brand_description]) VALUES (7, N'3CE', N'<p><span class="fw-medium">3CE</span> có tên gọi là Concept Eyes đến từ xứ kim chi, thành lập vào tháng 1/2009. Với hơn 10 năm sự nghiệp, <span class="fw-medium">3CE</span> đã nhanh chóng phổ biến trên thị trường với nhiều mặt hàng thời trang và mỹ phẩm. Trong đó mỹ phẩm <span class="fw-medium">3CE</span> luôn làm cho tín đồ làm đẹp trên Thế Giới “điên đảo”.</p>
<p><span class="fw-medium">3CE</span> nổi tiếng nhanh chóng nhờ vào các dòng mỹ phẩm với những màu sắc hiện đại. Những sản phẩm từ hãng luôn dẫn đầu trào lưu của khi vừa mới ra mắt. Từ kem nền, phấn phủ đến phấn mắt, Mascara, cọ trang điểm… Và tiêu biểu nhất chính là <span class="fw-medium">son 3CE</span>.</p>
<p>Ngoài Hàn Quốc, nhãn hàng đình đám này đã có tới hơn 150 cửa hàng ở nhiều nơi như Trung Quốc, Hong Kong, Thái Lan, Singapore và Nhật Bản. Tại Việt Nam, <span class="fw-medium">son 3CE</span> rất được đông đảo các tín đồ làm đẹp yêu thích vì giá thành phải chăng cùng chất lượng tuyệt vời.</p>')
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name], [category_description]) VALUES (1, N'Son Thỏi', NULL)
INSERT [dbo].[category] ([category_id], [category_name], [category_description]) VALUES (2, N'Son Kem', NULL)
INSERT [dbo].[category] ([category_id], [category_name], [category_description]) VALUES (3, N'Son Dưỡng', NULL)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[order_status] ON 

INSERT [dbo].[order_status] ([order_status_id], [order_status]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[order_status] ([order_status_id], [order_status]) VALUES (2, N'Đã xác nhận')
INSERT [dbo].[order_status] ([order_status_id], [order_status]) VALUES (3, N'Đang chuẩn bị hàng')
INSERT [dbo].[order_status] ([order_status_id], [order_status]) VALUES (4, N'Đang giao')
INSERT [dbo].[order_status] ([order_status_id], [order_status]) VALUES (5, N'Hoàn thành')
INSERT [dbo].[order_status] ([order_status_id], [order_status]) VALUES (6, N'Đã huỷ')
INSERT [dbo].[order_status] ([order_status_id], [order_status]) VALUES (7, N'Trả hàng')
SET IDENTITY_INSERT [dbo].[order_status] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [product_name], [product_color], [product_image], [product_price], [product_quantity], [product_short_description], [product_description], [category_id], [brand_id]) VALUES (1, N'Son YSL Slim Velvet 21 Rouge Paradoxe', N'Màu Đỏ Ruby', N'son-ysl-slim-velvet-21-rouge-paradox.png', CAST(950000 AS Decimal(18, 0)), 10, N'Son YSL Slim Velvet 21 Rouge Paradoxe – Màu Đỏ Ruby ra đời đã khiến nhiều tín đồ mê làm đẹp nhanh tay đặt hàng bởi màu son đỏ ruby thời thượng cùng chất son lì với kết cấu mềm mại như nhung mịn màng khiến nàng thích thú.', NULL, 1, 4)
INSERT [dbo].[product] ([product_id], [product_name], [product_color], [product_image], [product_price], [product_quantity], [product_short_description], [product_description], [category_id], [brand_id]) VALUES (2, N'Son YSL The Slim Glow Matte – 214 Illicit Orange', N'Cam cháy', N'son-ysl-slim-214-illicit-orange.jpg', CAST(890000 AS Decimal(18, 0)), 10, N'YSL tiếp tuc tung ra một siêu phẩm son nhỏ gọn mang tên Son YSL The Slim Glow Matte – 214 Illicit Orange. Từ khi ra mắt đến bây giờ cây  son nhỏ nhưng có võ của nhà YSL chưa bao giờ là hết sốt với các chị em.', NULL, 1, 4)
INSERT [dbo].[product] ([product_id], [product_name], [product_color], [product_image], [product_price], [product_quantity], [product_short_description], [product_description], [category_id], [brand_id]) VALUES (3, N'Son Kem YSL Vinyl Cream Lip Stain 441 Arcade Chili', N'Màu Đỏ Cam Gạch', N'son-kem-ysl-vinyl-cream-lip-stain-441-arcade-chili.png', CAST(1250000 AS Decimal(18, 0)), 10, N'Son Kem YSL Vinyl Cream Lip Stain 441 Arcade Chili – Màu Đỏ Cam Gạch là thỏi son được các chị em săn đón nhiều nhất trong thời gian gần đây. Thuộc thương hiệu nổi tiếng nên YSL 441 sở hữu chất son kem mềm mịn cùng độ giữ màu lên tới 10 giờ đồng hồ đã khiến chị em đứng ngồi không yên ngay từ khi mới ra mắt.', NULL, 2, 4)
INSERT [dbo].[product] ([product_id], [product_name], [product_color], [product_image], [product_price], [product_quantity], [product_short_description], [product_description], [category_id], [brand_id]) VALUES (4, N'Son Kem YSL Vinyl Cream Lip Stain 610 Nude Champion', N'Màu Cam', N'son-kem-ysl-vinyl-cream-lip-stain-610-nude-champion.png', CAST(1250000 AS Decimal(18, 0)), 12, N'Son Kem YSL Vinyl Cream Lip Stain 610 Nude Champion – Màu Cam Nude gây ấn tượng với phái đẹp bởi màu son nhẹ nhàng, tự nhiên nhưng vẫn vô cùng cuốn hút và quyến rũ. Đặc biệt chất son kem mềm mịn, giữ màu lên tới 10 giờ đã làm chị em phải nhanh tay đặt hàng ngay từ khi mới ra mắt.', NULL, 2, 4)
INSERT [dbo].[product] ([product_id], [product_name], [product_color], [product_image], [product_price], [product_quantity], [product_short_description], [product_description], [category_id], [brand_id]) VALUES (5, N'Son YSL The Bold 07 Unihibited Flame', N'Màu Đỏ Tươi Ánh Cam (New)', N'son-ysl-the-bold-07-unihibited-flame.png', CAST(950000 AS Decimal(18, 0)), 10, N'Son YSL The Bold 07 Unihibited Flame – Màu Đỏ Tươi Ánh Cam là một trong thỏi son cao cấp nhà YSL được ưa chuộng bởi màu son tươi sáng, trẻ trung nhưng cũng không kém phần sang trọng và quyến rũ.', NULL, 1, 4)
INSERT [dbo].[product] ([product_id], [product_name], [product_color], [product_image], [product_price], [product_quantity], [product_short_description], [product_description], [category_id], [brand_id]) VALUES (6, N'Son YSL Rouge Volupte Shine Collector', N'Đỏ Cherry', N'son-ysl-rouge-volupte-shine-collector.jpg', CAST(950000 AS Decimal(18, 0)), 10, N'Tone đỏ cherry nóng bỏng kết hợp cùng chất son satin cực mịn được “bao bọc” bởi lớp vỏ “nữ quyền” giúp cho Son YSL Rouge Volupte Shine Collector Màu Take My Red Away 120 khiến cho chị em không thể ngồi yên.', NULL, 1, 4)
INSERT [dbo].[product] ([product_id], [product_name], [product_color], [product_image], [product_price], [product_quantity], [product_short_description], [product_description], [category_id], [brand_id]) VALUES (7, N'Son YSL Rouge Volupte Candy Glaze 9 Tangerine Tease', N'Màu Đỏ Tươi Ánh Cam', N'son-ysl-rouge-volupte-candy-glaze-9-tangerine-tease.jpg', CAST(890000 AS Decimal(18, 0)), 10, N'Màu son lên môi nhẹ nhàng, tự nhiên, vẫn chất son “nguyên bản” siêu cấp ẩm với độ bóng nhẹ trên làn môi, Son YSL Rouge Volupte Candy Glaze 9 Tangerine Tease – Màu Đỏ Tươi Ánh Cam lên môi một cách tự nhiên và quyến rũ lạ kỳ.', NULL, 1, 4)
INSERT [dbo].[product] ([product_id], [product_name], [product_color], [product_image], [product_price], [product_quantity], [product_short_description], [product_description], [category_id], [brand_id]) VALUES (8, N'Son Chanel Rouge Allure Luminous Intense 212 Caractère', N'Màu Đỏ Nâu', N'son-chanel-rough-allure-luminous-intense-212-caractete.png', CAST(1050000 AS Decimal(18, 0)), 20, N'Son Chanel Rouge Allure Luminous Intense 212 Caractère – Màu Đỏ Nâu với tông màu cực trendy thời thượng chắc chắn sẽ không làm chị em thất vọng. Sở hữu thiết kế xinh đẹp, màu son thời thượng cùng chất son hoàn hảo, Chanel 212 Caractère dễ dàng trở thành gương mặt ưu tú trong những thỏi son được ưu chuộng.', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[product_image] ON 

INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (1, N'son-ysl-slim-velvet-21-rouge-paradox.png', 1)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (2, N'son-ysl-slim-velvet-21-rouge-paradox_1.png', 1)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (3, N'son-ysl-slim-velvet-21-rouge-paradox_2.png', 1)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (4, N'son-ysl-slim-velvet-21-rouge-paradox_3.png', 1)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (5, N'son-ysl-slim-velvet-21-rouge-paradox_4.png', 1)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (6, N'son-ysl-slim-214-illicit-orange.jpg', 2)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (7, N'son-ysl-slim-214-illicit-orange_1.jpg', 2)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (8, N'son-ysl-slim-214-illicit-orange_2.jpg', 2)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (9, N'son-ysl-slim-214-illicit-orange_3.jpg', 2)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (10, N'son-ysl-slim-214-illicit-orange_4.jpg', 2)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (11, N'son-kem-ysl-vinyl-cream-lip-stain-441-arcade-chili.png', 3)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (12, N'son-kem-ysl-vinyl-cream-lip-stain-441-arcade-chili_1.png', 3)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (13, N'son-kem-ysl-vinyl-cream-lip-stain-441-arcade-chili_2.png', 3)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (14, N'son-kem-ysl-vinyl-cream-lip-stain-441-arcade-chili_3.png', 3)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (15, N'son-kem-ysl-vinyl-cream-lip-stain-441-arcade-chili_4.png', 3)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (16, N'son-kem-ysl-vinyl-cream-lip-stain-610-nude-champion.png', 4)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (17, N'son-kem-ysl-vinyl-cream-lip-stain-610-nude-champion_1.png', 4)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (18, N'son-kem-ysl-vinyl-cream-lip-stain-610-nude-champion_2.png', 4)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (19, N'son-kem-ysl-vinyl-cream-lip-stain-610-nude-champion_3.png', 4)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (20, N'son-kem-ysl-vinyl-cream-lip-stain-610-nude-champion_4.png', 4)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (21, N'son-ysl-the-bold-07-unihibited-flame.png', 5)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (22, N'son-ysl-the-bold-07-unihibited-flame_1.jpg', 5)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (23, N'son-ysl-the-bold-07-unihibited-flame_2.jpg', 5)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (24, N'son-ysl-the-bold-07-unihibited-flame_3.jpg', 5)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (25, N'son-ysl-the-bold-07-unihibited-flame_4.jpg', 5)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (26, N'son-ysl-rouge-volupte-shine-collector.jpg', 6)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (27, N'son-ysl-rouge-volupte-shine-collector_1.jpg', 6)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (28, N'son-ysl-rouge-volupte-shine-collector_2.jpg', 6)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (29, N'son-ysl-rouge-volupte-shine-collector_3.jpg', 6)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (30, N'son-ysl-rouge-volupte-candy-glaze-9-tangerine-tease.jpg', 7)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (31, N'son-ysl-rouge-volupte-candy-glaze-9-tangerine-tease_1.jpg', 7)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (32, N'son-ysl-rouge-volupte-candy-glaze-9-tangerine-tease_2.jpg', 7)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (33, N'son-ysl-rouge-volupte-candy-glaze-9-tangerine-tease_3.jpg', 7)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (34, N'son-ysl-rouge-volupte-candy-glaze-9-tangerine-tease_4.jpg', 7)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (35, N'son-chanel-rough-allure-luminous-intense-212-caractete.png', 8)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (36, N'son-chanel-rough-allure-luminous-intense-212-caractete_1.png', 8)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (37, N'son-chanel-rough-allure-luminous-intense-212-caractete_2.png', 8)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (38, N'son-chanel-rough-allure-luminous-intense-212-caractete_3.png', 8)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (39, N'son-chanel-rough-allure-luminous-intense-212-caractete_4.png', 8)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (40, N'son-chanel-rough-allure-luminous-intense-212-caractete_5.png', 8)
INSERT [dbo].[product_image] ([product_image_id], [product_image], [product_id]) VALUES (41, N'son-chanel-rough-allure-luminous-intense-212-caractete_6.png', 8)
SET IDENTITY_INSERT [dbo].[product_image] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [role_name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (2, N'ROLE_EMPLOYEE')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (3, N'ROLE_MEMBER')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [username], [password], [full_name], [created_at], [status], [deleted]) VALUES (1, N'anhdt', N'$2a$10$q39wz54zjT9Qvc72N8ReHOqbbZVzAxkxl43ZgVacBzbQOJeL5TYt6', N'Đinh Tuấn Anh', CAST(N'2024-04-12T02:26:59.6600000' AS DateTime2), 1, 0)
INSERT [dbo].[user] ([user_id], [username], [password], [full_name], [created_at], [status], [deleted]) VALUES (2, N'minhth', N'$2a$10$9UsGzpJaXEvo3RgYvIWp1OnbpvYMD6mEeL270KvUX9LIIiCj9qeaS', N'Trần Hoàng Minh', CAST(N'2024-04-12T02:26:59.6600000' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET IDENTITY_INSERT [dbo].[user_address] ON 

INSERT [dbo].[user_address] ([user_address_id], [user_id], [receiver_name], [receiver_mobile], [user_address_detail], [user_address_wards], [user_address_districts], [user_address_provinces], [default_address]) VALUES (1, 2, N'Trần Hoàng Minh', N'0977657876', N'Fville 3, Fpt Software, Khu Công Nghệ Cao Hoà Lạc', N'Xã Tân Xã', N'Huyện Thạch Thất', N'Hà Nội', 1)
SET IDENTITY_INSERT [dbo].[user_address] OFF
GO
SET IDENTITY_INSERT [dbo].[user_detail] ON 

INSERT [dbo].[user_detail] ([user_detail_id], [user_id], [gender], [dob], [mobile], [email]) VALUES (1, 1, 1, N'11/11/1994', N'0987777888', N'anhdt@gmail.com')
INSERT [dbo].[user_detail] ([user_detail_id], [user_id], [gender], [dob], [mobile], [email]) VALUES (2, 2, 1, N'18/10/2001', N'0936734833', N'minhth@gmail.com')
SET IDENTITY_INSERT [dbo].[user_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[user_role] ON 

INSERT [dbo].[user_role] ([user_role_id], [user_id], [role_id]) VALUES (1, 1, 1)
INSERT [dbo].[user_role] ([user_role_id], [user_id], [role_id]) VALUES (2, 1, 2)
INSERT [dbo].[user_role] ([user_role_id], [user_id], [role_id]) VALUES (3, 1, 3)
INSERT [dbo].[user_role] ([user_role_id], [user_id], [role_id]) VALUES (4, 2, 3)
SET IDENTITY_INSERT [dbo].[user_role] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SPRING_SESSION_IX1]    Script Date: 8/22/2024 10:38:02 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [SPRING_SESSION_IX1] ON [dbo].[SPRING_SESSION]
(
	[SESSION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [SPRING_SESSION_IX2]    Script Date: 8/22/2024 10:38:02 AM ******/
CREATE NONCLUSTERED INDEX [SPRING_SESSION_IX2] ON [dbo].[SPRING_SESSION]
(
	[EXPIRY_TIME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SPRING_SESSION_IX3]    Script Date: 8/22/2024 10:38:02 AM ******/
CREATE NONCLUSTERED INDEX [SPRING_SESSION_IX3] ON [dbo].[SPRING_SESSION]
(
	[PRINCIPAL_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user__F3DBC572450E04FD]    Script Date: 8/22/2024 10:38:02 AM ******/
ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user_det__A32E2E1C88BF4FF5]    Script Date: 8/22/2024 10:38:02 AM ******/
ALTER TABLE [dbo].[user_detail] ADD UNIQUE NONCLUSTERED 
(
	[mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user_det__AB6E61640761F778]    Script Date: 8/22/2024 10:38:02 AM ******/
ALTER TABLE [dbo].[user_detail] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([order_status_id])
REFERENCES [dbo].[order_status] ([order_status_id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product_image]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[SPRING_SESSION_ATTRIBUTES]  WITH CHECK ADD  CONSTRAINT [SPRING_SESSION_ATTRIBUTES_FK] FOREIGN KEY([SESSION_PRIMARY_ID])
REFERENCES [dbo].[SPRING_SESSION] ([PRIMARY_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SPRING_SESSION_ATTRIBUTES] CHECK CONSTRAINT [SPRING_SESSION_ATTRIBUTES_FK]
GO
ALTER TABLE [dbo].[user_address]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[user_detail]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
USE [master]
GO
ALTER DATABASE [lipstick_store] SET  READ_WRITE 
GO
