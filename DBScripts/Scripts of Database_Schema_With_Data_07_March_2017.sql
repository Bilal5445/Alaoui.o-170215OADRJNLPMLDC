USE [ScrapyWeb]
GO
ALTER TABLE [dbo].[TweetSet] DROP CONSTRAINT [DF_TweetSet_DateDownload]
GO
/****** Object:  Table [dbo].[TwitterApplications]    Script Date: 3/8/2017 1:41:31 AM ******/
DROP TABLE [dbo].[TwitterApplications]
GO
/****** Object:  Table [dbo].[TweetSet]    Script Date: 3/8/2017 1:41:31 AM ******/
DROP TABLE [dbo].[TweetSet]
GO
/****** Object:  Table [dbo].[FBGroups]    Script Date: 3/8/2017 1:41:31 AM ******/
DROP TABLE [dbo].[FBGroups]
GO
/****** Object:  Table [dbo].[FBApplications]    Script Date: 3/8/2017 1:41:31 AM ******/
DROP TABLE [dbo].[FBApplications]
GO
/****** Object:  Table [dbo].[FacebookGroupFeed]    Script Date: 3/8/2017 1:41:31 AM ******/
DROP TABLE [dbo].[FacebookGroupFeed]
GO
/****** Object:  Table [dbo].[FacebookGroupFeed]    Script Date: 3/8/2017 1:41:31 AM ******/
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
/****** Object:  Table [dbo].[FBApplications]    Script Date: 3/8/2017 1:41:33 AM ******/
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
/****** Object:  Table [dbo].[FBGroups]    Script Date: 3/8/2017 1:41:33 AM ******/
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
/****** Object:  Table [dbo].[TweetSet]    Script Date: 3/8/2017 1:41:33 AM ******/
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
/****** Object:  Table [dbo].[TwitterApplications]    Script Date: 3/8/2017 1:41:33 AM ******/
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792693117090533376', N'منصة WIX ترد على اتهامات Wordpress لها بالسرقة: يوم بعد اتهام شركة wix من قبل مدير شركة wordpress الذي أكد في... https://t.co/nC9m5EqCjX', CAST(0x0000A730000136F4 AS DateTime), CAST(0x0000A6AF00C0E7FC AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792727329646661632', N'اعتقال فتى يبلغ 18 سنة  في الولايات المتحدة بتهمة العبث بنظام الطوارئ: قالت سلطات ولاية أريزونا أنها اعتقلت م... https://t.co/cDXz6dsOPD', CAST(0x0000A730000136E6 AS DateTime), CAST(0x0000A6AF00E63EF8 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792743973001408513', N'ذكاء اصطناعي من غوغل يقوم بتشفير البيانات من تلقاء نفسه !!: اعتبرت إنجما قمة التطور والتقدم التكنلوجي في مجال... https://t.co/TgWcNJQ38v', CAST(0x0000A730000136E2 AS DateTime), CAST(0x0000A6AF00F868F8 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792775266175102976', N'على غير عادتها ميكروسوفت تدعم خاصية شريط اللمس بأجهزة MacBook Pro الجديدة: عندما نتحدث عن ميكروسوفت و آبل فإن... https://t.co/JJSK2jWNI7', CAST(0x0000A730000136D8 AS DateTime), CAST(0x0000A6AF011A9054 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792803559066656768', N'فايرفوكس تعلن عن مشروع قد يغير نظرتنا كليا عن تصفح الأنترنت !: مع انشغال المجتمع التقني بأخبار آخر حواسيب شرك... https://t.co/hGH6ifctDy', CAST(0x0000A730000136D4 AS DateTime), CAST(0x0000A6AF013970A0 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792999750530310144', N'لهذا السببين الخطريين لا يجب عليك ربط هاتف الذكي بالحاسوب عن طريق كابل USB بعد اليوم !: العديد منا يقوم ربط ه... https://t.co/kTVU7J9xJk', CAST(0x0000A730000136D0 AS DateTime), CAST(0x0000A6B000840E40 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793015699211898880', N'معلومات جديدة حول هاتف آيفون 8 الجديد: رغم أن هاتف آيفون7 لم يمر على إطلاقه وقت طويل، إلا أن وسائل الإعلام ال... https://t.co/r28GFJYpoF', CAST(0x0000A730000136CA AS DateTime), CAST(0x0000A6B0009575B8 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793032780791676929', N'قم بتحميل متصفح Surfy Browser الجديد على جهازك الأندرويد و جربه قبل الجميع !: للأسف الشديد أنه هنالك العديد م... https://t.co/lUk1GTsu6c', CAST(0x0000A730000136C6 AS DateTime), CAST(0x0000A6B000A81AC4 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793049636646760449', N'هذا البرنامج هو اخطر برنامج لإختراق هواتف اندرويد فإنتبهوا !: في هذا الدرس الخطير ساريك كيف يقوم الهكرز بإستع... https://t.co/PDwCjVmw81', CAST(0x0000A730000136C0 AS DateTime), CAST(0x0000A6B000BA8088 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793081203456958464', N'أفضل موقع لتعلم الاختراق الاخلاقي بشكل تطبيقي  واختراقات تفاعلية: طبعا كاي مهتم بالامن والحماية ، فانت تبحث ع... https://t.co/OSufRdYz6K', CAST(0x0000A730000136BA AS DateTime), CAST(0x0000A6B000DCF410 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793134408651857920', N'سامسونغ تسرب بعض مميزات غالاكسي S8 لتجاوز ضجة النوت 7: في الوقت الذي ما زالت فيه الشركة الكورية الجنوبية سامس... https://t.co/JPU83Ayq6J', CAST(0x0000A730000136B4 AS DateTime), CAST(0x0000A6B00117054C AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793363971382185984', N'5 أشياء رائعة تخلت عنها ابل في 27 أكتوبر ، هل كان ستيف جوبز سيوافق عليها ؟: اعلنت شركة آبل أثناء مؤتمرها الصح... https://t.co/8PtIU6takY', CAST(0x0000A730000136AF AS DateTime), CAST(0x0000A6B100860E5C AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793383136113549312', N'جوجل تكشف عن ثغرة في نظام ويندوز في غياب مايكروسوفت: كشفت جوجل مساء أمس عبر مدونتها الإلكترونية عن ثغرة أمنية... https://t.co/1dSAs8Ujrq', CAST(0x0000A7300001369D AS DateTime), CAST(0x0000A6B1009AF8A8 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793388753620316161', N'تطبيق مشغل صوتيات جديد ينتشر كالنار في الهشيم لما له من مميزات رائعة | إكتشفها الأن !: إن كنت من عشاق الإستما... https://t.co/AQpxolJtdX', CAST(0x0000A73000013694 AS DateTime), CAST(0x0000A6B100A119CC AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793396174531158016', N'بلاكبيري تدخل مجالا جديدا بعيدا عن الهواتف الذكية: بعد أن قررت الشركة الكندية الشهيرة "بلاكبيري" اتخاذ قرار ت... https://t.co/RA8zm3peGo', CAST(0x0000A7300001368F AS DateTime), CAST(0x0000A6B100A93404 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793408396170924032', N'إنتبه صديقي قبل شرائك لهاتف صيني ! شاهد هذا الڤيديو: إنتبه صديقي ! قبل ان تشتري هاتف صيني عبر الانترنت شاهد ه... https://t.co/4v3FwdMZDz', CAST(0x0000A7300001368B AS DateTime), CAST(0x0000A6B100B68ADC AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793524609580605441', N'صدور العدد العاشر من مجلة المحترف: كما جرت العادة في أول كل شهر أطلقت مدونة المحترف العدد الجديد من مجلتها "م... https://t.co/hMUJL7KomE', CAST(0x0000A73000013686 AS DateTime), CAST(0x0000A6B101356000 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793729355541196802', N'كيف تقوم بتسريع الأنترنت و تحسينها على جهازك الأندرويد | جرب بنفسك !: مشكلة بطئ الأنترنت على الهواتف الذكية ه... https://t.co/YroFaoBygl', CAST(0x0000A7300001367E AS DateTime), CAST(0x0000A6B200895314 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793739716344414208', N'مايكروسوفت تكشف عن هوية الهاكرز الذين استغلوا ثغرة خطيرة في ويندوز: بعد أن كشفت شركة جوجل أمس الثلاثاء عن ثغر... https://t.co/km8uQjgRD6', CAST(0x0000A73000013676 AS DateTime), CAST(0x0000A6B20094A2C8 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793741615693111296', N'إنستغرام تختبر ميزة جديدة: أعلن تطبيق مشاركة الصور ومقاطع الفيديو القصيرة التابع لموقع التواصل الاجتماعي فيسب... https://t.co/f1NeiCwwhE', CAST(0x0000A73000013662 AS DateTime), CAST(0x0000A6B20096B478 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830399296382103552', N'https://t.co/CtdzzgrbeZ', CAST(0x0000A72F018B21DE AS DateTime), CAST(0x0000A71700D45FF8 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830420570693058560', N'@TaiebouneS @Maroc_Telecom ils vont rien faire ! M''ont fait la même chose..', CAST(0x0000A72F018B21D1 AS DateTime), CAST(0x0000A71700EB98E4 AS DateTime), N'', N'@TaiebouneS,@Maroc_Telecom,', N'183278308', N'WahidROUHLI', 33014, 832, N'Ben M''sick', N'2c87e3b1b55eec2c', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830453116638265344', N'Morocco’s High-Speed Train Tests Launched This Week
https://t.co/ZqXwsTnrA7', CAST(0x0000A72F018B21CB AS DateTime), CAST(0x0000A717010F1D78 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830457109942775808', N'@yahiakarim حتال غذا', CAST(0x0000A72F018B21C4 AS DateTime), CAST(0x0000A71701137918 AS DateTime), N'', N'@yahiakarim,', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830462479037788160', N'Moroccan Ministry of Interior Files Lawsuit Against Chabat over Accusations of Murder
https://t.co/fcl4eA3lm5', CAST(0x0000A72F018B21BD AS DateTime), CAST(0x0000A71701195518 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831127804137861120', N'اينوي نهار الجمعة كانو متاقيين الله اعترفوا بالخطأ 
اليوما نكرو كولشي! 
حسبي الله و نعم الوكيل! 
 #TouchePasAMa4G… https://t.co/uUCov5LPei', CAST(0x0000A7300019BFC2 AS DateTime), CAST(0x0000A71900D872F0 AS DateTime), N'TouchePasAMa4G,', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831460729152798720', N'سوء حظ أو مؤامرة ماسونية؟ 
 https://t.co/gL6SjGNK9Q', CAST(0x0000A7300019BFBB AS DateTime), CAST(0x0000A71A00B84BB0 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831467652006703104', N'#Spotify a préparé une belle playlist d''amoureux pour moi aujourd''hui ! Vous ne serez pas déçus... https://t.co/1yDGi9zRWH', CAST(0x0000A72F018B21AB AS DateTime), CAST(0x0000A71A00BFD948 AS DateTime), N'Spotify,', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831522156987240448', N'30 fois plus de types de ransomwares en 2016 qu''en 2015 https://t.co/H7m5Lxax0O', CAST(0x0000A7300019BFA5 AS DateTime), CAST(0x0000A71A00FB55CC AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831629594956529664', N'Le come-back du Nokia 3310 prévu au MWC 2017 https://t.co/QQ3oV29sGB', CAST(0x0000A7300019BF89 AS DateTime), CAST(0x0000A71A0170988C AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831823119451058177', N'How To Schedule Deleting Files In Dropbox https://t.co/PW1agdYMXY', CAST(0x0000A7300019BF7F AS DateTime), CAST(0x0000A71B00B84BB0 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831884592131035137', N'20 Best Android Apps &amp; Tips Of 2016 https://t.co/8DbFVANboE', CAST(0x0000A7300019BF70 AS DateTime), CAST(0x0000A71B00FB63DC AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831914670042791938', N'ملل رهيب .. احتاج لعطلة والابتعاد قليلا عن متابعة أخبار "البلوكاج" والشلل المؤسساتي وتدبير الندرة في الأخبار.... https://t.co/rZAooEv4kD', CAST(0x0000A72F0176560A AS DateTime), CAST(0x0000A71B011C3760 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831947769963220992', N'هالا مدريد .. الى الأمام أيها الفريق الملكي البرلماني :p', CAST(0x0000A72F01765604 AS DateTime), CAST(0x0000A71B014056A4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832186336530546689', N'تحسن الحالة الصحية للنسر الذي تعرض للتعذيب من قبل قاصرين بالفنيدق. والنيابة العامة تفتح تحقيقا في الحادث.. باش... https://t.co/nRGlHEt29s', CAST(0x0000A72F01765600 AS DateTime), CAST(0x0000A71C00B933B8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832214284809691136', N'مدير الميزانية فوزي لقجع، مخزن 80 مليون سنتيم  في خزينته بالفيلا ديالو.. وبركة منها بدوفيز.. ووزارته تتقول... https://t.co/y8TAHiIE26', CAST(0x0000A72F017655FB AS DateTime), CAST(0x0000A71C00D7B3EC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832971707430350848', N'MATRIX -  Les détails que vous n''aviez jamais remarqués ! https://t.co/F0ME8hD2Mh', CAST(0x0000A7300019BF5B AS DateTime), CAST(0x0000A71E00FB55CC AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833071707149762560', N'12,5 Go de perdu ce mois ci et toujours pas d''explications de la part de @inwi ! 
