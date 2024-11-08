USE [master]
GO
/****** Object:  Database [Praktika_RPM1]    Script Date: 07.11.2024 19:17:50 ******/
CREATE DATABASE [Praktika_RPM1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Praktika_RPM1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Praktika_RPM1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Praktika_RPM1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Praktika_RPM1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Praktika_RPM1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Praktika_RPM1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Praktika_RPM1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Praktika_RPM1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Praktika_RPM1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Praktika_RPM1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Praktika_RPM1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET RECOVERY FULL 
GO
ALTER DATABASE [Praktika_RPM1] SET  MULTI_USER 
GO
ALTER DATABASE [Praktika_RPM1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Praktika_RPM1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Praktika_RPM1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Praktika_RPM1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Praktika_RPM1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Praktika_RPM1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Praktika_RPM1', N'ON'
GO
ALTER DATABASE [Praktika_RPM1] SET QUERY_STORE = ON
GO
ALTER DATABASE [Praktika_RPM1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Praktika_RPM1]
GO
/****** Object:  Table [dbo].[Cactus]    Script Date: 07.11.2024 19:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cactus](
	[ID_Cactus] [int] IDENTITY(1,1) NOT NULL,
	[ID_Vid] [int] NULL,
	[ID_Proishozhdenie] [int] NULL,
	[Price] [int] NULL,
	[Age] [int] NULL,
	[Instructions] [nvarchar](1000) NULL,
	[Cactus_Name] [nvarchar](50) NULL,
	[Photo] [image] NULL,
	[Rewards] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Cactus] PRIMARY KEY CLUSTERED 
(
	[ID_Cactus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cactus_Vistavka]    Script Date: 07.11.2024 19:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cactus_Vistavka](
	[ID_Cactus_Vistavka] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cactus] [int] NULL,
	[ID_Vistavka] [int] NULL,
 CONSTRAINT [PK_Cactus_Vistavka] PRIMARY KEY CLUSTERED 
(
	[ID_Cactus_Vistavka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proishozhdenie]    Script Date: 07.11.2024 19:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proishozhdenie](
	[ID_Proishozhdenie] [int] IDENTITY(1,1) NOT NULL,
	[Name_Proishozhdenie] [nvarchar](50) NULL,
 CONSTRAINT [PK_Proishozhdenie] PRIMARY KEY CLUSTERED 
(
	[ID_Proishozhdenie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 07.11.2024 19:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID_Role] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07.11.2024 19:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID_User] [int] IDENTITY(1,1) NOT NULL,
	[Name_User] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[ID_Role] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vid]    Script Date: 07.11.2024 19:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vid](
	[ID_Vid] [int] IDENTITY(1,1) NOT NULL,
	[Name_Vid] [nvarchar](50) NULL,
 CONSTRAINT [PK_Vid] PRIMARY KEY CLUSTERED 
(
	[ID_Vid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vistavka]    Script Date: 07.11.2024 19:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vistavka](
	[ID_Vistavka] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Place] [nvarchar](50) NULL,
	[Comments] [nvarchar](50) NULL,
 CONSTRAINT [PK_Vistavka] PRIMARY KEY CLUSTERED 
(
	[ID_Vistavka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cactus] ON 

INSERT [dbo].[Cactus] ([ID_Cactus], [ID_Vid], [ID_Proishozhdenie], [Price], [Age], [Instructions], [Cactus_Name], [Photo], [Rewards]) VALUES (1, 4, 5, 5000, 45, N'g53erger', N'Кактус обыкновенный', NULL, N'gergerg')
INSERT [dbo].[Cactus] ([ID_Cactus], [ID_Vid], [ID_Proishozhdenie], [Price], [Age], [Instructions], [Cactus_Name], [Photo], [Rewards]) VALUES (4, 3, 4, 23452, 23423, N'4fsEFWSEF', N'EFWE', NULL, N'435235, egegeg, gerahetsjha, hrtjrj, fergerg')
INSERT [dbo].[Cactus] ([ID_Cactus], [ID_Vid], [ID_Proishozhdenie], [Price], [Age], [Instructions], [Cactus_Name], [Photo], [Rewards]) VALUES (5, 2, 2, 52, 25235, N'qdWRGWEeR', N'52525252', NULL, N'2352')
SET IDENTITY_INSERT [dbo].[Cactus] OFF
GO
SET IDENTITY_INSERT [dbo].[Proishozhdenie] ON 

INSERT [dbo].[Proishozhdenie] ([ID_Proishozhdenie], [Name_Proishozhdenie]) VALUES (1, N'Южная Америка')
INSERT [dbo].[Proishozhdenie] ([ID_Proishozhdenie], [Name_Proishozhdenie]) VALUES (2, N'Северная Америка')
INSERT [dbo].[Proishozhdenie] ([ID_Proishozhdenie], [Name_Proishozhdenie]) VALUES (3, N'Вест-Индия')
INSERT [dbo].[Proishozhdenie] ([ID_Proishozhdenie], [Name_Proishozhdenie]) VALUES (4, N'Африка')
INSERT [dbo].[Proishozhdenie] ([ID_Proishozhdenie], [Name_Proishozhdenie]) VALUES (5, N'Мадагаскар')
INSERT [dbo].[Proishozhdenie] ([ID_Proishozhdenie], [Name_Proishozhdenie]) VALUES (6, N'Балкон')
INSERT [dbo].[Proishozhdenie] ([ID_Proishozhdenie], [Name_Proishozhdenie]) VALUES (7, N'Шри-Ланка')
SET IDENTITY_INSERT [dbo].[Proishozhdenie] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID_Role], [Role_Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([ID_Role], [Role_Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID_User], [Name_User], [Login], [Password], [ID_Role]) VALUES (1, N'admin', N'1111', N'1111', 1)
INSERT [dbo].[Users] ([ID_User], [Name_User], [Login], [Password], [ID_Role]) VALUES (2, N'user', N'2', N'2', 2)
INSERT [dbo].[Users] ([ID_User], [Name_User], [Login], [Password], [ID_Role]) VALUES (3, NULL, N'11111', N'1111', 1)
INSERT [dbo].[Users] ([ID_User], [Name_User], [Login], [Password], [ID_Role]) VALUES (4, NULL, N'111111', N'111', 1)
INSERT [dbo].[Users] ([ID_User], [Name_User], [Login], [Password], [ID_Role]) VALUES (5, NULL, N'111111111', N'1111', 1)
INSERT [dbo].[Users] ([ID_User], [Name_User], [Login], [Password], [ID_Role]) VALUES (6, NULL, N'2222', N'1111', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vid] ON 

INSERT [dbo].[Vid] ([ID_Vid], [Name_Vid]) VALUES (1, N'Пустынный')
INSERT [dbo].[Vid] ([ID_Vid], [Name_Vid]) VALUES (2, N'Кактусовый')
INSERT [dbo].[Vid] ([ID_Vid], [Name_Vid]) VALUES (3, N'Опунциевый')
INSERT [dbo].[Vid] ([ID_Vid], [Name_Vid]) VALUES (4, N'Перескиевые')
INSERT [dbo].[Vid] ([ID_Vid], [Name_Vid]) VALUES (5, N'Маихуениевый')
SET IDENTITY_INSERT [dbo].[Vid] OFF
GO
SET IDENTITY_INSERT [dbo].[Vistavka] ON 

INSERT [dbo].[Vistavka] ([ID_Vistavka], [Date], [Place], [Comments]) VALUES (1, CAST(N'2006-12-14' AS Date), N'Казань-Экспо', N'Выставка кактусов')
SET IDENTITY_INSERT [dbo].[Vistavka] OFF
GO
ALTER TABLE [dbo].[Cactus]  WITH CHECK ADD  CONSTRAINT [FK_Cactus_Proishozhdenie] FOREIGN KEY([ID_Proishozhdenie])
REFERENCES [dbo].[Proishozhdenie] ([ID_Proishozhdenie])
GO
ALTER TABLE [dbo].[Cactus] CHECK CONSTRAINT [FK_Cactus_Proishozhdenie]
GO
ALTER TABLE [dbo].[Cactus]  WITH CHECK ADD  CONSTRAINT [FK_Cactus_Vid] FOREIGN KEY([ID_Vid])
REFERENCES [dbo].[Vid] ([ID_Vid])
GO
ALTER TABLE [dbo].[Cactus] CHECK CONSTRAINT [FK_Cactus_Vid]
GO
ALTER TABLE [dbo].[Cactus_Vistavka]  WITH CHECK ADD  CONSTRAINT [FK_Cactus_Vistavka_Cactus] FOREIGN KEY([ID_Cactus])
REFERENCES [dbo].[Cactus] ([ID_Cactus])
GO
ALTER TABLE [dbo].[Cactus_Vistavka] CHECK CONSTRAINT [FK_Cactus_Vistavka_Cactus]
GO
ALTER TABLE [dbo].[Cactus_Vistavka]  WITH CHECK ADD  CONSTRAINT [FK_Cactus_Vistavka_Vistavka] FOREIGN KEY([ID_Vistavka])
REFERENCES [dbo].[Vistavka] ([ID_Vistavka])
GO
ALTER TABLE [dbo].[Cactus_Vistavka] CHECK CONSTRAINT [FK_Cactus_Vistavka_Vistavka]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Roles] ([ID_Role])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Praktika_RPM1] SET  READ_WRITE 
GO
