USE [master]
GO
/****** Object:  Database [ScrapyWeb]    Script Date: 2/27/2017 2:26:28 AM ******/
CREATE DATABASE [ScrapyWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ScrapyWeb', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ScrapyWeb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ScrapyWeb_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ScrapyWeb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ScrapyWeb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ScrapyWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ScrapyWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ScrapyWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ScrapyWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ScrapyWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ScrapyWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ScrapyWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ScrapyWeb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ScrapyWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ScrapyWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ScrapyWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ScrapyWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ScrapyWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ScrapyWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ScrapyWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ScrapyWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ScrapyWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ScrapyWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ScrapyWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ScrapyWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ScrapyWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ScrapyWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ScrapyWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ScrapyWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ScrapyWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ScrapyWeb] SET  MULTI_USER 
GO
ALTER DATABASE [ScrapyWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ScrapyWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ScrapyWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ScrapyWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ScrapyWeb]
GO
/****** Object:  Table [dbo].[TweetSet]    Script Date: 2/27/2017 2:26:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TweetSet](
	[Tweet_Id] [varchar](150) NOT NULL,
	[TweetText] [nvarchar](150) NOT NULL,
	[DateDownload] [datetime] NOT NULL,
	[DateCreated] [datetime] NULL,
	[HashTags] [nvarchar](150) NULL,
	[Mentions] [nvarchar](150) NULL,
	[UserId] [varchar](50) NULL,
	[ScreenName] [nvarchar](50) NULL,
	[FollowersCount] [int] NULL,
	[FriendsCouunt] [int] NULL,
	[PlaceName] [varchar](50) NULL,
	[PlaceId] [varchar](50) NULL,
	[LatLong] [varchar](100) NULL,
	[Language] [varchar](50) NULL,
 CONSTRAINT [PK_TweetSet] PRIMARY KEY CLUSTERED 
(
	[Tweet_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TwitterApplications]    Script Date: 2/27/2017 2:26:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TwitterApplications](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [varchar](150) NOT NULL,
	[ConsumerKey] [varchar](150) NOT NULL,
	[ConsumerSecret] [varchar](150) NOT NULL,
	[AccessToken] [varchar](150) NOT NULL,
	[AccessTokenSecret] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TwitterApplications] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835513168503930880', N'إعرف تاريخك تعرف من أنت ☺', CAST(0x0000A7270020ED7E AS DateTime), CAST(0x0000A7250100845C AS DateTime), N'', N'', N'834785658174578688', N'RkibiOthmane', 3, 23, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835565776073543680', N'https://t.co/aHCXrSz7Ra', CAST(0x0000A7270020ED73 AS DateTime), CAST(0x0000A7250139EE04 AS DateTime), N'', N'', N'835315605993635844', N'AlhanfifAmine', 12, 147, N'Benslimane', N'1ffd06ae60e041d9', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835565950430822402', N'سطاج الوحش 
https://t.co/L4t8Qg6ht6', CAST(0x0000A7270020ED63 AS DateTime), CAST(0x0000A725013A1F3C AS DateTime), N'', N'', N'834785658174578688', N'RkibiOthmane', 3, 23, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835571884142002180', N'سطاج الوحش 

https://t.co/L4t8Qg6ht6', CAST(0x0000A7270020ED57 AS DateTime), CAST(0x0000A72501409970 AS DateTime), N'', N'', N'834785658174578688', N'RkibiOthmane', 3, 23, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835781282051330048', N'Lors du lancement de la 4G+ par @Maroc_Telecom le test était satisfaisant (pas encore bridé?) https://t.co/DKASy7H3Bs', CAST(0x0000A7270020ED4B AS DateTime), CAST(0x0000A7260099A020 AS DateTime), N'', N'@Maroc_Telecom,', N'2281294642', N'taoufikdotnet', 95, 227, N'El Menzeh', N'729fbe1099f5375a', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835782771763204096', N'Aujourd''hui le debit est loin d''être celui de la 4G+ ou la 4G promis par @Maroc_Telecom pour évincé la concurrence!… https://t.co/YPkUWBBR6q', CAST(0x0000A7270020ED41 AS DateTime), CAST(0x0000A726009B4024 AS DateTime), N'', N'@Maroc_Telecom,', N'2281294642', N'taoufikdotnet', 95, 227, N'El Menzeh', N'729fbe1099f5375a', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835882345769152514', N'https://t.co/XR7pjoCpv6', CAST(0x0000A7270020ED39 AS DateTime), CAST(0x0000A7260107EC74 AS DateTime), N'', N'', N'763463024564928512', N'1H3RnRag7yBxeMT', 21, 98, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835882594591977472', N'https://t.co/wp4CGGjg1K', CAST(0x0000A7270020ED36 AS DateTime), CAST(0x0000A726010832C4 AS DateTime), N'', N'', N'763463024564928512', N'1H3RnRag7yBxeMT', 21, 98, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835882799399849984', N'https://t.co/yuJfPavvGe', CAST(0x0000A7270020ED20 AS DateTime), CAST(0x0000A72601086B04 AS DateTime), N'', N'', N'763463024564928512', N'1H3RnRag7yBxeMT', 21, 98, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835882931734343681', N'https://t.co/L45htq6vtF', CAST(0x0000A7270020E9D0 AS DateTime), CAST(0x0000A72601089084 AS DateTime), N'', N'', N'763463024564928512', N'1H3RnRag7yBxeMT', 21, 98, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835883152509976577', N'https://t.co/AniKM3qNNf', CAST(0x0000A7270020E677 AS DateTime), CAST(0x0000A7260108CEA0 AS DateTime), N'', N'', N'763463024564928512', N'1H3RnRag7yBxeMT', 21, 98, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835883452025212929', N'https://t.co/qCWSxlY06N', CAST(0x0000A7270020CDE9 AS DateTime), CAST(0x0000A726010921D4 AS DateTime), N'', N'', N'763463024564928512', N'1H3RnRag7yBxeMT', 21, 98, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835883948093935616', N'https://t.co/ryosFH21XQ', CAST(0x0000A7270020B541 AS DateTime), CAST(0x0000A7260109AC1C AS DateTime), N'', N'', N'763463024564928512', N'1H3RnRag7yBxeMT', 21, 98, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835907283787919360', N'Just posted a photo @ Benslimane https://t.co/F3p8OwaS7F', CAST(0x0000A72700209638 AS DateTime), CAST(0x0000A7260123246C AS DateTime), N'', N'', N'827174226', N'SalmaStrong', 278, 73, N'Benslimane', N'1ffd06ae60e041d9', N'  33.6122,  -7.12111', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835907407498838017', N'😌 @ Benslimane https://t.co/9Sto2ZFJ4C', CAST(0x0000A72700202811 AS DateTime), CAST(0x0000A72601234794 AS DateTime), N'', N'', N'827174226', N'SalmaStrong', 278, 73, N'Benslimane', N'1ffd06ae60e041d9', N'  33.6122,  -7.12111', N'lt')
GO
SET IDENTITY_INSERT [dbo].[TwitterApplications] ON 

GO
INSERT [dbo].[TwitterApplications] ([ApplicationId], [ApplicationName], [ConsumerKey], [ConsumerSecret], [AccessToken], [AccessTokenSecret]) VALUES (1, N'ScrapyWeb', N'cknU1MnnygAjvrCeO0AEFDuYr', N'H5JKn0dNwyrKgN5N3PzAdOvspSj9j83N9Cbip2M7ksFyFbeYFu', N'182905682-HthaaicXrtztzUplboIHeM0zrBJmDFL1Q64JEmxQ', N'F8SEemZQ63bApEKh2JV00OINw1FqiZ0Sel1qZLXpyq18q')
GO
INSERT [dbo].[TwitterApplications] ([ApplicationId], [ApplicationName], [ConsumerKey], [ConsumerSecret], [AccessToken], [AccessTokenSecret]) VALUES (2, N'Test App', N'cknU1MnnygAjvrCeO0AEFDuYr', N'H5JKn0dNwyrKgN5N3PzAdOvspSj9j83N9Cbip2M7ksFyFbeYFu', N'182905682-HthaaicXrtztzUplboIHeM0zrBJmDFL1Q64JEmxQ', N'F8SEemZQ63bApEKh2JV00OINw1FqiZ0Sel1qZLXpyq18q')
GO
SET IDENTITY_INSERT [dbo].[TwitterApplications] OFF
GO
ALTER TABLE [dbo].[TweetSet] ADD  CONSTRAINT [DF_TweetSet_DateDownload]  DEFAULT (getdate()) FOR [DateDownload]
GO
USE [master]
GO
ALTER DATABASE [ScrapyWeb] SET  READ_WRITE 
GO