#LeForfait30GoInwiEstUneArnaque… https://t.co/gLA3kFUAW2', CAST(0x0000A7300019BF50 AS DateTime), CAST(0x0000A71E016879A4 AS DateTime), N'LeForfait30GoInwiEstUneArnaque,', N'@inwi,', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833072145932615680', N'@inwi par comparaison, voici la consommation data d''un client que j''ai convaincu de prendre le même forfait que moi… https://t.co/bSLpESICkH', CAST(0x0000A7300019BF3B AS DateTime), CAST(0x0000A71E0168F384 AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833086552939036672', N'@willou_du80 Nan 😁', CAST(0x0000A7300019BF31 AS DateTime), CAST(0x0000A71E0178ACE8 AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833086809743716352', N'@willou_du80 Pour qu''ils arrêtent ces magouilles !', CAST(0x0000A7300019BF26 AS DateTime), CAST(0x0000A71E0178F590 AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833087244030320642', N'@willou_du80 En privé, si.. Parfois 😉', CAST(0x0000A7300019BF1A AS DateTime), CAST(0x0000A71E01796E44 AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833088123475283969', N'@willou_du80 lol je t''aurais demandé de RT si t''étais marocain pour faire pression avec moi 😉 t''as de la chance ! 😂', CAST(0x0000A7300019BF11 AS DateTime), CAST(0x0000A71E017A645C AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833088366296104961', N'@willou_du80 je sais 😉', CAST(0x0000A7300019BF02 AS DateTime), CAST(0x0000A71E017AA854 AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833089155160739842', N'@atifayoub ماتگول غي بني ملال 😨', CAST(0x0000A7300019BEE1 AS DateTime), CAST(0x0000A71E017B84A4 AS DateTime), N'', N'@atifayoub,', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fa')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833283950663573505', N'@MohamedDekkak1 What are these questions for ? Are you out of content dear mohamed?', CAST(0x0000A72F018B21A5 AS DateTime), CAST(0x0000A71F00C49C08 AS DateTime), N'', N'@MohamedDekkak1,', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833405824051662848', N'قياديين في الاتحاد الاشتراكي يحاولون الركوب على توظيف سياسوي لتصريح رئيس الحكومة من قبل جبهة البوليساريو، من اجل... https://t.co/ziCKd1NB7g', CAST(0x0000A72F017655F7 AS DateTime), CAST(0x0000A71F01499F34 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833463610118639616', N'ست سنوات على الحراك الاجتماعي والسياسي ل20 فبراير: في اعتقادي كشاب شارك في الحراك كباقي المغاربة الذي خرجوا... https://t.co/3hBTohyVXr', CAST(0x0000A72F017655EF AS DateTime), CAST(0x0000A71F0188B020 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833624088388239360', N'قبل ست سنوات( 2011) خلال تسيير جمع عام لتنسيقية 20فبراير بالرباط..صباح الحرية والكرامة وغد افضل لكل الشباب... https://t.co/d984xldDas', CAST(0x0000A72F017655E4 AS DateTime), CAST(0x0000A72000AC533C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833703100036833281', N'@PizzaHutMaOFF bienvenue :)', CAST(0x0000A72F018B21A0 AS DateTime), CAST(0x0000A72001028F04 AS DateTime), N'', N'@PizzaHutMaOFF,', N'183278308', N'WahidROUHLI', 33014, 832, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833729430761652224', N'What happens one hour after you drink a can of #COKE https://t.co/UaMMKiTbiQ', CAST(0x0000A72F018B219B AS DateTime), CAST(0x0000A720011F4AE0 AS DateTime), N'COKE,', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834079284293681153', N'@najlaebb اش من صورة؟ مشفتهاش!', CAST(0x0000A72F017650F1 AS DateTime), CAST(0x0000A72101119D50 AS DateTime), N'', N'@najlaebb,', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834165836428541952', N'@RAM_Maroc une panne dans votre avion Vol #at274  Boeing 737700. Paraît que personne ne sait ce que c''est ni pour n… https://t.co/zEVJTUHhi4', CAST(0x0000A72F018B2196 AS DateTime), CAST(0x0000A72101701420 AS DateTime), N'at274,', N'@RAM_Maroc,', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834166100397060096', N'@RAM_Maroc #at274 il y a l''odeur du brûlé.. et le vol est dejjaaaaa en retard', CAST(0x0000A72F018B2190 AS DateTime), CAST(0x0000A72101705DF4 AS DateTime), N'at274,', N'@RAM_Maroc,', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834166589884870656', N'@RAM_Maroc vous ne pouvez pas nous honorer un jour ? #at274 #twittoma https://t.co/YqqBQfikd1', CAST(0x0000A72F018B2187 AS DateTime), CAST(0x0000A7210170E5E4 AS DateTime), N'at274,twittoma,', N'@RAM_Maroc,', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834167630101676033', N'Encore 15min de retard ! Combiné 45min.. toujours pas déterminé la source de l''odeur du brûlé..  #at274 @RAM_Maroc', CAST(0x0000A72F018B2178 AS DateTime), CAST(0x0000A72101720884 AS DateTime), N'at274,', N'@RAM_Maroc,', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834172601543061504', N'On décolle dans moins d''une minute et il y a toujours cette odeur bizarre à bord ! Allah ywesselna ala kheir ttyl #at274 @RAM_Maroc', CAST(0x0000A72F018B2173 AS DateTime), CAST(0x0000A7210177765C AS DateTime), N'at274,', N'@RAM_Maroc,', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834386071450480641', N'RT @el_manchar: Le mufti du #Liban "le voile n''est pas une obligation religieuse. Je l''ai exigé à Le Pen pour des raisons esthétique"https:…', CAST(0x0000A72F01764AA9 AS DateTime), CAST(0x0000A72200D4EEF0 AS DateTime), N'Liban,', N'@el_manchar,', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834387431902347264', N'حكماء الهاكا وتجني التيجيني
وجهت الهيأة العليا للاتصال السمعي البصري إنذارا للشركة الوطنية للإذاعة والتلفزة، على... https://t.co/Kk1WgD5QMC', CAST(0x0000A7300002226E AS DateTime), CAST(0x0000A72200D66AA0 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834472435936329728', N'الـــبـــيــان الـــخـــتـــامــــي
للدورة العادية للمجلس الوطني للاتحاد الوطني للشغل بالمغرب
 
