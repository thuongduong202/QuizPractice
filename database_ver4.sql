USE [master]
GO
/****** Object:  Database [ProjectSWP_KS04]    Script Date: 7/2/2022 2:10:28 PM ******/
CREATE DATABASE [ProjectSWP_KS04]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectSWP_KS04', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectSWP_KS04.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectSWP_KS04_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectSWP_KS04_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectSWP_KS04] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectSWP_KS04].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectSWP_KS04] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectSWP_KS04] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectSWP_KS04] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectSWP_KS04] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectSWP_KS04] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectSWP_KS04] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectSWP_KS04] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectSWP_KS04] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectSWP_KS04] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectSWP_KS04] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectSWP_KS04] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectSWP_KS04] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectSWP_KS04] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProjectSWP_KS04] SET QUERY_STORE = OFF
GO
USE [ProjectSWP_KS04]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryid] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_Quiz]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_Quiz](
	[quizid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[quizid] ASC,
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Option]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Option](
	[quizid] [int] NOT NULL,
	[questionid] [int] NOT NULL,
	[optionid] [int] NOT NULL,
	[option_content] [nvarchar](2000) NOT NULL,
	[right_option] [bit] NOT NULL,
 CONSTRAINT [PK__Option__41E528F5AC451FA9] PRIMARY KEY CLUSTERED 
(
	[quizid] ASC,
	[questionid] ASC,
	[optionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Option_test]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Option_test](
	[testid] [int] NOT NULL,
	[questionid] [int] NOT NULL,
	[optionid] [int] NOT NULL,
	[option_content] [nvarchar](2000) NOT NULL,
	[right_option] [bit] NOT NULL,
	[option_status] [bit] NOT NULL,
 CONSTRAINT [PK__Option_t__2C8B9F003FF15BF2] PRIMARY KEY CLUSTERED 
(
	[testid] ASC,
	[questionid] ASC,
	[optionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QVerifyPassword]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QVerifyPassword](
	[qid] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[quizid] [int] NOT NULL,
	[questionid] [int] NOT NULL,
	[question_title] [nvarchar](1000) NOT NULL,
	[Intruction] [nvarchar](2000) NULL,
	[randomOption] [bit] NOT NULL,
 CONSTRAINT [PK__Question__79D86A03F3B97BCE] PRIMARY KEY CLUSTERED 
(
	[quizid] ASC,
	[questionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_test]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_test](
	[questionid] [int] NOT NULL,
	[testid] [int] NOT NULL,
	[question_title] [nvarchar](1000) NOT NULL,
	[Intruction] [nvarchar](2000) NULL,
	[question_status] [bit] NOT NULL,
 CONSTRAINT [PK__Question__14B6DDF6BCEE48D0] PRIMARY KEY CLUSTERED 
(
	[testid] ASC,
	[questionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[quizid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[title] [nvarchar](1000) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Date_Created] [date] NOT NULL,
	[Last_update] [date] NULL,
 CONSTRAINT [PK__Quiz__CFF448152B26B3E7] PRIMARY KEY CLUSTERED 
(
	[quizid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[rateid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[quizid] [int] NOT NULL,
	[rate] [int] NOT NULL,
	[feedback] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[rateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[testid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[quizid] [int] NOT NULL,
	[title] [nvarchar](1000) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Date_Created] [date] NOT NULL,
	[Last_update] [date] NULL,
 CONSTRAINT [PK__Test__A29AFFE0B39EC991] PRIMARY KEY CLUSTERED 
(
	[testid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](50) NOT NULL,
	[password] [nchar](30) NOT NULL,
	[email] [nchar](50) NOT NULL,
	[aboutme] [nvarchar](1000) NULL,
	[phone] [nchar](20) NULL,
	[avatar] [nchar](1000) NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK__User__CBA1B25752AD2A82] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_verifyq]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_verifyq](
	[uid] [int] NOT NULL,
	[qid] [int] NOT NULL,
	[answer] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[View]    Script Date: 7/2/2022 2:10:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View](
	[userid] [int] NOT NULL,
	[quizid] [int] NOT NULL,
	[date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC,
	[quizid] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryid], [category_name]) VALUES (1, N'Language')
INSERT [dbo].[Category] ([categoryid], [category_name]) VALUES (2, N'Academic')
INSERT [dbo].[Category] ([categoryid], [category_name]) VALUES (3, N'Mathematic')
INSERT [dbo].[Category] ([categoryid], [category_name]) VALUES (4, N'Philosophy')
INSERT [dbo].[Category] ([categoryid], [category_name]) VALUES (5, N'History')
INSERT [dbo].[Category] ([categoryid], [category_name]) VALUES (6, N'Physics')
INSERT [dbo].[Category] ([categoryid], [category_name]) VALUES (7, N'Chemistry')
INSERT [dbo].[Category] ([categoryid], [category_name]) VALUES (8, N'Literary')
INSERT [dbo].[Category] ([categoryid], [category_name]) VALUES (9, N'Computer science')
INSERT [dbo].[Category] ([categoryid], [category_name]) VALUES (10, N'Art')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (1, 4)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (5, 1)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (6, 1)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (7, 1)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (9, 3)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (10, 3)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (11, 3)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (12, 2)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (12, 3)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (13, 3)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (15, 2)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (16, 1)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (17, 2)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (17, 9)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (18, 2)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (18, 9)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (19, 1)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (19, 2)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (19, 9)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (20, 1)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (21, 3)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (22, 3)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (23, 2)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (24, 1)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (25, 1)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (25, 2)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (27, 2)
INSERT [dbo].[category_Quiz] ([quizid], [categoryid]) VALUES (27, 3)
GO
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 1, 1, N'180', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 1, 2, N'200', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 1, 3, N'360', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 1, 4, N'330', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 2, 1, N'1', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 2, 2, N'0', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 2, 3, N'countless', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 3, 1, N'on', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 3, 2, N'near', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 3, 3, N'along', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 3, 4, N'at', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 4, 1, N'of', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 4, 2, N'for', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 4, 3, N'due to', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (1, 4, 4, N'because of', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (5, 1, 1, N'2', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (5, 1, 2, N'e', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (5, 1, 3, N'e', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (5, 2, 1, N'2', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (5, 2, 2, N't', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (5, 2, 3, N'u', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (6, 1, 1, N'Æ°', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (6, 1, 2, N'Æ°', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (6, 1, 3, N'Æ°', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (7, 1, 1, N'Æ°', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (7, 1, 2, N'Æ°', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (7, 1, 3, N'Æ°', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (8, 1, 1, N'3', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (8, 1, 2, N'3', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (9, 1, 1, N'1', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (9, 1, 2, N'2', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (9, 1, 3, N'3', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (9, 2, 1, N'1', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (9, 2, 2, N'3', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (9, 2, 3, N'4', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (10, 1, 1, N'1', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (10, 1, 2, N'2', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (10, 1, 3, N'3', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (10, 2, 1, N'2', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (10, 2, 2, N'7', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (10, 2, 3, N'9', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (11, 1, 1, N'1', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (11, 1, 2, N'3', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (11, 1, 3, N'5', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (11, 1, 4, N'q', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (11, 2, 1, N'2', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (11, 2, 2, N'3', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (11, 2, 3, N'4', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (12, 1, 1, N'1', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (12, 1, 2, N'2', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (12, 1, 3, N'3', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (12, 2, 1, N'11', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (12, 2, 2, N'12', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (12, 2, 3, N'13', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 1, 1, N'18', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 1, 2, N'7', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 1, 3, N'11', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 1, 4, N'25', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 1, 5, N'12', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 2, 1, N'26', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 2, 2, N'36', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 2, 3, N'24', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 2, 4, N'74', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 3, 1, N'400', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 3, 2, N'402', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 3, 3, N'404', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 3, 4, N'670', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 3, 5, N'938', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 4, 1, N'4000 + 500 + 60 + 7', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 4, 2, N'4000 + 50 + 6 + 7', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 4, 3, N'4000 + 506 + 67', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (13, 4, 4, N'400 + 500 + 60 + 7', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (15, 1, 1, N'in', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (15, 1, 2, N'beside', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (15, 1, 3, N'am', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (15, 1, 4, N'to', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 1, 1, N'Look angrily', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 1, 2, N'Major share', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 1, 3, N'Minor share', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 1, 4, N'Heart of the prey', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 2, 1, N'Resemble', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 2, 2, N'Easy', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 2, 3, N'Impossible', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 2, 4, N'For the end', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 3, 1, N'Warmly', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 3, 2, N'Cold-blooded', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 3, 3, N'Quietly', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 3, 4, N'Coldly', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 4, 1, N'Feel greatly', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 4, 2, N'Standard', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 4, 3, N'Extinguish', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (16, 4, 4, N'Below standard', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 1, 1, N's2 = s1;', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 1, 2, N'strcpy(s2,s1);', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 1, 3, N's2 == s1;', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 1, 4, N'all three are wrong', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 2, 1, N'Positive number', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 2, 2, N'Even number', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 2, 3, N'Odd number', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 2, 4, N'Prime number', 0)
GO
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 3, 1, N'8', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 3, 2, N'9', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 3, 3, N'10', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 3, 4, N'11', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 4, 1, N'Zero', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 4, 2, N'Base - 1', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 4, 3, N'Base 1', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 4, 4, N'none of the above', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 5, 1, N'to write output to the screen', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 5, 2, N'the program entry point', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 5, 3, N'Both correct', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (17, 5, 4, N'Both wrong', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 1, 1, N's2 = s1;', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 1, 2, N'strcpy(s2,s1);', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 1, 3, N's2 == s1;', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 1, 4, N'all three are wrong', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 2, 1, N'Positive number', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 2, 2, N'Even number', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 2, 3, N'Odd number', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 2, 4, N'Prime number', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 3, 1, N'8', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 3, 2, N'9', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 3, 3, N'10', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 3, 4, N'11', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 4, 1, N'Zero', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 4, 2, N'Base - 1', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 4, 3, N'Base 1', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 4, 4, N'none of the above', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 5, 1, N'to write output to the screen', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 5, 2, N'the program entry point', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 5, 3, N'Both correct', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (18, 5, 4, N'Both wrong', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 1, 1, N'Strong Question Language', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 1, 2, N'Structured Question Language', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 1, 3, N'Structured Query Language', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 2, 1, N'GET', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 2, 2, N'EXTRACT', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 2, 3, N'SELECT', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 2, 4, N'QUERY', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 2, 5, N'OPEN', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 3, 1, N'UPDATE', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 3, 2, N'SAVE AS', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 3, 3, N'MODIFY', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 3, 4, N'SAVE', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 4, 1, N'TRUNCATE', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 4, 2, N'DELETE', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 4, 3, N'REMOVE', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 5, 1, N'ADD RECORD', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 5, 2, N'ADD INTO', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 5, 3, N'INSERT', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (19, 5, 4, N'ADD NEW', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (20, 1, 1, N'qq', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (20, 1, 2, N'qqq', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (20, 1, 3, N'qqqq', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (20, 1, 4, N'qqqqq', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (20, 2, 1, N'qqqqq', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (20, 2, 2, N'qqqq', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (20, 2, 3, N'aaaa', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (20, 2, 4, N'aaaaaaa', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (21, 1, 1, N'1', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (21, 1, 2, N'2', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (21, 1, 3, N'3', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (21, 2, 1, N'1', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (21, 2, 2, N'2', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (21, 2, 3, N'3', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (22, 1, 1, N'1', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (22, 1, 2, N'12', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (22, 1, 3, N'11', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (23, 1, 1, N'1', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (23, 1, 2, N'2', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 1, 1, N'gave him some lip', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 1, 2, N'gave him a buzz', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 1, 3, N'gave him the air', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 1, 4, N'gave him a hard time', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 1, 5, N'gave him a five', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 2, 1, N'throw into the bargain', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 2, 2, N'throw in the towel', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 2, 3, N'throw into sharp relief', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 2, 4, N'throw in at the deep end', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 2, 5, N'throw down the gauntlet', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 3, 1, N'Stay abreast', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 3, 2, N'Stay after', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 3, 3, N'Stay back', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 3, 4, N'Stay down', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (24, 3, 5, N'Stay over', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 1, 1, N'gets under my skin', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 1, 2, N'gets up a head of steam', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 1, 3, N'gets up on my hind legs', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 1, 4, N'gets up an appetite', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 1, 5, N'gets the worst of it', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 2, 1, N'call on the carpet', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 2, 2, N'call it a day', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 2, 3, N'call his bluff', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 2, 4, N'call the shots', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 2, 5, N'call off the dogs', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 3, 1, N'has the ear of', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 3, 2, N'has the best of', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 3, 3, N'has the blues of', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 3, 4, N'has the edge on', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 3, 5, N'has the guts over', 0)
GO
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 4, 1, N'on the dot', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 4, 2, N'on the cuff', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 4, 3, N'on the carpet', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 4, 4, N'on the fence', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (25, 4, 5, N'on the double', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (27, 1, 1, N'1', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (27, 1, 2, N'11', 1)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (27, 1, 3, N'12', 0)
INSERT [dbo].[Option] ([quizid], [questionid], [optionid], [option_content], [right_option]) VALUES (27, 1, 4, N'13', 0)
GO
SET IDENTITY_INSERT [dbo].[QVerifyPassword] ON 

INSERT [dbo].[QVerifyPassword] ([qid], [title]) VALUES (1, N'Who are you?')
INSERT [dbo].[QVerifyPassword] ([qid], [title]) VALUES (2, N' What do you like the most?')
INSERT [dbo].[QVerifyPassword] ([qid], [title]) VALUES (3, N'Your nickname?')
INSERT [dbo].[QVerifyPassword] ([qid], [title]) VALUES (4, N'Your date of birth?')
INSERT [dbo].[QVerifyPassword] ([qid], [title]) VALUES (5, N'Your phone?')
SET IDENTITY_INSERT [dbo].[QVerifyPassword] OFF
GO
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (1, 1, N'What is the sum of the 3 angles of a triangle?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (1, 2, N'How many planes are formed from a point and a line that does not contain that point?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (1, 3, N'Turtles can sleep suspended _________________ the surface of the water.', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (1, 4, N'Should compensation be paid to victimes _________________ nuclear tests?', N'A', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (5, 1, N'thÆ°Æ¡ng', N'thÆ°Æ¡ng', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (5, 2, N'thá»§y', N'r', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (6, 1, N'Æ°', N'Æ°', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (7, 1, N'thuong ,  thuong', N'Æ°', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (8, 1, N'1+1= ?', N'3', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (9, 1, N'2=?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (9, 2, N'3=?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (10, 1, N'1=?', N'ee', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (10, 2, N'3^2=?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (11, 1, N'1', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (11, 2, N'1=?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (12, 1, N'1', N't', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (12, 2, N'Raina is making an apple pie. She needs 18 apples to make it. She has 7 apples. How many more apples does she need to make it?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (13, 1, N'Raina is making an apple pie. She needs 18 apples to make it. She has 7 apples. How many more apples does she need to make it?', N'Riana already has 7 apples and in total she needs 18 apples. So to know the number of more apples she needs, we have to subtract the total number of apples from number of apple she already has to get the answer. 18 - 7 = 11', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (13, 2, N'What number should replace the question mark (?) 50 - ? = 24', N'This is right answer. To get the number, we have to subtract 24 from 50. 50 - 24 = 26', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (13, 3, N'Kushal is going to meet his parents. For that he has to travel 670 km. He drives 268 km and stop to take rest. How many more km must Kushal travel to meet his parents?', N'This is a right answer. To find the distance that Kushal has to travel more, we have to subtract the distance that he has travelled from the total distance that he has to travel 650 - 268 = 402', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (13, 4, N'Which has the same value as the number 4567?', N'This is the right answer. 4000 + 500 + 60 + 7 is equal to 4567.', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (15, 1, N'Which is NOT a preposition?', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (16, 1, N'Directions: Choose the option that correctly defines the meaning of the given idiom/phrase.', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (16, 2, N'Choose the option that correctly defines the meaning of the given idiom/phrase.', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (16, 3, N'Choose the option that correctly defines the meaning of the given idiom/phrase.', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (16, 4, N'Choose the option that correctly defines the meaning of the given idiom/phrase.', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (17, 1, N'To copy a string into another, given: char s1[30] = \"xyz\", s2[20];', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (17, 2, N'If LSB of a binary number is \"0\" then it is:', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (17, 3, N'What is the output of the following piece of code?  int x = 3, y = 5, z; z = x + ++y;  printf(“%d”,z);', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (17, 4, N'The highest digit in any number system equals:', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (17, 5, N'The main() function is:', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (18, 1, N'To copy a string into another, given: char s1[30] = \"xyz\", s2[20];', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (18, 2, N'If LSB of a binary number is \"0\" then it is:', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (18, 3, N'What is the output of the following piece of code?  int x = 3, y = 5, z; z = x + ++y;  printf(“%d”,z);', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (18, 4, N'The highest digit in any number system equals:', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (18, 5, N'The main() function is:', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (19, 1, N'What does SQL stand for?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (19, 2, N'Which SQL statement is used to extract data from a database?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (19, 3, N'Which SQL statement is used to update data in a database?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (19, 4, N'Which SQL statement is used to delete data from a database?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (19, 5, N'Which SQL statement is used to insert new data in a database?', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (20, 1, N'qqq', N'q', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (20, 2, N'Which is NOT a preposition?', N'qq', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (21, 1, N'1=', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (21, 2, N'2=', N'', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (22, 1, N'1=', N'"', 0)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (23, 1, N'1=', N'"', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (24, 1, N'Fill in the blank with the suitable idiom/phrase.\nThe teacher ___________ for not showing up at the extra classes for the weak students of the class.', N'This is the correct option. To ''gave him a hard time'' implies to make someone feel bad for a mistake. The teacher gave him a hard time for not showing up at the extra classes for the weak students of the class."', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (24, 2, N'Fill in the blank with the suitable idiom/phrase.\nHe is a hard worker. He is not going to ________ that easily.', N'This is the correct option. To ''throw in the towel'' implies to quit or to surrender. He is a hard worker. He is not going to throw in the towel that easily."', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (24, 3, N'Fill in the blank with the suitable idiom/phrase.\n___________ from the highway. It is dangerous as so much traffic passes rough it at high speed!', N'This is the correct option. To ''stay back'' implies to keep distance from something that is harmful. Stay back from the highway. It is dangerous as so much traffic pass through it at high speed!"', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (25, 1, N'Fill in the blank with the suitable idiom/phrase.\\\\nHis continuous pestering for money really __________.', N'To ''gets under my skin'' here implies to bother or irritate me. His continuous pestering for money really gets under my skin.\\\"', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (25, 2, N'Fill in the blank with the suitable idiom/phrase.\\\\nThe opposition should _________ and give some time to the new Chief Minister to act.', N'To ''call off the dogs'' implies to stop criticizing someone over something. The opposition should call off the dogs and give some time to the new Chief Minister to act.\\\"', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (25, 3, N'Fill in the blank with the suitable idiom/phrase.\\\\nThe new Mercedes Benz _________ other similar models - its larger and quicker!', N'To ''have the edge on'' someone implies to be slightly better than something else. The new Mercedes Benz has the edge on other similar models - its larger and quicker!\\\"', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (25, 4, N'Fill in the blank with the suitable idiom/phrase.\\\\nThe word was sent out that the King wanted to see his defence minister ____________.', N'''On the double'' implies very fast or twice as fast. The word was sent out that the King wanted to see his defence minister on the double.\\\"', 1)
INSERT [dbo].[Question] ([quizid], [questionid], [question_title], [Intruction], [randomOption]) VALUES (27, 1, N'11=?', N'11=10+1', 1)
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (1, 2, N'Test Create Quiz', N'16/2', CAST(N'2022-06-12' AS Date), CAST(N'2022-06-30' AS Date))
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (5, 2, N'Test Create Quiz 2', N'12', CAST(N'2022-06-13' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (6, 2, N'Test Create Quiz', N'Æ°', CAST(N'2022-06-13' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (7, 2, N'Test Create Quiz', N'thÆ°Æ¡ng', CAST(N'2022-06-13' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (8, 2, N'Test Create Quiz', N'www thÆ°Æ¡ng', CAST(N'2022-06-13' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (9, 2, N'thương', N'test14/6', CAST(N'2022-06-14' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (10, 2, N'Tét ite1', N'14/6 part 1', CAST(N'2022-06-14' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (11, 2, N'thuong', N'1', CAST(N'2022-06-14' AS Date), CAST(N'2022-06-23' AS Date))
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (12, 2, N'Tét ite2', N'part', CAST(N'2022-06-14' AS Date), CAST(N'2022-06-18' AS Date))
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (13, 3, N'Mathematic for class 3', N'', CAST(N'2022-06-16' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (15, 2, N'English Grammar', N'English Language Arts Grammar Online Quiz
Welcome You', CAST(N'2022-06-17' AS Date), CAST(N'2022-06-20' AS Date))
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (16, 3, N'Idioms & Phrases', N'Practice the Idioms & Phrases', CAST(N'2022-06-20' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (17, 3, N'C Programming Language', N'C Programming Language Quiz -1 ', CAST(N'2022-06-20' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (18, 3, N'C Programming Language', N'C Programming Language Quiz -1 ', CAST(N'2022-06-20' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (19, 3, N'Basic SQL Quiz', N'Basic SQL Quiz', CAST(N'2022-06-20' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (20, 2, N'Mathematic for class 3', N'qqq', CAST(N'2022-06-24' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (21, 2, N'mathematic', N'class 2', CAST(N'2022-06-27' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (22, 2, N'mathematic', N'qw', CAST(N'2022-06-27' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (23, 2, N'mathematic', N'', CAST(N'2022-06-27' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (24, 2, N'thươngdt he150682', N'28/06 test', CAST(N'2022-06-28' AS Date), NULL)
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (25, 2, N'Idioms and Phrases', N'Idioms and Phrases', CAST(N'2022-06-28' AS Date), CAST(N'2022-06-30' AS Date))
INSERT [dbo].[Quiz] ([quizid], [userid], [title], [Description], [Date_Created], [Last_update]) VALUES (27, 2, N'tesst 30/6', N'tesst add random option for question', CAST(N'2022-06-30' AS Date), CAST(N'2022-06-30' AS Date))
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userid], [username], [password], [email], [aboutme], [phone], [avatar], [role_id]) VALUES (1, N'User One                                          ', N'123456                        ', N'abcgfhd@gmail.com                                 ', N'Love sleeping', N'0111222333          ', NULL, 0)
INSERT [dbo].[User] ([userid], [username], [password], [email], [aboutme], [phone], [avatar], [role_id]) VALUES (2, N'Thương Dương                                      ', N'1234567                       ', N'thuongdthe150682@fpt.edu.vn                       ', N'Sleeping', N'0000000000          ', N'220220622163401404.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 0)
INSERT [dbo].[User] ([userid], [username], [password], [email], [aboutme], [phone], [avatar], [role_id]) VALUES (3, N'Duong Thuong                                      ', N'123456                        ', N'thuongduonghe150682@gmail.com                     ', N'I like tree', N'0123456789          ', NULL, 0)
INSERT [dbo].[User] ([userid], [username], [password], [email], [aboutme], [phone], [avatar], [role_id]) VALUES (5, N'Admin                                             ', N'123456                        ', N'Admin@gmail.com                                   ', N'Manage User', NULL, NULL, 1)
INSERT [dbo].[User] ([userid], [username], [password], [email], [aboutme], [phone], [avatar], [role_id]) VALUES (6, N'Admin2                                            ', N'123456                        ', N'Admin2@gmail.com                                  ', N'Manage Quiz', NULL, NULL, 2)
INSERT [dbo].[User] ([userid], [username], [password], [email], [aboutme], [phone], [avatar], [role_id]) VALUES (7, N'Thuong Test                                       ', N'123456                        ', N'thuongduongthi20022001@gmail.com                  ', NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[user_verifyq] ([uid], [qid], [answer]) VALUES (2, 1, N'thuong')
INSERT [dbo].[user_verifyq] ([uid], [qid], [answer]) VALUES (2, 2, N'candy')
INSERT [dbo].[user_verifyq] ([uid], [qid], [answer]) VALUES (2, 3, N'thuong')
GO
ALTER TABLE [dbo].[Option] ADD  CONSTRAINT [DF__Option__right_op__4D94879B]  DEFAULT ((0)) FOR [right_option]
GO
ALTER TABLE [dbo].[Option_test] ADD  CONSTRAINT [DF__Option_te__right__4E88ABD4]  DEFAULT ((0)) FOR [right_option]
GO
ALTER TABLE [dbo].[Option_test] ADD  CONSTRAINT [DF__Option_te__optio__4F7CD00D]  DEFAULT ((0)) FOR [option_status]
GO
ALTER TABLE [dbo].[Question_test] ADD  CONSTRAINT [DF__Question___quest__5070F446]  DEFAULT ((0)) FOR [question_status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__role_id__6C190EBB]  DEFAULT ((0)) FOR [role_id]
GO
ALTER TABLE [dbo].[category_Quiz]  WITH CHECK ADD  CONSTRAINT [pk_catequiz] FOREIGN KEY([quizid])
REFERENCES [dbo].[Quiz] ([quizid])
GO
ALTER TABLE [dbo].[category_Quiz] CHECK CONSTRAINT [pk_catequiz]
GO
ALTER TABLE [dbo].[category_Quiz]  WITH CHECK ADD  CONSTRAINT [pk_quizcate] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Category] ([categoryid])
GO
ALTER TABLE [dbo].[category_Quiz] CHECK CONSTRAINT [pk_quizcate]
GO
ALTER TABLE [dbo].[Option]  WITH CHECK ADD  CONSTRAINT [FK_Option_Question] FOREIGN KEY([quizid], [questionid])
REFERENCES [dbo].[Question] ([quizid], [questionid])
GO
ALTER TABLE [dbo].[Option] CHECK CONSTRAINT [FK_Option_Question]
GO
ALTER TABLE [dbo].[Option]  WITH CHECK ADD  CONSTRAINT [pk_optquiz] FOREIGN KEY([quizid])
REFERENCES [dbo].[Quiz] ([quizid])
GO
ALTER TABLE [dbo].[Option] CHECK CONSTRAINT [pk_optquiz]
GO
ALTER TABLE [dbo].[Option_test]  WITH CHECK ADD  CONSTRAINT [FK_Option_test_Question_test] FOREIGN KEY([testid], [questionid])
REFERENCES [dbo].[Question_test] ([testid], [questionid])
GO
ALTER TABLE [dbo].[Option_test] CHECK CONSTRAINT [FK_Option_test_Question_test]
GO
ALTER TABLE [dbo].[Option_test]  WITH CHECK ADD  CONSTRAINT [pk_opttest] FOREIGN KEY([testid])
REFERENCES [dbo].[Test] ([testid])
GO
ALTER TABLE [dbo].[Option_test] CHECK CONSTRAINT [pk_opttest]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [pk_quesquiz] FOREIGN KEY([quizid])
REFERENCES [dbo].[Quiz] ([quizid])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [pk_quesquiz]
GO
ALTER TABLE [dbo].[Question_test]  WITH CHECK ADD  CONSTRAINT [pk_questtest] FOREIGN KEY([testid])
REFERENCES [dbo].[Test] ([testid])
GO
ALTER TABLE [dbo].[Question_test] CHECK CONSTRAINT [pk_questtest]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [pk_quizuser] FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([userid])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [pk_quizuser]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [pk_ratequiz] FOREIGN KEY([quizid])
REFERENCES [dbo].[Quiz] ([quizid])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [pk_ratequiz]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [pk_rateuser] FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([userid])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [pk_rateuser]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [pk_testquiz] FOREIGN KEY([quizid])
REFERENCES [dbo].[Quiz] ([quizid])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [pk_testquiz]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [pk_testuser] FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([userid])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [pk_testuser]
GO
ALTER TABLE [dbo].[user_verifyq]  WITH CHECK ADD  CONSTRAINT [pk_q_veryfyq] FOREIGN KEY([qid])
REFERENCES [dbo].[QVerifyPassword] ([qid])
GO
ALTER TABLE [dbo].[user_verifyq] CHECK CONSTRAINT [pk_q_veryfyq]
GO
ALTER TABLE [dbo].[user_verifyq]  WITH CHECK ADD  CONSTRAINT [pk_uer_veryfyq] FOREIGN KEY([uid])
REFERENCES [dbo].[User] ([userid])
GO
ALTER TABLE [dbo].[user_verifyq] CHECK CONSTRAINT [pk_uer_veryfyq]
GO
ALTER TABLE [dbo].[View]  WITH CHECK ADD  CONSTRAINT [pk_viewquiz] FOREIGN KEY([quizid])
REFERENCES [dbo].[Quiz] ([quizid])
GO
ALTER TABLE [dbo].[View] CHECK CONSTRAINT [pk_viewquiz]
GO
ALTER TABLE [dbo].[View]  WITH CHECK ADD  CONSTRAINT [pk_viewuser] FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([userid])
GO
ALTER TABLE [dbo].[View] CHECK CONSTRAINT [pk_viewuser]
GO
USE [master]
GO
ALTER DATABASE [ProjectSWP_KS04] SET  READ_WRITE 
GO
