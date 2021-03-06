USE [ScrapyWeb]
GO
/****** Object:  Table [dbo].[FacebookGroupFeed]    Script Date: 3/3/2017 3:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacebookGroupFeed](
	[GroupPostId] [int] NOT NULL,
	[PostText] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_FacebookGroupFeed] PRIMARY KEY CLUSTERED 
(
	[GroupPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FBApplications]    Script Date: 3/3/2017 3:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FBApplications](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [varchar](50) NOT NULL,
	[FbAppId] [varchar](50) NOT NULL,
	[FbAppSecret] [varchar](150) NOT NULL,
 CONSTRAINT [PK_FBApplications] PRIMARY KEY CLUSTERED 
(
	[FbAppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FBGroups]    Script Date: 3/3/2017 3:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FBGroups](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[FbGroupId] [varchar](50) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FBGroups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TweetSet]    Script Date: 3/3/2017 3:18:55 PM ******/
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
/****** Object:  Table [dbo].[TwitterApplications]    Script Date: 3/3/2017 3:18:55 PM ******/
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836229966702444546', N'Men can meet but the mountains cannot ! @ Benslimane https://t.co/oiNvwEynE5', CAST(0x0000A727017624AD AS DateTime), CAST(0x0000A72700F7CF74 AS DateTime), N'', N'', N'18526308', N'YasserMonkachi', 10931, 2390, N'Benslimane', N'1ffd06ae60e041d9', N'  33.6122,  -7.12111', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836915080633679872', N'STEEPLE analysis, do I state the steeple factors or the steeple impacts? Cause there is a difference &amp; I cant find the answer online 😥😥😥', CAST(0x0000A7290124B912 AS DateTime), CAST(0x0000A72900CC8634 AS DateTime), N'', N'', N'217547398', N'aLaBeyonce', 4569, 3894, N'Meknes', N'6f2f1dff9a9e3b8b', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836916264962510848', N'@Fawzan37msg @YouTube 
يا شيخنا الفاضل اذا اشتريت سيارة بالتقسيط ما حكم ذلك
الجواب مستعجلا وجزاكم الله خيرا', CAST(0x0000A7290124B8FC AS DateTime), CAST(0x0000A72900CDD0AC AS DateTime), N'', N'@Fawzan37msg,@YouTube,', N'727451843224330240', N'Olaadam12', 13, 66, N'El Hajeb', N'dac1e054d18bb470', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836916494068039681', N'you cant pour from an empty cup !', CAST(0x0000A7290124B092 AS DateTime), CAST(0x0000A72900CE0FF4 AS DateTime), N'', N'', N'3035214066', N'_brionnac', 703, 465, N'Meknes', N'6f2f1dff9a9e3b8b', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836916643204845568', N'@Dr_alqarnee 
با شيخنا الفاضل طرحت عليكم سؤالا عن شراء السيارة بالتقسيط ولم ترد علي لحد الان وانني في انتظار جوابكم', CAST(0x0000A7290124A8BC AS DateTime), CAST(0x0000A72900CE3A24 AS DateTime), N'', N'@Dr_alqarnee,', N'727451843224330240', N'Olaadam12', 13, 66, N'El Hajeb', N'dac1e054d18bb470', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836917042510974976', N'@almonajjid 
يا شيخنا الفاضل طرحت عليكم سؤالا عن شراء سيارة بالتقسيط ولم اتلق منكم اي رد فمن يرد علي وانا في امس الحاجة للجواب', CAST(0x0000A7290124976D AS DateTime), CAST(0x0000A72900CEA978 AS DateTime), N'', N'@almonajjid,', N'727451843224330240', N'Olaadam12', 13, 66, N'El Hajeb', N'dac1e054d18bb470', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836917387035291648', N'Waiting for lunch guests at Dar Zerhoune #restaurant #moulayidriss #moulay #morocco #maroc #moroccanfood #volubilis… https://t.co/QqGjuXz0JQ', CAST(0x0000A7290124668B AS DateTime), CAST(0x0000A72900CF0990 AS DateTime), N'restaurant,moulayidriss,moulay,morocco,maroc,moroccanfood,volubilis,', N'', N'2922043235', N'darzerhoune', 275, 223, N'Moulay Driss Zerhoun', N'8ae11104917d0cec', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837314869292634113', N'Granit rocks, Tafraoute -  Morocco. *Pictures out of my book "Views of Africa" published in 2010… https://t.co/dRcNWvXD2a', CAST(0x0000A72B00076AB1 AS DateTime), CAST(0x0000A72A00F557D0 AS DateTime), N'', N'', N'116204617', N'sfoto_', 42, 47, N'Ait Ouafqa', N'271cfb0d6c5cbb09', N'  29.4667,  -9.08333', N'en')
GO
SET IDENTITY_INSERT [dbo].[TwitterApplications] ON 

GO
INSERT [dbo].[TwitterApplications] ([ApplicationId], [ApplicationName], [ConsumerKey], [ConsumerSecret], [AccessToken], [AccessTokenSecret]) VALUES (1, N'ScrapyWeb', N'cknU1MnnygAjvrCeO0AEFDuYr', N'H5JKn0dNwyrKgN5N3PzAdOvspSj9j83N9Cbip2M7ksFyFbeYFu', N'182905682-HthaaicXrtztzUplboIHeM0zrBJmDFL1Q64JEmxQ', N'F8SEemZQ63bApEKh2JV00OINw1FqiZ0Sel1qZLXpyq18q')
GO
INSERT [dbo].[TwitterApplications] ([ApplicationId], [ApplicationName], [ConsumerKey], [ConsumerSecret], [AccessToken], [AccessTokenSecret]) VALUES (2, N'Test App1', N'cknU1MnnygAjvrCeO0AEFDuYr', N'H5JKn0dNwyrKgN5N3PzAdOvspSj9j83N9Cbip2M7ksFyFbeYFu', N'182905682-HthaaicXrtztzUplboIHeM0zrBJmDFL1Q64JEmxQ', N'F8SEemZQ63bApEKh2JV00OINw1FqiZ0Sel1qZLXpyq18q')
GO
SET IDENTITY_INSERT [dbo].[TwitterApplications] OFF
GO
ALTER TABLE [dbo].[TweetSet] ADD  CONSTRAINT [DF_TweetSet_DateDownload]  DEFAULT (getdate()) FOR [DateDownload]
GO