انعقد بحمد الله... https://t.co/dkPmQlHwZt', CAST(0x0000A73000022264 AS DateTime), CAST(0x0000A72201333104 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834473154982662144', N'من يريد الوقيعة بين الملك وابن كيران؟ | الموقع الإلكتروني لحزب العدالة والتنمية https://t.co/r8Ld2HXeJp', CAST(0x0000A73000022256 AS DateTime), CAST(0x0000A7220133F968 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834533904547602433', N'السياسي داير بحال الشيفور ديال طوموبيل، عليه فاش كيكون في البولا، النظر في المرايا شكون من وراه، لكن اذا بقا... https://t.co/Ab8LXZ6C41', CAST(0x0000A72F0176499C AS DateTime), CAST(0x0000A722017646D8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834543249981374465', N'خاض المغاربة طوال سنوات معركة شرسة ضد المخزن والعائلات والتكنوقراط، من اجل الحق في الاشراك في القرار والثروة..لكن... https://t.co/v1DFlSxnex', CAST(0x0000A72F0176488D AS DateTime), CAST(0x0000A722018079C8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834763884963696640', N'السيد "اخنوش اغراس باشا"، عليه الخروج للرأي العام للتوضيح والكشف عن مصادر ثروته وعلاقتها بالمال العام والاستفادة... https://t.co/9PO5OGTUNu', CAST(0x0000A72F01764721 AS DateTime), CAST(0x0000A72300E5C3EC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834934083973152769', N'حملة قوية من اجل تحميل البجيدي مسؤولية فيضانات سلا..رغم ان المسؤول الاول عن تدبير الازمات والكوارث هي وزارة... https://t.co/lP2HPFBEKw', CAST(0x0000A72F01764606 AS DateTime), CAST(0x0000A72400140370 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835057188196478976', N'https://t.co/Fr9bsxMvsU', CAST(0x0000A73000022253 AS DateTime), CAST(0x0000A724009A5DF8 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835235172467507200', N'الـ FDT تدعو إلى توقيف برنامج التيجيني.. وتصفه بـ "المهزلة" https://t.co/z7ISg8NENP', CAST(0x0000A7300002224E AS DateTime), CAST(0x0000A724015C9E7C AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835599362638118912', N'https://t.co/yppTJlpe8C', CAST(0x0000A73000022248 AS DateTime), CAST(0x0000A725015E9664 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'und')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836171774001876996', N'LES 5 JEUX PRÉFÉRÉS D''ALEXANDRE ASTIER ! https://t.co/tlwkT3BuXz', CAST(0x0000A7300019BEDB AS DateTime), CAST(0x0000A72700B84BB0 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836208003384819713', N'عدنا من جديد .. غير صبرو معنا الله يزازيكم :p', CAST(0x0000A72F0176442D AS DateTime), CAST(0x0000A72700DFD658 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836229966702444546', N'Men can meet but the mountains cannot ! @ Benslimane https://t.co/oiNvwEynE5', CAST(0x0000A727017624AD AS DateTime), CAST(0x0000A72700F7CF74 AS DateTime), N'', N'', N'18526308', N'YasserMonkachi', 10931, 2390, N'Benslimane', N'1ffd06ae60e041d9', N'  33.6122,  -7.12111', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836233256831975425', N'Le Nokia 3310 est de retour ! - MWC 2017 https://t.co/7KTMBTqfdM', CAST(0x0000A7300019BED2 AS DateTime), CAST(0x0000A72700FB6634 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836490711830790144', N'#vonvon https://t.co/mmy5wmHc4x', CAST(0x0000A73000022243 AS DateTime), CAST(0x0000A7280088E03C AS DateTime), N'vonvon,', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836651657169620992', N'يا ما أحلى الفسحة يا عيني  على رأس البر
والقمر نور   عيني يا عيني يا عيني   على موج البحر https://t.co/E4Fiix5Ku4', CAST(0x0000A72F01763DB8 AS DateTime), CAST(0x0000A7280138876C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836703022155722752', N'« Sozi » dans Linux Pratique 100 (Mars-Avril 2017) https://t.co/dMyJedNvjX', CAST(0x0000A7300019BECA AS DateTime), CAST(0x0000A72801709760 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837037756241100802', N'وزيرة الاتصال بجمهورية النيجر في ضيافة العدالة والتنمية | الموقع الإلكتروني لحزب العدالة والتنمية https://t.co/DBrvVRuIzB', CAST(0x0000A7300002223E AS DateTime), CAST(0x0000A72901526934 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837073954699366401', N'https://t.co/MP3V89vp5m', CAST(0x0000A730001A7200 AS DateTime), CAST(0x0000A7290179EA7C AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837080002344566784', N'في برنامج ومضات على راديو بيجيدي : الدكتور محمد المتقن يشرح رواية نايحات السلطان https://t.co/HMa3RA5c1G', CAST(0x0000A7300002222F AS DateTime), CAST(0x0000A72901808454 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837283962577960961', N'تقرير المستشار الملكي عمر عزيمان حول وضعية التعليم بالمغرب، إقرار صريح بفشل جميع السياسات المولوية الشريفة التي... https://t.co/DrMor4HDDZ', CAST(0x0000A72F01763A28 AS DateTime), CAST(0x0000A72A00D39C44 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837285063477854208', N'Is Morocco the perfect alternative for an adventurous family holiday? https://t.co/w0r3iuZmO3', CAST(0x0000A72F018B216F AS DateTime), CAST(0x0000A72A00D4CF4C AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837311456651718657', N'Sometimes we feel alone and with broken arms, that we can''t count on anything or anyone. Let''s never forget that... https://t.co/7TMYkLYeBL', CAST(0x0000A72F018B2159 AS DateTime), CAST(0x0000A72A00F19DE8 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837314869292634113', N'Granit rocks, Tafraoute -  Morocco. *Pictures out of my book "Views of Africa" published in 2010… https://t.co/dRcNWvXD2a', CAST(0x0000A72B00076AB1 AS DateTime), CAST(0x0000A72A00F557D0 AS DateTime), N'', N'', N'116204617', N'sfoto_', 42, 47, N'Ait Ouafqa', N'271cfb0d6c5cbb09', N'  29.4667,  -9.08333', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837337360991936512', N'بالفيديو.. الخبز المر.. الشرطة الاسبانية تعتدي بالعصي على مغربيات التهريب المعاشي https://t.co/RLsBsEAbU7', CAST(0x0000A72F0176285D AS DateTime), CAST(0x0000A72A010DE368 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837377782267146241', N'@duffwoman_ @Anas_BOUGATAYA @docteurho ah oui j''ai oublié ! Nous serons à encgC le jeudi prochain ^^', CAST(0x0000A72F018B2150 AS DateTime), CAST(0x0000A72A013A00C4 AS DateTime), N'', N'@duffwoman_,@Anas_BOUGATAYA,@docteurho,', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837389561235976193', N'https://t.co/dtEdpX9CDV', CAST(0x0000A730001A71F4 AS DateTime), CAST(0x0000A72A0146DC90 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837390609484759040', N'Face2Face: Real-time Face Capture and Reenactment of RGB Videos (CVPR 2016 Oral) https://t.co/gnPWDzv5DA', CAST(0x0000A730001A71E8 AS DateTime), CAST(0x0000A72A0148005C AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837420142040604673', N'NASA released a ton of software for free and here’s some you should try https://t.co/G43qC95lNW', CAST(0x0000A730001A71D3 AS DateTime), CAST(0x0000A72A01683CB4 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837440426936315906', N'https://t.co/8y88MHaZpd', CAST(0x0000A730001A71B5 AS DateTime), CAST(0x0000A72A017E5FE4 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837675270056333312', N'La génération Erasmus à la rescousse de l’Europe ? https://t.co/zsZleq8YVV', CAST(0x0000A730001A71A8 AS DateTime), CAST(0x0000A72B00F32C58 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837768275652149248', N'RT @Oussameleon: #bouteflika serait mort ça a l''air officiel mais attendons des sources sûres!', CAST(0x0000A730001A719A AS DateTime), CAST(0x0000A72B0158AD80 AS DateTime), N'bouteflika,', N'@Oussameleon,', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837770520514920450', N'https://t.co/EztjwoDDFn', CAST(0x0000A730001A7193 AS DateTime), CAST(0x0000A72B015B2074 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837898022998663173', N'Dormir tranquille est un luxe pour les SDF, et ce bus veut le mettre à leur portée https://t.co/OOmlZFR8Ju', CAST(0x0000A730001A7178 AS DateTime), CAST(0x0000A72C005AC648 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837983712910405632', N'La Théorie des Jeux — Science étonnante #39 https://t.co/I8DHg4TKL5', CAST(0x0000A7300019BEC3 AS DateTime), CAST(0x0000A72C00B84BB0 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838136533769195521', N'RT @Astro_Jeff: Reptile scales, or incredible and rugged geology in Morocco? https://t.co/UPjpqvCuHL', CAST(0x0000A73000025D92 AS DateTime), CAST(0x0000A72C015F1620 AS DateTime), N'', N'@Astro_Jeff,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838138676777467904', N'صورة المغرب من الفضاء .. الجبال تأخذ مساحة كبيرة 
https://t.co/kcnuESBv1d https://t.co/IqUpKiwde3', CAST(0x0000A73000025D88 AS DateTime), CAST(0x0000A72C01616CF4 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838139463163392004', N'واحد النابغة ديال حكيم بنشماش، باغي تعديل الدستور، لكي يسطو على رئاسة الحكومة حزبه..وقالك هذا ليس بانقلاب..... https://t.co/69XswopeZQ', CAST(0x0000A72F0176242E AS DateTime), CAST(0x0000A72C01624818 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838140079377952769', N'@ebtesambogari جميل على المستوى الشخصي .. لكن لا يحل مشكلة للعالم :/', CAST(0x0000A73000025D75 AS DateTime), CAST(0x0000A72C0162F45C AS DateTime), N'', N'@ebtesambogari,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838140592760766466', N'@Sirius_MR رغم فضائحه لا زالت شعبية فيون كبيرة .. ومواقفه ربما لا تقل سوءا عن لوبين', CAST(0x0000A73000025D6F AS DateTime), CAST(0x0000A72C01638354 AS DateTime), N'', N'@Sirius_MR,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838142723869786113', N'المغرب: صورة تافيلالت من الفضاء تظهر قنوات لنقل المياه تحت الأرض تم إنشاؤها في القرن 14 .. منها مايستخدم حتى اليوم… https://t.co/L9jKcHPHFy', CAST(0x0000A73000025D63 AS DateTime), CAST(0x0000A72C0165D6A4 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838143811532488704', N'@HabbajFaouzi اللي فهمت كانت كل قضية بوحدها .. دابا ولا قرار عام', CAST(0x0000A73000025D5E AS DateTime), CAST(0x0000A72C01670754 AS DateTime), N'', N'@HabbajFaouzi,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838152938740658176', N'بعد إفراغ التعليم العمومي من الطبقة المتوسطة بتشجيع المدارس الخاصة .. تظهر كل سنة دراسة رسمية تتباكى عن أحوال المدرسة العمومية 
#المغرب', CAST(0x0000A73000025D5A AS DateTime), CAST(0x0000A72C0170FD54 AS DateTime), N'المغرب,', N'', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838158226545868804', N'عدم وجود أبناء الطبقة المتوسطة بالمدرسة العموميية يؤدي إلى تدني جودة التعليم.. لأن أباء الطبقة المتوسطة هم من يستطيعون الضغط على المسؤولين', CAST(0x0000A73000025D57 AS DateTime), CAST(0x0000A72C0176C310 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838161535570743300', N'ميسيو اخنوش يريد ان يقنعنا انه ترك ملياراته سائبة، حبا في الشعب الفقير..نعم ترك كل تلك الثروة لكي يصلح امرنا... https://t.co/6J38Nl6J4o', CAST(0x0000A72F01761F5F AS DateTime), CAST(0x0000A72C017A5FAC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838162293879885825', N'المدارس الخاصة ربما كانت حلا لمشكل اقتصادي (الميزانية) وسياسي (التخلص من النقابات)  كرست فكرة أن التعليم الخاص هو سبيل الإرتقاء الإجتماعي', CAST(0x0000A73000025D54 AS DateTime), CAST(0x0000A72C017B329C AS DateTime), N'', N'', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838166267274080261', N'مع 2000 زاد الهوس بتعلم الفرنسية وزاد معه الهوس بالتعليم الخصوصي وأصبح شغل الناس أن مجموعة ف المجتمع درست ف البعثة الفرنسية ووصلت إلى السلطة', CAST(0x0000A73000025D4F AS DateTime), CAST(0x0000A72C017F898C AS DateTime), N'', N'', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838169949482938368', N'في فنلندا التي يضرب بها المثل في التعليم الناجح، لا توجد مدارس ولا جامعات خاصة! .. بإمكانك إنشاء مدرسة خاصة لكن ممنوع طلب رسوم دراسية', CAST(0x0000A73000025D4A AS DateTime), CAST(0x0000A72C01838E74 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838173803901517824', N'عندما قررت فنلندا إصلاح التعليم، كان الهدف جعل كل مدارس فنلندا في نفس المستوى لتحقيق العدالة الإجتماعية.. وليس تخريج نخبة من الطلبة المتفوقي', CAST(0x0000A73000025D3F AS DateTime), CAST(0x0000A72C0187C368 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838178640529620993', N'التفوق الأكاديمي لتلاميذ فنلندا لم يظهر إلا مؤخرا (~2001) بعد عقود من الإصلاح (~1970) وجعل التلميذ كيفما كان وضعه الإجتماعي هو مركز الإهتمام', CAST(0x0000A73000025D3A AS DateTime), CAST(0x0000A72D00018894 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838346769310302208', N'أجي تفهم تحرير سعر صرف الدرهم ( تعويم الدرهم ) - YouTube https://t.co/8pB7s4anfh', CAST(0x0000A730001A7162 AS DateTime), CAST(0x0000A72D00B90730 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838363530499874816', N'https://t.co/CieaPnPKbG', CAST(0x0000A73000022227 AS DateTime), CAST(0x0000A72D00CB5200 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838363715233800193', N'https://t.co/HFylsUmNtT', CAST(0x0000A7300002221F AS DateTime), CAST(0x0000A72D00CB8590 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838363921509715969', N'https://t.co/gsFXZyhLgl', CAST(0x0000A73000022212 AS DateTime), CAST(0x0000A72D00CBBEFC AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838449793311653888', N'العرنسية!
https://t.co/NgKPlA2Fzr

@hichaml3awd @Un_Marocain https://t.co/nDRYeTg3H1', CAST(0x0000A73000025D36 AS DateTime), CAST(0x0000A72D012977F4 AS DateTime), N'', N'@hichaml3awd,@Un_Marocain,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838477028034809857', N'RT @elhajjmalcolmx: "اريد ان اقاضي نظام التعليم في العالم"
@blafrancia 
@Zotob_ https://t.co/vl3YE54StI', CAST(0x0000A73000025D32 AS DateTime), CAST(0x0000A72D014730F0 AS DateTime), N'', N'@elhajjmalcolmx,@blafrancia,@Zotob_,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838477358491369472', N'@elhajjmalcolmx @Zotob_ رائع', CAST(0x0000A73000025D20 AS DateTime), CAST(0x0000A72D01478D84 AS DateTime), N'', N'@elhajjmalcolmx,@Zotob_,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838479648216477697', N'@MohaOuBr أنت صاحب الفيديو ؟', CAST(0x0000A73000025D1B AS DateTime), CAST(0x0000A72D014A0C30 AS DateTime), N'', N'@MohaOuBr,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838510729607200769', N'@MohaOuBr  إن شاء الله', CAST(0x0000A73000025D17 AS DateTime), CAST(0x0000A72D016BF8F4 AS DateTime), N'', N'@MohaOuBr,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838510811605762048', N'@elhajjmalcolmx شكرا', CAST(0x0000A73000025D13 AS DateTime), CAST(0x0000A72D016C0F38 AS DateTime), N'', N'@elhajjmalcolmx,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838527607482232832', N'@MustaphaSwinga @0Hamzaaaaa0 @MohaOuBr بغيت غير نقول تبارك الله عليك', CAST(0x0000A73000025CF8 AS DateTime), CAST(0x0000A72D017E6494 AS DateTime), N'', N'@MustaphaSwinga,@0Hamzaaaaa0,@MohaOuBr,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838530572318277633', N'@hassanSDK les bonnes et loyales disquettes à 1,2 Mo :) @AMybatit', CAST(0x0000A7300019BDE6 AS DateTime), CAST(0x0000A72D0181A118 AS DateTime), N'', N'@hassanSDK,@AMybatit,', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838757178903248897', N'Who''s in this year ? it''s in mhamid lghizlane ! https://t.co/bqS4Ey0oYb', CAST(0x0000A72F018B214B AS DateTime), CAST(0x0000A72E00ED6FFC AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838833164860653568', N'عاجل .. استقالة كريستوفر روس مبعوث الأمم المتحدة إلى الصحراء #تطبيق_نبض https://t.co/i4muTOL2tS', CAST(0x0000A73000022207 AS DateTime), CAST(0x0000A72E01405DAC AS DateTime), N'تطبيق_نبض,', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838835850184118274', N'استقالة كريستوفر روس مبعوث الأمم المتحدة إلى الصحراء https://t.co/XJf1a2wTtv', CAST(0x0000A73000022202 AS DateTime), CAST(0x0000A72E01434CD8 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838836121039667202', N'استقالة كريستوفر روس مبعوث الأمم المتحدة إلى الصحراء https://t.co/H3OGenavZF', CAST(0x0000A730000221FD AS DateTime), CAST(0x0000A72E014397D8 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838836153751068675', N'استقالة كريستوفر روس مبعوث الأمم المتحدة إلى الصحراء https://t.co/0KXRFmY9Rh', CAST(0x0000A730000221F6 AS DateTime), CAST(0x0000A72E0143A138 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838837763885654017', N'La france , grande absente du top 10 des économies mondiales en 2030 https://t.co/rbrxdGutq5', CAST(0x0000A730001A715A AS DateTime), CAST(0x0000A72E01456338 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838840819985580032', N'لهذا لا يمكن إشراك الاتحاد الاشتراكي في الحكومة | الموقع الإلكتروني لحزب العدالة والتنمية https://t.co/N7jV0lEEIl', CAST(0x0000A730000221E9 AS DateTime), CAST(0x0000A72E0148B984 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838901367569776640', N'#حجم_الزعل - #فزاع

عن وطا الارض السحابه تعانقه هيبه علوي
والتواضع من صفات العظماء المستحبه
والحياه الفاخره روعه... https://t.co/FUbAay5vh1', CAST(0x0000A72F018B2147 AS DateTime), CAST(0x0000A72E018ACD88 AS DateTime), N'حجم_الزعل,فزاع,', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838904339834028033', N'عن وطاالارض السحابه تعانقه هيبه علوي والتواضع من صفات العظماء المستحبه والحياه الفاخره روعه لكن ما هي بجوي
جوي الفرحه على وجه الفقارى الأحبه', CAST(0x0000A72F018B2120 AS DateTime), CAST(0x0000A72F00028A64 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33014, 832, N'Morocco', N'b5fc43481ea8b89a', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838999498911277056', N'زيارة وزيرة الاتصال بدولة النيجر لحزب العدالة https://t.co/LT2Ae4L67k', CAST(0x0000A730000221CD AS DateTime), CAST(0x0000A72F006A65E4 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839042724124901376', N'François Fillon «pas autiste» : SOS Autisme France saisit le CSA https://t.co/u3foDWnPSE', CAST(0x0000A730001A7150 AS DateTime), CAST(0x0000A72F00999210 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839070661293322245', N'القضية الوطنية (الصحراء)، ليست بحاجة لتواجد حزب لشكر في الحكومة، بل في حاجة الى الديموقراطية والعدالة الاجتماعية... https://t.co/kL6VkzRBhD', CAST(0x0000A72F0175F700 AS DateTime), CAST(0x0000A72F00B80FEC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839093396035747842', N'Le Maroc aurait déployé des forces spéciales dans la zone d’El Guerguarat https://t.co/RjJE1k9fuX', CAST(0x0000A730001A7143 AS DateTime), CAST(0x0000A72F00D0DF7C AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839117750861721602', N'فكما يستحيل لمن يسترزق #الملكية_المخزنية في ترويج لبروبغندا أن يكون موضوعيا فملف الصحراء
نفس الشئ مع مرتزقة $ بروبغندا جهات داعمة لبوليزريو', CAST(0x0000A72F0180E7AF AS DateTime), CAST(0x0000A72F00EB7490 AS DateTime), N'الملكية_المخزنية,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839120439091814404', N'@MrMolam خسذ أشبولكغ راشك :)', CAST(0x0000A72F0180E79F AS DateTime), CAST(0x0000A72F00EE63BC AS DateTime), N'', N'@MrMolam,', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839133530785468418', N'Join me in my mission to build an open IoT network, covering the city of @GrandCasablanca. @thethingsntwrk https://t.co/u7YdWX3gpP', CAST(0x0000A730001A713F AS DateTime), CAST(0x0000A72F00FCAD28 AS DateTime), N'', N'@GrandCasablanca,@thethingsntwrk,', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839133777922256896', N'Rejoignez moi dans la mission de créer un réseau IoT qui couvre la ville de  @GrandCasablanca. @thethingsntwrk https://t.co/u7YdWX3gpP', CAST(0x0000A730001A713C AS DateTime), CAST(0x0000A72F00FCF24C AS DateTime), N'', N'@GrandCasablanca,@thethingsntwrk,', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839133997653438467', N'Join me to make this happen https://t.co/Xew9aF3lwM', CAST(0x0000A730001A7131 AS DateTime), CAST(0x0000A72F00FD3068 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839137098401787905', N'هكذا سهل السيد ادريس لشكر مهمة رئيس الحكومة !! | الموقع الإلكتروني لحزب العدالة والتنمية https://t.co/w7rsU3MZ11', CAST(0x0000A730000221C7 AS DateTime), CAST(0x0000A72F0100926C AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839137973711089665', N'https://t.co/LBJDuHtWzo https://t.co/xMSs4jIXBZ', CAST(0x0000A730000221AF AS DateTime), CAST(0x0000A72F01018758 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839139581068980229', N'Suivez @TTNCasablanca @GrandCasablanca', CAST(0x0000A730001A7125 AS DateTime), CAST(0x0000A72F0103482C AS DateTime), N'', N'@TTNCasablanca,@GrandCasablanca,', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839165243695710208', N'عربونوش صنف أعراب مُعمرين ما قدتو على فرس ولاكورد ولاأتراك ولا أرمن هدو ساهلين ساعك أمازيغ دكدنا بابكم هربتوا للقفار
https://t.co/xmW5bKMcmu', CAST(0x0000A72F0180E79B AS DateTime), CAST(0x0000A72F011F49B4 AS DateTime), N'', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839166235220770817', N'حركة مرتزقة #البوليزريو هي بمثابة "حركة ثورة الأعراب" التي صنعتها #بريطانيا ضد العثمانين الأتراك لتقسيم المنطقة وتأسيس أنظمة عربنجية شمولية', CAST(0x0000A72F0180E798 AS DateTime), CAST(0x0000A72F01205F70 AS DateTime), N'البوليزريو,بريطانيا,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839166709516861440', N'المرحلة الأولى كانت تأسيس " كيان #موريتانيا" ولن أعود لتذكير بتاريخ تأسيس هذا الشبح الذي لا أصول تاريخية ولا سياسية ولا ثقافية في المنطقة', CAST(0x0000A72F0180E795 AS DateTime), CAST(0x0000A72F0120E3DC AS DateTime), N'موريتانيا,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839167095443161088', N'وقبلها المرحلة الأولى سبقها تأسيس كيان وهمي آخر #مالي دول  شبح آخر أسسته #فرنسا من لا شئ في أرض #الطوارق الأمازيغ كنظام عسكري شمولي عنصري', CAST(0x0000A72F0180E791 AS DateTime), CAST(0x0000A72F01214FAC AS DateTime), N'مالي,فرنسا,الطوارق,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839167515565703169', N'ثم بعدها جاءت مرحلة #البوليولو البوليزريو حركة مرتزقة محلية بتسير ولوجسيتك وموارد مالية وبشرية وعسكرية إقليمية ودولية كسرطان في #ثامازغا نغ', CAST(0x0000A72F0180E78E AS DateTime), CAST(0x0000A72F0121C4DC AS DateTime), N'البوليولو,ثامازغا,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839168034044530688', N'هناك من يعيش في وهم أساطير بروبغندا متآكلة للحرب الباردة ويصنع من حركة شمولية قومجية مسلحة مرتزقة  وهم صورة حركة تحريرية لا وجود لها فالواقع', CAST(0x0000A72F0180E78A AS DateTime), CAST(0x0000A72F01225500 AS DateTime), N'', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839169218008477697', N'وبالمناسبة بحال #فلسطين بحال #المغرب  في هذه الناحية 
الوصوليين والإنتهازين ممن يسترزق مع الأنظمة أو حركة مرتزقة مسلحة العرض أكثر من الطلب', CAST(0x0000A72F0180E786 AS DateTime), CAST(0x0000A72F0123A0A4 AS DateTime), N'فلسطين,المغرب,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839169588046745600', N'من يرفع علم حركة شمولية عسكرية مرتزقة #البوليزريو بغض النظر عن العلم كرمز ولكن تمثليته فهو يمثل أنذل حركة في المنطقة عسكرية مرتزقة شمولية', CAST(0x0000A72F0180E781 AS DateTime), CAST(0x0000A72F012407C4 AS DateTime), N'البوليزريو,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839170193456787456', N'ليس هناك فرق بين من يرفع #علم_البوليزريو و #علم_القذافي أو علم صهانية في بداية القرن 20 نفوس تحن لحركات #مُعمرة مرتزقة ديكتاتورية دخيلة !', CAST(0x0000A72F0180E77D AS DateTime), CAST(0x0000A72F0124B084 AS DateTime), N'علم_البوليزريو,علم_القذافي,مُعمرة,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839170635385405440', N'عاجلا أو أجلا 
الحركات التحريرية لشعوب الأصلية في #ثامزغا - بكل رموزها يستحيل لها أن تتقاطع مع حركات مُعمرة مرتزقة لأنها النقيض بل عدوها', CAST(0x0000A72F0180E779 AS DateTime), CAST(0x0000A72F01252CBC AS DateTime), N'ثامزغا,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839171010960183296', N'وما حراك #آية_إيفني كما ذكرت قبل سنوات و أشهر وقبل أيام في #الصحراء_الأمازيغية لدليل قاطع أن أكبر عدو لأهل الصحراء هي حركة #مُعمرة بوليزريو', CAST(0x0000A72F0180E775 AS DateTime), CAST(0x0000A72F01259508 AS DateTime), N'آية_إيفني,الصحراء_الأمازيغية,مُعمرة,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839171389005434881', N'ما حدث في #مراكش  قبل سنوات كان أول مؤشر على صحة قراءتي قبل سنوات النظام مطاطي يمكن محاورته رغم طبيعته لكن مرتزقة البوليزريو فهو #جماد_مُعمر', CAST(0x0000A72F0180E771 AS DateTime), CAST(0x0000A72F0125FE80 AS DateTime), N'مراكش,جماد_مُعمر,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839171835585511424', N'الآن مرتزقة المُعمرين والمُعمرات لصحراءنها الأمازيغية خرجوا من صمتهم لوجه سهامهم للأمازيغ السكان الأصليين لصحراء ولتهجم على حراك #الريف :)', CAST(0x0000A72F0180E76E AS DateTime), CAST(0x0000A72F01267BE4 AS DateTime), N'الريف,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839172144986734593', N'لكن تاريخ المُعمرين في #الصحراء - سواءا الجنوب الغربية أو ما يسمى موريتانياأو حتى مالي  هزيل جدا بلا بصمات تاريخ وهمي نُفخ فيه ومنفوخ فيه', CAST(0x0000A72F0180E74D AS DateTime), CAST(0x0000A72F0126D29C AS DateTime), N'الصحراء,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839172484465319937', N'التاريخ العظيم بكل + وسلبيتها الذي بصم #الصحراء_الأمازيغية هو ليس للمُعمرين ولكن لسكان الأصليين #الأمازيغ بن تشفين نموذج على سبيل المثال', CAST(0x0000A72F0180E748 AS DateTime), CAST(0x0000A72F01273188 AS DateTime), N'الصحراء_الأمازيغية,الأمازيغ,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839172855443124224', N'يوسف بن تاشفين الأمازيغي يفضح أكاذيب مرتزقة نخبة #البوليزري و ومرتزقة #موريتانيا  المعمريين العُروبيين بأن الصحراء هي ليست لهم ولكن للأمازيغ', CAST(0x0000A72F0180E73E AS DateTime), CAST(0x0000A72F012798A8 AS DateTime), N'البوليزري,موريتانيا,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839173161937678336', N'يمكن لهيئات ومنظمات الدولية مرتزقة #البوليزريو شراء ذمام المُعمرين والمعمرات أو الوصولين والإنتهازيين ب $ كما تقوم بذلك أنظمتنا في المنطقة', CAST(0x0000A72F0180E73A AS DateTime), CAST(0x0000A72F0127EE34 AS DateTime), N'البوليزريو,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839173583331000321', N'لكن مرة أخرى العارف بتاريخ #الصحراء القديم والحديث وتاريخ تخصيب حركة مرتزقة معمري #البوليزريو في المنطقة يستحيل أن يسقط في دعم مرتزقة معمرين', CAST(0x0000A72F0180E623 AS DateTime), CAST(0x0000A72F01286490 AS DateTime), N'الصحراء,البوليزريو,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839192075174359040', N'Saisissez l''opportunité de faire décoller #casablanca et la mettre sur la vague IoT à temps 
Enregistrez vous sur... https://t.co/bH7y9TLJmC', CAST(0x0000A730001A7117 AS DateTime), CAST(0x0000A72F013C9230 AS DateTime), N'casablanca,', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839199482524880897', N'RT @elourouba: Saisissez l''opportunité de faire décoller #casablanca et la mettre sur la vague IoT à temps 
Enregistrez vous sur... https:/…', CAST(0x0000A730001A7114 AS DateTime), CAST(0x0000A72F0144A7B8 AS DateTime), N'casablanca,', N'@elourouba,', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839199525126488066', N'RT @TTNCasablanca: https://t.co/IhpJCCCaH2', CAST(0x0000A730001A7098 AS DateTime), CAST(0x0000A72F0144B49C AS DateTime), N'', N'@TTNCasablanca,', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'und')
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
