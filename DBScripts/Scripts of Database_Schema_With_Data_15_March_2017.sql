USE [ScrapyWeb]
GO
ALTER TABLE [dbo].[TweetSet] DROP CONSTRAINT [DF_TweetSet_DateDownload]
GO
/****** Object:  Table [dbo].[TwitterApplications]    Script Date: 3/15/2017 2:57:28 PM ******/
DROP TABLE [dbo].[TwitterApplications]
GO
/****** Object:  Table [dbo].[TweetSet]    Script Date: 3/15/2017 2:57:28 PM ******/
DROP TABLE [dbo].[TweetSet]
GO
/****** Object:  Table [dbo].[FBGroups]    Script Date: 3/15/2017 2:57:28 PM ******/
DROP TABLE [dbo].[FBGroups]
GO
/****** Object:  Table [dbo].[FBApplications]    Script Date: 3/15/2017 2:57:28 PM ******/
DROP TABLE [dbo].[FBApplications]
GO
/****** Object:  Table [dbo].[FacebookGroupFeed]    Script Date: 3/15/2017 2:57:28 PM ******/
DROP TABLE [dbo].[FacebookGroupFeed]
GO
USE [master]
GO
/****** Object:  Database [ScrapyWeb]    Script Date: 3/15/2017 2:57:28 PM ******/
DROP DATABASE [ScrapyWeb]
GO
/****** Object:  Database [ScrapyWeb]    Script Date: 3/15/2017 2:57:28 PM ******/
CREATE DATABASE [ScrapyWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ScrapyWeb', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ScrapyWeb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[FacebookGroupFeed]    Script Date: 3/15/2017 2:57:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FacebookGroupFeed](
	[GroupPostId] [varchar](150) NOT NULL,
	[PostText] [nvarchar](max) NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_FacebookGroupFeed] PRIMARY KEY CLUSTERED 
(
	[GroupPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FBApplications]    Script Date: 3/15/2017 2:57:29 PM ******/
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
/****** Object:  Table [dbo].[FBGroups]    Script Date: 3/15/2017 2:57:29 PM ******/
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
/****** Object:  Table [dbo].[TweetSet]    Script Date: 3/15/2017 2:57:29 PM ******/
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
/****** Object:  Table [dbo].[TwitterApplications]    Script Date: 3/15/2017 2:57:29 PM ******/
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
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1377736762301214', N'لكم التعليق', CAST(0x0000A7360178C7DC AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1381638058577751', N'وقفة احتجاجية لمهني سيارة الأجرة الصنف الثاني أمام مقر عمالة إفران .
و السبب المضايقات من طرف بعض مهني سيارة الأجرة الصنف الأول. لقيامهم بنقل الركاب داخل المجال الحضاري.', CAST(0x0000A73500F5670C AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1383100205098203', N'سلام خوتي واخواتاتي بغيت نعرف هاد الفايس بوك نتاعمن هاد rah faux compte  او لي كيعرفو اقولينا شكوناهوا و شكرا', CAST(0x0000A7350071A048 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1383710528370504', N'أطالب المسؤولين بالقسم الإقتصادي بعمالة إقليم إفران و الجماعة الترابية بمدينة إفران بمراجعة تسعيرة النقل بواسطة سيارة الأجرة الصغيرة بمدبنة إفران و جعاها كمدينة أزرو  وذلك من أجل تكافؤ الفرص بين المواطنات والمواطنين   في الولوج لهذه الخدمة، كما أطالب بالترخيص لسيارة الأجرة الكبيرة بنقل المواطنات والمواطنين داخل المجال الحضري لضمان مبدأ المنافسة الشريفة.
كما أدعو المجتمع المدني بالإقليم الى التنسيق من أجل رفع الضرر المادي الذي يلحق جيوب المواطن بسبب التسعيرة المبالغ فيها من طرف سيارة الأجرة الصغيرة بمدبنة إفران.', CAST(0x0000A73500FBF658 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1384015378340019', N'معرفتش علامن غدي نترحم ......', CAST(0x0000A734014D2B68 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1384191818322375', N'بلاغ توضيحي يخص ساكنة مدينة إفران  بخصوص الوقفة الاحتجاجية لساءقي سيارات الأجرة الصغيرة 

منذ يومه الجمعة الماضي قامت هذه الأخيرة بوقفة احتجاجية بتمويه كامل ومغلوط للرأي العام. الافراني.... أن هذا الفعل يخص النضال من أجل إيقاف عمل سيارات الأجرة الكبيرة عن العمل داخل المجال الحضري لمدينة إفران وهذا تغليط لساكنة المدينة. المشكل هو كالآتي :
بعدما قامت مجموعة من سيارات الأجرة الكبيرة بنقل وتسفير زبناءها الطلبة من أمام باب جامعة الأخوين إلى مدنهم المجاورة خارج المجال الحضري والترابي لمدينة إفران أى إلى بعض المدن كالرباط و الدار البيضاء. ... إلخ 
كان رد الفعل وقفة احتجاجية بحجة الاشتغال داخل المدينة  حيث طالبوا نقل الطلبة إلى المحطة الطرقية لاستخلاص الأجر داخل المدينة ومن ثم نقوم نحن بتسفيرهم إلى الوجهات المطلوبة وهذا أمر مرفوض وغير منطقي. أو قانوني 
عذرا للساكنة على هذا التصرف الاناني في حقهم من طرف هذه الجهة غير المسؤولة.  .
نحن سائقي سيارات الأجرة الكبيرة نقوم بنقل الزبناء خارج المجال الحضري وليس داخله ومن أي نقطة داخل المدينة كيفما كانت وشكرآآ على تفهمكم.', CAST(0x0000A73500EF5E84 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1384645234943700', N'https://youtu.be/pf5FCm63fZM', CAST(0x0000A7350057AE18 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1384758804932343', N'السلام عليكم ورحمة الله وبركاته. 
 البارح و انا جالس قرب صيدلية الفضيلة  الموجودة بحي الاطلس ؛ انتظر قدوم الصيدلي ؛ بعد صلاة المغرب  إذ اتفاجؤ بأحد المخلوقات المحسوبين على البشر ؛ يدخل بسيارته بالساحة المتواجدة أمام الصيدلية ؛ و يقوم بشحن  عدد من قطع الرصيف الموضوعة هناك !!!  والله يا إخوة شعرت بالخجل لكوني لم أحرك ساكنا . 
فهل يحكمنا قانون الغاب ؟؟  هل مزال الغني يأكل الضعيف ؟ هل وصلت الوقاحة بهاؤلاء إلى التطاول على الملك العمومي و مرافقه ؟؟ أليست حراسة لهذه الادوات و المواد التي تضيع عليها اموالنا العامة ؟؟', CAST(0x0000A7350076F458 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1385177728223784', N'ـ  موسم الصيد المهزلة ـ
افتتح موسم الصيد هذا اليوم الأحد 12/03/2017 و قد حج المئات من هواة الصيد بمختلف أعمارهم الى الوديان المرتبة آملين وفرة سمك التروتة بصنفيه النهرية و القزحية لكن فرحتهم لم تدم طويلا بعدما اكتشفوا أن هذه الأنهار خالية الا من بعض اسماك التروتة القزحية المرباة  بصهاريج رأس الماء وعين عتروس والتي يطلقون عليها هواة الصيد لقب الزراوطية لكونها مدجنة وسهلة الإصطياد و تتناول أي طعم بما في ذلك العجين و التي تم تفريغها بهذه الأودية 24 ساعة قبل انطلاق افتتاح الموسم ٠ هذه الحيلةاو المسرحية التي أضحى  المركزالوطني لأحياء الماء و تربية السمك يلجأ إليها كل سنة  قبل افتتاح موسم الصيد لدر الرماد في أعين الصيادين و حفظ ماء الوجه وإعطاء الإنطباع على أن السمك موجود حتى يقول الجميع أن ـ العام زين ـ  لم تعد تنطلي على جل هواة الصيد ٠ أجل بعد مقابلة رئيس الجمعية الرياضية لصيد السمك بأزرو مروفوقا بالكاتب العام لنفس الجمعية بكل من واد خنيك ـ كيكو ـ الذي تمت تهيئته مؤخرا، و واد بقريت بعض هواة الصيد أعرب معظمهم عن امتعاضهم للحالة المزرية التي توجد عليها الوديان مبدين تذمرهم و عدم رضاهم  على السياسة الفاشلة التي تنهجها المندوبية السامية للمياه و الغابات و محاربة التصحر الذي أودى بقطاع الصيد الى هذه الكارثة، واعين كل الوعي انه بمجرد نفاد الكميات القليلة المفرغة وذلك خلال الاسبوع القادم على ابعد تقدير  لن يجدوا ما يصطادونه طيلة موسم الصيد، لكون المركز الذي قام بتطعيم الأودية  بفراخ التروتة حسب ذكره هذا إن كان حقا فعل، لم يقم بأي تتبع لمعرفة هل هي موجودة أصلا ام جرفتها السيول؟  ومدى  نموها ؟ إذن لن نستغرب انعدام السمك بمياهنا القارية مادام المركز لا يثابر على تطعيمها على مراحل بالفراخ و تتبع نموها والكف عن اللجوء الى الاسماك الجاهزة للصيد لانقاد الموسم٠', CAST(0x0000A735010522C8 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1385315371543353', N'ـ  ساكنة أمغاس تنتفض ـ 

في هذا اليوم الأحد 12 مارس 2017 قامت جمعية شباب أمغاس للرياضة والتنمية بوقفة إحتجاجية  إبتداء من الساعة التاسعة  صباحا إلى غاية الساعة الحادية عشرة  أمام بحيرة أمغاس 1 وذلك إستنكارا لكل أشكال الإقصاء والتهميش الذي طال الساكنة خصوصا منهم الشباب من قبل المركز الوطني لإحياء الماء وتربية السمك بأزرو، و المتمثل في إغلاق المركب السياحي أمغاس 2 الذي يعتبر وباقي البحيرات المتنفس الوحيد لهذه البلدة في وجه ساكنة المنطقة وكافة الزوار إضافة الى سوء تدبير هذه البحيرات وجعلها تحت تصرف نخبة من الصيادين المقربين من مهندس يعمل بالمركز آنف الذكر سيما امغاس 2 و 3 ليقيموا فيه ولائمهم ، وجلب ذويهم و أقاربهم لقضاء أوقات ممتعة بجنباتها دون غيرهم و لربما قضاء مآرب أخرى لا يعلمها سواهم٠ كما ان المحتجين طالبوا برحيل ذلك المهندس والكف عن قطع الاشجار و تغيير معالم البحيرات ونددوا كذلك بغزو الإسمنت لبحيرة امغاس 2 و تشويه جماليتها ٠', CAST(0x0000A7350134BF74 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1385382741536616', N'الشوباني بين الامس واليوم
قلك بن كيران هناك رئيس جماعة لم يكن عندو صباط ودابا تيركب في سيارة تسوا120 مليون وأنا اقدم له الشوباني من حزبه وجماعته لم يكن يتوفر على ثمن كأس شاي في مقهى  بمدينة الراشيدية  وبنعال البلاستيكية للسيدات وها هو يتبرع في اسطول من السيارات الفاخرة في افقر جهة في الوطن', CAST(0x0000A7350162DCEC AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1385397998201757', N'يأتي هذا الإجتماع في إطار اللقاءات التواصلية التي تنظمها مؤسسة تنمية القدرات الريادية بجامعة الأخوين، في إطار المسابقة الجهوية لرائد السنة، وقد عرفت المرحلة الأولى من المسابقة مشاركة اكثر من 170 مشاركة ومشارك على مستوى جهة فاس مكناس، وتمثل جمعية  شباب بلا حدود في هذه المسابقة الآنسة صفاء عصمي، حيث تم انتقائها ضمن قائمة 11 متأهل  للمرحلة النهائية، في انتظار الإعلان عن الفائز بلقب الريادة يوم 4 أبريل 2017 بجامعة الأخوين', CAST(0x0000A735015525FC AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1385491034859120', N'علم المملكة المغربية يرفع اليوم بمقر الاتحاد الافريقي', CAST(0x0000A7350163DEBC AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1385552334852990', N'في قبة البرلمان يوجد فقط هدا الشاب الدي يشتغل بصدق وإخلاص ، أين هم الأخرون ؟', CAST(0x0000A73501749798 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1385584768183080', N'شكرا الاخ جبريل على الاستضافة في صفحة MRJ', CAST(0x0000A7350182E488 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1385774848164072', N'ـ  ساكنة أمغاس تنتفض ـ 

في هذا اليوم الأحد 12 مارس 2017 قامت جمعية شباب أمغاس للرياضة والتنمية بوقفة إحتجاجية  إبتداء من الساعة التاسعة  صباحا إلى غاية الساعة الحادية عشرة  أمام بحيرة أمغاس 1 وذلك إستنكارا لكل أشكال الإقصاء والتهميش الذي طال الساكنة خصوصا منهم الشباب من قبل المركز الوطني لإحياء الماء وتربية السمك بأزرو، و المتمثل في إغلاق المركب السياحي أمغاس 2 الذي يعتبر وباقي البحيرات المتنفس الوحيد لهذه البلدة في وجه ساكنة المنطقة وكافة الزوار إضافة الى سوء تدبير هذه البحيرات وجعلها تحت تصرف نخبة من الصيادين المقربين من مهندس يعمل بالمركز آنف الذكر سيما امغاس 2 و 3 ليقيموا فيه ولائمهم ، وجلب ذويهم و أقاربهم لقضاء أوقات ممتعة بجنباتها دون غيرهم و لربما قضاء مآرب أخرى لا يعلمها سواهم٠ كما ان المحتجين طالبوا برحيل ذلك المهندس والكف عن قطع الاشجار و تغيير معالم البحيرات ونددوا كذلك بغزو الإسمنت لبحيرة امغاس 2 و تشويه جماليتها ٠', CAST(0x0000A736002BA82C AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1385830424825181', N'شكون يدير فينا واحد الخير.بغينا نعرفو شكون الناس اللي عندهوم الكريمات ديال طاكسي صغير فافران  وبغينا نعرفو شكون مالين الشكارة اللي تيتحكمو فالقطاع.لانه بانلي ولاد افران اللي معتصمين غي شيافر بوفريا مساكن بغينا نعرفو اللوبي اللي محركهوم وتيستافد ومخبع من مور هاد الشباب المقهور والمغلوب على أمرو مسكين.وشكرا', CAST(0x0000A736009CEBE0 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1385855288156028', N'نظمت مبادرة درعة تافيلالت بتنسيق مع جمعية شباب بلا حدود بأزرو النسخة الرابعة في التوجيه لفائدة تلميذات و تلاميذ الثانويات التأهيلية بأزرو ، وذلك يومي السبت 11 مارس 2017، بالمركز الثقافي بمدينة أزرو.', CAST(0x0000A7360047CF34 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1386307928110764', N'في عوة جديدة للعرين تحية حب و احترام لكل اصدقائي ، اخواني ، اخواتي الافرانيين و الافرانيات ؛ في كثير من الاحيان لا اود ان اشارك و اكتفي بمتابعة الصفحة لكن الكثير الكثير من الامور التي تخص الشٱن المحلي تدفعني للمشاركة بعيدا عن مبدأ النقذ الهدام ولكن فعلا تدني مستوى كل الخدمات مع المجلس الشاب الذي كنا نتوسل فيه ما هو خير للبلاد والعباد لكن  كنا على خطأ (الناس هزا جنوا كتقلب غي ما تسلخ ) بدون الدخول في التفاصيل حتى لا تفقدو ذلك النقير من الاحترام الافراني ، لكن فعلا مستوى جد ضعيف لأداء المنتخبين في ابسط الامور واكثرها اهمية (الانارة) حيث نجد انه اذا انقطع الكهرباء في احد الاحياء يهمل لأيام و ربما لأسابيع و غالبا لأشهر و في العديد من الاماكن الحيوية ، .... فعلا خيبة امل كبيرة فيكم يا مجلس الشباب على الاقل القاري و العشني كيشفرو و كيخدمو نتوما غي شفرا بلا خدمة منهمكين الله يعطيكم الصحة.', CAST(0x0000A73600F5D1B0 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1386386288102928', N'فشل انعقاد الجلسة الثالثة من دورة فبراير2017 بجماعة سيدي المخفي
والكرة في مرمى السلطات الاقليمية', CAST(0x0000A736014E9200 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1386719704736253', N'إفران بعيون جديدة', CAST(0x0000A736017B85D0 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1386771584731065', N'منصب رئيس مجموعة الجماعات البيئة بإفران في المزاد العلني!؟
الحياد المطلوب حتى لا تسند الأمور إلى غير أهلها؟', CAST(0x0000A73601822200 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'142220009186235_1387034198038137', N'هل تستدرك الدوائر المسؤولة محليا وإقليميا وجهويا عارا على جبينها؟
كرة اليد الآزروية أمام فرصة تاريخية لإقليم إفران
 وظلم ذوي القربى إلى أين؟', CAST(0x0000A737006A6968 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1497349720496080', N'salam merci partager et d''être avec nous le jour de l''évenement dial le don de sang m3a tes amies 
 centre régional de transfusion sanguine a les amicales المركز الجهوي لتحاقن الدم بحي ليزاميكال
le dimanche 15 juin á 9h incha allah
https://www.facebook.com/events/1435323513394235/?ref=25', CAST(0x0000A36301081B54 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1498032480427804', N'(y)', CAST(0x0000A363010817D0 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1498555477042171', N'salam merci partager et d''être avec nous le jour de l''évenement "" don de sang m3a tes amies 
 centre régional de transfusion sanguine a les amicales المركز الجهوي لتحاقن الدم بحي ليزاميكال ""
le dimanche 15 juin á 9h incha allah
https://www.facebook.com/events/1435323513394235/?ref=25', CAST(0x0000A363010816A4 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1511849229046129', N'https://www.facebook.com/events/318805064945523?refid=48', CAST(0x0000A36F0078F474 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1514800485417670', N'https://www.facebook.com/pages/festival-ISSNI-N-OURGH-du-film-amazigh/102231685984', CAST(0x0000A378002ADB18 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1521440038087048', N'salut mes ami(e)s je vous propose notre services à vous de les découvrir. "CreaClub" à Votre disposition:
création des sites web et applications de gestion
Présentation événementielle Relookage,
Conception et réalisation de projet d''infographie 
Réalisation de tous les supports de communication: brochures, catalogues, affiches, flyers, carte visite, dépliants, menus, panneaux publicitaires.', CAST(0x0000A3A300449AE4 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1535203556710696', N'https://www.facebook.com/events/288484874680396/?ref_notif_type=like&source=1', CAST(0x0000A3A30044CFA0 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1535505776680474', N'السلام عليكم يا أهل الخير 
بمناسبة عيد اﻷضحى تنظم مبادرة فاعل خير أكادير الكبير تحت إشراف لجنتها الاجتماعية حملة " تفاسكا ن الخير " في نسختها الثالثة والتي تهدف إلى توزيع أضاحي العيد على الأسر اليتيمة، الفقيرة والمعوزة بمنطقة أكادير الكبير 
وبموازاة مع توزيع الأضاحي ستشرف اللجنة الموازية للمبادرة على حملة "فكلوا منها وأطعموا البائس الفقير" في نسختها الثانية لتوزيع اللحوم على الأسر التي لم تتمكن من شراء أضحية العيد ابتداء من اليوم الثاني لعيد الأضحى 
كما ستشرف لجنة التكوين والتأطير للمبادرة على تقديم دورة تحسيسية حول آداب الذبح والنظافة والتي سيخصص ريعها لحملة توزيع الأضاحي 
وختاما ستنظم المبادرة زيارة اجتماعية بعد عيد الأضحى ستعطى الأولوية فيها للمتطوعين الذين اشتغلوا لإنجاح هذه الحملات
للمساهمة في هذه الحملات الخيرية ورسم البسمة على وجوه هذه اﻷسر -سواء بالمساهمة المادية أو بايصال الحملة ﻷكبر عدد من المحسنين فالدال على الخير كفاعله- المرجو التواصل معنا على بريد الصفحة :
https://m.facebook.com/MobadaratFaailKhair
رقم الحساب البنكي: القرض الفلاحي
225021032022202651012439
أو اﻻتصال على اﻷرقام التالية:
رقم الجمعية: 0613045619
مشرف الحملة: 0634643587', CAST(0x0000A3A6006FE8D4 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1562391507325234', N'https://www.facebook.com/pages/%D8%AC%D9%85%D8%B9%D9%8A%D8%A9-%D8%A7%D9%84%D8%AA%D8%B6%D8%A7%D9%85%D9%86-%D9%84%D9%84%D8%AB%D9%82%D8%A7%D9%81%D8%A9-%D9%88-%D9%84%D9%84%D8%AA%D9%86%D9%85%D9%8A%D8%A9-%D8%A7%D9%84%D9%82%D8%B1%D9%88%D9%8A%D8%A9/452602621449188?ref=bookmarks', CAST(0x0000A3F800FBC3F4 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1575012132729838', N'https://www.facebook.com/events/779119148827276/?ref_notif_type=plan_user_joined&source=1', CAST(0x0000A3F80122A708 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1576100872620964', N'chokran khay Hàssàn AnirOx :)', CAST(0x0000A3FB00633E40 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1577874105776974', N'https://www.facebook.com/events/856085181108929/?fref=ts', CAST(0x0000A413005D7ADC AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1587438558153862', N'يا شعب المتطوعين صوتو علينا صوتكم يحفزنا و يدعمنا نحن فريق صناع الامل رقم 3 
https://www.facebook.com/groups/MobadaratFaailKhair/permalink/614891028640541/?qa_ref=pp', CAST(0x0000A413005D6F24 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1596159750615076', N'السلام عليكم..
نطمع في 6 دقائق من وقتكم الثمين :)
نقدم اليكم حصيلة جمعيتنا مبادرة فاعل خير ـ أكادير الكبير خلال سنة 2014..

و هذا برنامجنا السنوي الذي سنشتغل عليه ان شاء الله خلال هذه السنة :
على مدار السنة سيتم العمل على الأنشطة التالية: 
* توفير دخل قار لأسرة معوزة 
* مشروع بادر - صدقة جارية 
* حملة أحلام بريئة
15 فبراير 2015 : دورة تكوينية في إنشاء وتسيير الجمعيات (التكوين القانوني) 
22 فبراير 2015 : نشاط ترفيهي 
08 مارس 2015 : دورة تكوينية في إنشاء وتسيير الجمعيات (التسيير الإداري والمالي) 22 مارس 2015 : الاحتفال بعيد الأم 
12 أنريل 2015 : دورة تكوينية في إنشاء وتسيير الجمعيات (إنشاء البطائق التقنية وإعداد التقارير) 
25 و 26 أبريل 2015 : دورة تكوينية في لغة الإشارة تحت عنوان: لنسمع ضجيجهم 
03 ماي 2015 : حملة خاصة بعمال النظافة 
10 ماي 2015 : دورة تكوينية في إنشاء وتسيير الجمعيات (إدارة الاجتماعات) 
02 غشت 2015 : نشاط ترفيهي 
09 غشت 2015 : دورة تكوينية في فن الإلقاء والتعامل مع الشخصيات 
06 شتنبر 2015 : دورة تكوينية في أنماط الشخصية 
شتنبر 2015 : إنشاء مكتبة بمقر المبادرة 
18 أكتوبر 2015 : حملة طبية لفائدة الأطفال 
25 أكتوبر 2015 : دورة تكوينية حول مهارات التفوق لفائدة المتمدرسين بالعالم القروي 
07 و 08 نونبر 2015: دورة تكوينية حول الإسعافات الأولية : مسعف في كل عائلة 
06 دجنبر 2015 : أمودو ن الخير 3 
من 24 إلى 30 دجنبر 2015 : معرض مبادرة فاعل خير
برنامج رمضان: 
* بقفة من خيرك يحلى رمضان غيرك 3 
* محاضرة إيمانية 
* زيارة اجتماعية 
* مسابقة في تجويد القرآن
برنامج عيد الأضحى: 
* تفاسكا ن الخير 4 
* فكلوا منها وأطعموا البائس الفقير 3 
* زيارة اجتماعية

دعواتكم..
مسيرة موفقة أحبتنا :)

', CAST(0x0000A42900659190 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1603140103250374', N'https://www.facebook.com/Lmachton?fref=ts', CAST(0x0000A4880162F588 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1645911562306561', N'https://www.facebook.com/events/1431461163837985/

السلام عليكم
مرحبا بمساعداتكم مادية كانت او عينية 
 إن الله لا يضيع أجر مناحسن عملا    
  صدق الله العظيم', CAST(0x0000A49F015006A8 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1649728811924836', N'السلام عليكم ورحمة الله وبركاته..
.
في إطار أنشطتها ستنظم مجموعة أسعد للرحلات والخرجات الترفيهية والاستكشافية رحلة إلى كل من شفشاون النوارة المدينة الزرقاء وأقشور المتواجدة في أكناف الشاون.
حيت ستكون الانطلاقة يوم الجمعة 12يونيو 2015على الساعة السادسة مساءا..
فمرحبا بالجميع ..
واجب المشاركة سيكون في حدود 510 درهم للفرد ..
الذي سيغطي كل من مصاريف النقل (حافلة مكيفة ومريحة ) + المبيت+وجبة فطور يوم اﻷحد.
بالنسبة للمقاعد ستكون محدودة..
.
*اليكم برنامج الرحلة المشوق .
...
الجمعة 12 يونيو 2015 :
-18:00 : التجمع أمام المحطة الطرقية المسيرة.
-18:00الإنطلاقة من أكادير
* السبت 13 يونيو 2015 :
-7:00 : وجبة الفطور (فطور حر )
-8:30 الوصول لمنطقة أقشور.
- الصعود للشلال الصغير (استراحة بالمكان) ثم بداية الصعود نحو الشلال الكبير.
- الإستمتاع بسحر طبيعة المنطقة.
- الوصول للشلال.
- وقت حر للراحة والتجول ثم العودة للشلال الصغير.
- تناول وجبة الغذاء (غداء حر)
-16:00 التوجه نحو شفشاون.
- الاستقرار بالفندق.
-وقت حر للاستحمام والراحة.
20:00 جولة ليلية بشفشاون.
- عشاء حر.
22:30 المبيت بالفندق.
* الأحد 14 يونيو 2015 :
-07:00 تناول وجبة الفطور .
08:00 مغادرة الفندق.
- زيارة راس الما (المصدر الرئيسي للماء بشفشاون).
- الصعود لمسجد الجبل (تلّ بوزعافر).
- الإستمتاع بالمنظر البانورامي المطّل على المدينة.
- زيارة القصبة: (السجن، البرج، المتحف ورواق السيدة الحرة ).
12:00 تناول وجبة الغداء (حر ).
-13:00: إنطلاق رحلة العودة .
''رحلة موفقة للجميع ''
عدد المقاعد : 48 مقعدا
لاداء ثمن التذكرة او مزيدا من الاستفسار المرجو مراسلتي وشكرا.
بالنسبة للحجز يكون بأداء الواجب بأكمله
على الارقام التالية
*0673299397
*0622159575
*0641087352
....
ملحوظة : يعتبر المقعد محجوزا عند أداء المبلغ بكامله', CAST(0x0000A4C601883640 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1451438478420538_1662747887289595', N'https://m.facebook.com/profile.php?id=766611233437910', CAST(0x0000A4C601802568 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1602978549962609_1814541198806342', N'حًسبــــيِ آلّلّــــهً ونعݥ آلّوڪيِــلّ 😔😔', CAST(0x0000A7340003EEA4 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'1602978549962609_1815024468758015', N'بلاغ توضيحي يخص ساكنة مدينة إفران  بخصوص الوقفة الاحتجاجية لساءقي سيارات الأجرة الصغيرة 

منذ يومه الجمعة الماضي قامت هذه الأخيرة بوقفة احتجاجية بتمويه كامل ومغلوط للرأي العام. الافراني.... أن هذا الفعل يخص النضال من أجل إيقاف عمل سيارات الأجرة الكبيرة عن العمل داخل المجال الحضري لمدينة إفران وهذا تغليط لساكنة المدينة. المشكل هو كالآتي :
بعدما قامت مجموعة من سيارات الأجرة الكبيرة بنقل وتسفير زبناءها الطلبة من أمام باب جامعة الأخوين إلى مدنهم المجاورة خارج المجال الحضري والترابي لمدينة إفران أى إلى بعض المدن كالرباط و الدار البيضاء. ... إلخ 
كان رد الفعل وقفة احتجاجية بحجة الاشتغال داخل المدينة  حيث طالبوا نقل الطلبة إلى المحطة الطرقية لاستخلاص الأجر داخل المدينة ومن ثم نقوم نحن بتسفيرهم إلى الوجهات المطلوبة وهذا أمر مرفوض وغير منطقي. أو قانوني 
عذرا للساكنة على هذا التصرف الاناني في حقهم من طرف هذه الجهة غير المسؤولة.  .
نحن سائقي سيارات الأجرة الكبيرة نقوم بنقل الزبناء خارج المجال الحضري وليس داخله ومن أي نقطة داخل المدينة كيفما كانت وشكرآآ على تفهمكم.', CAST(0x0000A7350003276C AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362537067474201', N'الحكومة ارتكبت جرائم وفضاعات لا تحصى ضد أساتذة الكرامة، لكن الخالق والمخلوق لن ينسى قتل روح جنين في بطن امه بسبب رفس تعرضت له خلال تدخل امني في حق شباب يطالبون فقط بتطبيق القانون والإطلاع على محاضر ترسيبهم. ذنوب الجنين في عنق هذه الحكومة ولهلا يسمح ليها دنيا واخرة
الله يسمح لي', CAST(0x0000A73500432D44 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362537664140808', N'شي ناس نتا كتكبر بيهوم وهوما كيصغرو بيك شنو المعمول معاهوم فنظركوم؟؟؟', CAST(0x0000A7350044109C AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362538467474061', N'إغ إكا أومداكل نك تأمنت تزرت إزد تحوريت إغذ المزور أداك أور اسكر أنوسم', CAST(0x0000A7350044E968 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362540244140550', N'فرجة ممتعة 
دعمكم لنستمر ونحن علينا إسعادكم بكل مميز ورائع وفريد❤❤❤❤
مشاركة❤إعجاب❤تعليق❤❤
ولوبنقطة', CAST(0x0000A7350046431C AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362540344140540', N'فرجة ممتعة 
دعمكم لنستمر ونحن علينا إسعادكم بكل مميز ورائع وفريد❤❤❤❤
مشاركة❤إعجاب❤تعليق❤❤
ولوبنقطة', CAST(0x0000A73500465A8C AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362541197473788', N'يقول الكاتب نجيب محفوظ في آخر أيام حياته: لست نادم على شيء إلا على أيامي التي لم أعشها كما أُحب خشيةً من كلام الناس', CAST(0x0000A735004743C0 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362564624138112', N'‫عاجل _ الإعلام الإيفواري يؤكد وجود اتفاق مبدئي بين مدرب الأسود هيرفي رونار و”الفيلة”‬', CAST(0x0000A73500569E38 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362565270804714', N'سعيا منها للعمل على مدار 24/24 الصفحة بحاجة إلى مسؤولين جدد ... من بينهم بنات 

الشروط:
1- إتقان الأمازيغية
2- النشر والترويج للصفحة
3- تنشيط الصفحة باستمرار

فعلى الراغب بالتطوع والإنضمام الى الصفحة أن يرسل رسالة، وحبذا لو كانت المبادرة من بعض الوجوه لكتقول مواضيع الصفحة ونشاطتها ضعيفة وغير هادفة، لكم الفرصة لطرح تلك المواضيع .....', CAST(0x0000A73500577830 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362565434138031', N'سعيا منها للعمل على مدار 24/24 الصفحة بحاجة إلى مسؤولين جدد ... من بينهم بنات 

الشروط:
1- إتقان الأمازيغية
2- النشر والترويج للصفحة
3- تنشيط الصفحة باستمرار

فعلى الراغب بالتطوع والإنضمام الى الصفحة أن يرسل رسالة، وحبذا لو كانت المبادرة من بعض الوجوه لكتقول مواضيع الصفحة ونشاطتها ضعيفة وغير هادفة، لكم الفرصة لطرح تلك المواضيع .....', CAST(0x0000A7350057AE18 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362565680804673', N'سعيا منها للعمل على مدار 24/24 الصفحة بحاجة إلى مسؤولين جدد ... من بينهم بنات 

الشروط:
1- إتقان الأمازيغية
2- النشر والترويج للصفحة
3- تنشيط الصفحة باستمرار

فعلى الراغب بالتطوع والإنضمام الى الصفحة أن يرسل رسالة، وحبذا لو كانت المبادرة من بعض الوجوه لكتقول مواضيع الصفحة ونشاطتها ضعيفة وغير هادفة، لكم الفرصة لطرح تلك المواضيع .....', CAST(0x0000A7350057D848 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362571904137384', N'La route de Tizi-n-Tichka....
 تيزي نتيشكا... صور اليوم ...
صدق او ﻻتصدق هذه حالة تيشكا هذه الايام والاشغال لم تنته بعد .....  !!!
اين المسؤلين اين المشرفين على العمل اين المهندسين !!! 
اين الحكومة وﻻ ماشي مشكل الطريق تؤدي فقط إلى الجنوب الشرقي... 
لو تركوها كما كانت سابقا احسن بكثير من الحالة التي هي فيها الان... لاحول ولا قوة الا بالله.

بارطاجي لعلك تكون السبب لتصل دوائر القرار', CAST(0x0000A735005AFB04 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362572740803967', N'الطلبة القاعديون وازمة العنف في الجامعات المغربية 
    احمد الدغرني 

الاسم الذي اختارته الظروف  لفصيل الطلبة القاعديين يربطهم بالقواعد الشعبية ،لأنهم كانوا منبثقين فعلا من قواعد الطلبة المنسحبين والرافضين للأحزاب السياسية  وقياداتهاالتي كانت موجودة في سنوات السبعينات من القرن الماضي كحزب الاستقلال  وحزب التقدم والاشتراكية  والاتحاد الوطني للقوات الشعبية وحزب الشورى والاستقلال  ،وهي الاحزاب الأربعة  التي كانت تتوزع فيما بينها جماهير طلبة المغرب،لان الاحزاب الاخرى كالحركة الشعبية، لم تكن متواجدة في صفوف الاتحاد الوطني لطلبة المغرب،ان لم نسلم بأنها لم تكن تهتم بقطاع التنظيمات الطلابية ،واكتفت بتاسيس شبيبة تابعة لها تعمل داخل الحزب،لانها لم تكن تنسجم مع طموحات الشباب في معارضة الحكم المخزني، وكان شانها وحالتهاهي التي استمرت فيها بقية الاحزاب التي ظهرت بعدها كالتجمع الوطني للأحرار والاتحاد  االالدستوري... 
ومنهجيا لايمكن فهم الصراعات الطلابية المغربية الا بالرجوع الى الماضي  البعيد والقريب نحو سنة1970,عندما كان الاتحاد الوطني لطلبة المغرب تحت الوصاية المطلقة لجيل من قادة الاحزاب السياسية والنقابية كان منهم عبد ا لله ابراهيم ،والمحجوب بن الصديق وعمر بن جلون، ومحمد اليازغي، وعلي يعته وعزيز بلال  ...وهم الذين سيروا وهياواروساء هذه المنظمة قبل منعها مثل محمد الحلوي(محام حاليا بالدار البيضاء لم يعد يذكر في السياسة) وحميد برادة(صحافي فرنكوفوني معروف في مجلةJeune Afrique) وَعَبَد الرحمان القادري(أستاذ للقانون الدستوري بكلية الحقوق بالرباط توفي)وفتح الله والعلو(أستاذ جامعي في علم الاقتصاد ووزير سابق )وَعَبَد اللطيف المنوني(مستشار ملكي منذسنة2011) ومحمد لخصاصي(سفير المغرب في سوريا)والطيب بناني(أستاذ بالمدرسة المحمدية للمهندسين توفي) وعزيز المنبهي(مناضل يساري من خط منظمة الى الامام)،ذكرت هؤلاء  الروساء السابقين قصد الإشارة الى أهمية هذه المنظمة الطلابية وما أنتجته  من نخب سياسيةوايضا لاثير نظر من لايزال حيّا من هؤلاء  الى ضرورة حل مشكل العنف في الجامعة
المغربية ثم انه لايمكن فهم غضب الشباب الماركسي المغربي دون فهم وضعية الشيوعية المغربية التي تتجه نحو الانقراض بسبب منع الحزب الشيوعي المغربي
 مر المغرب بمرحلة محاربة الاحزاب  القديمة  التي نشأت اثناء فترة الحماية الفرنسية والإسبانية ،كلها  من طرف المخزن الذي بدا يهيء نماذج الحزبية التي تسانده في كل انواع سياسته ابتداء من جبهة الدفاع عن المؤسسات الدستوريةFDIC الى تشجيع غير المتحزبين الذين يسمون المحايدين او الأحرارLes sans appartenance  politique  وتحويلهم الى تنظيمات حزبية صورية تتوزع فيما بينها خريطة الحزبية المسموح بوجودها من طرفه وتتوزع صوريا مذاهب الاشتراكية والليبرالية  والدين 
ومر المغرب بمرحلة تقسيم طلبة الجامعات والمعاهد على منظمتين الاتحاد الوطني اوطم، والاتحاد العام التابع لحزب الاستقلال، ومن هذا التقسيم الثناءىي (UNEM-UGEM)بدا الصراع بين الطلاب ، وكان في اصله صراعا سلميا يكتسي طابع التنافس ،كما كان بين العمال( UMT-UGTM)وظهرت اواءل عمليات العنف  في سنوات السبعينات  بين التنظيم الطلابي الاستقلالي ،والتنظيم الاتحادي الوطني للقوات الشعبية وقماش الحزب الشيوعي المغربي خاصة عندما كان محمد الوفا الوزير الحالي رءيسا للاتحاد العام لطلبة المغرب ومحمد لخصاصي  رءيسا للاتحاد الوطني لطلبة المغرب،
ثم تحول الصراع الطلابي  بعد ظهور  التنظيمات الاسلامية  الواردة من الهند وباكستان  وإيران ومصروغيرهامثل الشبيبة الاسلامية بالدار البيضاء وجماعة التبليغ بالقصر الكبير وجماعة العدل والاحسان بمراكش  ،وجماعة الامر بالمعروف والنهي عن المنكر بوجدة ...استقطبوا تلاميذ المدارس الثانوية والتعليم الديني ،لان أغلبيتهم كانوا من موظفي التعليم، ونقلوا اسلوبهم التنظيمي الى صفوف الطلبة  بدعم من الدولة المخزنية التي كانت منخرطة في الحرب الباردة بين المعسكر الشيوعي والرأسمالي و تحارب الشيوعية والاشتراكية بواسطة الاسلام السياسي  لانها كانت تواجه الشيوعيين والاشتراكيين والليبراليين بأنهم ملحدين وكفارا...وكانت تنظيماتهم اقتصرت على المساجد التي يمارسون فيها رغباتهم ثم خرجوامنها ابتداء من سنة 1975الى المعاهد والجامعات والى عموم الامكنة
بدأت القسمة الثلاثية بين الطلبة الىUNEmمع UGEMثم الاسلاميون  وبقي الاسلاميون  كفصيل اختار البقاء في اوطم لانه لم يكن بعد يتوفر على حزب سياسي ليؤسس منظمة خاصةبه ،ولم ينضموا الى الاتحاد العام لطلبة المغرب بسبب منافستهم من طرف ايديولوجية هذا الحزب التي كانت سلفية تقليدية يرأسها علال الفاسي ومجموعة من الفقهاء مثل المختار السوسي وغيره ،الى ان أسس حزب العدالة و التنمية منظمة تابعة له تسمى التجديد الطلابي 
كان الاتحاد الوطني لطلبة المغرب قد تربى في صفوفه من يتصور نفسه  كجمهورية مستقلة عن المخزن والأحزاب ،وفي خيال الشباب عن المجتمع ، ولذلك اخترع ماسماه بشرعية وجود الفصائل ،وكان جوهر الخلاف يدور حول من هو الفصيل الشرعي داخل المنظمة؟ومن هو غير الشرعي؟كما كان المخزن يبت في الحزب الشرعي والممنوع عندما منع الحزب الشيوعي المغربي سنة1959ومنع حزب الشورى والاستقلال 
كان الاتحاد الوطني لطلبة المغرب  ايضاهو اول منظمة للشباب عرفت ائتلافا  رباعيا بين اليسار الشيوعي والاشًتراكي واليسار الجذري والإسلاميين في المغرب مابعد سنة1956ثم تحول الوضع الى ائتلاف خماسي بظهور الطلبة الامازيغيين الذين لم يكونوا بدورهم يتوفرون على حزب سياسي
كان هذا الائتلاف  نموذجا مشابها لحالة النقابات العمالية وكان يمكن لونجح ان يكون مدرسة للديموقراطية المغربية، لان الشباب والطبقة العاملة هم اكبر سند للديموقراطية والحريّة 
لكن ظروفا كثيرة وعوامل جعلت الائتلاف  تعتريه صراعات دموية أدت الى كثرة القتلى والسجناء والمعطوبين لم يواكبها المثقفون والعلماء بالدراسة والتخطيط السياسي الصالح لبناء علاقات واعية وديموقراطية ،ويمكن تلخيص محاور الصراعات الطلابية الى اربعة
1- الدين الاسلامي والعروبة 

2- الشيوعية والاشتراكية والقومية العربية
3-الامازيغية 
4-فصايل تابعة لمختلف الاحزاب  والقبايل مثل فصيل الطلبة الصحراويين و فصيل طلبة اليسار التقدمي، ومنظمة التجديد الطلابي ....
ويعتبر المحور الاول والثاني قديمين من حيث تاريخ وجودهما   في صفوف الطلبة والتلاميذ بينما المحور الثالث جديد رغم انه من ناحية تاريخ العالم اقدم من المحورين الاولين معا
ان المكونات الأربع  للطلاب داخل الجامعة تتطلب المواكبة بالدراسة، وخاصة ان الشعب يتالم من انتشار العنف ،والشباب بمختلف أنواعه يتعرض لهذا العنف ،وأحيانا القتل والجروح والاعطاب البدنية
ولذلك نطرح في هذه الورقة إمكانية  دراسةالتحالفات والمصالحات بين هذه الأطراف  خاصة ان  اغلب الضحايا من القتلى والجرحى والسجناء  والمعطوبين ينتمون الى العائلات  الناطقة بالامازيغية  وتدل على ذلك ألقابهم وأسماؤه  مثل أيت الجيد وبلهواري والسياسيوي وايزم عمر والدريدري وبو مالي والحسناوي....
وبان عدد الطلبة الجامعيين بالمغرب في التعليم العام والخاص يصل الى حوالي 600000 يدرس منهم بالخارج حوالي 50000(انظرRevue de  édition 2016-2017l''étudiant marocain.n.114) ويعني ان الطلبة المتواجدين داخل المغرب هم فقط550000 يعنيهم العنف الطلابي  مع اعتبار ان  هذاالعدد يضم طلبة التعليم الخصوصي الذين لايعنيهم وجود القاعديين وبقية الفصائل  الطلابية الاخرى لأنهم ينتمون الى فروع الجامعات والمعاهد الأجنبية التي تتابع فيها الدراسة من طرف النخب الغنية التي لاتهتم بالنضال الطلابي الذي  يتعاطى له المنحدرون والمنحدرات من أسر الفقراء، لذلك تتمركز الصراعات الطلابية في مواقع الجامعات الحكومية مثل فاس ومكناس ووجدة واكادير والقنيطرة والراشدية ويكون ضحاياها من الفقراء والبدو
ونلاحظ انه لم يسجل صراع عنيف بين الطلبة الإسلاميين والامازيغيين  بقدر ماكان التيار القاعدي يفجر الصراعات معهما معا،وهو الذي خلف الاحزاب القديمة بسيطرته المطلقة على المنظمة الطلابية  بعد منعها،،ثم بدا الاسلاميون والأمازيغ معا يسحبون البساط الجماهيري الطلابي من تحت أقدامه ، ويعاني هذا التيار من الإحساس بعدم وجود سند حزبي له في خارج الجامعات،بينما  تجد الفصائل  الاخرى سندا لها،كما يعاني من أزمة سقوط أنظمة الحكم الشيوعية في كل بلدان العالم وتحول نظام كوريا الشمالية الى ملكية شيوعية ورثها ابناء مؤسسها  كيم السونغKim Il-Sung وتحول كوبا الى ملكية شيوعية ورثها اخو مؤسسها راؤول كاستروRaul Castro،وتحول الحزب الشيوعي الصيني الى تاجر راسمالي عالمي،وفصيل القاعديين فريد من نوعه في الشبا الشيوعي بمنطقة شمال افريقيا،يواجه الدولة المخزنية بالعنف اللفظي والبدني، ويواجه الفصائل الطلابية بنفس الأسلوب ،ولذلك يتعرض لعزلة مطلقة تدفعه الى الموت والسجون والاعطاب البدنية فمن سيرث الشيوعية المغربية؟
كانت هذه إشارات  مقتضبة في موضوع يتطلب اكثر منهااتمنى ان نعود اليهً
          الرباط 22يونيو 2016', CAST(0x0000A735005BBA08 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362750484119526', N'السلام عليكم ... بداية أسبوع موفقة للجميع <3', CAST(0x0000A73500D4C970 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362750694119505', N'استمتع بأبيك و أمك قبل فقدهما ..فقد يأتي وقت تتمنى أن تسمعهما أعذب الكلمات و أرقها ولا تقدر فقد ..فات الأوان !
رب ارحمهما كما ربياني صغيرا !', CAST(0x0000A73500D53C48 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362885830772658', N'صُراخ و شجار بين سعد لمجرد و الفتاة الفرنسية أمام المحكمة و هذه التفاصيل

', CAST(0x0000A7350140A8AC AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362888250772416', N'ماذا لو حصل ذلك بالمغرب؟؟ أكان السفير أو أي شخص لديه منصب سام بالدولة سيعرض على القضاء لسب وشتم مواطن عادي؟!!!!!', CAST(0x0000A7350142E6E4 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362888730772368', N'لا يُعاب المرء بفقره، ولا عيب في جسمه فليس له في ذلك حولٌ ولا قوة.. إنما يُعاب على قُبح لسانه ورداءة أخلاقه

#حكمة_اليوم', CAST(0x0000A73501435638 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362993497428558', N'لا أهتم بمن يكون معي رائعا في البداية 🌿🌿 و إنما اهتم بمن يبقى معي دائما حتى النهاية 🌿🌿 ففي البداية كلهم رائعون.
كلام في الصميم ❤❤', CAST(0x0000A73600072B28 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_362997484094826', N'حين تبدع المرأة التازناختية.', CAST(0x0000A736000ABE64 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363027920758449', N'عاجل // فرنسا تطرد قنصلة المغرب مليكة العلوي التي احتجزت خادمة مغربية وعذبتها وتركتها ليغتصبها ابنها ... وقع هذا في دولة ترفض استغلال الإنسان كيفما كان أما بالنسبة للمغرب فكونو أكدين أنها لن تعاقب بل سيتم توظيفها بمنصب سامي داخل المغرب', CAST(0x0000A7360020A24C AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363028507425057', N'بداية الشوط الثاني
بث مباشر : كأس الإتحاد الإنجليزي
تشيلسي # مانشستر يونايتد
يوتيوب : https://goo.gl/9nm9MS
هواتف : https://goo.gl/9nm9MS', CAST(0x0000A736002127E4 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363029990758242', N'الرفيسة بالدجاج البلدي و اتاي بالزعفران يا سلام....مرحبا بكم الليله', CAST(0x0000A73600228E7C AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363209930740248', N'‏"سبحان الله وبحمده عدد خلقه، ورضا نفسه، وزنة عرشه، ومداد كلماته" ثلاث مرات
‏"انشرها و أعد تغريدها ليكتب لك بإذن الله أجر كل من يقولها"', CAST(0x0000A73600C70B78 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363355374059037', N'فرنسا جرات على القنصل ديال المغرب في اورلي، مليكة العلوي، حيت احتجزت "المساعدة المنزلية" ديالها و تكرفصت عليها، من بعد ما جابتها من المغرب لفرنسا (على حساب المساعدة) و واعدتها براتب شهري ديال مليون و نصف سنتيم تقريبا في الشهر و تتكلف بماكلتها و سكناها و تقاد ليها وراقها باش تشوف ولدها في المغرب...

مليكة استغلت السيدة و خدمتها اكثر من شهرين بلا ما تخلصها (زعما كتدوز سطاج بلا خلاص) و طلبت منها ما تخرج ما تكلم مع أحد و تقطع ليها مصاريف الاكل و السكن من راتبها...

المساعدة المنزلية ملي عيات من تمارة و الاحتجاز، ما لقات قدامها غير تغوت و تطلب المساعدة. هنا تدخلوا الجيران و مجموعة من الحقوقيين الفرنسيين و مشاو عند مليكة العلوي اللي سدت عليهم باب شقتها و قالت ليهم "بلا ما تعيطوا للبوليس. أنا غادي نتفاهم مع السيدة اللي خدامة عندي"
شد انتباهي جواب واحد الفرنسي من هادوك اللي جاو يحرروا  المساعدة المنزلية  ملي قال ليها : " حنا في فرنسا. ما كنتفاهموش هنا. كنطبقوا القانون"...
القضية ما وقفتش هنا و تم استدعاء الشرطة و اخراج المساعدة المنزلية من شقة العلوي اللي كانت محبوسة فيها. 

اليوم، فرنسا اعطات للقنصل المغربية مهلة 48 ساعة باش تخوي التراب الفرنسي حيت ما يقبلوش الاحتجاز و الاساءة للبشر من اي واحد (واخا يكون دبلوماسي)...

دبا، تخيلوا معاي شحال من مسؤولة كبيرة في الدولة، تعينات باش تحرص على مصالح المغاربة و في دارها ملي كيتسدوا عليها البيبان، كتكون اول واحدة كتعدى على حقوق الناس اللي خدامين معاها...

بلا ما تخيلوا بزاف، غادي نعاود ليكم مرة اخرى، قصة سيدة رئيسة جمعية كتهتم بالنساء و تشجع عملهن كمديرات و صاحبات شركات، قدام عيني و عينين الموظفين حيحات على  السيدة المسؤولة على النظافة و شبعتها معيور حيت علقت طابليتها "الموسخة" في العلاقة ديال المعاطف المخصصة أصلا لهاد الغرض...

كل مرة، كتبان لي هاد السيدة الرائدة في الصحافة و في تصريح للتلفازة، كتهدر على حقوق النساء العاملات، كنتفكر تبهديلها لمرأة عاملة تهمتها الوحيدة هي انها فقيرة و ماشي بحال المقاولات عضوات الجمعية...

الفرنسي لخص حال المغاربة في جملة واحدة "حنا ما كنتفاهموش في فرنسا. حنا كنطبقوا القانون"...

للاسف، عندنا حنا. كلشي كيتفاهم و كلشي ساكت و كلشي مشارك في هاد الجريمة. 
كلشي ما عاجبوش حال المساعدات المنزليات الصغار و المعنفات و لكن كلشي عارف أن القانون ما كيطبقش على جميع المغاربة...

الحاصول، هنيئا لنا بممثلينا خارج ارض الوطن و ممثلينا داخل قبة البرلمان و الجهات و الجماعات...

تبارك الله عليكم. كتعرفوا تدافعوا على حقوق الفقير قبل الميسور. 

#إيخان_أس_مليار
#الجالية
منقول', CAST(0x0000A7360121C02C AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363356054058969', N'الحياة في صورة، هذه الصورة معبره فعلا ❤ .', CAST(0x0000A73601224DF8 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363359347391973', N'شعرت بالإهانة من جملة رجل فرنسي يقول للقنصلة المغربية التي تعتدي على خادمتها  On est en France ici زعما انتوما فالمغرب بلاد السيبة. سمعي على وذنك الحكومة اللي درتي قانون تشغيل الخادمات ومزال ما شفنا حتى حاجة فالتطبيق
شوهتونا الله يعطيكم الكنبس
الله يسمح لي', CAST(0x0000A73601252DE8 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363359864058588', N'شعارات منددة بالوضع المزري الدي يعيشه تلاميد المؤسسة التانوية الجديدة بطاطا ، بسبب الأكل الدي يقدم لهم  في القسم الداخلي و الدي لا يسد لهم رمق جوعهم و الكل يعلم ما يقدم في الجناح الداخلي الخاص بالأكل و بدون توضيحات في هدا المجال، و لصرختهم المتوالية لدليل  كل الأدلة على أن التعليم لا يزال يتخبط في مستنقع الفساد ووجب تجفيفه  لتوفير سير عادي لهؤلاء الفئة المقصية ، فالمتعلمين (التلاميد) هم محور المنضومة التعليمية و الجوهر ، و بهكدا سلوكات تكرس الدولة سياسة قمعية و تجاهلية و يتداخل فيها العديد من المتفاعلين من مدير المؤسسة و صولا لوزارة التربية الوطنية المسؤولة عن قطاع التعليم بهدا البلد السعيد ، و ما يجب أن نعلمه أن التعليم هو النقطة الأولى و فيها درس الطبيب و المحامي و المهندس إلخ... و التلاميد جزء لا يتجزأ منا ووجب مساندتهم و توفير الدعم لهم و النأي بهم أكاديميا نحو الأفضل ، و لتوفير جو دراسي ملائم وجب توفير أكل جيد و نوم مريح و مكتبة داخلية و هدا ما نفتقده في مؤسساتنا التعليمية العمومية...
منقول : Abdllah Anir', CAST(0x0000A73601258CD4 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363452557382652', N'عاجل السلطات المغربية....                                                                              اعتقال رجل الأعمال اللبناني المقرب من حزب الله؛ قاسم تاج الدين؛ الذي أدرج اسمه على لوائح الإرهاب الأمريكية منذ 2009', CAST(0x0000A73601617C30 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363455607382347', N'فرنسا:بعد تحقيق دام قرابة شهرين توجيه الاتهام إلى المرشح الرئاسي فرانسوا فيون في قضية الوظائف الوهمية', CAST(0x0000A7360161E224 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363462854048289', N'النفاق الغربي....', CAST(0x0000A73601683F0C AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363464320714809', N'يعود الملك محمد السادس حفظه الله وايده مساء اليوم إلى أرض الوطن بعد جولة إفريقية طويلة قادته في زيارات رسمية وخاصة إلى كل من إثيوبيا، وجنوب السودان، وغانا، وزامبيا، وغينيا، ثم كوت ديفوار، قبل أن يعود أدراجه إلى البلاد.
وكان حفظه الله وايده  قد غادر البلاد في السابع والعشرين من يناير الماضي، متجها حينها إلى العاصمة الإثيوبية أديس أبابا، التي احتضنت يومي 30 و31 يناير الجاري، القمة الثامنة والعشرين للاتحاد الإفريقي، التي صادقت رسميا على عودة الرباط إلى المنظمة.
وبعودة الملك إلى الوطن بعد قضاء زهاء شهر ونصف في جولاته الإفريقية المتعددة ، حفظ الله ملكنا كما حفظ به الذكر الحكيم انك سميع مجيب...', CAST(0x0000A7360169827C AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363464510714790', N'رفـــــع العلم المغـــربي فوق مقر الإتحاد الإفريقي
رفع العلم المغربي بشكل رسمي، اليوم الاثنين، بمقر الاتحاد الإفريقي بأديس أبابا، بعد رجوعه إلى الاتحاد الافريقي في يناير الماضي.
وإلى جانب العلم المغربي تم رفع 55 علما للدول الأعضاء في الاتحاد الإفريقي.هذا وعاد المغرب إلى منظمة الإتحاد الإفريقي خلال أعمال الدورة 28، بعد مغادرته له 32 عاما', CAST(0x0000A7360169A928 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363470400714201', N'‫مفاجأة _ الإتحاد الأوروبي يجمد نشاط حكم برشلونة وسان جيرمان وفقاً لصحيفة ماركا الإسبانية‬', CAST(0x0000A736016CF740 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363487494045825', N'#nan_ouili_zerinin', CAST(0x0000A7360178A388 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363488084045766', N'شوفو طريقة كيفاش تسرقت سيدة...
 #بارطاجي باش ناس ترد بالها', CAST(0x0000A73601792EFC AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363508060710435', N'ﺍﺫﺍ ﻇﻬﺮ ﻟﻚ ﻫﺬﺍ ﺍﻟﻤﻨﺸﻮﺭ ﻓﺄﻧﺖ ﻣﻦ ﺍﻻﺷﺨﺎﺹ ﺍﻟﻤﻤﻴﺰﻳﻦ ﻓﻲ ﺻﻔﺤﺘﻨﺎ فضلا منكم لايك', CAST(0x0000A73601877160 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363572537370654', N'لو تم فعلا بن كيران هو رئيس الحكومة ....فإنه سيطالب با ستخلاص les assurances على كل الرويطات في المغرب', CAST(0x0000A73700283A70 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363579837369924', N'إذا وصلك هذا الفيديو فانت من المميزين <3 في صفحتنا فكافئ هذا التميز باعجاب وتعليق (y) والشكر مسبقا لكل من تواضع وشاركنا 
مناظرة شعرية أمازيغية بلسان احيا....عصيد.....عبد اوطاطا', CAST(0x0000A737002F9F04 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363583400702901', N'بنكيران انتهى سياسيا في عيون القصر 
.
كشفت صحيفة " إلباييس " عن أسباب عدم لقاء وزير الخارجية الإسباني الجديد ألفونسو داستيس، لرئيس الحكومة المعين عبد الإله بنكيران،  خلال زيارته للرباط.

و قال الصحافي الإسباني الشهير، إغناسيو سامبريرو، في مقال بالجريدة المذكورة، أنه عادة ما يلتقي رئيس الدبلوماسية الإسبانية خلال زيارته للرباط برئيس السلطة التنفيذية في البلاد ، لكن موظفين في الخارجية المغربية، ردوا على طلب نظرائهم الاسبان، بأنه ليس من الضروري تحديد موعد مع بنكيران، يضيف الصحافي الاسباني .

هذا الامر اعتبره سامبريرو ، المعروف بمتابعته القريبة للشؤون المغاربية، بمثابة " تهميش "  لعبد الإله بنكيران ، مبرزا بالقول "  يبدو أن هذا الرجل انتهى سياسيا في عيون القصر " .', CAST(0x0000A73700327468 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363586210702620', N'نهار يرجع المدعو " خالد عليوة " للحبس .. عرف باللي غاديين في مسار استقلالية القضاء بالمغرب .
* استقلال القضاء ليس بالخطابات الرنانة .....السي راميد

"', CAST(0x0000A73700357528 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363599640701277', N'للي مبارطجاش هاد الفيديو ماشي بشار بهاد المعنى هذا وكتمنى تفهموا الفيديو للي ماشي أمازيغي يحاول يشرحو لو شي واحد أمازيغي غير باش تعرفوا هاد الناس فين عايشين والصورة كتعبر بكثير عن الكلام  هاد الناس راهم الأولى من السودان ودول أفريقيا حرام نشفوا مناظير ومناكير بهاد الشكل 
حسبنا الله ونعم الوكيل 
#كلشي_يبارطاجي
الشعب #ينزف_يستغيث', CAST(0x0000A737003CB694 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363608104033764', N'رسميا : هيرفي رونار يعلن عن لائحة الأسود لوديتي تونس و بوركينا فاسو
زياش مرة أخرى خارج الحسابات :O :O
', CAST(0x0000A7370040AB14 AS DateTime))
GO
INSERT [dbo].[FacebookGroupFeed] ([GroupPostId], [PostText], [UpdatedTime]) VALUES (N'330708820657026_363618987366009', N'طائرات جزائرية تتجسس على الحدود المغربية والجيش يبدأ حربه الإكترونية بالمنطقة الجنوبية
.
 كشفت يومية “المساء” في عددها ليوم الثلاثاء، أن فرق القوات المسلحة الملكية انتقلت إلى السرعة القصوى لمواجهة استفزازات الجزائر بالشريط الحدودي، إذ بدأت طبول حرب إلكترونية بين الجارتين، إذ لجأ الجيش المغربي  إلى تشغيل نظام إلكتروني دفاعي يستخدم لأغراض عسكرية، بعد الحديث عن استعمال الجزائر طائرات دون طيار، من بين مهامها الأساسية الاستطلاع وتحديد المواقع العسكرية عن بعد، إضافة إلى مباشرة عمليات التجسس الجوية، الأمر الذي قوبل بطائرات تابعة للقوات الجوية الملكية مشطت الشريط الحدودي طيلة اليومين الماضيين.

ونقلت الصحيفة على لسان خبير عسكري، أنه عكس الأنباء الرائجة بخصوص استعانة الجزائر بمنصات صواريخ باليستية من طراز (إس 300) و(إس 400) في اتجاه الحزام الأمني، فإن الترسانة الروسية لم تسلم لأي دولة عربية الأسلحة الجديدة ، بل لم تقدم حتى لإيران.', CAST(0x0000A737004A76E4 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[FBApplications] ON 

GO
INSERT [dbo].[FBApplications] ([ApplicationId], [ApplicationName], [FbAppId], [FbAppSecret]) VALUES (1, N'ScrapyWeb', N'360921534307030', N'e7622d158d04babc3bdc5e5687174040')
GO
SET IDENTITY_INSERT [dbo].[FBApplications] OFF
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'749040543532023808', N'هاد الثنائية القطية ماشي سبق وهدرنا عليها هنا في هاد الحائط ؟ ...كل التضامن مع حزب البديل الديموقراطي..دفاعا عن... https://t.co/2jivrYqs4W', CAST(0x0000A73700F2C103 AS DateTime), CAST(0x0000A637000BB350 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'749046564547653632', N'بصراحة: فهاد العشر الأواخر وهاد الشهر الفضيل، اشنو المؤخدات ديالكم على قناعتي بأن بنكيران كشخصية سياسية قادمة من... https://t.co/rOX3Ue4x4w', CAST(0x0000A73700F2C0FC AS DateTime), CAST(0x0000A63700124620 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'749424843616124928', N'واحد الرفيق كنت كناقش معه البجيدي انه جاء من المجتمع ويمثل جزء من المغاربة المحافظين ومزيان هاد غالبية يكون معبر... https://t.co/uQSKavHRFL', CAST(0x0000A73700F2C0F6 AS DateTime), CAST(0x0000A63800239E5C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'749445585640579072', N'الحزب الذي يود أن يعمل من داخل المؤسسات القائمة لا يستحق ان يوجد. الحزب يغير الظرف بالعمل ولا ينتظر ان يتغير... https://t.co/WhQ0Ekc7el', CAST(0x0000A73700F2C0EB AS DateTime), CAST(0x0000A638003A4148 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'749808064992280580', N'نشر موقع جهوي ان احد قياديي " البام" عزيز بنعزوز اتهم بنكيران بالداعيشي في لقاء بايت بني بوعياش..دبا بنكيران عضو... https://t.co/uEPyLQ4ppS', CAST(0x0000A73700F2C0E2 AS DateTime), CAST(0x0000A639003A5B10 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'750031979597467648', N'الود لخضر هو الحل!󾌫', CAST(0x0000A73700F2C0DA AS DateTime), CAST(0x0000A639012EBB9C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'750454540609130500', N'عيد مبارك سعيد للجميع. وكل عام وأنتم بألف خير', CAST(0x0000A73700F2C0D0 AS DateTime), CAST(0x0000A63A01706754 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'750794439958863872', N'مبروك لرونالدو والبرتغال في النهائي 󾌫', CAST(0x0000A73700F2C0C9 AS DateTime), CAST(0x0000A63B0157DCE8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'751236070839312384', N'هههههههههههههههه https://t.co/e2ciDu5nZq', CAST(0x0000A73700F2C0B9 AS DateTime), CAST(0x0000A63D0022D724 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'752251064947179521', N'هدددددددددددف لللبرتغال...افضل هدية لرائد الفضاء رونادلوووووو', CAST(0x0000A73700F2C0B3 AS DateTime), CAST(0x0000A63F015F94B0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'752443893803737089', N'https://t.co/AiGNb0RLTp', CAST(0x0000A73700F2C09D AS DateTime), CAST(0x0000A64000A68678 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'752458180886720512', N'رفيق موريتاني في السفر على متن حمام لخليع، طلب مني سيجارة، فكنت طبعا مرحبا بطلبه، غير ان الرفيق طلب،زميله في... https://t.co/NgG2oFuTKJ', CAST(0x0000A73700F2C081 AS DateTime), CAST(0x0000A64000B61DE0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'752569188816973825', N'هادشي ديال فضيحة النفايات الايطالية، حتى لو صدقنا مزاعم البعض، بأن جهات ما تحركه وتحاول اشعال فتيله، من أجل تشتيت... https://t.co/zA9y67sAfR', CAST(0x0000A73700F2C07A AS DateTime), CAST(0x0000A640012F45E4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'752600990545764352', N'تحقيق مهم يكشف جزء من خبايا فضيحة النفايات الايطالية المستوردة https://t.co/o74rva0tNT', CAST(0x0000A73700F2C06B AS DateTime), CAST(0x0000A6400151FB0C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'752905400035442692', N'عيب في بلد يريد تنظيم rl, "كوب 22" تكون عندو وزيرة، شكلا ومضمونا ضد البيئة..الحيطي كلشي عندها "فابريكي"، من... https://t.co/ofwn82kI2j', CAST(0x0000A73700F2C065 AS DateTime), CAST(0x0000A6410112B438 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'753184793605595136', N'النفايات الإيطالية تم التلاعب في مصدرها وشركة إسرائيلية تكلفت بنقلها للمغرب (+وثيقة) https://t.co/lunPWUwPtM', CAST(0x0000A73700F2BEF7 AS DateTime), CAST(0x0000A64200B81F28 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'753195650817335296', N'سأحل ضيفا على قناة فرانس 24 بالعربية، ابتداء من الساعة الثالثة والنصف بتوقيت المغرب..للمساهمة في نقاش "تفاعل... https://t.co/ahZp0Ea96A', CAST(0x0000A73700F2BEF1 AS DateTime), CAST(0x0000A64200C3F924 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'753250299129819136', N'اتمنى انني كنت عند حسن ظنكم..رغم قلة الوقت وبعد غياب طويل على الحديث في المباشر..:p', CAST(0x0000A73700F2BEEA AS DateTime), CAST(0x0000A64200FF9D80 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'753550021509906435', N'في حال قبول شكوى هذا الحزب من طرف القضاء، سيتم توقيف عمل لجنة تقصي الحقائق! https://t.co/QYa1qTLanP', CAST(0x0000A73700F2BEE2 AS DateTime), CAST(0x0000A64300BB39B0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'753600843740569600', N'https://t.co/qs1efI5Q2e', CAST(0x0000A73700F2BEDD AS DateTime), CAST(0x0000A64300F2B14C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'753639758287499265', N'لأول مرة !!! https://t.co/BWAnIfRenk', CAST(0x0000A73700F2BEDA AS DateTime), CAST(0x0000A643011D28C8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'753671435537752064', N'تم حذف حساب الصديق الاستاذ الجامعي عمر الشرقاوي، بعد حملة تبليغات مجهولة المصدر..كل التضامن مع الشرقاوي !', CAST(0x0000A73700F2BED2 AS DateTime), CAST(0x0000A643013FBBF4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'753937693592158208', N':D :D :D هواة السياسة! https://t.co/vt6vvL2vuo', CAST(0x0000A73700F2BECE AS DateTime), CAST(0x0000A64400D6D1C0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'753940559052627969', N'المغرب يطلب من كينيا دعمه لاستعادة عضويته في الاتحاد الإفريقي دون شروط مسبقة
Younes Masskine https://t.co/1hLAUrso53', CAST(0x0000A73700F2BECB AS DateTime), CAST(0x0000A64400D9F224 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'754337477003993088', N'الانقلاب في تركيا عمل مدان، وادانته ورفضه واجب على كل ديموقراطي..والشعب التركي اهدى شعوبنا درسا تاريخيا في حماية... https://t.co/Xb0VTicQPo', CAST(0x0000A73700F2BEC7 AS DateTime), CAST(0x0000A64500FFA230 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'754646446641733632', N'عندما تتمعن، في مواقف بعض قادة البام من المحاولة الانقلابية، وانت تعرف من اين خرج هذا المولود السياسي... https://t.co/Lv7CorBqGP', CAST(0x0000A73700F2BEC3 AS DateTime), CAST(0x0000A64600C55530 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'754762486864314368', N'الشباب المغاربة وفي العالم،، الهمتهم الثورة الكوبية وانتفاضة ماي68 وانتصارات الفيتنام على الامبريالية..اليوم هناك... https://t.co/cQPFXYYqve', CAST(0x0000A73700F2BEBE AS DateTime), CAST(0x0000A6460143FA48 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'754804514864111616', N'باختصار شديد، هنا حداثيين ديمقراطيين واستبداديين وهناك اسلاميين ديموقراطيين وغير ديموقراطيين..والمعركة في بلدنا... https://t.co/ADnK9qRFUm', CAST(0x0000A73700F2BEB8 AS DateTime), CAST(0x0000A6460171D878 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'755458404932608000', N'حميد زيد في مقال ساخر :D
فشكرا لنجيب شوقي.. شكرا على هدياك لي..وعلى هذين الصديقين :D https://t.co/Rd4Js3BgnL', CAST(0x0000A73700F2BEB4 AS DateTime), CAST(0x0000A64801247BC8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'756938653629374465', N'واحد الفكرة ، صدعتني فراسي..وبغيت نشاركها معكم، كما كنت ولازلت، اشارككم ارائي وانطباعاتي بكل عفوية، بعيدا عن... https://t.co/46H2ifvjjO', CAST(0x0000A73700F2BEB1 AS DateTime), CAST(0x0000A64C0145FB90 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'757202664346255360', N'تابعت كباقي المغاربة حملة زيرو كريساج، الحملة يبدو انها شعبية، لكن لا يمكن فصلها عما يقع من تطورات سياسية متسارعة... https://t.co/ofiHRUqhxU', CAST(0x0000A73700F2BEA9 AS DateTime), CAST(0x0000A64D00DA9D3C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'757613152544718848', N'"لكم" تكشف حصريا عن لائحة أولية بأسماء المستفيدين من تجزئة "خدام الدولة" https://t.co/lcXUDSw6BE', CAST(0x0000A73700F2BEA4 AS DateTime), CAST(0x0000A64E010F1C4C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'757901766226767872', N'"لكم" تكشف حصريا عن اللائحة الكاملة للمستفيدين من تجزئة "خدام الدولة" بمثن بخس ( +وثائق) https://t.co/JVlc8J4yfI', CAST(0x0000A73700F2BE9E AS DateTime), CAST(0x0000A64F00BE9830 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'757921574901145600', N'ها مصدر الوثائق..تسدات العوينة دبا..يالله بركة من المؤامرات والكلام الفارغ https://t.co/xwOojBgFVT', CAST(0x0000A73700F2BE9B AS DateTime), CAST(0x0000A64F00D436F4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'758239184654065664', N'جوج المؤشرات تبين بشكل مكشوف ان هناك من داخل الدولة "العقيمة"، من يقوم بحملة انتخابية سابقة لأوانها لصالح... https://t.co/cIk2n1OniS', CAST(0x0000A73700F2BE96 AS DateTime), CAST(0x0000A65000A35804 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'758263358089035776', N'les incompétents..:D https://t.co/bUKxBhI23i', CAST(0x0000A73700F2BE90 AS DateTime), CAST(0x0000A65000BDBAB4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'759007970914996224', N'حزب البجيدي فيه أكثر من 40 ألف عضو..شحال من واحد فيهم تورط في حرب الجزائر؟ كم من منهم تورط في حرب العراق؟ كم من... https://t.co/PhYB9QsNDI', CAST(0x0000A73700F2BE8D AS DateTime), CAST(0x0000A65200D36080 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'759033467220946944', N'جلبير الأشقر: نحن أمام تملك خاص للدولة من قبل جماعات حاكمة على طريقة "الدولة الميراثية" (حسب المفهوم الذي صاغه... https://t.co/c3nfGpWrP8', CAST(0x0000A73700F2BE8A AS DateTime), CAST(0x0000A65200EF3454 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'759086331121328128', N'الشيخ إمام: وهبت عمري للأمل محسن :) https://t.co/CNqwAzCyEF', CAST(0x0000A73700F2BE83 AS DateTime), CAST(0x0000A6520128E6A4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'760440502504357888', N'هذا هز علينا شاقور في فيديو... لا اذكر انه تم التحقيق معه او تم استدعاء ديالو...واش عقلتو عليه؟؟ https://t.co/qpANajjpYn', CAST(0x0000A73700F2BE7F AS DateTime), CAST(0x0000A65600C0CD08 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'760442761472606208', N'لمغاربة لي بغاو يساهمو في مواجهة عودة التسلط عبر التصويت للأحزاب المستقلة في قرارها السياسي عن دوائر التحكم او... https://t.co/uLrVJmiAxv', CAST(0x0000A73700F2BE7C AS DateTime), CAST(0x0000A65600C344AC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'760536687458000900', N'نقاش مباشر وممتاز، من تنظيم موقع هسبريس حول قضية "خدام الدولة" https://t.co/Agrv082VZR', CAST(0x0000A73700F2BE78 AS DateTime), CAST(0x0000A6560129C7A4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'760808821212192768', N'من 2008 وحنا في الفيسبوك ننقاش ونتبادل الرأي ونختلف واحيانا كثيرة تبادلنا الشتائم والاتهامات...لكن لم نصل يوما... https://t.co/EmEwMb949h', CAST(0x0000A73700F2BE75 AS DateTime), CAST(0x0000A65700C74610 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'761232112020324353', N'من العار ومن العيب ومن المخزي ان يدافع صحافي على "إهانة" واذلال الصحفيين، بدعم تكميلي من الدولة. هادشي راه كاين... https://t.co/SU2D9RmMsV', CAST(0x0000A73700F2BE71 AS DateTime), CAST(0x0000A6580109BEDC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'761292918258855936', N'باش منضيعوش البوصلة...الصراع الحالي هو بين من اختار احترام الديموقراطية بتدرج كوسيلة للاصلاح  من داخل المؤسسات،... https://t.co/RdZTxDLom8', CAST(0x0000A73700F2BE6E AS DateTime), CAST(0x0000A658014C1B88 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'761525621960867840', N'نقاش الدعم التكيملي والدعم العمومي للصحف، ماشي تهجم على زملاء في المهنة..نناقش الأمر بشكل مبدئي..لي عندو شي حساب... https://t.co/QjQDFRtn0S', CAST(0x0000A73700F2BE6B AS DateTime), CAST(0x0000A65900BE9254 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'761536035897606144', N'"مول بسطيلة" يلتحق ب "البام"..دبا غادي يولي دير "بسطيلة" حداثية.. وغادي يقطع مع بسطيلة الرجعية ..:p', CAST(0x0000A73700F2BE67 AS DateTime), CAST(0x0000A65900C9F018 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'761576626392039424', N'هادي مداخلة لهاد البرلماني في مجلس المستشارين :D https://t.co/H4vSqD1SOf', CAST(0x0000A73700F2BE63 AS DateTime), CAST(0x0000A65900F63C54 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'761583304516730884', N'هذا جاي يخطب ماشي جاي يدير سياسة :D ;D https://t.co/cpHB63UWq1', CAST(0x0000A73700F2BE5F AS DateTime), CAST(0x0000A65900FD85F4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'761594645688225792', N'هذا  عندو "اللذة" رغم ان لذة بسطيلة الحوث هي سبب طرده من البجيدي :D https://t.co/4iTy8OQgKs', CAST(0x0000A73700F2BE5C AS DateTime), CAST(0x0000A6590109E6B4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'762017947422453760', N'حرب الاشاعات واختلاق الاخبار المفبركة من اجل الضرب في البيجيدي، وصلت لمستوى غير مسبوق، وبوفرة وغباء منقطع النظير،... https://t.co/4vz6kht5z3', CAST(0x0000A73700F2BE58 AS DateTime), CAST(0x0000A65A014C61D8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'762624826339160065', N'البولميك أثناء ارتفاع درجة "الحمى" الانتخابية، إيجابي وشيء معمول به في كل الديمقراطيات..التهجم على نبيلة منيب غير... https://t.co/7pySMsqZx6', CAST(0x0000A73700F2BE55 AS DateTime), CAST(0x0000A65C00CBB6C8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'762710495946219521', N'بمجرد تفقدي لحسابي البنكي، أصبت بإكتئاب حاد صيفي :(', CAST(0x0000A73700F2BE51 AS DateTime), CAST(0x0000A65C01293654 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'763360353392680960', N'سنة على عودة  موقع "لكم%  لقرائه، بعد محاولة فاشلة لإقباره من طرف قوى الاستبداد..شكرا للقراء الأوفياء للموقع على... https://t.co/NppXd0VpAG', CAST(0x0000A73700F2BE4D AS DateTime), CAST(0x0000A65E00D7724C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'763371242258915328', N'هادشي علاش دعيت لأول مرة في حياتي للتسجيل في اللوائح الانتخابية..اتفق مع شقير في مقاربته :p https://t.co/OP4riXZmE8', CAST(0x0000A73700F2BE4A AS DateTime), CAST(0x0000A65E00E3547C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'763425931352473601', N'دبا الحكومة تمت بتوافق بين أحزاب انتخبها المغاربة في 25 نونبر 2011، وحزب "خدام" الدولة بقيادة النابغة محمد بوسعيد... https://t.co/GG6MH2VX1I', CAST(0x0000A73700F2BE46 AS DateTime), CAST(0x0000A65E011F0490 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'763444276676165634', N'لا تسألوني ما اسمُهُ حبيبي ___ أخشى عليكم ضَوْعَةَ الطُيُوبِ. 
والله لو بُحْتُ بأيِّ حرفٍ ___ تكدّسَ الليلَكُ في... https://t.co/LUeJwEhQGN', CAST(0x0000A73700F2BE43 AS DateTime), CAST(0x0000A65E01330A58 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'763681910161801216', N'عبد الله العروي يتسائل : هل النخبة المغربية الحالية أقل وطنية من التي سبقتها؟، ليجيب قائلا: "أستطيع أن أقول إن... https://t.co/aB6iY8H8g8', CAST(0x0000A73700F2BE3F AS DateTime), CAST(0x0000A65F00AAE218 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'763709055441498115', N'الكارثة الحاقيقية ماشي أنك تلتلقي محمد أحداد ويحدثك على عقيدته المؤسسة على الفشل في الحب..لكن الكارثة ان بعد... https://t.co/LBUmIdimFv', CAST(0x0000A73700F2BE36 AS DateTime), CAST(0x0000A65F00C88278 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'763717180861087744', N'هذا مكيحشمش ومكيتقشرش ..يدافع عن الخطأ وله قدرة هائلة على تبرير ما لا يبرر..لا افهم لماذا يتمسكون بهذا المعتوه؟؟؟ https://t.co/f3Av5Hojtt', CAST(0x0000A73700F2BE33 AS DateTime), CAST(0x0000A65F00D16064 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'763738887281860608', N'تسجيل صوتي حصل عليه موقع "لكم"، الشوباني : زايد فيه :D https://t.co/QqFs5Zr0HC', CAST(0x0000A73700F2BE2F AS DateTime), CAST(0x0000A65F00E910D8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'763756153746628608', N'https://t.co/afwnMh2CFe', CAST(0x0000A73700F2BE2B AS DateTime), CAST(0x0000A65F00FBE974 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'763784332574072833', N'الشوباني، يحب النساء ..مكين باس زيدوه الثانية..الشوباني يحب المناصب، طرد من الوزارة وحصل على رئاسة... https://t.co/fN2ts3L3r1', CAST(0x0000A73700F2BE27 AS DateTime), CAST(0x0000A65F011AAA1C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'764060640386220032', N'اللهم اجعل لن مخرجا ومدخلا بحال الشوباني :D https://t.co/wPYZv5r8Pn', CAST(0x0000A73700F2BE24 AS DateTime), CAST(0x0000A66000BCB7B8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'764169974038618112', N'بعيدا عن التحليلات السطحية لبعض المتهافتين، نبيلة منيب، استطاعت ان تضع نفسها بجدارة، زعيمة للخط الثالث، فقد ورطت... https://t.co/VRonOEzCcv', CAST(0x0000A73700F2BE20 AS DateTime), CAST(0x0000A66001340C28 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'764218299173466112', N'تعازي الحارة الرفيق السموني في وفاة والدك...الله يبدل المحبة بالصبر.. :(', CAST(0x0000A73700F2BE1B AS DateTime), CAST(0x0000A6600168C954 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'764389086085931008', N'فين هادشي؟󾌫', CAST(0x0000A73700F2BE18 AS DateTime), CAST(0x0000A6610097ACE8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'764496537972043780', N'من وعود كلينتون الانتخابية...لَّعَلَّكُمْ تَعْقِلُونَ https://t.co/7EMATtB0nH', CAST(0x0000A73700F2BE14 AS DateTime), CAST(0x0000A661010CF200 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'764763904522223616', N'يسعد صباحكم https://t.co/5RQXFWAJgq', CAST(0x0000A73700F2BE0D AS DateTime), CAST(0x0000A66200A53E58 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'764816134814261248', N'الغريب ان تدفع وزارة الداخلية بتلجيم المشاركة السياسية، من خلال عرقلتها لتوسيع المشاركة السياسية، من خلال... https://t.co/CzDLEOWS1H', CAST(0x0000A73700F2BE08 AS DateTime), CAST(0x0000A66200DE3E88 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'765260991533834240', N'بنميلود يخاطبكم:) https://t.co/5lrEhbDlow', CAST(0x0000A73700F2BE02 AS DateTime), CAST(0x0000A66301383FF0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'765266287064936452', N'قولو الاستاذ محمد جبرون..ان تكلفة اجهاض الانتقال الديموقراطي بمصر، لم تنفع معها عملية ضخ مالي مباشر من دول الخليج... https://t.co/yy4ZtVe9rJ', CAST(0x0000A73700F2BDFC AS DateTime), CAST(0x0000A663013E0804 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'765273747666403328', N'توضيح: بعض الشباب انزعجوا من توصيف او انطباع او لنسميها محاولة للفهم بمنطق سطحي، كما هو متداول بشكل واسع في هذا... https://t.co/SGE2Z5aDv6', CAST(0x0000A73700F2BDF6 AS DateTime), CAST(0x0000A66301462CC8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'765556234783232004', N'نحن بلد محمد عابد الجابري الذي جال حسن حنفي في حوار المشرق والمغرب لأشهر على صحيفة اليوم السابع ان لم تخن... https://t.co/Btxco2nVsS', CAST(0x0000A73700F2BDF0 AS DateTime), CAST(0x0000A66400EEF890 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'765886038787158016', N'دبا الاصدقاء بالله عليكم لما قولو لنا اشنو هاد المشروع التنويري التجديدي الذي  يقدمه يوسف زيدان، لكي نغادر هاد... https://t.co/TPdwu9Vibe', CAST(0x0000A73700F2BDE8 AS DateTime), CAST(0x0000A66500CB6844 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'765950576563744768', N'مثلا 󾌫.،لنتعلم كيفية القيام بحملة انتخابية بدون معلم https://t.co/zu8VQikd7I', CAST(0x0000A73700F2BDE4 AS DateTime), CAST(0x0000A6650111D7E8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'766006479522504704', N'لا أنت حبيبي و لا ربينا سوى

وقصتنا الغريبة شلعها الهوى https://t.co/SPUZvL3OE0', CAST(0x0000A73700F2BDDE AS DateTime), CAST(0x0000A665014EDBD4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'766371941129281537', N'بيقولوا الحب بيقتل الوقت
 بيقولوا الوقت بيقتل الحب https://t.co/HxLmAv1awU', CAST(0x0000A73700F2BDCD AS DateTime), CAST(0x0000A666015235A4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'766572749133320193', N'يا من هواه أعزه وأذلني
 كيف السبيل الى وصالك دلني https://t.co/AA9QWHP7Ni', CAST(0x0000A73700F2BDC8 AS DateTime), CAST(0x0000A66700A1DD80 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'766679232655269889', N'قل للذين بأرض الشام قد نزلوا

قتيلكم بالهوى مازال مقتولا

يا شام. يا شامة الدنيا ، ووردتها

يا من بحسنك أوجعت... https://t.co/MRby1xEHgE', CAST(0x0000A73700F2BDC1 AS DateTime), CAST(0x0000A667011613E4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'767176207431503872', N'كان يبقى الحب جنون يخلص بحرف النون
و مش كل إنساني تمرق تفرق و تصير تمون https://t.co/e94hqZKWk5', CAST(0x0000A73700F2BDBB AS DateTime), CAST(0x0000A669001D7504 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'767429849409581056', N'واش رجعنا لحملات البصري الأمنية ضد لي " كوبل"!؟ واش وجود امرأة ورجل قرب البحر تهمة توجب الاعتقال؟؟ واش احنا فعلا... https://t.co/1ubphXVf7f', CAST(0x0000A73700F2BDB7 AS DateTime), CAST(0x0000A669013247D0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'767514072954929152', N'وأكد مصدر "العمق المغربي" أن بنحماد حكى أنه كان في وضعية عادية ويتناول وجبة الفطور وأنه لم يكن قط في وضعية جنسية... https://t.co/KnfOxgY0JN', CAST(0x0000A73700F2BDB1 AS DateTime), CAST(0x0000A66A0002B23C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'767772709593964544', N'الغرائز تحرك الغوغاء، والمخزن ابنا الأول، رمى لنا بلحم الناس لكي ننهشه بكل حيوانية، لأنه افلح في ان يربينا على... https://t.co/pqGz2Ftstw', CAST(0x0000A73700F2BDAB AS DateTime), CAST(0x0000A66A011CF8BC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'767818852218568704', N'النقيب والحقوقي واستاذنا في العزة والكرامة والوطنية، عبد الرحمن بنعمرو:  توقيف بن حماد والنجار، ومتابعتهما، يدخل... https://t.co/yZNzqtjUgq', CAST(0x0000A73700F2BDA5 AS DateTime), CAST(0x0000A66A014F5488 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'767857874550792194', N'يمكن انني مثالي او انني سادجا كباقي المغاربة، لكنني صادق وفي لقناعتي الحقوقية والديموقراطية..او كما يحلو البعض ان... https://t.co/EQcga4MhVn', CAST(0x0000A73700F2BDA0 AS DateTime), CAST(0x0000A66A0179EBA8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'767888568601763840', N'فوبيا الخوانجية وعقدة الهزيمة:) https://t.co/vr6lFI4OLl', CAST(0x0000A73700F2BD9B AS DateTime), CAST(0x0000A66B000FE970 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'768010857330667520', N'لو شي مرّة صبحية تفكر تتصل فيي
 قلي شو يللي بيعلقني بس فيك https://t.co/LD5FZVGKoM', CAST(0x0000A73700F2BD95 AS DateTime), CAST(0x0000A66B00955F74 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'768083224077664256', N'بعيدا عن تشفي الغوغاء " الحداثوية والاسلامية"، في حادثة بنحماد والنجار..وتحرك الة دعائية موجهة واخرى توظف لغبائها... https://t.co/zqFaljUZmj', CAST(0x0000A73700F2BD8F AS DateTime), CAST(0x0000A66B00E45AFC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'768098014741295104', N'علينا ان نرحب بالعنف ضد المرأة التي تعتقد ان عنف الرجل شرعيا..وعلينا ان ننفذ عقوبة الاعدام في من يراها شرعية ومن... https://t.co/fQzp61toQn', CAST(0x0000A73700F2BD8A AS DateTime), CAST(0x0000A66B00F47F04 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'768150820013637633', N'في الماضي كان الفرنسيون يصيحون: هذه البورجوازية التي تمول حزب الاستقلال لم تزدهر إلاّ نتيجة جهودنا التعميرية. وفي... https://t.co/PMawRsIQig', CAST(0x0000A73700F2BD85 AS DateTime), CAST(0x0000A66B012E20EC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'768222665442267136', N'شحال تملقت لبنكيران والبجيدي ومرشحونيش حتى ترشيح نضالي في لائحة الشباب...صافي غادي نمشي نقلب حتى انا على اللذة عند البام󾌲', CAST(0x0000A73700F2BD73 AS DateTime), CAST(0x0000A66B017C89F8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'768423238955307008', N'العلمانية الفرنسية التي تعيش التمركز على الذات، وتعتبر الوافدين عليها يسعون لوأد قيمها...هاهي تبرز عن توحشها، من... https://t.co/ZEeBpx8HXm', CAST(0x0000A73700F2BD6E AS DateTime), CAST(0x0000A66C00CBF034 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'768437648625106945', N'كتبت تدوينة للسخرية من بعض الغوغائيين، الذي يعتبرون دفاعي عن سلطة الانتخاب ضد السلطنة، هي تملق لبنكيران وحزبه لكي... https://t.co/tmUXMbIMEv', CAST(0x0000A73700F2BD68 AS DateTime), CAST(0x0000A66C00DBA998 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'768460285984313344', N'لكي نفهم ما يقع في مشهدنا السياسي..علينا ان نفهم ماهي النماذج التي قدمت للتغيير في تاريخنا السياسي بعد تسليم... https://t.co/1fEU959zH0', CAST(0x0000A73700F2BD63 AS DateTime), CAST(0x0000A66C00F45F60 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'768839429075111937', N'Burkini ban protesters throw beach party at French embassy in London https://t.co/i6kZkDHJMa', CAST(0x0000A73700F2BD5B AS DateTime), CAST(0x0000A66D0106A7D8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'769635697745682432', N'مالكش حق� https://t.co/U1bs2IgihH', CAST(0x0000A73700F2BD53 AS DateTime), CAST(0x0000A66F0154AFA0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'769680719689940992', N'بنكيران ابان في مرحلة الصراع مع المخزن. انه رجل وطني. يحلم بمشروع اصلاح سياسي يتجاوز البجيدي...لكن سقوطه في خطأ... https://t.co/vTDO3GsrM9', CAST(0x0000A73700F2BD4C AS DateTime), CAST(0x0000A66F0185D288 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'770025712527011840', N'بعد ترشيح البجيدي لسلفي معادي للديموقرطية ويكفر مخالفيه. ويعادي كل اشكال الحريات كما  يعادي تعدد المغرب... https://t.co/7GTjxrbGq8', CAST(0x0000A73700F2BD46 AS DateTime), CAST(0x0000A6700172D598 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'770225984645828609', N'ارتماء بنكيران واحتضانه لغلاة السلفية الوهابية التي تروج الكراهية والحقد وتعادي الحريات السياسية... https://t.co/9jVzZZps6C', CAST(0x0000A73700F2994F AS DateTime), CAST(0x0000A67100C1E774 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'770254217319686144', N'لا إصلاح سياسي بدون تنوير وعقلانية ومواجهة السلفية المتخلفة "وهابية، جهادية، مخزنية..."، ولا حداثة بالسلطوية... https://t.co/2mY7w0khD4', CAST(0x0000A73700F29948 AS DateTime), CAST(0x0000A67100E0B758 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'770327639903105024', N'ليس غريبا ان نسمع ممن خرب البلد على جميع المستويات (تعليم، صحة، سكن، شغل، فقر..)، يتحدث اليوم عن برنامج لانقاذ... https://t.co/ZCmkwzReK3', CAST(0x0000A73700F29943 AS DateTime), CAST(0x0000A6710130DA30 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'770538135704961024', N'اسمع كلامك تعجبني... https://t.co/4NrzMeV8Tg', CAST(0x0000A73700F2993F AS DateTime), CAST(0x0000A672008B13E8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'770676392791011328', N'notre cher ami Younes Derraz a disparu aidez nous à le retrouver.
diffusez au maximum svp https://t.co/fYUG3vNRjy', CAST(0x0000A73700F2993C AS DateTime), CAST(0x0000A6720121F86C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'770952426983657472', N'عندما يشكرك أحد رموز الفشل في الحب، فاعلم ان نهايتك قريبة!
 Mohammed Ahaddad شكرا ايها الصعلوك الجميل
شكرا https://t.co/whhcgzrVAy', CAST(0x0000A73700F29938 AS DateTime), CAST(0x0000A67300C3B8B0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'770980023016820736', N'خارج السياق: أكبر خطأ ممكن يقوم به الانسان، هو ان يترك "ليزي اكس" ديالو، في لائحته بالفيسبوك..اش من حقد؟ أش من... https://t.co/1I5DLCOsFQ', CAST(0x0000A73700F29935 AS DateTime), CAST(0x0000A67300E1D7A0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'771295069328576512', N'يونس الدراز بخير..شكر للجميع https://t.co/3bUHhna7yi', CAST(0x0000A73700F29932 AS DateTime), CAST(0x0000A67400AE2CAC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'771738475628490752', N'خليو فلوس هدية عيد ميلادي ...متقولوش لي جا مع العيد والدخول المدرسي وديك الاسطوانة "المنحوسة" التي لاحقتني من... https://t.co/j0XLwsPgCu', CAST(0x0000A73700F2992D AS DateTime), CAST(0x0000A6750106989C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'771983680122347520', N'Le pays qui se rêvait autoritaire https://t.co/xrq8Jf2XrM', CAST(0x0000A73700F29927 AS DateTime), CAST(0x0000A6760086B398 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'772171034543915013', N'تجبيدة اذن رفيق طفولي يعيش مراهقة شيوعية: ها علاش اقول ان بنكيران انسان وطني؟. بل يشكل كبرياء الشعب بلغة المؤرخ... https://t.co/3NNHfYBolI', CAST(0x0000A73700F2991C AS DateTime), CAST(0x0000A67601532E14 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'772367295171665920', N'قبل خمس سنوات󾌲 https://t.co/svRNAz6t1p', CAST(0x0000A73700F29915 AS DateTime), CAST(0x0000A677009DDE74 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'772437056064749568', N'خطوة جد ممتازة تذا تبناها الرميد https://t.co/CF2ITqRLvI', CAST(0x0000A73700F2990E AS DateTime), CAST(0x0000A67700EA0240 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'772449429282557953', N'"منتدى الكرامة" يطالب بإعادة صياغة نصوص القانون الجنائي التي تمس الحياة الخاصة https://t.co/aCB87xmndP', CAST(0x0000A73700F29907 AS DateTime), CAST(0x0000A67700F78348 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'772464437739610114', N'مطالب منتدى الكرامة، بتغييربعض  فصول القانون الجنائي المطاطة التي تستعمل للانتقام من المعارضين، "تقدميين" او... https://t.co/EIK33psDV0', CAST(0x0000A73700F29900 AS DateTime), CAST(0x0000A6770107E440 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'772500603230650368', N'علاش معنديش "لايف"؟ واش حنا ماشي كليان الفيسبوك :p', CAST(0x0000A73700F298FA AS DateTime), CAST(0x0000A677012F5C28 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'772537980993044480', N'عندكم زهر ان لايف ميمكنش يخدم عندي لان هاتفي حقير...اما كنت غادي نكرهكم في نهار لي مارك فكر يدير لايف󾌲', CAST(0x0000A73700F298F6 AS DateTime), CAST(0x0000A677015827E8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'772854907833647104', N'قلب تمرّس باللذات وهو فتىً
كبرعم لمسَتْه الريح فانفتح https://t.co/Zydpowp1YR', CAST(0x0000A73700F298F3 AS DateTime), CAST(0x0000A678012689F4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'773098742853537792', N'في الحقيقة اتفق مع عبد اللطيف وهبي، في مسألة التمييز بين بنكيران والبجيدي..لكن اختلف معه في شكل هذا... https://t.co/mnWvtSnjgF', CAST(0x0000A73700F298EF AS DateTime), CAST(0x0000A67900A526E8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'773108454449881088', N'هذه توقعاتي لنتائج الانتخابات في 7 أكتوبر، علاش احنا منديروش تشوافت السياسية:
أولا/ حزب العدالة والتنمية الإسلامي... https://t.co/XM0OSxqB7n', CAST(0x0000A73700F298EB AS DateTime), CAST(0x0000A67900AFBFCC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'773492878144339968', N'الكذبة مش خطيّة 
وعدني أنّو رح تجي 
وتعا .... ولا تجي https://t.co/rlaT8ssAOf', CAST(0x0000A73700F298E6 AS DateTime), CAST(0x0000A67A00C7CCD4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'773540822189019136', N'أسئلة لمن يتكلم ببراءة لكن عن سوء فهم او عن سذاجة سياسية، أما من يخدم أجندة حزب التحكم فهو غير معني بكلامي:
**... https://t.co/rwy3rHVKix', CAST(0x0000A73700F298E1 AS DateTime), CAST(0x0000A67A00FC2088 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'773567901634818050', N'ويقولون لك خبراء السياسة الجدد...ماذا سينفع المغرب اذا وصل البجيدي او البام؟ بجوج بحال بحال..طيب، وكأنه يضعنا بين... https://t.co/keiXX5HyVj', CAST(0x0000A73700F298DC AS DateTime), CAST(0x0000A67A0119AE28 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'773807165941354496', N'صباحكم أمل:  أمل ... إيه في أمل
أوقات بيطلع من ملل https://t.co/JKX10ZBNme', CAST(0x0000A73700F298D1 AS DateTime), CAST(0x0000A67B00934DC4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'773934711475404800', N'الأستاذ محمد الناجي يختصر بشكل ممتاز ما نردده منذ شهور ..شكرا أستاذ https://t.co/5KPw7nR9eF', CAST(0x0000A73700F298C9 AS DateTime), CAST(0x0000A67B011E8150 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'774884603660267520', N'صباح ومسا https://t.co/yNFBrc8MJb', CAST(0x0000A73700F298BD AS DateTime), CAST(0x0000A67E0088B030 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'775053186117828608', N'عيد مبارك سعيد وكل عام وأنتم بألف خير', CAST(0x0000A73700F298B5 AS DateTime), CAST(0x0000A67E0140AE88 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'775124730856738816', N'@Tic_Maroc علينا و عليك اخي ☺', CAST(0x0000A73700F3F921 AS DateTime), CAST(0x0000A67F00034134 AS DateTime), N'', N'@Tic_Maroc,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'775420262602989568', N'@AndroidPIT_FR je suis pour le port d''Amsterdam 😉', CAST(0x0000A73700F3F919 AS DateTime), CAST(0x0000A67F0145CB84 AS DateTime), N'', N'@AndroidPIT_FR,', N'15111281', N'Nabil79', 3402, 1504, N'Béni-Mellal', N'94af1f56d083a76b', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'775467462477410308', N'#lol https://t.co/pC1qU50Qt6', CAST(0x0000A73700F3F913 AS DateTime), CAST(0x0000A67F01794FCC AS DateTime), N'lol,', N'', N'15111281', N'Nabil79', 3402, 1504, N'Béni-Mellal', N'94af1f56d083a76b', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'776512998777221121', N'شكرا لكل من كلف نفسه بعث رسالة تهنئة بمناسبة عيد ميلادي ..هرمنا من أجل نعيش نفس الاستبداد والفساد..احباط وخوف من... https://t.co/rxJIOWU7Kx', CAST(0x0000A73700F298AE AS DateTime), CAST(0x0000A682014BE0F0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'776736560716931072', N'منع حماد القباج من الترشح اعتداء سافر على الحقوق المدنية لمواطن مغربي، مهما اختلفنا معه في افكاره..وردة فعل... https://t.co/HcZbQnzZUO', CAST(0x0000A73700F298AA AS DateTime), CAST(0x0000A68300B45D0C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'776954031315030016', N'وهبتي عمري للأمل� https://t.co/pfCf8i630C', CAST(0x0000A73700F298A5 AS DateTime), CAST(0x0000A68400163398 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'777122264621932544', N'شكون في الاصدقاء غادي يسافر بالسيارة من مراكش للرباط او مراكش البيضاء، اليوم  السبت او غدا الأحد..نتواصل في... https://t.co/h4flmsbwkc', CAST(0x0000A73700F298A0 AS DateTime), CAST(0x0000A68400CDCF80 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'777139992640516096', N'واش مازال كتعتبرو "كو فواتيراج" عيب؟؟! ..', CAST(0x0000A73700F2989B AS DateTime), CAST(0x0000A68400E12904 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'777452074321707008', N'لعب دراري، من خلال مسيرة مفبركة وموجهة من جهات معلومة لن يوقف مواجهة التدخل في العمل الحزبي وعملية "لو كنترول"... https://t.co/r5VtzSHg07', CAST(0x0000A73700F29895 AS DateTime), CAST(0x0000A68500AA418C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'777640281713827840', N'بشاخ الحداثة ��� https://t.co/xdxHBkheJs', CAST(0x0000A73700F29885 AS DateTime), CAST(0x0000A6850177A9EC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'777834663704403968', N'أصابك عشق أم رميت بأسهم - فما هذه إلا سجيّة مغرمِ https://t.co/VMdMsWUEmm', CAST(0x0000A73700F2987F AS DateTime), CAST(0x0000A68600C04D4C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'777841587472756736', N'L’islamisme politique un problème dans le contexte d''un pays comme le Maroc ? https://t.co/FIeFycIiNP', CAST(0x0000A73700F2986A AS DateTime), CAST(0x0000A68600C7DC10 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'777846514949431297', N'المسيرة "المجهولة"...ترتيب "سلطوي" لإعلان الشرارة الأولى لـ''''قيامة'''' الانتخابات https://t.co/PbSKLiNSr5', CAST(0x0000A73700F29863 AS DateTime), CAST(0x0000A68600CD3D04 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'777911768471470080', N'واش شاركتو فالمسيرة ديال الأحد ضد بن كيران ؟ :D :D :D https://t.co/0ZcnVIOufM', CAST(0x0000A73700F2985F AS DateTime), CAST(0x0000A6860114750C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'777912729097146369', N'اخبار هام: كما كان متوقعا لم اتوصل بأية هدية في عيد ميلادي..شبعتوني "قر"..فعلا نحن شعب كريم  وداكشي ... الخ :D', CAST(0x0000A73700F2985B AS DateTime), CAST(0x0000A68601158168 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'777914443732844544', N'@AbdullahAbaaki1 @A_Loukili @7didane لم اقرر بعد 😈', CAST(0x0000A73700F29851 AS DateTime), CAST(0x0000A68601175F88 AS DateTime), N'', N'@AbdullahAbaaki1,@A_Loukili,@7didane,', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'778236031418167296', N'How to Master and Use These Gestures in MIUI 8 Like a Pro: Homescreen https://t.co/2mQYbkSHkK https://t.co/9rC8DKBwQJ', CAST(0x0000A73700F3F90D AS DateTime), CAST(0x0000A68700EAD8B4 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'778662856581582848', N'القصة مش طقس يا حبيبي
هاي قصة ماضي كان عنيف
بس هلق ما بتذكر شكل وجهك
بس بذكر قديش كان أليف https://t.co/Mnl3FjnC1g', CAST(0x0000A73700F29847 AS DateTime), CAST(0x0000A68801312C38 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'778980208821100544', N'الدافع الوحيد الذي يجعلك ترى في أن الحل هو المشاركة في الانتخابات وليس مقاطعتها، ليست الاحزاب المشاركة في... https://t.co/8wn6IoFwGW', CAST(0x0000A73700F2983E AS DateTime), CAST(0x0000A689010005CC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'779020980811431936', N'لأقعـدن على الطـريـق وأشتكي
وأقـول مـظـلــوم و أنت ظـلمـتـني
ولأدعون عليك في غسق الدجى
يـبـلـيـك ربي مـثـلـمــا... https://t.co/5o3ts5Z9G2', CAST(0x0000A73700F29836 AS DateTime), CAST(0x0000A689012C846C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'779030904828198913', N'على بعد أمتار من مغادرتي العمارة التي يتواجد بها مكتب العمل..نادني،المنادي: شي شعيلة الله يعفو عليك..فقمت بمده... https://t.co/HHLpXPs2ax', CAST(0x0000A73700F2982D AS DateTime), CAST(0x0000A68901375A40 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'779275215163523072', N'المس بالحياة الخاصة والنبش في أعراض السياسيين، سلوك جبان وقذارة وحقارة وبؤس ..يعبر عن الخوف وعدم القدرة على... https://t.co/LX0gl7jjoC', CAST(0x0000A73700F29823 AS DateTime), CAST(0x0000A68A00B67BA0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'779358324810809344', N'لا اتبادل الشتائم على الفيسبوك، لكنني افضل ان اتبادلها في الواقع..واصدقائي الذين يعرفونني في الواقع على علم... https://t.co/9mkS3a0rQb', CAST(0x0000A73700F29818 AS DateTime), CAST(0x0000A68A01113054 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'779373259653521408', N'لترفع عن ساقها ثَوْبَها غيمةً غيمةً
وانتظرها،
وقدَّمْ لها الماءَ قبل النبيذِ ولا تتطلَّع إلى تَوْأَمَيْ حَجَلٍ... https://t.co/SqAxBn1kJY', CAST(0x0000A73700F2980F AS DateTime), CAST(0x0000A68A01217C34 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'779461914585862144', N'انطلقت الحملة...صوتي للعدالة والتنمية،محليا...ولفيدرالية اليسار  وطنيا...صوتي ضد التحكم لكي لا يقع نكوص وللأمل في... https://t.co/iHELUBKUGT', CAST(0x0000A73700F29803 AS DateTime), CAST(0x0000A68A01823E20 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'779606820180688896', N'@Ouafa_2 @_Fatita @I_9mile  انفاجرو بزوج و المحقق مازال ماعاق 😉', CAST(0x0000A73700F3F906 AS DateTime), CAST(0x0000A68B0094E210 AS DateTime), N'', N'@_Fatita,@I_9mile,', N'15111281', N'Nabil79', 3402, 1504, N'Béni-Mellal', N'94af1f56d083a76b', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'779614732319883264', N'جميل 󾌰 https://t.co/zHzC3xSB1k', CAST(0x0000A73700F297F8 AS DateTime), CAST(0x0000A68B009D8564 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'779695127493242881', N'أيها الساقي إليك المشتكى                                    قد دعوناك وإن لم تسمع https://t.co/EbQrxS77rv', CAST(0x0000A73700F297EA AS DateTime), CAST(0x0000A68B00F543E4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'780073357345714176', N'إذا كان ذنبي أن حبّك سيّدي.. فكل ليالي العاشقين ذنوب
أتوب إلى ربي وإني لمرة يسامحني ربي.. إليكِ أتوب.. https://t.co/e6w2kJpa9D', CAST(0x0000A73700F297E4 AS DateTime), CAST(0x0000A68C01068E10 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'780092858149773312', N'رغم أنني حالم حد الرومانسية "الثورية"، فقد بدأ يدب فيَّ اليأس ويصيبني الإحباط !.

**ملاحظة: لا علاقة للتدوينة بالسياسة', CAST(0x0000A73700F297DE AS DateTime), CAST(0x0000A68C011BD61C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'780388510037606400', N'بالفيديو..عائلات تلاميذ تنتفض بسبب "4 في الطاولة" https://t.co/b0Ye5e44GN', CAST(0x0000A73700F297DA AS DateTime), CAST(0x0000A68D00D30068 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'780820416965345280', N'@Larbi_org @AbdullahAbaaki1 @AfriNomad @Jbilou__ @FLqadiri البجيدي محليا وفدرالية وطنيا..البام مصيبة وكارثة لن يمر :D', CAST(0x0000A73700F297D5 AS DateTime), CAST(0x0000A68E011EE03C AS DateTime), N'', N'@Larbi_org,@AbdullahAbaaki1,@AfriNomad,@Jbilou__,@FLqadiri,', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'780830183561555969', N'@aitrione @Larbi_org من جهل شيء عاداه..اولا الناس لا تتبادل الشتائم بمرض يعاني منه جزء كبير من المغاربة..ثانيا: شغل مخك قليلا لتستوعب', CAST(0x0000A73700F297D0 AS DateTime), CAST(0x0000A68E0129885C AS DateTime), N'', N'@Larbi_org,', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'781444100159668224', N'عودة "البجيدي" لقيادة الحكومة، أصبح  شبه محسوم..وفشل مشروع "البام" أصبح واضحا..هل يتحلى من أسس "البام" بالشجاعة... https://t.co/sb6zaQG1wZ', CAST(0x0000A73700F297CB AS DateTime), CAST(0x0000A69000B08A88 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'781499694342086656', N'@willou_du80 Chui passé au Mi5 aujourd''hui même 😇', CAST(0x0000A73700F3F8FF AS DateTime), CAST(0x0000A69000ED37BC AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'781887972870328320', N'Les nombres premiers
https://t.co/6sBECmyOPH', CAST(0x0000A73700F3F8E5 AS DateTime), CAST(0x0000A691010979B8 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'782283935321616386', N'Mes amis au Maroc, est ce que vous recevez les SMS de confirmation de connexion depuis les sites tel que Twitter, Facebook, Google ?', CAST(0x0000A73700F3F8E0 AS DateTime), CAST(0x0000A692012E1D68 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'782284356719116288', N'Ce genre de SMS trouve du mal me parvenir et le support de @inwi dit ne peut rien faire pour moi !', CAST(0x0000A73700F3F8DA AS DateTime), CAST(0x0000A692012E93C4 AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'782285275389104128', N'ان سبب اقتناعي التام بالتصويت لنبيلة منيب ولفيدرالية اليسار الديموقراطي وطنيا،  ليس فقط لانني يساري منذ 19... https://t.co/PkwnzS8Tty', CAST(0x0000A73700F297C4 AS DateTime), CAST(0x0000A692012F9468 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'782289780918878209', N'@ahbou_ T''es chez quel opérateur ?', CAST(0x0000A73700F3F8CC AS DateTime), CAST(0x0000A69201347F00 AS DateTime), N'', N'@ahbou_,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'782307522237587460', N'@Fahdos C''est effectivement Avec PayPal que je rencontre le problème aujourd''hui.. Twitter et Facebook les autres jours ! Poke @inwi !', CAST(0x0000A73700F3F8C7 AS DateTime), CAST(0x0000A6920147DC08 AS DateTime), N'', N'@Fahdos,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'782960077460344832', N'إذا رجعت بجن وإن تركتك بشقى 
لا قدرانة فل ولا قدرانة أبقى https://t.co/ynVFu2UFN7', CAST(0x0000A73700F297BF AS DateTime), CAST(0x0000A69400F90984 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'782989141986467840', N'@Tic_Maroc 1 Go le volume data ! C''est vraiment de l''arnaque !', CAST(0x0000A73700F3F8BF AS DateTime), CAST(0x0000A6940118C29C AS DateTime), N'', N'@Tic_Maroc,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'783267151524356096', N'عمال وقياد وشيوخ ومقدمين ... 
سمعوا مزيان الله يرضي عليكم......راكم مابقيتوش كتعرفوا لداك الشي ديال الانتخابات..... https://t.co/NK5fn7HfUf', CAST(0x0000A73700F297BA AS DateTime), CAST(0x0000A69500BCAAD4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'783276470349234176', N'من حسم منكم امر التصويت ولمن؟ ومن كان مقاطعا وسيصوت؟ ولمن؟ ومن كان سيصوت، وقرر المقاطعة؟ ومن لازال مترددا منكم؟', CAST(0x0000A73700F297B6 AS DateTime), CAST(0x0000A69500C6D6BC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'783643086241013760', N'تختلف معه..لا تتفق مع برنامج حزبه ..لكن تحترمه لأنه يبقى رجل سياسة عصري، يؤسس للممارسة الديمقراطية في الحقل... https://t.co/NsrGHT5Nl1', CAST(0x0000A73700F297B0 AS DateTime), CAST(0x0000A69600CB73FC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'784142040397410304', N'@_Fatita العشرة ونص نكونو فبلايصنا...', CAST(0x0000A73700F3F8B9 AS DateTime), CAST(0x0000A6970160803C AS DateTime), N'', N'@_Fatita,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'784147627071926272', N'@_Fatita Eh oui', CAST(0x0000A73700F3F8AE AS DateTime), CAST(0x0000A6970166992C AS DateTime), N'', N'@_Fatita,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'784456779170209792', N'ارادة الشعب المغربي ستنتصر على دعاة البؤس والتحكم والتخلف...لن نقبل بأن يعود هذا البلد لممارسة المقبور البصري...... https://t.co/5K4848xRba', CAST(0x0000A73700F2979D AS DateTime), CAST(0x0000A698012C7FBC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'784512913478475776', N'@Hafiida_ اختي بغيت الدليل على أن هاد الحوار دار بيناتهم... هاد الأسلوب اللغوي دياااالنا 😉', CAST(0x0000A73700F3F885 AS DateTime), CAST(0x0000A6980169C2F0 AS DateTime), N'', N'@Hafiida_,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'784513906890907648', N'@Hafiida_ داك الشي صحييييح و متافق معاه ولكن حشومة نكذبو على السيدة الا ماگالت والو 😉', CAST(0x0000A73700F3F84D AS DateTime), CAST(0x0000A698016AD8AC AS DateTime), N'', N'@Hafiida_,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'784551325036122112', N'مقعد للفيدرالية بالرباط https://t.co/iCcnoEgpXS', CAST(0x0000A73700F29797 AS DateTime), CAST(0x0000A69900082CF8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'784564048163696640', N'مبروك للبجيدي وتحية خاصة لفيدرالية اليسار..وشكرا للشعب المغربي، الذي يبهرنا في كل مرة بذكائه ونضجه واستحقاقه للديمقراطية كاملة..', CAST(0x0000A73700F29792 AS DateTime), CAST(0x0000A69900161070 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'785123048009629697', N'الحقيقة العارية ان السيادة الشعبية انتصرت. لاول مرة في تاريخ المغرب الراهن يختار المغاربة رئيس حكومتهم بالاقتراع... https://t.co/s1948YIkYk', CAST(0x0000A73700F2978D AS DateTime), CAST(0x0000A69A00ECA540 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'785139881106403328', N'من يحاول منذ إعلان نسبة المشاركة، إحصاء عدد غير المشاركين والمقاطعين للعبة السياسية..اعتقد أنه يتلذذ بعملية "حصد... https://t.co/lGeSqAZLHj', CAST(0x0000A73700F29789 AS DateTime), CAST(0x0000A69A00FF03FC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'785419882200502272', N'بالنسبة لحزب الأصالة والمعاصرة..بعد تدقيق في 102 برلماني، فقد عبر للبرلمان فقط "3" أعضاء من المكتب السياسي: وهم... https://t.co/0gFcCm1qvD', CAST(0x0000A73700F29784 AS DateTime), CAST(0x0000A69B00A518D8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'785441724378284032', N'حلوة يا بلدي https://t.co/Q7kkoPKnL6', CAST(0x0000A73700F29780 AS DateTime), CAST(0x0000A69B00BCEFF8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'785452645079191552', N'رباح ينتظر المنادي على ما يبدو..مبغاش يشد الصف ...عيطو لفقيه https://t.co/IUhJ7uepSi', CAST(0x0000A73700F2977B AS DateTime), CAST(0x0000A69B00C8DB88 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'785757505779560448', N'يسعد صباحكم � https://t.co/BgaXPoKVzn', CAST(0x0000A73700F29777 AS DateTime), CAST(0x0000A69C008A1218 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'786700209086668801', N'قمت بحذف التعليق السابق لأنني غلطت في المعطيات حول هوية اصحاب الحملة..اعتذر للمتابعين..', CAST(0x0000A73700F29772 AS DateTime), CAST(0x0000A69E0177EA60 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'786713614128472065', N'سكتت يوماً فهل سكتت؟*** أجملُ التاريخِ كان غدا

واعدي لا كنتَ من غضبٍ ***أعرف الحب سنىً وهدى https://t.co/awQYmkIqhb', CAST(0x0000A73700F2976E AS DateTime), CAST(0x0000A69E01868BB0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'786831548783919104', N'Enfin ! La maj #Miui8 tant attendue ! https://t.co/x7wwWjto3x', CAST(0x0000A73700F3F839 AS DateTime), CAST(0x0000A69F007BC078 AS DateTime), N'Miui8,', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'786848733241696256', N'@willou_du80 Pas d''amalgame ! Je suis musulman certes mais pas fan des engins explosifs 😉', CAST(0x0000A73700F3F82B AS DateTime), CAST(0x0000A69F008E81A4 AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'786882423967670272', N'رجعت الشتوية https://t.co/z09fdJp9S0', CAST(0x0000A73700F29769 AS DateTime), CAST(0x0000A69F00B34750 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'786948524709703680', N'طيلة ولاية الحكومة المنتهية سيبرز اسم أخنوش أكثر من مرة مصاحبا لقضايا تخص تدبير المال العام، حتى لقب بوزير... https://t.co/n6OmQZweCB', CAST(0x0000A73700F29764 AS DateTime), CAST(0x0000A69F00FB6AE4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'787306609085181953', N'قراءة في انتخابات 7اكتوبر https://t.co/ca0EzMsNqi', CAST(0x0000A73700F2975F AS DateTime), CAST(0x0000A6A000F6B88C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'787307569891119104', N'قراءة في انتخابات 7اكتوبر https://t.co/QmBP27ruCd', CAST(0x0000A73700F2975B AS DateTime), CAST(0x0000A6A000F7C4E8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'787314841094684673', N'نقاش بين الشباب اليساري، حول انتخابات 7 اكتوبر..من تنظيم جمعية انفاس، بالرباط', CAST(0x0000A73700F29757 AS DateTime), CAST(0x0000A6A000FFB4F0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'787772998153543680', N'أهواه من قال إني ما أبتسمت له دنا فعانقني شوق إلى الهرب 
*********
نسيت من يده أن أسترد يدي طال السلام و طالت رفة... https://t.co/rblszjynn0', CAST(0x0000A73700F29753 AS DateTime), CAST(0x0000A6A101683A5C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'787962571160707072', N'@willou_du80 il est beau 😍', CAST(0x0000A73700F3F81E AS DateTime), CAST(0x0000A6A200AB9EC4 AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'787972030897483776', N'مولود جديد في الصحافة الالكترونية المغربية...بالتوفيق للزملاء في بابوبي.
Mohammed Ahmed Odda Khalid Gueddar Baki... https://t.co/jSvYliBnqK', CAST(0x0000A73700F2974E AS DateTime), CAST(0x0000A6A200B5F158 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'788063723189567489', N'بدل الصراع على الطرابيش والسلاهم، والتهجم الأرعن وغير اخلاقي على بلافريج والشناوي ومنيب..كنت انتظر من اتحاديي... https://t.co/BZXtK7oDpb', CAST(0x0000A73700F29749 AS DateTime), CAST(0x0000A6A2011A03B4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'788150012131831812', N'بعد انتصار بنكيران على السلطوية في الانتخابات..هاهو يتجه بخطى ثابتة لتحرير حزبي الاستقلال من السلطوية لكي... https://t.co/dbDNluylvD', CAST(0x0000A73700F29744 AS DateTime), CAST(0x0000A6A2017830B0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'788159008863641604', N'مكتيقوش اش تنقول اوى ضحكو لي مع راسكم..المهم في الاخير غادي تصدق قرائتي للفنجان السياسي..كما وقع في الانتخابات... https://t.co/H8HbnqtvHL', CAST(0x0000A73700F29740 AS DateTime), CAST(0x0000A6A20182025C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'788421958715187200', N'https://t.co/pMtcwwg1x3', CAST(0x0000A73700F2973B AS DateTime), CAST(0x0000A6A301157B8C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'788784548947648513', N'ههههههههههههههههه D :D: https://t.co/JWhzMSpZ7S', CAST(0x0000A73700F29737 AS DateTime), CAST(0x0000A6A40115B4F8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'789148471332921344', N'عدم تلبية فيدرالية اليسار لدعوة بنكيران، قرار سياسي صائب بالفهم البرغماتي للممارسة السياسية، التي يتقنها... https://t.co/MXG16U8jrb', CAST(0x0000A73700F29732 AS DateTime), CAST(0x0000A6A5011760B4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'789157512461377536', N'هام جدااااااااااااااااااااااااااااااااااا https://t.co/wzhiH1JHkQ', CAST(0x0000A73700F2972D AS DateTime), CAST(0x0000A6A501213F44 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'789519404539207680', N'منيب: نحترم مؤسسة الحكومة..واتصلت ببنكيران مرتين ولم يرد! https://t.co/KUVvV5KfVZ', CAST(0x0000A73700F29728 AS DateTime), CAST(0x0000A6A60120B4FC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'789536072510410753', N'RT @MKACITV5M: 🎤 Ce dimanche je reçois @saadlamjarred1 dans #MaghrebOrientExpress #SaadLamjarred #Maroc @SaadFanclub #MOE @TV5MONDE 🎧 سعد ل…', CAST(0x0000A73500F7DA2A AS DateTime), CAST(0x0000A6A60132E604 AS DateTime), N'MaghrebOrientExpress,SaadLamjarred,Maroc,MOE,', N'@MKACITV5M,@saadlamjarred1,@SaadFanclub,@TV5MONDE,', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'789536931638018048', N'RT @HITRADIOMA: .@saadlamjarred1 adore ses fans &lt;3
Redécouvre le passage hier en direct sur #HITRADIO 👉 https://t.co/Cc8xkuRane https://t.c…', CAST(0x0000A73500F7DA1A AS DateTime), CAST(0x0000A6A60133D640 AS DateTime), N'HITRADIO,', N'@HITRADIOMA,@saadlamjarred1,', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'789874120695681024', N'RT @HITRADIOMA: Joue et gagne tes places pour assister au concert de @saadlamjarred1 le 29 Octobre à Paris ;)

Comment participer 👉 https:/…', CAST(0x0000A73500F7D9CD AS DateTime), CAST(0x0000A6A7011855A0 AS DateTime), N'', N'@HITRADIOMA,@saadlamjarred1,', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790154610010914816', N'موعدكم مع سعد لمجرد في برنامج #MOE على الساعة الواحدة بعد الظهر بتوقيت المغرب عبر قناة #TV5MONDE https://t.co/qclOaA69xk', CAST(0x0000A73500F7D9C8 AS DateTime), CAST(0x0000A6A800BEF398 AS DateTime), N'MOE,TV5MONDE,', N'', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790200220709707776', N'@inwi Quand PayPal veut vérifier mon numéro de téléphone, l''sms de vérification ne me parvient jamais ! Idem pour beaucoup de services...', CAST(0x0000A73700F3F80A AS DateTime), CAST(0x0000A6A800F0BA90 AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790200572808925184', N'@inwi j''ai fait des tests avec mon numéro iam tout passe.. Mais rien avec mon numéro Inwi...', CAST(0x0000A73700F3F7F0 AS DateTime), CAST(0x0000A6A800F11D00 AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790202154132832256', N'@inwi mes amis mont confirmé que ces SMS arrivent sans problème sur leurs mobiles contrairement à ce que votre sav veut me faire croire..', CAST(0x0000A73700F3F7E8 AS DateTime), CAST(0x0000A6A800F2D6CC AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790202337876926467', N'@inwi que le problème ne vient pas d''inwi mais de ces services qui existent en dehors du Maroc..', CAST(0x0000A73700F3F7DB AS DateTime), CAST(0x0000A6A800F30A5C AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790202655897448449', N'@inwi alors pourquoi les numéros IAM et méditel sont vérifiés par ces mêmes services au Maroc ?', CAST(0x0000A73700F3F7CE AS DateTime), CAST(0x0000A6A800F3636C AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790203076774879238', N'@inwi À part whatsapp, la plupart des services en ligne ne peuvent pas vérifier mon numéro : Google, Facebook, Twitter, PayPal, Familonet..', CAST(0x0000A73700F3F7C2 AS DateTime), CAST(0x0000A6A800F3D89C AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790203681425780736', N'@inwi exemple de familonet, le code de vérification n''arrive jamais par SMS... https://t.co/dS23Ew2GZR', CAST(0x0000A73700F3F7BD AS DateTime), CAST(0x0000A6A800F4815C AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790227696047550464', N'RT @MKACITV5M: 🎤 Le message de @saadlamjarred1 à ses fans @SaadFanclub #SaadLamjarred 🎧 #Maroc #MOE #MaghrebOrientExpress @TV5MONDE https:/…', CAST(0x0000A73500F7D9C3 AS DateTime), CAST(0x0000A6A8010EB784 AS DateTime), N'SaadLamjarred,Maroc,MOE,MaghrebOrientExpress,', N'@MKACITV5M,@saadlamjarred1,@SaadFanclub,@TV5MONDE,', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790227824141533184', N'RT @HITRADIOMA: Joue et gagne tes places pour assister au concert de @saadlamjarred1 le 29 Octobre à Paris ;)

Comment participer 👉 https:/…', CAST(0x0000A73500F7D9BA AS DateTime), CAST(0x0000A6A8010EDAAC AS DateTime), N'', N'@HITRADIOMA,@saadlamjarred1,', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790231390927421440', N'لمن فاتته حلقة اليوم من برنامج #MOE يمكنكم الان مشاهدتها عبر الرابط التالي :... https://t.co/eEpPzTZx19', CAST(0x0000A73500F7D9AE AS DateTime), CAST(0x0000A6A80112BFF0 AS DateTime), N'MOE,', N'', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790276367044804608', N'@drisslebbat Merci pour la confirmation Driss. Poke @inwi', CAST(0x0000A73700F3F7B3 AS DateTime), CAST(0x0000A6A80143D5F4 AS DateTime), N'', N'@drisslebbat,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790310811147309058', N'عزاؤنا واحد في فقدان سمو الأمير المغفور له الشيخ خليفة بن حمد آل ثاني، ولا نقول الا ما يرضى… https://t.co/Tisa0wV0LD', CAST(0x0000A73500F7D9A8 AS DateTime), CAST(0x0000A6A801696D64 AS DateTime), N'', N'', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790310823239512064', N'عزاؤنا واحد في فقدان سمو الأمير المغفور له الشيخ خليفة بن حمد آل ثاني، ولا نقول الا ما يرضى ربنا، أعظم الله أجركم... https://t.co/kobv8OFDXM', CAST(0x0000A73500F7D9A2 AS DateTime), CAST(0x0000A6A8016970E8 AS DateTime), N'', N'', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790483141727227904', N'بعد اقل من ساعة موعدكم مع سعد لمجرد ضيفا على Radio Orient France على الساعة 11 بتوقيت المغرب ...

رابط الإستماع... https://t.co/Dmxx6G0n6u', CAST(0x0000A73500F7D994 AS DateTime), CAST(0x0000A6A9009A0038 AS DateTime), N'', N'', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790494058573602816', N'RT @TV5MONDEMOE: .@saadlamjarred1 : "Notre culture marocaine commence à sortir du monde arabe ... j''en suis très fier" @7Lou_Anne #Darija #…', CAST(0x0000A73500F7D98E AS DateTime), CAST(0x0000A6A900A5E970 AS DateTime), N'Darija,', N'@TV5MONDEMOE,@saadlamjarred1,@7Lou_Anne,', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790501574128836608', N'@inwi Merci ^^', CAST(0x0000A73700F3F7A6 AS DateTime), CAST(0x0000A6A900AE1D70 AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790526021627961344', N'Lartiste and I  😎#saadlamjarred1 #saadlamjarred #paris_29octobre_slshow https://t.co/w3BNbNSw6s', CAST(0x0000A73500F7D97E AS DateTime), CAST(0x0000A6A900C8CC4C AS DateTime), N'saadlamjarred1,saadlamjarred,paris_29octobre_slshow,', N'', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790526032180838400', N'Lartiste and I  😎#saadlamjarred1 #saadlamjarred #paris_29octobre_slshow https://t.co/egPfWIU5P3', CAST(0x0000A73500F7D970 AS DateTime), CAST(0x0000A6A900C8CEA4 AS DateTime), N'saadlamjarred1,saadlamjarred,paris_29octobre_slshow,', N'', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790654311437074432', N'RT @RotanaMagz: سعد لمجرد يشوق جمهوره لحفله في باريس
https://t.co/nT8UXO8FHR
#روتانا #مشاهير @saadlamjarred1', CAST(0x0000A73500F7D967 AS DateTime), CAST(0x0000A6A90154D070 AS DateTime), N'روتانا,مشاهير,', N'@RotanaMagz,@saadlamjarred1,', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790668592786370560', N'غناء: فيروز

يَا لَيْلَ الصَّبِّ مَتَى غَدُهُ
أَقِيَامُ السَّاعَةِ مَوْعِدُهُ https://t.co/8gOjpf6Mkw', CAST(0x0000A73700F29725 AS DateTime), CAST(0x0000A6A9016466AC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790680033216135169', N'Empêcher Firefox de quitter si le dernier onglet est fermé https://t.co/foOm49Ghbq', CAST(0x0000A73700F3F79F AS DateTime), CAST(0x0000A6A90170E260 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790868219951194112', N'RT @mtvlebanon: سعد لمجرّد الأوّل عربياً... وقريباً الى #باريس
https://t.co/MBNo72BX5c
@saadlamjarred1 #mtvlebanonstars https://t.co/vCuUL3…', CAST(0x0000A73500F7D953 AS DateTime), CAST(0x0000A6AA00B2C2E4 AS DateTime), N'باريس,mtvlebanonstars,', N'@mtvlebanon,@saadlamjarred1,', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790933793267978240', N'#paris_29octobre_slshow #saadlamjarred #saadlamjarred1 @ Paris, France https://t.co/pRT70iljE7', CAST(0x0000A73500F7D948 AS DateTime), CAST(0x0000A6AA00FA53FC AS DateTime), N'paris_29octobre_slshow,saadlamjarred,saadlamjarred1,', N'', N'356442237', N'saadlamjarred1', 518333, 78, N'Paris', N'09f6a7707f18e0b1', N'  48.87171682,  2.32606013', N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790933806475841536', N'#paris_29octobre_slshow #saadlamjarred #saadlamjarred1 https://t.co/tPeraqaHa5', CAST(0x0000A73500F7D942 AS DateTime), CAST(0x0000A6AA00FA5780 AS DateTime), N'paris_29octobre_slshow,saadlamjarred,saadlamjarred1,', N'', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'790966457769353216', N'RT @HITRADIOMA: Joue et gagne tes places pour assister au concert de @SaadLamjarred1 le 29 Octobre à Paris ;)

Comment participer 👉 https:/…', CAST(0x0000A73500F7D937 AS DateTime), CAST(0x0000A6AA011DFA8C AS DateTime), N'', N'@HITRADIOMA,@saadlamjarred1,', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791018187051692033', N'Finally I had the pleasure to meet my bro @gadelmaleh , the show blew my mind ...really as… https://t.co/bYtXbufJOJ', CAST(0x0000A73500F7D906 AS DateTime), CAST(0x0000A6AA01566F48 AS DateTime), N'', N'@gadelmaleh,', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791018197281542144', N'Finally I had the pleasure to meet my bro @gadelmaleh , the show blew my mind ...really as moroccans we''re purely... https://t.co/7PCezhIWYM', CAST(0x0000A73500F7D8F5 AS DateTime), CAST(0x0000A6AA015672CC AS DateTime), N'', N'@gadelmaleh,', N'356442237', N'saadlamjarred1', 518333, 78, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791186675791716354', N'@willou_du80 je l''ai croisé l''autre jour ! Une beauté ! 😍', CAST(0x0000A73700F3F798 AS DateTime), CAST(0x0000A6AB0082D0AC AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791238264548126720', N'@willou_du80 Oh que oui', CAST(0x0000A73700F3F791 AS DateTime), CAST(0x0000A6AB00BB1EBC AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791245729884930048', N'@willou_du80 oui oui je confirme ☺️', CAST(0x0000A73700F3F784 AS DateTime), CAST(0x0000A6AB00C344AC AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791246167493451776', N'@willou_du80 C''est ton droit 😉', CAST(0x0000A73700F3F77D AS DateTime), CAST(0x0000A6AB00C3BE8C AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791247708724092928', N'@willou_du80 Oui ça demande une phase d''adaptation mais une fois dedans, difficile de voir ailleurs 😉', CAST(0x0000A73700F3F777 AS DateTime), CAST(0x0000A6AB00C56DCC AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791249003392425984', N'@willou_du80 Oui oui, on ne change pas une équipe qui gagne ☺️', CAST(0x0000A73700F3F76A AS DateTime), CAST(0x0000A6AB00C6D6BC AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791323422756339713', N'الزمن الجميل: يمكن فايت لي شفتك https://t.co/sfibNMfClv', CAST(0x0000A73700F2971F AS DateTime), CAST(0x0000A6AB01180F50 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791709940532572160', N'ولي فؤاد إذا طال العذاب به طار اشتياقاً إلى لقيا معذبه
يفديك بالنفس صب لو يكون له أعز من نفسه شيء فداك به https://t.co/8KcXlOrn8e', CAST(0x0000A73700F29718 AS DateTime), CAST(0x0000A6AC0132651C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791755494473994242', N'@MavenHosting des soucis sur vos serveurs ?', CAST(0x0000A73700F3F763 AS DateTime), CAST(0x0000A6AC01641CD8 AS DateTime), N'', N'@MavenHosting,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'791761978054303744', N'بالعشق ؛ تستوي كلُّ العيوب والشّكّ ينهار
بالعشق؛ تنتهي فينا الحروب و تزهو الأقدار https://t.co/Rb952Ddq3p', CAST(0x0000A73700F2970F AS DateTime), CAST(0x0000A6AC016B3090 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792364031470407680', N'محسن شهيد لقمة العيش ..محسن شهيد معركة المغاربة اليومية من أجل طرف ديال الخبز المذلول ..محسن اعلان عن فشل سياسة... https://t.co/rpXly3MF3U', CAST(0x0000A73700F2970A AS DateTime), CAST(0x0000A6AE00E540AC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792369152656891904', N'Pour les gens qui vont se demander, demain, quelle heure est il ? Installez cette application : i-Sa3a… https://t.co/q0uvk1lBJd', CAST(0x0000A73700F3F75C AS DateTime), CAST(0x0000A6AE00EAD788 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792433667561951232', N'المدن التي ستنظم وقفات احتجاجية غدا:
-الرباط أمام البرلمان، على الساعة الخامسة مساء.
-الدار البيضاء ساحة المريشال... https://t.co/Hv62c4lRpm', CAST(0x0000A73700F29706 AS DateTime), CAST(0x0000A6AE01314024 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792693117090533376', N'منصة WIX ترد على اتهامات Wordpress لها بالسرقة: يوم بعد اتهام شركة wix من قبل مدير شركة wordpress الذي أكد في... https://t.co/nC9m5EqCjX', CAST(0x0000A730000136F4 AS DateTime), CAST(0x0000A6AF00C0E7FC AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792727329646661632', N'اعتقال فتى يبلغ 18 سنة  في الولايات المتحدة بتهمة العبث بنظام الطوارئ: قالت سلطات ولاية أريزونا أنها اعتقلت م... https://t.co/cDXz6dsOPD', CAST(0x0000A730000136E6 AS DateTime), CAST(0x0000A6AF00E63EF8 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792743973001408513', N'ذكاء اصطناعي من غوغل يقوم بتشفير البيانات من تلقاء نفسه !!: اعتبرت إنجما قمة التطور والتقدم التكنلوجي في مجال... https://t.co/TgWcNJQ38v', CAST(0x0000A730000136E2 AS DateTime), CAST(0x0000A6AF00F868F8 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792775266175102976', N'على غير عادتها ميكروسوفت تدعم خاصية شريط اللمس بأجهزة MacBook Pro الجديدة: عندما نتحدث عن ميكروسوفت و آبل فإن... https://t.co/JJSK2jWNI7', CAST(0x0000A730000136D8 AS DateTime), CAST(0x0000A6AF011A9054 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792782726776651777', N'مباشرة من الرباط: مسيرة الشهيد محسن فكري https://t.co/UX9IgyFZ0b', CAST(0x0000A73700F29701 AS DateTime), CAST(0x0000A6AF0122B3EC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792782962639171584', N'بث مباشر من فاس
وقفة احتجاجية على روح الفقيد #محسن_فكري https://t.co/TLIDr8qm4C', CAST(0x0000A73700F296FD AS DateTime), CAST(0x0000A6AF0122F6B8 AS DateTime), N'محسن_فكري,', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792783364847796229', N'مباشرة من الدار البيضاء...وقفة شهيد الحكرة محسن فكري https://t.co/INhZIwjF3i', CAST(0x0000A73700F296F9 AS DateTime), CAST(0x0000A6AF01236738 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792783956387196929', N'مباشر من وجدة/ مسيرة شهيد الحكرة محسن فكري https://t.co/xGpEBgdwAY', CAST(0x0000A73700F296EF AS DateTime), CAST(0x0000A6AF01240C74 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792785598864093184', N'مباشر من مسيرة "شهيد الحكرة" بايت بني بوعياش https://t.co/MIDGFoczvd', CAST(0x0000A73700F296EA AS DateTime), CAST(0x0000A6AF0125D6A8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792786006432948225', N'طنجة مباشر:  مسيرة "شهيد الحكرة" محسن فكري https://t.co/cDHuwUTIUD', CAST(0x0000A73700F296E6 AS DateTime), CAST(0x0000A6AF01264854 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792786341859852289', N'مباشر من تطوان : مسيرة "شهيد الحكرة" https://t.co/Uqpd5T5nmg', CAST(0x0000A73700F241D3 AS DateTime), CAST(0x0000A6AF0126A614 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792788185164156929', N'مباشر من اأكادير/ وقفة شهيد الحكرة محسن فكري https://t.co/gyltJIX268', CAST(0x0000A73700F241CE AS DateTime), CAST(0x0000A6AF0128A9B4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792790230206218241', N'مباشر من أكادير https://t.co/FFEvIslZlq', CAST(0x0000A73700F241CA AS DateTime), CAST(0x0000A6AF012AE468 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792790451980013568', N'مباشر من طنجة https://t.co/Q3tasbHw4R', CAST(0x0000A73700F241C6 AS DateTime), CAST(0x0000A6AF012B2284 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792794197854195712', N'مباشر من العرائش https://t.co/TESc0gYsI5', CAST(0x0000A73700F241C3 AS DateTime), CAST(0x0000A6AF012F3900 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792795017203056641', N'القنيطرة.. شكل احتجاجي على #طحن_مو https://t.co/MoXpRdrGZU', CAST(0x0000A73700F241BF AS DateTime), CAST(0x0000A6AF01301EB0 AS DateTime), N'طحن_مو,', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792795114926141444', N'مباشرة من شفشاون #طحن_مو https://t.co/sdEjxSfeth', CAST(0x0000A73700F241BB AS DateTime), CAST(0x0000A6AF013039A4 AS DateTime), N'طحن_مو,', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792796482311163904', N'مباشر : مسيرة حاشدة من أمام كوميسارية الحسيمة https://t.co/kYGMF0rvHX', CAST(0x0000A73700F241B7 AS DateTime), CAST(0x0000A6AF0131B7AC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792800768239820801', N'مباشر: تيزنيت تتضامن مع الشهيد محسن فكري https://t.co/ICU2ScPaix', CAST(0x0000A73700F241AA AS DateTime), CAST(0x0000A6AF01366554 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792801840878514178', N'مباشر من بركان: وقفة الشهيد محسن فكري https://t.co/sxzriANGnU', CAST(0x0000A73700F241A6 AS DateTime), CAST(0x0000A6AF01379154 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792802178213830656', N'مباشرة من شارع محمد الخامس بطنجة في مسيرة الكرامة تنديدا بمقتل الشهيد محسن فكري https://t.co/F0yA2qKlin', CAST(0x0000A73700F241A1 AS DateTime), CAST(0x0000A6AF0137EF14 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792802729462796288', N'مباشر من مراكش: مسيرة شهيد الحكرة محسن فكري https://t.co/tWg8fkLlJJ', CAST(0x0000A73700F2419C AS DateTime), CAST(0x0000A6AF01388898 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792803559066656768', N'فايرفوكس تعلن عن مشروع قد يغير نظرتنا كليا عن تصفح الأنترنت !: مع انشغال المجتمع التقني بأخبار آخر حواسيب شرك... https://t.co/hGH6ifctDy', CAST(0x0000A730000136D4 AS DateTime), CAST(0x0000A6AF013970A0 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792811844146696192', N'من مسيرة "شهيد الحكرة" محسن فكري بالرباط https://t.co/4kqoY6Zez5', CAST(0x0000A73700F24195 AS DateTime), CAST(0x0000A6AF01427C40 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792820892611055616', N'إن مسيرات ووقفات اليوم..هي صرخة "الشعب"، ضد تغول رجال الأمن والادارة الترابية في المغرب..هي صرخة ضد الظلم... https://t.co/ibr7cQzlZo', CAST(0x0000A73700F2418E AS DateTime), CAST(0x0000A6AF014C5BFC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792827920335142914', N'El Mahdi Lyoubi ابداع رائع في مسيرة الرباط', CAST(0x0000A73700F24188 AS DateTime), CAST(0x0000A6AF015406E0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'792828925089091585', N'من مسيرة الرباط ضد الحكرة https://t.co/cVfCm9LK0y', CAST(0x0000A73700F24182 AS DateTime), CAST(0x0000A6AF01552020 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793152269382455296', N'الأن مباشرة : مظاهرة حاشدة بالحسيمة . https://t.co/1y3RR7SDEl', CAST(0x0000A73700F2417C AS DateTime), CAST(0x0000A6B0012A8324 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793167745085038592', N'Amis marocains, comment elle a été votre journée sur internet aujourd''hui ? Normale ?', CAST(0x0000A73700F3F752 AS DateTime), CAST(0x0000A6B0013B675C AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793169019960426496', N'@Nabil79 Ma journée : 
- impossible d''attacher une pièce jointe de quelques ko
- Cloud dissipé
- Anti-virus pas à jour
- Collègues en colère', CAST(0x0000A73700F3F748 AS DateTime), CAST(0x0000A6B0013CCB9C AS DateTime), N'', N'@Nabil79,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793193630878076933', N'Publicité mensongère ! https://t.co/wEbThtrqPr', CAST(0x0000A73700F3F73A AS DateTime), CAST(0x0000A6B00157A82C AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793424629650038784', N'شقيق محسن فكري: نستنكر كل المزايدات الإعلامية والسياسية التي تسببت في إيذائنا وإيذاء الشهيد وانتهاك حرمته بصفة خاصة https://t.co/XknHBEg0xd', CAST(0x0000A73700F24176 AS DateTime), CAST(0x0000A6B100C84204 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793524609580605441', N'صدور العدد العاشر من مجلة المحترف: كما جرت العادة في أول كل شهر أطلقت مدونة المحترف العدد الجديد من مجلتها "م... https://t.co/hMUJL7KomE', CAST(0x0000A73000013686 AS DateTime), CAST(0x0000A6B101356000 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793526472052969476', N'الفتنة تتجسد في تلك البرلمانية التافهة من حزب الاتحاد الدستوري، الذي اسس  في سنوات الجمر والرصاص، لخدمة أجندات... https://t.co/2cwCOP6gUV', CAST(0x0000A73700F24168 AS DateTime), CAST(0x0000A6B101376850 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793729355541196802', N'كيف تقوم بتسريع الأنترنت و تحسينها على جهازك الأندرويد | جرب بنفسك !: مشكلة بطئ الأنترنت على الهواتف الذكية ه... https://t.co/YroFaoBygl', CAST(0x0000A7300001367E AS DateTime), CAST(0x0000A6B200895314 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793739716344414208', N'مايكروسوفت تكشف عن هوية الهاكرز الذين استغلوا ثغرة خطيرة في ويندوز: بعد أن كشفت شركة جوجل أمس الثلاثاء عن ثغر... https://t.co/km8uQjgRD6', CAST(0x0000A73000013676 AS DateTime), CAST(0x0000A6B20094A2C8 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793741615693111296', N'إنستغرام تختبر ميزة جديدة: أعلن تطبيق مشاركة الصور ومقاطع الفيديو القصيرة التابع لموقع التواصل الاجتماعي فيسب... https://t.co/f1NeiCwwhE', CAST(0x0000A73000013662 AS DateTime), CAST(0x0000A6B20096B478 AS DateTime), N'', N'', N'148801404', N'mr_raghib', 64819, 83, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793777388442226688', N'ورفض ابن كيران انتقادات البعض له لعدم تقديمه بشكل شخصي واجب العزاء لأهل القتيل، وقال :"أرسلت ثلاثة وزراء سابقين... https://t.co/44l2rfP2rL', CAST(0x0000A73700F24163 AS DateTime), CAST(0x0000A6B200BDBF64 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'793904679566671872', N'الرميد لـ "لكم": التحقيق في قضية "محسن فكري" ليس بالمسرحية https://t.co/to1czr2fQF', CAST(0x0000A73700F24148 AS DateTime), CAST(0x0000A6B20148ACA0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'794174705754316800', N'فينكم؟ https://t.co/4gnZgqS2gQ', CAST(0x0000A73700F24141 AS DateTime), CAST(0x0000A6B300E3DEC4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'794979722077831168', N'@unemarocaine Parce que c''est pas du mssemen ?', CAST(0x0000A73700F3F730 AS DateTime), CAST(0x0000A6B5013B71E8 AS DateTime), N'', N'@unemarocaine,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795293886302265344', N'بالفيديو: مواطن يتهم "قائد الصهريج" بقلعة السراغنة بتكسير فكه والأمر باعتقاله
https://t.co/hK63adJV0R #maroc #Mohsin_Fikri', CAST(0x0000A73700F2413C AS DateTime), CAST(0x0000A6B60106CFB0 AS DateTime), N'maroc,Mohsin_Fikri,', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795294456509558784', N'بالفيديو..مواطن يتهم "قائد الصهريج" بقلعة السراغنة بتكسير فكه https://t.co/3MdcGQ2Lzs', CAST(0x0000A73700F2412F AS DateTime), CAST(0x0000A6B601076F10 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795303589451272193', N'نقل مباشر. مسيرة الرباط تضامنا مع محسن فكري https://t.co/0XVWwolTIi', CAST(0x0000A73700F24127 AS DateTime), CAST(0x0000A6B601116768 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795307064448925697', N'نقل مباشر. مسيرة الرباط تضامنا مع محسن فكري https://t.co/QNZuo4oesb', CAST(0x0000A73700F2411A AS DateTime), CAST(0x0000A6B6011531B8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795314254618521600', N'من تطوان، وقفة ضد الحكرة .. https://t.co/bFxePvxGVI', CAST(0x0000A73700F24113 AS DateTime), CAST(0x0000A6B6011D0B7C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795314666104832000', N'مباشر من امزورن: وقفة ضد الحكرة https://t.co/Xmz8Tpn7Hi', CAST(0x0000A73700F2410C AS DateTime), CAST(0x0000A6B6011D7E54 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795330853685563392', N'نقل مباشر. مسيرة الرباط تضامنا مع محسن فكري https://t.co/02LWjExYJc', CAST(0x0000A73700F240FF AS DateTime), CAST(0x0000A6B6012F2898 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795385295806038017', N'RT @younesmasskine: قريبا في المغرب: برافو ربحتي الانتخابات، وا خود تذكار عبارة عن صينية فضية وسير في رحلة سياحية الى مولا يعقوب وخلينا نشك…', CAST(0x0000A73700F240F9 AS DateTime), CAST(0x0000A6B6016A9388 AS DateTime), N'', N'@younesmasskine,', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795640392800669700', N'الله يعفو علينا من شي محللين..قالك الكفاءة اهم من الاغلبية العددية!!..وكأن الحكومة الفاشلة لصاحب التحليلات... https://t.co/4kmZ3o0wqQ', CAST(0x0000A73700F240EF AS DateTime), CAST(0x0000A6B700F57AF8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795729710458212352', N'@Fahdos شديييد', CAST(0x0000A73700F3F727 AS DateTime), CAST(0x0000A6B70156F60C AS DateTime), N'', N'@Fahdos,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795730127422455809', N'@Fahdos وفاللخر تتزوج بمول الطوموبيل... 😉', CAST(0x0000A73700F3F721 AS DateTime), CAST(0x0000A6B701576A10 AS DateTime), N'', N'@Fahdos,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795732112422932482', N'@Pssktch عظم الله اجركم و الله يرحمها و يوسع عليها... الله اصبركم أخي 🙁', CAST(0x0000A73700F3F709 AS DateTime), CAST(0x0000A6B701599588 AS DateTime), N'', N'@Pssktch,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'795980259996954625', N':D :D https://t.co/mIIOIbNmCS', CAST(0x0000A73700F240E7 AS DateTime), CAST(0x0000A6B800DCE72C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'796107796433567744', N'@Dhi_salma Aminux sans hésitation 😜', CAST(0x0000A73700F3F6FB AS DateTime), CAST(0x0000A6B801681860 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'796130418638589952', N'يا حنينة يا حنينة يا حنينة                                     أهل الهوى بليل الغزل شهدو لنا... https://t.co/SfB6iMJwXJ', CAST(0x0000A73700F240C5 AS DateTime), CAST(0x0000A6B80180C84C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'796390675239567365', N'فاز ترامب او فازت كلينتون..الموت الموت لأمريكا عدوة الشعوب !', CAST(0x0000A73700F2409D AS DateTime), CAST(0x0000A6B901115124 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'796405227901583360', N'لما بدا يتثنى https://t.co/yQztHlmxo0', CAST(0x0000A73700F2408E AS DateTime), CAST(0x0000A6B90121338C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'796408853206302720', N'1ère visite officielle du Président Donald Trump en France :D https://t.co/Omp9GZFaDH', CAST(0x0000A73700F23F92 AS DateTime), CAST(0x0000A6B90125280C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'796417567959220225', N'اول اصبع للسافل ترامب في انتظار حرق صوره بعد اقرب حرب سيشعل فتيلها https://t.co/qoeKSD7oXt', CAST(0x0000A73700F23F90 AS DateTime), CAST(0x0000A6B9012EAB34 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'796513183636844544', N'@FtayZen عظم الله اجركم اختي 🙁', CAST(0x0000A73700F3F6F5 AS DateTime), CAST(0x0000A6BA000B8470 AS DateTime), N'', N'@FtayZen,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'796729309071282177', N'Ouverture de la conférence sur la propriété industrielle #COP22 https://t.co/EktjsgG9Oz', CAST(0x0000A73500F8F2BE AS DateTime), CAST(0x0000A6BA00F764D0 AS DateTime), N'COP22,', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'797070270200774657', N'في ذكرى إضراب 14 دجنبر.. دعوة لإضراب عام ومسيرة احتجاجا على "التقاعد والتعاقد" https://t.co/N7dsV7OY3S', CAST(0x0000A73700F23F8D AS DateTime), CAST(0x0000A6BB00E001B4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'797085090279002112', N'هادشي لي بقا الميلودي يهضر عليا..صافي ارجوكم اوقفوا الكرة الارضية باغي نهبط😖', CAST(0x0000A73700F23F8B AS DateTime), CAST(0x0000A6BB00F02F1C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'797093548810260481', N'@feryate 😂😂😂😂😂', CAST(0x0000A73700F3F6EE AS DateTime), CAST(0x0000A6BB00F9699C AS DateTime), N'', N'@feryate,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'797127683759079428', N'مباشرة من الناظور: مسيرة احتجاجية تضامنا مع محسن فكري https://t.co/opF61p9AgU', CAST(0x0000A73700F23F89 AS DateTime), CAST(0x0000A6BB011EAB80 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'797128534133088257', N'مباشرة من الحسيمة: مسيرة بالورود والشموع من أجل محسن فكري https://t.co/FMVmtVusy2', CAST(0x0000A73700F23F82 AS DateTime), CAST(0x0000A6BB011F9964 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'797164200413888512', N'Intervention en ouverture de la journée industrie de la #COP22 – les écosystèmes industriels au service d’une crois… https://t.co/AdJCuckti2', CAST(0x0000A73500F8F2B8 AS DateTime), CAST(0x0000A6BB014685D8 AS DateTime), N'COP22,', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'797387550293893120', N'كبر القلب وفتح بوابو..وبطل يسأل عن تفسير https://t.co/K81LEnNXPr', CAST(0x0000A73700F23F80 AS DateTime), CAST(0x0000A6BC00AEC75C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'797862241836138496', N'والصبر يا مبتلي والصبر يا أيوب.. https://t.co/0w1KyIBiql', CAST(0x0000A73700F23F7E AS DateTime), CAST(0x0000A6BD01295850 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'798168573764112386', N'Lancement du EU Energy Day #COP22 –c’est une opportunité pour échanger sur nos expériences et préserver notre aveni… https://t.co/sArayKBmwH', CAST(0x0000A73500F8F2AC AS DateTime), CAST(0x0000A6BE00EC2A34 AS DateTime), N'COP22,', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'798228342621306881', N'Réunion avec Mme Catherine Novelli, sous-secrétaire d’Etat américaine pour la croissance économique, l’énergie et l… https://t.co/gCN7iRbC8i', CAST(0x0000A73500F8F2A8 AS DateTime), CAST(0x0000A6BE012D656C AS DateTime), N'', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'798240278121484288', N'يا قمر انا وياك...
حبّينا قمرنا
وعشنا أنا ويّاك https://t.co/pDNYitCSyY', CAST(0x0000A73700F23F7B AS DateTime), CAST(0x0000A6BE013A6C94 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'798246389063053312', N'لكل من غادرنا للبحث عن القمر..هل انت أحول؟..هاهو القمر ها حداك :p', CAST(0x0000A73700F23F79 AS DateTime), CAST(0x0000A6BE01411800 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'798288129400651776', N'مهما علا شأنك ومهما كان لك من الحظوة والمال..37 هي 37 وميمكنش نسمحو بإهانة ارادة لمغاربة.. هكذا خاطب بنكيران عزيز... https://t.co/zz2NoV5G2P', CAST(0x0000A73700F23F77 AS DateTime), CAST(0x0000A6BE016EA680 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'798579209983709185', N'Signature d''un MOU pour la participation d''étudiants marocains à la compétition américaine Solar Decathlon avec… https://t.co/dIFKBU1Cbo', CAST(0x0000A73500F8F2A0 AS DateTime), CAST(0x0000A6BF0120D374 AS DateTime), N'', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'798913385505099776', N'Rencontre avec M. LI Young, directeur général de l''@UNIDO au sujet des domaines de partenariat industriel #COP22 https://t.co/T1iOOpuwgR', CAST(0x0000A73500F8F297 AS DateTime), CAST(0x0000A6C001020840 AS DateTime), N'COP22,', N'@UNIDO,', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'798929603146448896', N'Rencontre avec une délégation du groupe EDF #COP22 https://t.co/9mDf7Ryxkc', CAST(0x0000A73500F8F292 AS DateTime), CAST(0x0000A6C00113BBE4 AS DateTime), N'COP22,', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799209790899503108', N'في دول كثيرة في العالم..وقعت مشاكل في تشكيل الحكومة من بعد الانتخابات..والصحافيين والمحللين بقاو متبعين المفاوضات... https://t.co/vJSGddTI9t', CAST(0x0000A73700F23F76 AS DateTime), CAST(0x0000A6C100BA057C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799313385133408256', N'Signature d’une déclaration sur les échanges électriques entre le Maroc, l’Allemagne, l’Espagne, la France et le Po… https://t.co/YVCTE1mTeN', CAST(0x0000A73500F8F283 AS DateTime), CAST(0x0000A6C1012B15A0 AS DateTime), N'', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799314599971590144', N'Rencontre avec Mme Ségolène Royal, ministre de l’environnement, de l''énergie et de la mer de la France #COP22 https://t.co/mb78DZ8X6m', CAST(0x0000A73500F8F280 AS DateTime), CAST(0x0000A6C1012C684C AS DateTime), N'COP22,', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799317201253781505', N'Intervention lors du Moroccan Energy Day #COP22 https://t.co/ghQcLBqTOp', CAST(0x0000A73500F8F272 AS DateTime), CAST(0x0000A6C1012F4008 AS DateTime), N'COP22,', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799318177519980544', N'Rencontre avec M. Rainer Baake, Secrétaire d’Etat au ministère fédéral des affaires économiques et de l’énergie d’A… https://t.co/Zi47peULIY', CAST(0x0000A73500F8F26E AS DateTime), CAST(0x0000A6C101304FE8 AS DateTime), N'', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799354759870234624', N'ضحايا انتهاكات الدكتاتورية يتحدثون بتونس https://t.co/CzaQBwawjQ', CAST(0x0000A73700F23F74 AS DateTime), CAST(0x0000A6C101583D00 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799601637736251392', N'وفق أخر تصريح لبنكيران لموقع "كود".. أخنوش أصبح لا يفاوض بإسم "الأحرار"فقط، با يفاوض باسم "الحركة الشعبية"... https://t.co/NPF1sPhXxJ', CAST(0x0000A73700F23F72 AS DateTime), CAST(0x0000A6C200DA2B90 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799637194931585024', N'كن شي واحد من بعض الصحافيين المغاربة ..كن ردد في وجهها الخونة يطلعو برا :D https://t.co/ytekhNDjuQ', CAST(0x0000A73700F23F70 AS DateTime), CAST(0x0000A6C20100FAB8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799745349933993985', N'@malektebayo ماكانتش عندنا فالمقرر 😝', CAST(0x0000A73700F3F6E7 AS DateTime), CAST(0x0000A6C2017704B0 AS DateTime), N'', N'@malektebayo,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799745464052699136', N'@Spikoza @malektebayo ها واحد بحالي 😉', CAST(0x0000A73700F3F6E1 AS DateTime), CAST(0x0000A6C201772454 AS DateTime), N'', N'@Spikoza,@malektebayo,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799745524765249538', N'@Spikoza bac technique ? @malektebayo', CAST(0x0000A73700F3F6D4 AS DateTime), CAST(0x0000A6C2017735E8 AS DateTime), N'', N'@Spikoza,@malektebayo,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'799782528483807232', N'هاد لمفروح كيفكرني فراسي😅 https://t.co/riEPEF3M39', CAST(0x0000A73700F23F6E AS DateTime), CAST(0x0000A6C300141630 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'800067917236867078', N'ندية البرنوصي الفقيهة الدستورية قالت ان الملك يمكن يعين اخنوش لتشكيل الحكومة..وانا تنقول امام هاد التسيب الدستوري... https://t.co/MU5LayEBdi', CAST(0x0000A73700F23F6C AS DateTime), CAST(0x0000A6C3014B8EE8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'800103389027794944', N'باش نتفاهمو ما كين لا رفض حزب الاستقلال ولا ازمة دستورية..كاين مشكل داير على لعاقة وهاد الناس لي كيقولو لمستير... https://t.co/4vFYb3GQF4', CAST(0x0000A73700F23F6A AS DateTime), CAST(0x0000A6C301724574 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'800128734636507136', N'@Spikoza 😂😂 @malektebayo', CAST(0x0000A73700F3F6CD AS DateTime), CAST(0x0000A6C400026D18 AS DateTime), N'', N'@Spikoza,@malektebayo,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'800157993253806080', N'من ليالي مهرجان "موسيقى بدون تأشيرة بالرباط فيزيون عفوية بين بقاس وعلي كيطا واخرون..موسيقى جنوب الصحراء عندما... https://t.co/O0BUuYdd0D', CAST(0x0000A73700F23F69 AS DateTime), CAST(0x0000A6C400225C18 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'800663677418541056', N'الأيقونة في عيدها 81.. ألفُ شُكر وتحية لك على الأمل والحب التي تزرع في قلوب الملايين كل يوم ! https://t.co/hlUkuoV1hb', CAST(0x0000A73700F23F67 AS DateTime), CAST(0x0000A6C500BEC008 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'800669936146231297', N'شي رباعة لفهايمية، كيقولو لك علاش بنكيران لم يمارس صلاحيته؟..وفاش كيمارس صلاحيته علاش يبقى جالس في منزله؟ اشنو... https://t.co/PAPrkUYWJe', CAST(0x0000A73700F23F66 AS DateTime), CAST(0x0000A6C500C595A4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'800685479159074816', N'وتيّهتُمونِـي فِـي بديـع جَمالِـكُـم . . . وَلَم أدر فِي مَجرَ الهَوَى أَينَ مَوضعي 

وأوصَيتُمونِـي لا أبـوح... https://t.co/1oR89QcHcE', CAST(0x0000A73700F23F64 AS DateTime), CAST(0x0000A6C500D68B70 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'800727418705219584', N'ما لاحظته من خلال التعليقات على الفيسبوك..بخصوص اطلاق الشرطة الرصاص على "السراق" وقطاع الطرق..يجعلك تستخلص ان جزء... https://t.co/snBEkylCmQ', CAST(0x0000A73700F23F62 AS DateTime), CAST(0x0000A6C501045230 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'800813478361649152', N'@ToToPoStOoOo وحدة قياس هادي عندكم؟ لين الهيكتومتر و الكيلومتر؟ 😉', CAST(0x0000A73700F3F6C7 AS DateTime), CAST(0x0000A6C501623EB8 AS DateTime), N'', N'@ToToPoStOoOo,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'800839142443782144', N'نجيب بتحبها؟ بتحبها يا نجيب😆 https://t.co/LrZBT7UByL', CAST(0x0000A73700F23F60 AS DateTime), CAST(0x0000A6C5017E416C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'801028101337554945', N'شوفو الناس اش دارت على "جرو" واحنا شي "مكرهي" البشرية..قالك خاص القرطاس والاعدامات بلا محاكمات في شوارع المغرب https://t.co/M3Csytv7FH', CAST(0x0000A73700F23F5E AS DateTime), CAST(0x0000A6C600C0F990 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'801118780701212673', N'خلال إضراب مستخدمي الطرق السيارة في 48 ساعة الماضية، بدون مروءة حضر المئات من المستخدمين لتعويضهم خلال الإضراب،... https://t.co/2lIl93TPcu', CAST(0x0000A73700F23F5C AS DateTime), CAST(0x0000A6C60123F180 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'801134687125118976', N'@ToToPoStOoOo بين*', CAST(0x0000A73700F3F6B9 AS DateTime), CAST(0x0000A6C601354D40 AS DateTime), N'', N'@ToToPoStOoOo,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'801146780175908864', N'روعة روعة روعة :) https://t.co/kXrDbLehVO', CAST(0x0000A73700F23F5A AS DateTime), CAST(0x0000A6C601427FC4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'801514833309007873', N'Inauguration de la 5ème édition des Automotive Meetings Tangier-Med de l’AMICA – une vitrine de la dynamique des éc… https://t.co/QArK2le4oe', CAST(0x0000A73500F8F26B AS DateTime), CAST(0x0000A6C70148AEF8 AS DateTime), N'', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'801884963075424256', N'الغريب ان اغلب الغيورين على المدرسة العمومية في الفيسبوك يدرسون ابنائهم في المدارس الخاصة...داكشي ديال علال... https://t.co/Q2Ct8nRiIF', CAST(0x0000A73700F23F51 AS DateTime), CAST(0x0000A6C801512240 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'802193337168097281', N':D  تستحق المشاهدة ..ويا لمعفر غير بشوية :D https://t.co/0MuejvlSJz', CAST(0x0000A73700F23F4F AS DateTime), CAST(0x0000A6C901162ED8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'802511071420497921', N'رحل فديل https://t.co/Ng7d6amW0p', CAST(0x0000A73700F23F4D AS DateTime), CAST(0x0000A6CA00E57310 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'802983704029171714', N'بغل كبير وعنصري حقير، اسمه فرونسوا فيون.. قادم لحكم فرنسا..ايام سوداء تنتظر المهاجرين من اصول عربية ومسلمة وافريقية!!!..', CAST(0x0000A73700F23F4B AS DateTime), CAST(0x0000A6CB015DC4A0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803155947120107520', N'@Sli3fana_ تلاقيتيه؟ سعداتك انا كنتلاقاه ديما فين ساكن مكيجيش يقول ليا السلام... والمعفر تعفر بشوية ههههه @chehbi', CAST(0x0000A73700F307CD AS DateTime), CAST(0x0000A6CC008E3ED8 AS DateTime), N'', N'@Sli3fana_,@chehbi,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803156203089969152', N'RT @JamalEddine11: الصالير في المغرب

 داير فحال Les Règles 

كي جي مرة فالشهر ...⏳
 
و كيبقا خمسة ايام 😂', CAST(0x0000A73700F307C9 AS DateTime), CAST(0x0000A6CC008E8654 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803157069998211072', N'@issambenj Rang Rover, stp.', CAST(0x0000A73700F307C2 AS DateTime), CAST(0x0000A6CC008F78E8 AS DateTime), N'', N'@issambenj,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803157670274338817', N'@ToToPoStOoOo kan khassek dir lih tag hahahaha 😂😂😂😂', CAST(0x0000A73700F307BE AS DateTime), CAST(0x0000A6CC0090207C AS DateTime), N'', N'@ToToPoStOoOo,', N'43256664', N'AnouarNACH', 5448, 1022, N'Sidi Belyout', N'a548d855eb55e9dd', NULL, N'in')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803158268638068736', N'@Spikoza مسخوط ههههه كلمات زسنة :D @AlWaziir', CAST(0x0000A73700F307B8 AS DateTime), CAST(0x0000A6CC0090C6E4 AS DateTime), N'', N'@Spikoza,@AlWaziir,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803158664009945088', N'@cesef I saw it, just hahahahaha :D', CAST(0x0000A73700F3079D AS DateTime), CAST(0x0000A6CC00913638 AS DateTime), N'', N'@cesef,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'tl')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803158790891831296', N'@cesef It''s rated RED color on IMDB''s app.', CAST(0x0000A73700F30767 AS DateTime), CAST(0x0000A6CC00915960 AS DateTime), N'', N'@cesef,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803158951634337792', N'@Spikoza صباح النور و أسبوع موفق صديقي :)', CAST(0x0000A73700F3075E AS DateTime), CAST(0x0000A6CC009185E8 AS DateTime), N'', N'@Spikoza,', N'43256664', N'AnouarNACH', 5448, 1022, N'Sidi Belyout', N'a548d855eb55e9dd', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803161036580855808', N'7 Ways to Make a Conversation With Anyone | Malavika Varadan | TEDxBITSPilaniDubai https://t.co/EKZGhhGXo1', CAST(0x0000A73700F30758 AS DateTime), CAST(0x0000A6CC0093CC54 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803182774970556416', N'@Sli3fana_ @chehbi هو لي معفر ماشي نتي هههه', CAST(0x0000A73700F3074A AS DateTime), CAST(0x0000A6CC00AB8628 AS DateTime), N'', N'@Sli3fana_,@chehbi,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803225989719486464', N'الحمد لله، استطعت ان اخرج للعلن بعض من أنصار العنصري "فيون" بالمغرب، حتى قبل أن يصبح هذا المتخلف رئيسا... https://t.co/mvR9L8uys7', CAST(0x0000A73700F23F4A AS DateTime), CAST(0x0000A6CC00DAAFFC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803235149508907008', N'Mohamed Lachabi : Sid El Juge &amp; Bayda Mon Amour - محمد العشابي : البيضة مونامور: https://t.co/B9dRQY77O1 via', CAST(0x0000A73700F30743 AS DateTime), CAST(0x0000A6CC00E4AF5C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803320214511296512', N'@K7al_L3afta 😂😂😂😂😂😂😂 https://t.co/pcZuPqBnib', CAST(0x0000A73700F3073D AS DateTime), CAST(0x0000A6CC01418628 AS DateTime), N'', N'@K7al_L3afta,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803348786550632449', N'لا تقيّموا الناس بما يرتدون من ملابس ... بل بما يملكون من علمٍ وثقافة!
#على_سبيل_العلم
#ها_العار', CAST(0x0000A73700F30737 AS DateTime), CAST(0x0000A6CC0160B4F8 AS DateTime), N'على_سبيل_العلم,ها_العار,', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803355400548548608', N'NEW - جديد
30 min ago
@K7al_L3afta @yahiakarim @bouziane_a 

https://t.co/MGrbi3dQWN', CAST(0x0000A73700F30728 AS DateTime), CAST(0x0000A6CC0167ED04 AS DateTime), N'', N'@K7al_L3afta,@yahiakarim,@bouziane_a,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803585122062790657', N'مليار و400 مليون سنتيم لإصلاح وتشييد 120 مرحاضا بالبرلمان المغربي...

صباح المراحيض البرلمانية المتطورة:
أعتقد أن... https://t.co/MahB6ABZDZ', CAST(0x0000A73700F3071B AS DateTime), CAST(0x0000A6CD00D7229C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803589386948448256', N'ضايعين من تسجيل ديال 1977 https://t.co/S3myRSUVeg', CAST(0x0000A73700F23F3F AS DateTime), CAST(0x0000A6CD00DBCA68 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803717500160479232', N'الحكومة عندها مشكل و أزمة فالتعليم العمومي و باغيا تردو بالفلوس... و معندهاش مشكل تصايب طواليطات ديال البرلمان ب... https://t.co/INp2yulRNS', CAST(0x0000A73700F30708 AS DateTime), CAST(0x0000A6CD01679D54 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'803938416572375040', N'صراحة لأنني لا اومن بالصدفة في السياسة. اشك في مصداقية الحملة ضد المؤسسات المنتخبة بالمغرب. خاصة ان هناك مغالطات... https://t.co/0VbGFEIYsG', CAST(0x0000A73700F23F3A AS DateTime), CAST(0x0000A6CE00CD35FC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804006988317392896', N'وزارة الخارجية تضم ثلاث وزراء..وهؤلاء الثلاث يحتقرون المغاربة بخصوص تطورات قضيتهم الأولى..أصدروا بلاغا بليدا..لا... https://t.co/9FfSfrL3dV', CAST(0x0000A73700F23F38 AS DateTime), CAST(0x0000A6CE01180CF8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804116383294521344', N'حمام الدار https://t.co/NHDYbIA0bh', CAST(0x0000A73700F23F36 AS DateTime), CAST(0x0000A6CF0003EFD0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804124487742582784', N'·Canta Palestina https://t.co/X0k0SA8ZR9', CAST(0x0000A73700F23F35 AS DateTime), CAST(0x0000A6CF000CC7E0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'es')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804402454045618176', N'RT @___Fatale: Faites partager s''il vous plait. https://t.co/mUq7BAcy1H', CAST(0x0000A73700F30701 AS DateTime), CAST(0x0000A6CF013C2660 AS DateTime), N'', N'@___Fatale,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804402627282878465', N'RT @Oum_Kulthum: لبس الشتا السنة دي مش لينا ده لولاد تُجار السلاح والمُخدرات ولأن الحلال أجمل سننتظر الـ Sale 😂.', CAST(0x0000A73700F306FA AS DateTime), CAST(0x0000A6CF013C5798 AS DateTime), N'', N'@Oum_Kulthum,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804403287768309760', N'Je savais pas qu''elle y a des filles qui parlent beaucoup comme dans la vie réelle. Elle sont ثرثارات. Mille tweets pour dire 1 banalité.', CAST(0x0000A73700F306EC AS DateTime), CAST(0x0000A6CF013D0F94 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804416525608292352', N'@afpfr', CAST(0x0000A73700F23F33 AS DateTime), CAST(0x0000A6CF014B8204 AS DateTime), N'', N'@afpfr,', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804430553906876416', N'مهدي علوي - مزال مزال &amp; البيضة مونامور (2017): https://t.co/fqv7AWNRRp via @YouTube', CAST(0x0000A73700F306E6 AS DateTime), CAST(0x0000A6CF015AD1F0 AS DateTime), N'', N'@YouTube,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804596321202110464', N'RT @bouziane_a: La transformation digital ! @yahiakarim @Anas_BOUGATAYA  @Anas_Khoumane  @yassinebnihla @Y4583L https://t.co/GHpm7RuChQ', CAST(0x0000A73700F306D1 AS DateTime), CAST(0x0000A6D000843AC8 AS DateTime), N'', N'@bouziane_a,@yahiakarim,@Anas_BOUGATAYA,@Anas_Khoumane,@yassinebnihla,@Y4583L,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804600721240944641', N'RT @wald_Nas_wlah: ﻓﺼﻞ ﺍﻟﺸﺘﺎﺀ ﻓﺼﻞ ﺍﻟﺤﻨﻴﻦ .. ﻓﺼﻞ ﺍﻟﻌﺪﺱ ﻭﺍﻟﺒﻴﺼﺎﺭﺓ ﻭﺍﻟﺤﻤّﺺ ﺑﺎﻟﻜﺮﻋﻴﻦ .
 ﻧﺰﺍﺭ ﺟﻮﻋﺎﻧﻲ...', CAST(0x0000A73700F306CB AS DateTime), CAST(0x0000A6D000890814 AS DateTime), N'', N'@wald_Nas_wlah,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804601658995044352', N'@a7dadi @angry_twitto وانعس تانتا لاش فايق بكري', CAST(0x0000A73700F306BD AS DateTime), CAST(0x0000A6D0008A0D68 AS DateTime), N'', N'@a7dadi,@angry_twitto,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804607628370448384', N'@elkrari mais c''est trop, elles tweetent leur vie quotidienne action par action :(', CAST(0x0000A73700F3068E AS DateTime), CAST(0x0000A6D000909228 AS DateTime), N'', N'@elkrari,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804644067674095617', N'وصل اليوم صاحبُ السُّمو الشَّيخ "راتب بن أجرة آل فُلوسْ" حفِظهُ الله و رعاه إلى مطار مِحْفظتي العزيزة .. وكان في... https://t.co/c7N7JPCCv9', CAST(0x0000A73700F3067D AS DateTime), CAST(0x0000A6D000B8563C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804783179051704320', N'@Zay_neub kaydiroha quelques sociétés, akhir société khdemt 3ndha kanakhdo nhar d l''anniversaire off 😂😂😂', CAST(0x0000A73700F30673 AS DateTime), CAST(0x0000A6D0015029D0 AS DateTime), N'', N'@Zay_neub,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'804792203688165377', N'🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫⤵⤵⤵⤵⤵
الإخوان سلام الله عليكم 
هاد الشخص في أمس الحاجة للمساعدة رجله في تآكل يوم بعد يوم ليس له من... https://t.co/plAkMI6ZMA', CAST(0x0000A73700F3066F AS DateTime), CAST(0x0000A6D0015A03B0 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805075068153950208', N'Hala madrid', CAST(0x0000A73700F23F2F AS DateTime), CAST(0x0000A6D1010338F0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'tl')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805148928765206528', N'انا گاع ما بقيت نبغي نخرَّج معايا الفلوس حيت هوما ديما كايخليوني نرجع لدار غي بوحديتي...', CAST(0x0000A73700F3066C AS DateTime), CAST(0x0000A6D10153D5A8 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805175389760983040', N'IDÉE REÇUE #17 : Écorcher un grain de beauté  https://t.co/z1VI74fFgl', CAST(0x0000A73700F3F6B2 AS DateTime), CAST(0x0000A6D10170B704 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805428245361553408', N'https://t.co/6RnheFAlUd', CAST(0x0000A73700F30669 AS DateTime), CAST(0x0000A6D200F92B80 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Hay-Hassani', N'b58a1611c14353a6', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805430652996878336', N'طلعات للطوبيس هي و ولدها صغير...الشيفور شاف فولدها و هو يگول "يخخخخ...هذا أقبح ولد شفتو فحياتي"...طلع ليها الدم... https://t.co/NNC9H99ZFz', CAST(0x0000A73700F30665 AS DateTime), CAST(0x0000A6D200FBCC28 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805452704374001664', N'الحُب هو فقط جوج ديال الناس معندهوم مايدار فاهمين بعضياتهم غلط فالأول...نهار كيفهمو بعضياتهم مزيان كيتفارقو.', CAST(0x0000A73700F30662 AS DateTime), CAST(0x0000A6D20113DCB4 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805515939647279104', N'@Tousssaaa w ach fiha :P', CAST(0x0000A73700F3065F AS DateTime), CAST(0x0000A6D20158E110 AS DateTime), N'', N'@Tousssaaa,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'pl')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805516969776676864', N'@Leila_Ghandi dans 30min sur 2M :)
#LeilaGhandi #DesHistoiresEtDesHommes #H&amp;H #HH', CAST(0x0000A73700F3065C AS DateTime), CAST(0x0000A6D2015A0158 AS DateTime), N'LeilaGhandi,DesHistoiresEtDesHommes,H,HH,', N'@Leila_Ghandi,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805517616701968384', N'@K7al_L3afta العتاد و السلاح و الماكلة من الفوق', CAST(0x0000A73700F30659 AS DateTime), CAST(0x0000A6D2015AB5D0 AS DateTime), N'', N'@K7al_L3afta,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805543790362656768', N'Wow! Just amazing le discours de Tata Milouda :)
#LeilaGhandi @Leila_Ghandi 
#TataMilouda https://t.co/1E0zGZvZ7b', CAST(0x0000A73700F30656 AS DateTime), CAST(0x0000A6D201774650 AS DateTime), N'LeilaGhandi,TataMilouda,', N'@Leila_Ghandi,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805544134312415237', N'@K7al_L3afta ايوا رد بالك ههههه خاص غير السلاح هههه راك فاهم', CAST(0x0000A73700F30653 AS DateTime), CAST(0x0000A6D20177A668 AS DateTime), N'', N'@K7al_L3afta,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805544736094355456', N'L''émission est terminée 😕😕
#LeilaGhandi', CAST(0x0000A73700F30651 AS DateTime), CAST(0x0000A6D201784F28 AS DateTime), N'LeilaGhandi,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805545002508099584', N'@Leila_Ghandi c''est la phrase que j''ai adoré. Merci...', CAST(0x0000A73700F3064E AS DateTime), CAST(0x0000A6D2017898FC AS DateTime), N'', N'@Leila_Ghandi,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805545074268499968', N'RT @Leila_Ghandi: Le paradis c''est ta femme et tes enfants #LeilaGhandi à Paris', CAST(0x0000A73700F3064A AS DateTime), CAST(0x0000A6D20178ACE8 AS DateTime), N'LeilaGhandi,', N'@Leila_Ghandi,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805545093155483649', N'RT @Leila_Ghandi: Comment peux-tu frapper ta femme puis te laver les mains et aller à la mosquée?? #LeilaGhandi à Paris', CAST(0x0000A73700F30647 AS DateTime), CAST(0x0000A6D20178B2C4 AS DateTime), N'LeilaGhandi,', N'@Leila_Ghandi,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805545643628527616', N'"الجنة..هي مراتك و هي ولادك" - طاطا ميلودة
 #LeilaGhandi', CAST(0x0000A73700F30644 AS DateTime), CAST(0x0000A6D201794C48 AS DateTime), N'LeilaGhandi,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805545913582227456', N'"كيفاش تقدر تضرب مراتك...و من بعد تنوض تتوضى و تمشي للجامع؟" -طاطا ميلودة
 #LeilaGhandi', CAST(0x0000A73700F30641 AS DateTime), CAST(0x0000A6D201799748 AS DateTime), N'LeilaGhandi,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805557890123763712', N'RT @_Fatita: 😂😂😂😂😂😂😂😂😂😂😂😂😂😂 https://t.co/wxzOpcCKP5', CAST(0x0000A73700F3063E AS DateTime), CAST(0x0000A6D20186AA28 AS DateTime), N'', N'@_Fatita,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805558466697949184', N'@Spikoza ذقتو مرة وحدة فحياتي العام لي فات...مازوينش 😭😭
😭😂😂😂', CAST(0x0000A73700F3063A AS DateTime), CAST(0x0000A6D201874AB4 AS DateTime), N'', N'@Spikoza,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805558809041272832', N'RT @RTarabic: من هي أبرز شخصية عربية وعالمية وماهو الحدث الأهم في العام المنصرم ؟!
ندعوكم للتصويت معنا..
https://t.co/351SZhTTGP https://t.…', CAST(0x0000A73700F30637 AS DateTime), CAST(0x0000A6D20187AACC AS DateTime), N'', N'@RTarabic,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805569106661543936', N'واش أنا الوحيد لي معجبوش Suicide Squad ?? 😭😭😭
#SuicideSquad', CAST(0x0000A73700F30635 AS DateTime), CAST(0x0000A6D3000765C0 AS DateTime), N'SuicideSquad,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805704833487478784', N'@yahiakarim واييه عادي جدا و كانوا دايرين بيه الحالة', CAST(0x0000A73700F30632 AS DateTime), CAST(0x0000A6D3009B87A0 AS DateTime), N'', N'@yahiakarim,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805704997619044352', N'@LadyHanou من اللاخر هههههه', CAST(0x0000A73700F3062F AS DateTime), CAST(0x0000A6D3009BB554 AS DateTime), N'', N'@LadyHanou,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805705288443633664', N'هاهاهاهاهاهاهاهاها 😂😂😂😂😂😂 https://t.co/E2V4wuzbjK', CAST(0x0000A73700F3062C AS DateTime), CAST(0x0000A6D3009C0630 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805707334303567872', N'واحد المثل يقول
المذبوحة كاضحك على المسلوخة..والمقطعة فالسطل كاتقولهوم هزوني نطل.. 😀', CAST(0x0000A73700F30629 AS DateTime), CAST(0x0000A6D3009E4210 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805707607457624068', N'@ToToPoStOoOo جري عليه معندك مادير بالخونة', CAST(0x0000A73700F30624 AS DateTime), CAST(0x0000A6D3009E8E3C AS DateTime), N'', N'@ToToPoStOoOo,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805707761510191104', N'التبرتيش. https://t.co/lfxszScCCo', CAST(0x0000A73700F30621 AS DateTime), CAST(0x0000A6D3009EB998 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805707870587260928', N'RT @BoHerr: دعاء السفر "يا ربي نركب فالطاكسيات الجداد" 🙏', CAST(0x0000A73700F3061D AS DateTime), CAST(0x0000A6D3009ED810 AS DateTime), N'', N'@BoHerr,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'805867560227012609', N'روسيا وتركيا وأمريكا وقطر والسعودية والإمارات وداعش وبشار الأسد وحزب الله وإيران المعارضة السورية والاتحاد... https://t.co/jQmKZgwRAx', CAST(0x0000A73700F23F23 AS DateTime), CAST(0x0000A6D3014D20DC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'806093580578279424', N'Pourquoi π est-il si fou ? https://t.co/d1vwD6oD02', CAST(0x0000A73700F3F6AB AS DateTime), CAST(0x0000A6D400B84BB0 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'806106410056646656', N'خالص العزاء للأستاذ عبد الإله بنكيران في وفاة والدته. إنا لله وإنا إليه راجعون.', CAST(0x0000A73700F23F16 AS DateTime), CAST(0x0000A6D400C64C74 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'806565520208252928', N'فريد الأطرش - اشتقتلك https://t.co/vG8xXY0Hsq', CAST(0x0000A73700F23F0E AS DateTime), CAST(0x0000A6D5012FDBE4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'806593692073136128', N'البيتزا  لي كاتصوبوا فالمغرب... ف ايطاليا كيقولوا ليها الحرشة.', CAST(0x0000A73700F30619 AS DateTime), CAST(0x0000A6D5014E9B60 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'806774667599958016', N'Okay 😂😂
#OrangeMaroc #Meditel #Méditel https://t.co/Om7bcYbdeo', CAST(0x0000A73700F30615 AS DateTime), CAST(0x0000A6D600889D70 AS DateTime), N'OrangeMaroc,Meditel,Méditel,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'806800752446312449', N'Suis-je le seul qui n''a pas aimé les couleurs et les fonts du site d #OrangeMaroc? :/
#méditel #Meditel @OrangeMaroc', CAST(0x0000A73700F30610 AS DateTime), CAST(0x0000A6D600A51554 AS DateTime), N'OrangeMaroc,méditel,Meditel,', N'@OrangeMaroc,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'806900585165451264', N'وفاة عميد أغنية المالوف في الجزائر محمد الطاهر الفرقاني https://t.co/IskPsKlRpV', CAST(0x0000A73700F23F06 AS DateTime), CAST(0x0000A6D601120A4C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'806945672406700033', N'@AKeldani magnifique, je la pique hahaha :D', CAST(0x0000A73700F3060C AS DateTime), CAST(0x0000A6D601433FF4 AS DateTime), N'', N'@AKeldani,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'806965202247884801', N'ممثلة تبيع السجائر بالتقسيط تبكي.. مغاربة حكروني بسبب "كولون" على البساط الأحمر https://t.co/llE7UdUt6G', CAST(0x0000A73700F30608 AS DateTime), CAST(0x0000A6D601589034 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'807195427070246912', N'@SaadNBB 20 dh pour supprimer l''annonce.. 😉', CAST(0x0000A73700F3F69E AS DateTime), CAST(0x0000A6D700C8526C AS DateTime), N'', N'@SaadNBB,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'807242147703517185', N'Windows 7 : Solution du problème de Windows Update | Passion Technologeek https://t.co/QJ6K5GK4UT', CAST(0x0000A73700F3F697 AS DateTime), CAST(0x0000A6D700FB4FF0 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'807302744444899328', N'@a7dadi nari icône dyal Windows Média Player ch7al kan ty3jbniiiiiiii hahahaha trop foooooort 😂😂😂😂', CAST(0x0000A73700F30605 AS DateTime), CAST(0x0000A6D7013D7204 AS DateTime), N'', N'@a7dadi,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'807309191987793920', N'شكون داير الرباط --مراكش، السبت مساء او الأحد..نقرقبو ناب ونتعاونو على الطريق..وشكرا', CAST(0x0000A73700F23F04 AS DateTime), CAST(0x0000A6D701447C5C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'807336170812297221', N'La nouvelle chanson de Issam Kamal au #JT de 2M :)

Magnifique ce mec !

@IssamChannel', CAST(0x0000A73700F30600 AS DateTime), CAST(0x0000A6D70161EDDC AS DateTime), N'JT,', N'@IssamChannel,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'807574903255875584', N'-قالت ليه مراتو : خايفة تتزوج عليا...
و هو بما أنه مكيبغيش مراتو تخاف...مشا تزوج عليها باش يحيد ليها الخوف...جزاه الله خيرا...ولد الناس.', CAST(0x0000A73700F305FC AS DateTime), CAST(0x0000A6D800DAF8A4 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'807727439837335552', N'حسين الجسمي : أتمنى لحبيبي و صديقي المغربي الانتصار بدقة قاضية في مدة قياسية 💟💟💟', CAST(0x0000A73700F305F8 AS DateTime), CAST(0x0000A6D801817364 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808005341191540736', N'@yahiakarim وا تاهاداك بنادم يدويو عليه؟', CAST(0x0000A73700F305F4 AS DateTime), CAST(0x0000A6D901253E50 AS DateTime), N'', N'@yahiakarim,', N'43256664', N'AnouarNACH', 5448, 1022, N'Jorf El Melha', N'bf4a297278329d0a', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808006035080413184', N'@yahiakarim مزيان هههههه يسحابلي تانتا من المعجبين و المؤيدين ههههه', CAST(0x0000A73700F305F0 AS DateTime), CAST(0x0000A6D90125FFAC AS DateTime), N'', N'@yahiakarim,', N'43256664', N'AnouarNACH', 5448, 1022, N'Jorf El Melha', N'bf4a297278329d0a', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808040899716456449', N'عواشر مباركة وكل عام وأنتم بخير', CAST(0x0000A73700F23EFC AS DateTime), CAST(0x0000A6D9014C0C4C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808371025008328705', N'ياسين رحو &amp; عبدو سليم - غدار أناني (Official Music Vidéo): https://t.co/AfFN6eoIhh via @YouTube', CAST(0x0000A73700F305EC AS DateTime), CAST(0x0000A6DA0128D63C AS DateTime), N'', N'@YouTube,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808622486665490432', N'بمناسبة ذكرى المولد النبوي، يسعدني أن أتقدم إليكم باحر التهاني وأغلى الأماني راجين من العلي القدير أن يعيد عليكم هذه الذكرى بالصحة والسعادة', CAST(0x0000A73500F8F25C AS DateTime), CAST(0x0000A6DB00AFC5A8 AS DateTime), N'', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808622568655749120', N'@MyHafidElalamy Je vous souhaite un très bon Aid Al Mawlid en compagnie de vos proches', CAST(0x0000A73500F8F257 AS DateTime), CAST(0x0000A6DB00AFDD18 AS DateTime), N'', N'@MyHafidElalamy,', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808652772153368576', N'سيلفي حامض😈', CAST(0x0000A73700F23EFA AS DateTime), CAST(0x0000A6DB00D0D3C4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808709668960960512', N'@Sli3fana_ La rive? 😂😂😂@QachachAzharRim', CAST(0x0000A73700F305E8 AS DateTime), CAST(0x0000A6DB010EEC40 AS DateTime), N'', N'@Sli3fana_,@QachachAzharRim,', N'43256664', N'AnouarNACH', 5448, 1022, N'Agdal Riyad', N'b5ba21c5db1c99e9', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808709744013807616', N'@Sli3fana_ شديد راجووووول هههه @EtotheRaf', CAST(0x0000A73700F305E4 AS DateTime), CAST(0x0000A6DB010F0158 AS DateTime), N'', N'@Sli3fana_,@EtotheRaf,', N'43256664', N'AnouarNACH', 5448, 1022, N'Agdal Riyad', N'b5ba21c5db1c99e9', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808710336371101696', N'RT @HarraqiH: Je sollicite la twittoma ( si elle existe toujours) , j''ai besoin de quelqu''un en RH pour un projet. Les #RT sont énormément…', CAST(0x0000A73700F305E0 AS DateTime), CAST(0x0000A6DB010FA694 AS DateTime), N'RT,', N'@HarraqiH,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808710399218556929', N'@LadyHanou واناري الحداگة ديال الشينوا هادي هههههه', CAST(0x0000A73700F305DB AS DateTime), CAST(0x0000A6DB010FB828 AS DateTime), N'', N'@LadyHanou,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808710778924781568', N'RT @Leila_Ghandi: Engagez-vous, exposez-vous, prenez des risques, ne craignez pas la critique, mettez vos projets en marche, contribuez au…', CAST(0x0000A73700F305D1 AS DateTime), CAST(0x0000A6DB011022CC AS DateTime), N'', N'@Leila_Ghandi,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808710905802395648', N'RT @o_exacoustos: Qui a déclenché la guerre en Syrie ? Qui a armé Daesh ? Qui a acheté son pétrole ? Vous arrive-t-il parfois de douter de…', CAST(0x0000A73700F305CD AS DateTime), CAST(0x0000A6DB011045F4 AS DateTime), N'', N'@o_exacoustos,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'808719128295047169', N'😂😂😂😂 ﻭﺍﺣﺪ ﻣﺸﻰ ﻳﺨﻄﺐ .. ﺩﺧﻞ ﻟﺼﺎﻟﻮﻥ ﻭ ﺳﺘﻘﺒﻠﻮ ﺧﻮ ﺍﻟﺒﻨﺖ .. ﺷﻮﻳﺔ ﺩﺧﻼﺕ ﺍﻟﺒﻨﺖ ﻫﺎﺯﺓ ﺻﻴﻨﻴﺔ ﻓﻴﻬﺎ ﻛﻴﻜﺔ ﻭﻋﺼﻴﺮ ﻭ ﺣﻄﺎﺗﻬﻢ ﻓﻮﻕ... https://t.co/4D09Q4Fvw5', CAST(0x0000A73700F305CA AS DateTime), CAST(0x0000A6DB01194000 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809032862112550913', N'@Sli3fana_ كازا...لي مشا ماجا @EtotheRaf', CAST(0x0000A73700F305C7 AS DateTime), CAST(0x0000A6DC00E42640 AS DateTime), N'', N'@Sli3fana_,@EtotheRaf,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809137228983205888', N'فاتي فلوغ ملي تاتدعي على صاحبها : "يارب ان لم اتزوجه فامنحه زوجة تتبول في السرير😈😈😈🙊🙊🏃🏃🏃"', CAST(0x0000A73700F305C2 AS DateTime), CAST(0x0000A6DC01560E04 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809137421497597952', N'@amlascooop هههههههه 😂😂😂😂😂😂', CAST(0x0000A73700F305BE AS DateTime), CAST(0x0000A6DC015642C0 AS DateTime), N'', N'@amlascooop,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809139278693404672', N'@MahmoudAbuHasan مغربي...صح؟', CAST(0x0000A73700F305BB AS DateTime), CAST(0x0000A6DC015849E4 AS DateTime), N'', N'@MahmoudAbuHasan,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809147105902268418', N'هادي عشر سنين و هو كيقولها غادي نتزوج بيك حيت كنموت عليك...و مازال ماماتش.', CAST(0x0000A73700F305B7 AS DateTime), CAST(0x0000A6DC0160D49C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809148193170669569', N'هل تعلم أن عند Économiste الفرحة ديال équilibre فل bilan أكثر من فرحته يوم زفافه. 😅', CAST(0x0000A73700F305B3 AS DateTime), CAST(0x0000A6DC0162054C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809149404024373249', N'مسلسل #حياتي الآن على قناة الأولى..
مسلسل مابيهش.
#AlAoula', CAST(0x0000A73700F305A8 AS DateTime), CAST(0x0000A6DC016356CC AS DateTime), N'حياتي,AlAoula,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809188778766172160', N'علموا أولادكم...
أن الأنثى "وطن" و أن الوطن لا يُخان.', CAST(0x0000A73700F305A1 AS DateTime), CAST(0x0000A6DD0002CE5C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809496742672601090', N'الا لقيتيها فالواقع كتشبه لتصاورها لي كينين فالفايسبوك ،نوض صلي جوج ركعات و قول حمدتك يا ربي و شكرتك و قل اعوذ برب الفلق.', CAST(0x0000A73700F3059D AS DateTime), CAST(0x0000A6DD0152EA1C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809499953957629954', N'https://t.co/dITc7IynG8', CAST(0x0000A73700F30599 AS DateTime), CAST(0x0000A6DD01566BC4 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809534566788726784', N'@mdrissi Ils encouragent le piratage des chaînes cryptées officiellement 😉 @OrangeMaroc @Tic_Maroc', CAST(0x0000A73700F3F691 AS DateTime), CAST(0x0000A6DD017C3214 AS DateTime), N'', N'@mdrissi,@OrangeMaroc,@Tic_Maroc,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809798696913272832', N'هاد الجيل حق الرب مابقا كايحشم, عندها 11 سنة و كتقيل بأنسطاغرام بالبوزات و التصاحيب و ماكينا غير حبيبي و توحشتك... https://t.co/kWf9MkJEVh', CAST(0x0000A73700F30595 AS DateTime), CAST(0x0000A6DE0110F5BC AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809869461767487491', N'ف قفص الإتهام أمينوكس قال :
"أنا ولد الشعب...ركبت فالطوبيس 5سنين".

أنا: هاهاهاهاهاهاهاها
مول قفص الاتهام:... https://t.co/80gfpZyZUa', CAST(0x0000A73700F30590 AS DateTime), CAST(0x0000A6DE015E3070 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'809874008577605633', N'شكون يفهمني هههههه اش هادشي؟

https://t.co/y7eArYCyiH
#MBK #MehdiBenkirane', CAST(0x0000A73700F3058C AS DateTime), CAST(0x0000A6DE016327EC AS DateTime), N'MBK,MehdiBenkirane,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810071410945171456', N'الاخوان. فاش كيكون عندنا 
abonnement
ديال التيليفون و نبغيو نحيدوه، واش كنديرو دوموند
Résiliation
او اشنو؟ #RT please', CAST(0x0000A73700F30587 AS DateTime), CAST(0x0000A6DF00AF170C AS DateTime), N'RT,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810110766326181888', N'اي تعامل زوين كيديرو شي راجل الناس كيسميوه الرجال  عنيبة...على هاد القبل نزار قباني كان أكبر عنقود ديال العنب.', CAST(0x0000A73700F30583 AS DateTime), CAST(0x0000A6DF00DA0AC0 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810177819804397568', N'شكون داير غدا الأحد مراكش الرباط؟ ..نقسمو الطريق ونفرقو اللغا ..وشكرا', CAST(0x0000A73700F23EF7 AS DateTime), CAST(0x0000A6DF01233984 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810263306363670528', N'@mdrissi il était les premiers à mettre en avant le téléchargement des films dans les pubs alors qu''aucune offre légale n''a été disponible.', CAST(0x0000A73700F3F683 AS DateTime), CAST(0x0000A6DF01808580 AS DateTime), N'', N'@mdrissi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810264402628853761', N'@mdrissi Ils étaient*', CAST(0x0000A73700F3F67E AS DateTime), CAST(0x0000A6DF0181B888 AS DateTime), N'', N'@mdrissi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810494232486182912', N'في المغرب...
تمشي للمقاطعة فالصباح بكري تلقاهم مازال مافتحوا.
تمشي فالعشيا متأخر تلقاهم سدو.
تمشي فوسط النهار... https://t.co/LjPsaZ2Zw7', CAST(0x0000A73700F30580 AS DateTime), CAST(0x0000A6E000F10B6C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810572416690884608', N'طابت ليلتكم .. تاكلوها هنا ولا تديوها معاكم ؟', CAST(0x0000A73700F3057D AS DateTime), CAST(0x0000A6E001466058 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810572487239024640', N'قالت ليه: الا تفارقتي معايا غندير شي فضيحة فراسي :O
تفارقو... ودارت Les Meches جاوها واعرين العفيريتا...', CAST(0x0000A73700F3057A AS DateTime), CAST(0x0000A6E001467444 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810572570378534912', N'اندير لك أتاي الحاج ؟
والله مكرهت الحاجة
نوضي ابنتي ديري اتاي لباك 
اين هو المنطق', CAST(0x0000A73700F30576 AS DateTime), CAST(0x0000A6E001468BB4 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810572645997625344', N'كاين شي ناس 

ملي كتقول ليهم "عنداك تقولوها لشي واحد"

كيسمعوها هوما "عنداك تنسى شي واحد "', CAST(0x0000A73700F30572 AS DateTime), CAST(0x0000A6E00146A0CC AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810572872167157761', N'كاين شي ناس ملي كتقول ليهم "عنداك تقولوها لشي واحد"
كيسمعوها هوما "عنداك تنسى شي واحد ". — feeling pissed off', CAST(0x0000A73700F3056F AS DateTime), CAST(0x0000A6E00146E014 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810622148788240384', N'#معلومة : في المغرب، خمسة ديال الأزواج كيطالقو كل ساعة.
 أي ما يعادل 120 حالة طلاق في اليوم.', CAST(0x0000A73700F30569 AS DateTime), CAST(0x0000A6E0017CA744 AS DateTime), N'معلومة,', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810849090057732096', N'@KhaledBenghadda merci et au plaisir de vous revoir.', CAST(0x0000A73500F8F24A AS DateTime), CAST(0x0000A6E100E8D3E8 AS DateTime), N'', N'@KhaledBenghadda,', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810932220382904321', N'كتكون connecté حتى كتجيك invitation من عند شي وحدة كاتبة 
#الهاربة_من_الحب 
أودي طفرتو حتى انا بقاليا غير تجي تخباي عندي...', CAST(0x0000A73700F30563 AS DateTime), CAST(0x0000A6E101438E78 AS DateTime), N'الهاربة_من_الحب,', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810935314403487744', N'RT @FZKhamaily: Montrez à Poutine la différence entre le drapeau tunisien et Turque avant que ca ne soit trop tard 😂😂', CAST(0x0000A73700F3055F AS DateTime), CAST(0x0000A6E10146EF50 AS DateTime), N'', N'@FZKhamaily,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810935747767398400', N'غنقوليه الله يحرق طواسل موك البوعار. https://t.co/n0Dyzt8Huj', CAST(0x0000A73700F3052D AS DateTime), CAST(0x0000A6E101476804 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810941627292385281', N'شهود المرحلة واصحاب التحليلات التافهة..انصتوا قليلا https://t.co/F7sgAwVttY', CAST(0x0000A73700F23EF4 AS DateTime), CAST(0x0000A6E1014DD2FC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810942083599056897', N'ردود الفعل الرسمية https://t.co/Hsk4iN0gEE', CAST(0x0000A73700F23EF2 AS DateTime), CAST(0x0000A6E1014E518C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'810953996311609348', N'متابعة https://t.co/HAsLawYRHY', CAST(0x0000A73700F23EF0 AS DateTime), CAST(0x0000A6E1015B52D8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811169984219115520', N'شي يساريات ويساريين مشاو عند العدل والاحسان..رفضت قيادات الجماعة حتى السلام عليهن وكأنهن مصابات بالجرب..وشي وحدين... https://t.co/zKrEQXUReH', CAST(0x0000A73700F23EEE AS DateTime), CAST(0x0000A6E200BB8A8C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811193267681366016', N'باش نتفاهمو.. بوتين مجرم وزعيم عصابة وليس برفيق يساري..غالبية المتعاطفين معه من اليمين المتطرف الأوروبي واليسار... https://t.co/TAdSxILbZf', CAST(0x0000A73700F23EE8 AS DateTime), CAST(0x0000A6E200D4F3A0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811209699144175617', N'هل تعلم ان بوتين قتل بالشيشان 200 ألف شخص؟ هل تعلم ان بوتين قتل أزيد من 20 صحافي؟ هل تعلم ان بوتين محافظ وشجع... https://t.co/6kYE3i7NZN', CAST(0x0000A73700F23EE5 AS DateTime), CAST(0x0000A6E200E6E308 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811276978347196416', N'يساريين وحقوقيات يسخرون من "العياشة" الذين يقبلون يد الملك، ويقبلون بإهانات وتحقير قيادات جماعة العدل والاحسان،... https://t.co/w0P6jyizzb', CAST(0x0000A73700F23EE2 AS DateTime), CAST(0x0000A6E201305114 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811285442649849856', N'@K7al_L3afta kyf9ssoni ana :(', CAST(0x0000A73700F3052A AS DateTime), CAST(0x0000A6E201398DEC AS DateTime), N'', N'@K7al_L3afta,', N'43256664', N'AnouarNACH', 5448, 1022, N'Hay-Hassani', N'b58a1611c14353a6', NULL, N'tl')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811357583571349504', N'المغرب كيعيش مرحلة تاريخية ديال لمغاربة كاملين متبعين كيفاش المخزن يعرقل تشكيل الحكومة وكيفاش اخرج ثاني غني في... https://t.co/0wwbLJrOH2', CAST(0x0000A73700F23EDF AS DateTime), CAST(0x0000A6E201884900 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811534969323606016', N'السياسة في المغرب تمارس في معترك الحكم.. من 2011 الى 2016..لهذا لا ارى فائدة في الاستمرار في الجدل العقيم مع دعاة... https://t.co/Jolm271JvT', CAST(0x0000A73700F23EDD AS DateTime), CAST(0x0000A6E300BE5FF0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811566097770119168', N'رومانسية المرأة المغربية في فصل الشتاء:
"ندير ليك محمصة دفيلك مصارنك؟"', CAST(0x0000A73700F30524 AS DateTime), CAST(0x0000A6E300E05998 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811611309267709953', N'شي ميخيات ديال اليسار كيعتقدو ان كراهية المخزن والحقد عليه، يبرر تحالفهم مع "داعش" اذا قبلت بهم.. ماهذا المسخ؟؟..... https://t.co/PMaYtee6UL', CAST(0x0000A73700F23EDB AS DateTime), CAST(0x0000A6E30111B13C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811653449205108736', N'RT @Pssktch: الظرافات مابقاتش واكلة فهاد الزمان كون ظريف ياكلووك و يركبو عليك .... كون قبيح يديرو ليك الشان ..', CAST(0x0000A73700F1BD91 AS DateTime), CAST(0x0000A6E3013FAF10 AS DateTime), N'', N'@Pssktch,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811653530197127169', N'RT @Zyounate: Hahahaha il est con ce Manchar https://t.co/Wxb5LdwIKv', CAST(0x0000A73700F1BD89 AS DateTime), CAST(0x0000A6E3013FC680 AS DateTime), N'', N'@Zyounate,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811690738404757504', N'ممكن كنت عنيفا في التعبير عن موقفي، لكل من احس بالاهانة، عليه ان يتفهم ان العنف في الكلام ناتج عن احساس بإهانة... https://t.co/ekuhnTx5zI', CAST(0x0000A73700F23ED6 AS DateTime), CAST(0x0000A6E301686234 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811899142981251073', N'فهاد العالم الذي اصبحت تحكمه سياسة الفوضى والعنف..على الانسان ان ينتصر لوطنه وللانسان فقط..وان يشتم كل صباح ساسة... https://t.co/R5ZUC2EYPH', CAST(0x0000A73700F23EC9 AS DateTime), CAST(0x0000A6E400C05328 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811917531015421953', N'علاش معنديش الكتابة في الصور بالألوان، يا مارك يا امبريالي يا حقير!', CAST(0x0000A73700F23EC7 AS DateTime), CAST(0x0000A6E400D464A8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811988846195970049', N'ناري كون كان عندي "لايف"..كنت غادي نتجاوز الميلودي في عدد الفيديوهات..عندكم الزهر حمدو الله :p', CAST(0x0000A73700F23EC5 AS DateTime), CAST(0x0000A6E401223A0C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'811992021422510080', N'https://t.co/rJuCdh5vZY', CAST(0x0000A73700F23EC3 AS DateTime), CAST(0x0000A6E40125B128 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'812017139330744320', N'RT @AddTips: How To Prevent A User From Installing Or Running Extensions In Chrome https://t.co/apUwr9LsLC', CAST(0x0000A73700F3F67A AS DateTime), CAST(0x0000A6E401411B84 AS DateTime), N'', N'@AddTips,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'812267034075627520', N'تطبيق أحد فصول القانون الجنائي لا يحتاج كل هذه الضجة و"الردح" الرسمي والإعلامي..والا فهناك توظيف سياسي لتطبيق... https://t.co/lpLEZNW5mb', CAST(0x0000A73700F23EC2 AS DateTime), CAST(0x0000A6E500C654A8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'812272363047964672', N'و نتوما, شنو تقدرو تديرو فآخر 24 ساعة ديالكم؟ هادشي من أحسن آخر الحاجات لي شفت. https://t.co/1LPg4e6iuA', CAST(0x0000A73700F1BD84 AS DateTime), CAST(0x0000A6E500CC261C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'812380037596975104', N'@a7dadi c''est la nouvelle mise a jour, j''ai retiré ana dik l''icone :D', CAST(0x0000A73700F1BD7E AS DateTime), CAST(0x0000A6E50141A950 AS DateTime), N'', N'@a7dadi,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'812668212210909184', N'DigiGirlz Morocco - برنامج ديجي غيرلز المغرب: https://t.co/vcnPmJLHwN via @YouTube', CAST(0x0000A73700F1BD6C AS DateTime), CAST(0x0000A6E600F0AB54 AS DateTime), N'', N'@YouTube,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'812811293988179968', N'أحسن تعليق : القاتل تركي و المقتول روسي و المعتقل مغربي؟
#فهم_تصطا...', CAST(0x0000A73700F1BD64 AS DateTime), CAST(0x0000A6E700015180 AS DateTime), N'فهم_تصطا,', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813066275836530688', N'شباط ماشي نزيه وماشي مناضل وماشي مع الديموقراطية...اوا واخنوش وساجد هما نيلسون مانديلا وغاندي !!😆', CAST(0x0000A73700F23EC0 AS DateTime), CAST(0x0000A6E701179A20 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813140838259838976', N'كيلو ديال لحم ب 80 درهم، و 80 كيلو ديال لحم ب 100 درهم...
تأملوها!', CAST(0x0000A73700F1BD5B AS DateTime), CAST(0x0000A6E70168FA8C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813147208711335936', N'@desillusion__ هااهاه من الحساسية😆', CAST(0x0000A73700F209BD AS DateTime), CAST(0x0000A6E7016FEEA0 AS DateTime), N'', N'@desillusion__,', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813314057423949825', N'@Smael_Sebti rien n''est bizzare... c''ezt quoi le problème selon toi?', CAST(0x0000A73700F1BD52 AS DateTime), CAST(0x0000A6E8009A85D0 AS DateTime), N'', N'@Smael_Sebti,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813314226672566272', N'RT @Sli3fana_: Je cherche un hammam/douche à Rabat (Diour Jamaa ou l''océan) mrc. 😭😭😭😭', CAST(0x0000A73700F1BD2A AS DateTime), CAST(0x0000A6E8009AB4B0 AS DateTime), N'', N'@Sli3fana_,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813314747479326721', N'@Smael_Sebti ca veut dire que peut être 4 personnes cherchent Hijab et 4 d''autres cherchent makeup hahaha, tawazon :)
Blad silm w salam :)', CAST(0x0000A73700F1BD23 AS DateTime), CAST(0x0000A6E8009B472C AS DateTime), N'', N'@Smael_Sebti,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813346130675245056', N'بلوكاج الحكومة ماشي ذاتي ..من الغباء القول ان بنكيران يريد "بلوكاج" تشكيل حكومته..البلوكاج أصحابه هم لي عندهم... https://t.co/mgG7iHwJcn', CAST(0x0000A73700F209B7 AS DateTime), CAST(0x0000A6E800BD8724 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813362045911519232', N'شخصية سنة 2016 في المغرب: هو الناخب المغربي الذي هزم المال وأعوان السلطة و"حولي ولد زروال" ومسيرة أخننة الدولة و "جبلون" :D', CAST(0x0000A73700F209AE AS DateTime), CAST(0x0000A6E800CEE53C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813427548545830913', N'الخارجية تهاجم بنكيران ..الخارجية تهاجم شباط...مزوار ومن يحركه يريدون رئاسة مجلس النواب والوزارات المهمة، عبر... https://t.co/6waFrlgRwa', CAST(0x0000A73700F209A6 AS DateTime), CAST(0x0000A6E801166268 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813438668073537537', N'بهدوء يا شباب: راه الديوان الملكي سبق ورد عليه حزب التقدم والاشتراكية..زعما "الفعفاع"غادي يخلع حزب الاستقلال؟... https://t.co/FpTPIgTkbk', CAST(0x0000A73700F2099F AS DateTime), CAST(0x0000A6E801228638 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813763575437230081', N'لازال لشباط الكثير ما يقول..تصوروا يدوي على ما عاشه من مؤامرات على الحكومة في 2013؟ ..من سيكذبه آنذاك..المخزن يدفع بهبيل فاس للضرب بالحجر😅', CAST(0x0000A73700F2098D AS DateTime), CAST(0x0000A6E900F99E58 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813780480432738304', N'علاج جديد للسرطان في المغرب 🇲🇦 
https://t.co/yu122MWI5v', CAST(0x0000A73700F3F676 AS DateTime), CAST(0x0000A6E9010C1100 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813830063783297025', N'2016 في جملة! لكم الكلمة', CAST(0x0000A73700F20988 AS DateTime), CAST(0x0000A6E901422EE8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813856938077392900', N'فراسكم السيسي اهدر 20 مليار دولار من مساعدات دول الخليج..واقتصاد مصر تجاوز القاع بمترين.. وهادشي من عام 2013 الى... https://t.co/NlcUWGdtuF', CAST(0x0000A73700F20983 AS DateTime), CAST(0x0000A6E9015F831C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'813881006847643648', N'اشنو هو اسوأ تعليق قرأت فهاد البروفايل في 2016؟', CAST(0x0000A73700F2097E AS DateTime), CAST(0x0000A6E90179C754 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814162001358450689', N'المشكل داخلي في المغرب وحله سيكون باحترام من فوض بصناديق الاقتراع لتشكيل الأغلبية الحكومة...وعلى مول "المازوط"... https://t.co/yS05HUwob2', CAST(0x0000A73700F20979 AS DateTime), CAST(0x0000A6EA0120F318 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814189061573345280', N'@ToToPoStOoOo safi? :D', CAST(0x0000A73700F1BD14 AS DateTime), CAST(0x0000A6EA013E7ADC AS DateTime), N'', N'@ToToPoStOoOo,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'tr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814189217974718465', N'RT @Ayoubaboussou: هل أنت تريد الإنتحار او تريد الموت ...!! 

إرمي نفسك في البحر سترى أنك تصارع لتعيش .. أنـت لا تريد ان تموت .. بل تريد قت…', CAST(0x0000A73700F1BD0F AS DateTime), CAST(0x0000A6EA013EA764 AS DateTime), N'', N'@Ayoubaboussou,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814189493590888449', N'@karimOUTTA you like it? :D', CAST(0x0000A73700F1BCE4 AS DateTime), CAST(0x0000A6EA013EF390 AS DateTime), N'', N'@karimOUTTA,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814790426276335616', N'اقوى اللحظات التي عاشها المغاربة في 2016.. هي ليلة 7 أكتوبر..ليلة المؤامرة الفاشلة على الإرادة الشعبية، وظهور... https://t.co/ErGwSP3eYK', CAST(0x0000A73700F2096A AS DateTime), CAST(0x0000A6EC00B7CAC8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814822279708340224', N'مصدر مقرب من بنكيران: يصعب رفع لائحة للأغلبية للملك تضم "الاستقلاليين" بعد تصريحات شباط حول موريتانيا https://t.co/Vp4BOUvSFF', CAST(0x0000A73700F208C8 AS DateTime), CAST(0x0000A6EC00DA8E00 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814852671505043456', N'وسيذكر التاريخ المغربي ...2016 بعام السياسة...', CAST(0x0000A73700F208BA AS DateTime), CAST(0x0000A6EC00FBB968 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814853708064362496', N'حتى لو تخلى بنكيران على"شباط" فالمعركة من أجل احترام ارادة المغاربة ودستورهم، لم تنته بعد..المستهدف بالبلوكاج كان... https://t.co/cesLxy6xUb', CAST(0x0000A73700F208AE AS DateTime), CAST(0x0000A6EC00FCDADC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814869153907621889', N'للطارئين والطارئات على السياسة والشأن العام مع ظهور المواقع الاجتماعية: فراسكم الحكومات في المغرب كان يتم تشكيلها... https://t.co/vskui2MnbV', CAST(0x0000A73700F208A7 AS DateTime), CAST(0x0000A6EC010DB6E0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814875882863128577', N'الحياة أقصر مما تتصورون، هادشي الى ما قلتش أنها غدارة بالعباد.
ولد عمتي (في الثلاثينيات من العمر) لي كان كيعاون... https://t.co/J9yJooOaSc', CAST(0x0000A73700F1BCDD AS DateTime), CAST(0x0000A6EC01150E90 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814876503695572992', N'@Spikoza mamcha m3ak bas akhouya', CAST(0x0000A73700F1BCAB AS DateTime), CAST(0x0000A6EC0115BC00 AS DateTime), N'', N'@Spikoza,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ht')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'814902956957061120', N'اه نسيت .. مع بوادر رحيل 2016.. اعتذر لكل من أسأت إليه عن غير قصد.. نناقش بندية..نختلف .. لا نجامل. لا نزايد.. لا... https://t.co/dlhWY3AWij', CAST(0x0000A73700F208A0 AS DateTime), CAST(0x0000A6EC01329B04 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815142185272229888', N'صباح الثورة والخبز والحرية https://t.co/jTm0V60U6f', CAST(0x0000A73700F20892 AS DateTime), CAST(0x0000A6ED00AC3140 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815143586035630081', N'كبر القلب وفتح ابوابه.. https://t.co/esO0pOqHvZ', CAST(0x0000A73700F2088B AS DateTime), CAST(0x0000A6ED00ADB8A8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815189659840024576', N'الاستقلاليين نمارد السياسية ..وضعو جميع السيناريوهات امامهم..وردو للمخزن الصاع صاعين..كما فكو على بنكيران الحصار..', CAST(0x0000A73700F20885 AS DateTime), CAST(0x0000A6ED00E001B4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815272842396831745', N'تتوالى السنوات وتتغير الأرقام والتوحش والعنف يسود في عالم يفقد إنسانيته.. رغم كل الدمار والاحباطات والبؤس المحيط... https://t.co/EuxhGIWViq', CAST(0x0000A73700F20878 AS DateTime), CAST(0x0000A6ED013ACA54 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815325029231685632', N'من اللحظات الجميلة ان تقضي نهاية السنة بعيدا عن الاحتفالات الجماعية، التي يحضر فيها النفاق والتمثيل والانشاء...... https://t.co/AgIMqCWEOl', CAST(0x0000A73700F20871 AS DateTime), CAST(0x0000A6ED0173BECC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815344991220416514', N'باقية 10 دقايق على 2017، شكون باغي يقول لي شي حاجة وعام هذا هو صابر...يالله سربيو قولو معندكم😅😆', CAST(0x0000A73700F20868 AS DateTime), CAST(0x0000A6ED018987C0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815348610296676352', N'كل عاااااااام وأنتم بخييييير😍😍', CAST(0x0000A73700F2085D AS DateTime), CAST(0x0000A6EE0001F914 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815361548159950848', N'RT @AJABreaking: عاجل | مراسل #الجزيرة: 35 قتيلا و42 مصابا في الهجوم على الملهى الليلي في اسطنبول', CAST(0x0000A73700F20856 AS DateTime), CAST(0x0000A6EE00101850 AS DateTime), N'الجزيرة,', N'@AJABreaking,', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815361714476777472', N'RT @AJABreaking: عاجل | مراسل #الجزيرة: الشرطة ستقتحم الملهى بحثا عن المسلحين الذين نفذوا الهجوم', CAST(0x0000A73700F20850 AS DateTime), CAST(0x0000A6EE00104730 AS DateTime), N'الجزيرة,', N'@AJABreaking,', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815530425288458240', N'مجموعة 159..ضحايا الحالة المدنية...عيد ميلاد سعيد وكل عام وأنتم بخير😆', CAST(0x0000A73700F20843 AS DateTime), CAST(0x0000A6EE00C86784 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815543230863470592', N'وقالت وزيرة العائلة التركية فاطمة بتول سايان كايا في تصريحات نقلتها وكالة الأناضول للأنباء أن بين القتلى الـ39... https://t.co/Qz1R4sJAiX', CAST(0x0000A73700F2083A AS DateTime), CAST(0x0000A6EE00D66140 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815545782929674240', N'RT @AFP: Saudis, Moroccans, Lebanese, Libyans among victims of Istanbul attack: minister https://t.co/mhjYtMXM2n #IstanbulAttack', CAST(0x0000A73700F2082F AS DateTime), CAST(0x0000A6EE00D92AEC AS DateTime), N'IstanbulAttack,', N'@AFP,', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815606703525953536', N'وصلنا للنهاية, و مرت سنة أخرى حافلة بالمواقف المتعددة.
صواب, خطأ, فرح, حزن, ندم, مشاكل, تجاهُل....هكذا هي رموزها... https://t.co/hhHwVh00Qq', CAST(0x0000A73700F1BC9E AS DateTime), CAST(0x0000A6EE011BA868 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815652435557486592', N'لي قرا الميساج ديالك
وماجاوبكش
كتب ليه:"واش بصح داكشي لي سمعت عليك؟ "
وملي يجاوبك قرا الميساج ديالو وماتجاوبوش
واستمتع بحريق الدم وقلي السم', CAST(0x0000A73700F1BC7F AS DateTime), CAST(0x0000A6EE014D915C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'El Mansouria', N'30afc5254ded8895', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815834295789088768', N'Je vous souhaite une bonne année 2017. Qu''elle soit remplie de bonheur, de santé et de réussite, pour vous et pour vos proches.', CAST(0x0000A73500F8F246 AS DateTime), CAST(0x0000A6EF00888AB0 AS DateTime), N'', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815834601683820544', N'@MyHafidElalamy أطيب التحيات واجمل الامنيات، بحلول السنة الميلادية 2017، أتمنى أن تعم ايامكم الافراح والمسرات، مقرونه بغد اجمل', CAST(0x0000A73500F8F23D AS DateTime), CAST(0x0000A6EF0088E03C AS DateTime), N'', N'@MyHafidElalamy,', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815918952429785088', N'العار يا بو أحمد لي زارو ما ينكد...حامي العطاوية https://t.co/O5yZghjX2r', CAST(0x0000A73700F20827 AS DateTime), CAST(0x0000A6EF00E4EEA4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'815997716048281602', N'@Youssefyamani j''ai commandé par une de banque populaire sur AliExpress, par contre j''ai galéré avec les guichets pr tourver quoi manger :(', CAST(0x0000A73700F1BC68 AS DateTime), CAST(0x0000A6EF013AE548 AS DateTime), N'', N'@Youssefyamani,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816043446112751617', N'@Amine_WTB أش وقع؟', CAST(0x0000A73700F3F672 AS DateTime), CAST(0x0000A6EF016CCE3C AS DateTime), N'', N'@Amine_WTB,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816244456957636609', N'كلام في الصميم https://t.co/F3JKjSlypD', CAST(0x0000A73700F20814 AS DateTime), CAST(0x0000A6F000BCAE58 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816310600112504832', N'نداء لأصحاب القلوب الرحيمة: :D :D 
"يا بنكيران،
هذا حزب الاتحاد الاشتراكي التاريخي، صال و جال و تفاوض في الماضي... https://t.co/pQxZV6DGrF', CAST(0x0000A73700F2080D AS DateTime), CAST(0x0000A6F00104DED0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816358569398386689', N'@___Fatale I think yes', CAST(0x0000A73700F1BC5B AS DateTime), CAST(0x0000A6F001393860 AS DateTime), N'', N'@___Fatale,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816358759798894592', N'😂😂😂😂😂😂😂😂😂😂😂😂😂 https://t.co/P6fH4sET7D', CAST(0x0000A73700F1BC55 AS DateTime), CAST(0x0000A6F001396E48 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816362667866750976', N'RT @yahiakarim: WhatsApp:deux nouveaux malwares très dangereux qui volent vos données bancaires https://t.co/C5q3aogcRm #Malware #virus #wh…', CAST(0x0000A73700F1BC47 AS DateTime), CAST(0x0000A6F0013DB14C AS DateTime), N'Malware,virus,', N'@yahiakarim,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816430433982365698', N'الفرق بين الأمس واليوم: لمغاربة كانو كيسمعو على المخزن من معارضين، مجرد بشتركون في الحكم، كيضربو الطم.. دبا... https://t.co/J9JdgbhYbK', CAST(0x0000A73700F20806 AS DateTime), CAST(0x0000A6F00187A748 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816435961714380801', N'بلاغ البجيدي في اعتقادي كمواطن بسيط، واضح وغير لي مبغاش يفهم..خلاصته: كل الاحتمالات واردة ولن نقبل بابتزازات... https://t.co/YVfjJEqaJV', CAST(0x0000A73700F207F9 AS DateTime), CAST(0x0000A6F100022DD0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816575862212612096', N'- سلم لي عليه https://t.co/9xcBxvdwDa', CAST(0x0000A73700F207F2 AS DateTime), CAST(0x0000A6F1009ADDB4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816606682448965633', N'"البام bis" الذي خرج او أخرج أخنوش لقيادته، كان هدفه الأساسي، دفع بنكيران للفشل في تشكيل الحكومة و"يحط سوارت".... https://t.co/j3KZSC48sD', CAST(0x0000A73700F207EC AS DateTime), CAST(0x0000A6F100BC80A4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816615912447082496', N'علاش اخنوش كيحشم يقول غادي ناقش عرض ببنكيران مع لشكر وساجد ولعنصر؟ ويكفتي فقط بساجد ولعنصر؟', CAST(0x0000A73700F207DE AS DateTime), CAST(0x0000A6F100C693F0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816657785228324864', N'كنفضل يكون عندي ولد صعيب و ماتكونش عندي بنت ساهلة.', CAST(0x0000A73700F1BC33 AS DateTime), CAST(0x0000A6F100F446C4 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'816686049711767553', N'يا صلاة الزين على الحلوين https://t.co/KSxtUpCAjT', CAST(0x0000A73700F207D8 AS DateTime), CAST(0x0000A6F101132008 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'817022934728450048', N'لي تيبان ان المخزن باغي يوصل رسالة ديال ان هو مول الشي والانتخابات ماعندها قيمة عنده، وثانية ان ناسو لي غيشكلو... https://t.co/ddAaiLYotM', CAST(0x0000A73700F207CA AS DateTime), CAST(0x0000A6F200F749DC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'817422364787044352', N'في الحقيقة من بعد هذه البلاغات التافهة لكل من أخنوش وملحقاته في الهولدينغ السياسي "الاتحاد الدستوري والاتحاد... https://t.co/YhXnDJcbJJ', CAST(0x0000A73700F207C4 AS DateTime), CAST(0x0000A6F3011FB7DC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'817478702162276352', N'Neghma - Kif Nensak [Exlusive Lyrics Video] | نغمة - كيف ننساك https://t.co/JuKw3a7EPk', CAST(0x0000A73700F1BC26 AS DateTime), CAST(0x0000A6F3015D347C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818159066413432832', N'أهم ما في البلاغ الرباعي.. الاعلان بشكل رسمي التحاق "الاتحاد الاشتراكي" بالهولدينغ السياسي لعزيز أخنوش :D', CAST(0x0000A73700F207BD AS DateTime), CAST(0x0000A6F5012CBB80 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818379495241617408', N'Bonjour @inwi, tu peux m''expliquer cette différence de 10 Go ? Alors que le compteur data a toujours été assez préc… https://t.co/t85dh0Dexa', CAST(0x0000A73700F3F66E AS DateTime), CAST(0x0000A6F60091CD64 AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818380935263645696', N'@inwi J''ajoute, il s''agit d''un smartphone dual sim, et le compteur se concorde avec les stats de votre concurrent "historique"...😒', CAST(0x0000A73700F3F669 AS DateTime), CAST(0x0000A6F600935F58 AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818381871017037825', N'@inwi le compteur data d’Android a toujours été précis depuis que je suis chez vous ! Pourquoi il commence à se tromper en 2017 ?', CAST(0x0000A73700F3F665 AS DateTime), CAST(0x0000A6F6009464AC AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818416921007837184', N'بعد بلاغ بنكيران، على المشاركين في انتخابات 7 أكتوبر، الذين صوتوا ضد حزب البؤس وإغراءات المال وتحدوا ضغوطات رجال... https://t.co/YwYGgzfyrp', CAST(0x0000A73700F207B6 AS DateTime), CAST(0x0000A6F600BAA608 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818463650507816960', N'زيدو فالمازوط..
زيدو فالخبز..
زيدو فالسكر..
زيدو فالحليب..
زيدو فالتقاعد..
زيدو فالعصا..

حنا بغينا نزيدو فحاجة... https://t.co/uITI6kDjN5', CAST(0x0000A73700F1BC16 AS DateTime), CAST(0x0000A6F600EDA5E4 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818577078756982784', N'قديما : الغايب حجتو معاه..
الآن : الغايب صاحبتو معاه :D
#فاعل_خير, لا شكر على واجب 😂😂😂', CAST(0x0000A73700F1BC0A AS DateTime), CAST(0x0000A6F6016970E8 AS DateTime), N'فاعل_خير,', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818590022517583872', N'ديرو دوزيم
..شوفو الناس فين كاتخسر الفلوس 😁😁😁
#Twittoma https://t.co/8pRlNq76Jj', CAST(0x0000A73700F1BC04 AS DateTime), CAST(0x0000A6F601779150 AS DateTime), N'Twittoma,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818777733123756034', N'@inwi up!', CAST(0x0000A73700F3F662 AS DateTime), CAST(0x0000A6F700B8ED68 AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818790357173465088', N'أخنوش زادوه ليه فيه "دوباج"، داكشي علاش مكملش 3 اشهر...وأصبح جفاف سياسي حاقيقي :D ..من يعوضه؟', CAST(0x0000A73700F207AA AS DateTime), CAST(0x0000A6F700C6B4C0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818816808912388096', N'الطالبي العلمي وعلم التوالد عند الحكومات.. المسخ السياسي والتواصلي :D https://t.co/k1dZT06xoZ', CAST(0x0000A73700F207A2 AS DateTime), CAST(0x0000A6F700E39298 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818853361005002752', N'La gynécologie politique 😂😂 https://t.co/9oboLPPkLv', CAST(0x0000A73700F20795 AS DateTime), CAST(0x0000A6F7010B777C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818866976709865473', N'@sbiti_ اعتقد ان العلمي دخل إلى تاريخ أغبى الأقوال في 10 أيام وبدون معلم..غيجي وكون حرايفي السياسة؟', CAST(0x0000A73700F20790 AS DateTime), CAST(0x0000A6F7011A5364 AS DateTime), N'', N'@sbiti_,', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'818871597167689728', N':D :D
كما قال امحمد جبرون، فالجهات التي تتدخل في البلوكاج لها أسباب وجيهة مرتبطة بالمصالح العليا للوطن.  وليس أي... https://t.co/31RxFt4sM6', CAST(0x0000A73700F20787 AS DateTime), CAST(0x0000A6F7011F5ECC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819137312403685376', N'شنو الهدية لي ممكن تقدموا لواحد عزيز عليكم...
اسمعوا و استافدوا و اسكتوا :) https://t.co/ePb32iAkMM', CAST(0x0000A73700F1BBFD AS DateTime), CAST(0x0000A6F800B5DC40 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819504346551504896', N'فاش تتشوف هاد المستوى الهزيل ديال أخنوش... كتولي مؤمن " أن كل بورجوازي حقير، غبي بالفطرة" :D https://t.co/l4lEhp95OF', CAST(0x0000A73700F2077A AS DateTime), CAST(0x0000A6F900BAEEB0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819547995477864448', N'سنة أمازيغية سعيد لجميع المغاربة وكل عام وأنتم بخير..كاين شي "تاكلا" واللا غير نابوبي!', CAST(0x0000A73700F20773 AS DateTime), CAST(0x0000A6F900EA9264 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819609425589796865', N'ويستمر #البحث_عن_10_جيگا دون إجابة... @inwi https://t.co/EuIJPeAFHc', CAST(0x0000A73700F3F65E AS DateTime), CAST(0x0000A6F9012D9DAC AS DateTime), N'البحث_عن_10_جيگا,', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819614663222722561', N'@Fahdos ما نسمحش ليهم غدا عند سيدي ربي 😡 @inwi', CAST(0x0000A73700F3F65A AS DateTime), CAST(0x0000A6F901335558 AS DateTime), N'', N'@Fahdos,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819640081757732864', N'@Fahdos نترجم لإينوي باش ايفهمو : الصولد ديالهم غادي إيكون ايبويزي... عالله اتاقاو الله 😂 @inwi', CAST(0x0000A73700F3F656 AS DateTime), CAST(0x0000A6F9014F12E8 AS DateTime), N'', N'@Fahdos,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819640936607137793', N'Vraiment, faut généraliser les mercredis fériés.. Ça détresse bien 👍✌️', CAST(0x0000A73700F3F653 AS DateTime), CAST(0x0000A6F9015001F8 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819647452726906882', N'@Nabil79 destresse*', CAST(0x0000A73700F3F64F AS DateTime), CAST(0x0000A6F901571DE4 AS DateTime), N'', N'@Nabil79,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819662334310445056', N'الا لقيتي راسك فرحان...
سير تنعس قبل ماينكد عليك شي واحد. — feeling naughty', CAST(0x0000A73700F1BBEF AS DateTime), CAST(0x0000A6F901675BB4 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819670762093244416', N'JUMANJI - Les détails que vous n''aviez pas remarqués ! https://t.co/OjrfOsrJ4O', CAST(0x0000A73700F3F64A AS DateTime), CAST(0x0000A6F901708F2C AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819933906749243392', N'المغرب يعيش أزمة سياسية، لم يعرف مثيلا لها في عهد الملك محمد السادس.. في الأيام المقبلة سنكون أمام الحسم في... https://t.co/4byNI3BY9G', CAST(0x0000A73700F2076E AS DateTime), CAST(0x0000A6FA01043E44 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819953363412545536', N'بنكيران مخزني. وفي نفس الوقت الداخلية تقيم القيامة لتزوير الانتخابات والباطرونا تلعنه والاعلام المسخر يشهر بيه... https://t.co/yVVMuLGa51', CAST(0x0000A73700F20762 AS DateTime), CAST(0x0000A6FA01197A98 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'819990134041022464', N'لا "لشكلطة مجلس النواب" ولا لـ"أخنشة الحكومة" ولا لعسكرة الريف!', CAST(0x0000A73700F2075F AS DateTime), CAST(0x0000A6FA01419C6C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'820695023364743168', N'مبادرة يروج لها في الإعلام ولا أحد يتبناها...واش هادي تسمى مبادرة؟؟ هادي تديرييت ..لواه قالك مساندة نقدية ويكون... https://t.co/WyU0K9u01r', CAST(0x0000A73700F20758 AS DateTime), CAST(0x0000A6FC012BE890 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'820759121209212929', N'كيف دايرين الخوت مع هاد البرد وتوحدانييت؟✌', CAST(0x0000A73700F20755 AS DateTime), CAST(0x0000A6FC0171DD28 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'820945240181837824', N'البليدة حاضرة في الإعلام الدولي .. الاناضول تخصص قصاصة للعطاوية العظمى :p https://t.co/ffkEKD1Epz', CAST(0x0000A73700F20752 AS DateTime), CAST(0x0000A6FD00B17BF0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'820982249491468288', N'من بعد 17 سنة على حكم الملك محمد السادس، تتم الاستعانة بفريق ادريس البصري، للدفاع عن مصالح المخزن وتكبيل الإرادة... https://t.co/hhBaP1WWkW', CAST(0x0000A73700F2074C AS DateTime), CAST(0x0000A6FD00D9E090 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821016006621593603', N'@LeMechantBoeuf Tu es foutu cher  @Anas_BOUGATAYA ! je m''attends à te lire chaque jour pendant une semaine ;)', CAST(0x0000A73700F3C504 AS DateTime), CAST(0x0000A6FD00FEB7D0 AS DateTime), N'', N'@LeMechantBoeuf,@Anas_BOUGATAYA,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821036126639165440', N'La finalité du marketing d''influence est d''identifier et de nouer des relations étroite avec les acteurs de votre... https://t.co/yuNgx7rWAR', CAST(0x0000A73700F3C4FF AS DateTime), CAST(0x0000A6FD0114AD4C AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821050841763368963', N'16 يناير 2017: يوم ساهم الاتحاد الاشتراكي في مؤامرة وأد التجربة التأسيسية للانتقال الديموقراطي... هكذا سيذكرهم... https://t.co/4BlL1C8nAv', CAST(0x0000A73700F20749 AS DateTime), CAST(0x0000A6FD0124BC3C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821074849049280512', N'حظ سعيد للمنتخب الوطني لكرة القدم.. دائما هناك أمل بالفوز.. يالله جيبوها يا رفاق ونسونا شويا هاد "شكلطة" مجلس النواب :)', CAST(0x0000A73700F20746 AS DateTime), CAST(0x0000A6FD013EF00C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821076785718841344', N'@K7al_L3afta hahahahahah :D', CAST(0x0000A73700F1BBE9 AS DateTime), CAST(0x0000A6FD01410D74 AS DateTime), N'', N'@K7al_L3afta,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'tl')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821094806248189953', N'@C_012_LM je pense bien que oui..', CAST(0x0000A73700F3C4F9 AS DateTime), CAST(0x0000A6FD0154B7D4 AS DateTime), N'', N'@C_012_LM,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821095070086602753', N'Les billets de retour sont déjà de cours de réservation #codmar #lmatch', CAST(0x0000A73700F3C4EB AS DateTime), CAST(0x0000A6FD015501A8 AS DateTime), N'codmar,lmatch,', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821096051524431873', N'الله ينهل التامل مك #CAN2017', CAST(0x0000A73700F3C4E4 AS DateTime), CAST(0x0000A6FD015613E0 AS DateTime), N'CAN2017,', N'', N'183278308', N'WahidROUHLI', 33017, 833, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821096154121306112', N'RT @hootsuite: Hey social media managers, these 6 different templates will make your life easier 😉 https://t.co/4Y32AAq9sP https://t.co/Czy…', CAST(0x0000A73700F3C4DB AS DateTime), CAST(0x0000A6FD0156312C AS DateTime), N'', N'@hootsuite,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821096742015926272', N'Conférence de presse de bilan de la loi portant sur l’interdiction des sacs en plastique. Le Maroc s’achemine vers… https://t.co/4Hz9NMKUzO', CAST(0x0000A73500F8F21E AS DateTime), CAST(0x0000A6FD0156D53C AS DateTime), N'', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821096952649707520', N'12 joueurs et un arbitre contre une équipe de 10 personnes et vous voulez pas marquer #honte #CAN2017 #codmar #lmatch', CAST(0x0000A73700F3C4D6 AS DateTime), CAST(0x0000A6FD01570FD4 AS DateTime), N'honte,CAN2017,codmar,lmatch,', N'', N'183278308', N'WahidROUHLI', 33017, 833, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821098808180404228', N'البؤس الرياضي والسياسي.. اخنوش ولقجع يحرضان المغاربة على الثورة 😒😒', CAST(0x0000A73700F20743 AS DateTime), CAST(0x0000A6FD015915CC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821128432973185024', N'شي وحدين كيقولو على راسهم غاديكال، وعدميين وخلافجيةويسار ومسينيسا و....فرحانين بهاد الانتكاسة التي عاشها المغرب... https://t.co/vrGD6x6lmh', CAST(0x0000A73700F2073F AS DateTime), CAST(0x0000A6FD01796AC0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821315414714155008', N'Hello @OrangeMaroc 
Je crois que #Meditel devient Orange, non? https://t.co/TyEJKzGp7W', CAST(0x0000A73700F1BBE1 AS DateTime), CAST(0x0000A6FE00B9FAF0 AS DateTime), N'Meditel,', N'@OrangeMaroc,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821318809998999552', N'خسارة صغيرة وربح كبير للوطن.. نكسة "احتلال" المالكي لرئاسة مجلس النواب، مجرد ردة فعل سياسية من قوى الاستبداد... https://t.co/0FHDcTHepv', CAST(0x0000A73700F2073C AS DateTime), CAST(0x0000A6FE00BDB028 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821320624639475712', N'Merci pour ton partage @theophileg @SlideShare', CAST(0x0000A73700F3C4D2 AS DateTime), CAST(0x0000A6FE00BFAA68 AS DateTime), N'', N'@theophileg,@SlideShare,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821323413427982336', N'Isn''t this good news for French people?  https://t.co/u7um3ZdKO6', CAST(0x0000A73700F3C4CE AS DateTime), CAST(0x0000A6FE00C2B5B4 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821333476662198273', N'وخا اسيدي انا ماشي موضوعي.. طيب، كيفاش رئيس الحكومة الملكف، يرفض تواجد حزبك معه في الحكومة، وقيادتك تريد "بزز"... https://t.co/m5LnD2VHv3', CAST(0x0000A73700F20738 AS DateTime), CAST(0x0000A6FE00CDB234 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821361909811257344', N'ثلاث ديال الحوايج خلاوني نحس أنني فأوروبا
هاد البرد ❄
وأورونج 📞
و لبسة جديدة ديال البوليس', CAST(0x0000A73700F3C4CA AS DateTime), CAST(0x0000A6FE00ECBA58 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821394573935185920', N'إنهم بهذا الاختيار يسعون إلى تحنيط المالكي، كي لا ينقرض حزب الاتحاد الاشتراكي.  
فالاتحاد ثروة وطنية  وتحتاجه... https://t.co/Nb3oc1I5QX', CAST(0x0000A73700F20735 AS DateTime), CAST(0x0000A6FE01105FBC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821416088831492098', N'من غير اغراس اغراس واسكاس ايفولكي..واش اخنوش كيعرف الأمازيغية؟؟ اشك في ذلك !', CAST(0x0000A73700F20731 AS DateTime), CAST(0x0000A6FE0127DB74 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821428364535824384', N'مستقل في رأيي وحر في قناعتي..ولا انتظر من أحد شكرا ولا جزاء.. أحلم ان يعيش المغاربة بكرامة..ولا حق لأي مخلوق في... https://t.co/YHr5GAYdKS', CAST(0x0000A73700F20725 AS DateTime), CAST(0x0000A6FE01354188 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821440712109658114', N'جبرون: على "البيجيدي" ضم حزب "لشكر" للحكومة والاستغناء عن بنكيران
تعليق: لا لا يا استاذ.. عليهم منح لشكر رئاسة... https://t.co/QpR3sB35Vw', CAST(0x0000A73700F20720 AS DateTime), CAST(0x0000A6FE0142BB88 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821460963631230977', N'Mon forfait 30 Go 4G d''@inwi  est épuisé alors que le compteur data d’Android indique qu''il me reste plus se 12 Go… https://t.co/hv9FsLotEn', CAST(0x0000A73700F3F645 AS DateTime), CAST(0x0000A6FE0158D558 AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821461573826990080', N'@willou_du80 Pas du tout, il fonctionnait toujours sans jamais enregistrer de tel écarts... @inwi', CAST(0x0000A73700F3F641 AS DateTime), CAST(0x0000A6FE01597F44 AS DateTime), N'', N'@willou_du80,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821461753632616448', N'@willou_du80 En plus c''est un dual sim, il affiche la bonne consommation pour l''opérateur concurrent... @inwi', CAST(0x0000A73700F3F63D AS DateTime), CAST(0x0000A6FE0159B1A8 AS DateTime), N'', N'@willou_du80,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821461858951561216', N'@willou_du80 c''est pas bizarre c''est de l''arnaque @inwi', CAST(0x0000A73700F3F638 AS DateTime), CAST(0x0000A6FE0159CEF4 AS DateTime), N'', N'@willou_du80,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821462281045348354', N'@willou_du80 Ils reconnaissent jamais l''arnaque... @inwi', CAST(0x0000A73700F3F634 AS DateTime), CAST(0x0000A6FE015A4550 AS DateTime), N'', N'@willou_du80,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821462967820685312', N'@willou_du80 je change d''opérateur dès que je termine mon engagement ! Ils peuvent compter sur moi ! @inwi', CAST(0x0000A73700F3F62C AS DateTime), CAST(0x0000A6FE015B0580 AS DateTime), N'', N'@willou_du80,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821466213045899265', N'@willou_du80 plus de 12 mois... @inwi', CAST(0x0000A73700F3F627 AS DateTime), CAST(0x0000A6FE015E8F5C AS DateTime), N'', N'@willou_du80,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821515488706568197', N'دات مومنت فاش كاتدير ال portabilité من Maroc Telecom الى Orange و كيجيو كيتحماو عليك كيحيدو ليك النمرة و ماكاتبقا... https://t.co/tpdasNnDpg', CAST(0x0000A73700F1BBDF AS DateTime), CAST(0x0000A6FF0008D5B8 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'821712138347626496', N'https://t.co/h5WT6SgSRd', CAST(0x0000A73700F3C4C4 AS DateTime), CAST(0x0000A6FF00DF7514 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822063331703980033', N'@uniqleo @illayali واخا غي نفيق...', CAST(0x0000A73700F3F622 AS DateTime), CAST(0x0000A70000D33D58 AS DateTime), N'', N'@uniqleo,@illayali,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822068699481997313', N'@illayali ملي تكبر تولي عزافة', CAST(0x0000A73700F3F61D AS DateTime), CAST(0x0000A70000D9182C AS DateTime), N'', N'@illayali,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822069866203062274', N'@uniqleo @illayali صراحة ماعنديش البديل ولكن ننصحكم بهاد الموقع 
https://t.co/CaYHFarLFz', CAST(0x0000A73700F3F619 AS DateTime), CAST(0x0000A70000DA5F20 AS DateTime), N'', N'@uniqleo,@illayali,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822072996399554561', N'@BENDAKAKMOHAMED 😂😂😂', CAST(0x0000A73700F3F613 AS DateTime), CAST(0x0000A70000DDC958 AS DateTime), N'', N'@BENDAKAKMOHAMED,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822486558670520320', N'كثر من عشر سنين و أنا مع اتصالات المغرب بدون منقول أح راسي...
هادي عشر ايام قلت نحيد اشتراكي و نديرو ف اورونج لي... https://t.co/Fb33ZrjZFN', CAST(0x0000A73700F1BBD8 AS DateTime), CAST(0x0000A7010115A364 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822513953213468673', N'Ce que j''ai compris, que Dieu me pardonne. 
Il faudrait bloquer l''accès à Facebook et Google afin que les... https://t.co/eV0WEsZa9g', CAST(0x0000A73700F3C4C0 AS DateTime), CAST(0x0000A701013388E8 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822551740662906881', N'فوز المنتخب على الطوغو، داير بحال 102 لي جاب البام في الانتخابات...مميكنش يفسرها شي محلل موضوعي😅', CAST(0x0000A73700F2071D AS DateTime), CAST(0x0000A701015CC654 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822595940892688385', N'Bonsoir, je souhaite porter plainte contre Maroc Telecom ! Est-ce que quelqu''un pourrait aussi m''orienter vers... https://t.co/1QqZgXL0Rq', CAST(0x0000A73700F3C4BB AS DateTime), CAST(0x0000A702000182B8 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822788041500717057', N'@AmerBenouda c''est une honte..', CAST(0x0000A73700F3C4B7 AS DateTime), CAST(0x0000A70200D32A98 AS DateTime), N'', N'@AmerBenouda,', N'183278308', N'WahidROUHLI', 33017, 833, N'Ben M''sick', N'2c87e3b1b55eec2c', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822836940080840706', N'Mehdi Alaoui - Sid L''juge &amp; Ya Lmima | مهدي علوي - سيد الجيج &amp; يا لميمة https://t.co/po4HvKcLyV', CAST(0x0000A73700F1BBCA AS DateTime), CAST(0x0000A70201088850 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822851673244700672', N'@freehousni الهجيج ههههه', CAST(0x0000A73700F1BBC7 AS DateTime), CAST(0x0000A70201189D1C AS DateTime), N'', N'@freehousni,', N'43256664', N'AnouarNACH', 5448, 1022, N'Sidi Belyout', N'a548d855eb55e9dd', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822860835810930689', N'I''m at @Morocco_Mall in Casablanca, Grand Casablanca https://t.co/D2V7OF40Qd', CAST(0x0000A73700F1BBC1 AS DateTime), CAST(0x0000A70201229C7C AS DateTime), N'', N'@Morocco_Mall,', N'43256664', N'AnouarNACH', 5448, 1022, N'Anfa', N'93e879312241ce12', N'  33.57596015,  -7.70658545', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'822946634292166657', N'@GhizlaneRadi hhhh', CAST(0x0000A73700F3C4B2 AS DateTime), CAST(0x0000A7020180405C AS DateTime), N'', N'@GhizlaneRadi,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823195867817607169', N'#Rain #Rainy #Morocco #Maroc
#المغربي #مطر #المطر #المغرب #المغربية #مغربي #مغربية #شتاء @… https://t.co/cGarv5uYkg', CAST(0x0000A73700F1BBB7 AS DateTime), CAST(0x0000A7030104C184 AS DateTime), N'Rain,Rainy,Morocco,Maroc,المغربي,مطر,المطر,المغرب,المغربية,مغربي,مغربية,شتاء,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Sidi Belyout', N'a548d855eb55e9dd', N'  33.60734167,  -7.63256111', N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823196213143076864', N'Just posted a photo @ Hassan II Mosque https://t.co/27ehT9Dhiz', CAST(0x0000A73700F1BBB3 AS DateTime), CAST(0x0000A703010522C8 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Sidi Belyout', N'a548d855eb55e9dd', N'  33.60734167,  -7.63256111', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823205071815053312', N'https://t.co/OgSBrgpUTS', CAST(0x0000A73700F3C4AE AS DateTime), CAST(0x0000A703010ECDC8 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823207188072120321', N'Everyone you meet is fighting a battle you know nothing about.
Be kind. Always. https://t.co/dwNWycOdYD', CAST(0x0000A73700F3C4A9 AS DateTime), CAST(0x0000A70301111C68 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823211756885606401', N'RT @BloggerSidekick: "Your personal brand is who you are, you must define it, tell your story and share your passions!"  -@iSocialFanz http…', CAST(0x0000A73700F3C4A4 AS DateTime), CAST(0x0000A703011619C0 AS DateTime), N'', N'@BloggerSidekick,@iSocialFanz,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823212286240313344', N'C''est quoi ça @RAM_Maroc Est-ce normal ce discours ???? https://t.co/qmcASI0Fjl', CAST(0x0000A73700F3C4A0 AS DateTime), CAST(0x0000A7030116AD68 AS DateTime), N'', N'@RAM_Maroc,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823212988219924480', N'RT @aboulfeth: Est ce normal qu''un adaptateur USB-C Multiport AV coûte 59 Euros en France et 1490 Dhs chez @VirginMegaMaroc @Virgin ??', CAST(0x0000A73700F3C49B AS DateTime), CAST(0x0000A7030117711C AS DateTime), N'', N'@aboulfeth,@VirginMegaMaroc,@Virgin,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823232731828154369', N'@MeHdiELBaHi @RAM_Maroc @San9afis et si la Ram me répond ? Ou ils n''ont pas de temps pour démentir ?', CAST(0x0000A73700F3C496 AS DateTime), CAST(0x0000A703012CFD20 AS DateTime), N'', N'@MeHdiELBaHi,@RAM_Maroc,@San9afis,', N'183278308', N'WahidROUHLI', 33017, 833, N'Anfa', N'93e879312241ce12', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823235571795554304', N'@RAM_Maroc merci pour l''éclaircissement m.', CAST(0x0000A73700F3C491 AS DateTime), CAST(0x0000A7030130167C AS DateTime), N'', N'@RAM_Maroc,', N'183278308', N'WahidROUHLI', 33017, 833, N'Anfa', N'93e879312241ce12', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823249915333775360', N'جيبلي مغربي فاهم "منتدى السؤدد وحماه"، نجيبلك الحلقة الاخيرة ديال مسلسل سامحيني...', CAST(0x0000A73700F1BBB0 AS DateTime), CAST(0x0000A703013FBE4C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823300080216182790', N'52% des siteweb sont en EN mais seulement 25% des habitants de la planète comprennent l’EN. #Mozilla', CAST(0x0000A73700F3C48D AS DateTime), CAST(0x0000A70301767DEC AS DateTime), N'Mozilla,', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823464119852564480', N'https://t.co/pBWSDiCRkl', CAST(0x0000A73700F3C487 AS DateTime), CAST(0x0000A704009E0520 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823552371536052224', N'@YRoudaby @2Mtv je doute fort.. sik y avait pas le festival jidar, personne n''oserait faire des peintures murales et tout ça en cc à casa', CAST(0x0000A73700F3C483 AS DateTime), CAST(0x0000A70400FE5560 AS DateTime), N'', N'@YRoudaby,@2Mtv,', N'183278308', N'WahidROUHLI', 33017, 833, N'El Maarif', N'043051f4e4ba4f15', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823552502465335296', N'RT @LucaMerotta: .@JanaHainsworth "Public spending is not unlimited, but progressive universalism +adequate safety nets proven to be effect…', CAST(0x0000A73700F3C478 AS DateTime), CAST(0x0000A70400FE7AE0 AS DateTime), N'', N'@LucaMerotta,@JanaHainsworth,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823585047575924736', N'بحكم أنني كنت من بين أعضاء المبادرة المدنية لحل ملف الأساتذة المتدربين. فإن القرار بترسيب 150 أستاذا متدربا، سوى... https://t.co/HpBYKhuLC2', CAST(0x0000A73700F2071A AS DateTime), CAST(0x0000A7040121FF74 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823640407812829188', N'Your greatness is not what you have, it''s what you give.
#quote #motivation https://t.co/s253Vc8aan', CAST(0x0000A73700F3C473 AS DateTime), CAST(0x0000A704015E6B08 AS DateTime), N'quote,motivation,', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823812182878146560', N'@inwi pour ne plus accuser le compteur data, voici le même compteur sur le même téléphone avec ma deuxième ligne… https://t.co/6m23tGVnjF', CAST(0x0000A73700F3F608 AS DateTime), CAST(0x0000A705008E6200 AS DateTime), N'', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823878732419072000', N'المغاربة يريون معرفة كيف تم تمويل حملة  برلمانيي"البام".. كل التقارير التي رصدت انتخابات 7 أكتوبر، وقفت على... https://t.co/yLpEaOympi', CAST(0x0000A73700F20717 AS DateTime), CAST(0x0000A70500D70424 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823904228787757061', N'La province de Casablanca impose des conditions strictes pour les chauffeurs de taxis : 

- Le chauffeur n''a pas... https://t.co/WRanW5EMdg', CAST(0x0000A73700F3C46E AS DateTime), CAST(0x0000A70500F2D7F8 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823936341410975744', N'Pour les entreprises/utilisateurs qui souhaitent rejoindre une conversation déjà en cours sur les réseaux... https://t.co/qfGZubsbFj', CAST(0x0000A73700F3C468 AS DateTime), CAST(0x0000A7050115E3D8 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'823998096015245317', N'مبروك للمنتخب التأهل لدور الربع✌', CAST(0x0000A73700F20713 AS DateTime), CAST(0x0000A7050159495C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824168556011126784', N'@Fahdos Chkoun? #Inwi ? Ils vont faire des investigations et vérifier ma consommation data...', CAST(0x0000A73700F3F603 AS DateTime), CAST(0x0000A7060087D188 AS DateTime), N'Inwi,', N'@Fahdos,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824168927211257856', N'@Fahdos C''est pas la première fois qu''ils font ça pour moi, leurs experts vont sûrement trouver que c''est la faute de Google...', CAST(0x0000A73700F3F5FE AS DateTime), CAST(0x0000A706008839D4 AS DateTime), N'', N'@Fahdos,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824169179628638209', N'@Fahdos.. Android ne sait pas compter... Mais le con il se trompe que sur ma consommation.. 😏', CAST(0x0000A73700F3F5F9 AS DateTime), CAST(0x0000A70600888024 AS DateTime), N'', N'@Fahdos,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824172816421556224', N'Belle leçon matinale de la part de malik bentalha. 
Ce qui empêche les gens de vivre ensemble, c''est leurs... https://t.co/mx3KQxJNYi', CAST(0x0000A73700F3C463 AS DateTime), CAST(0x0000A706008C7828 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824190230844547072', N'Web 1.0 : Besoin de gens qui savent écrire sur leurs métiers plus que des gens qui savent faire de la publicité #guerredigitale @CFaillet', CAST(0x0000A73700F3C45E AS DateTime), CAST(0x0000A706009F79C8 AS DateTime), N'guerredigitale,', N'@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824192895129387009', N'#DTIWorkshop : Web 3.0 : Le web des data ( Blockchain, beacon, sémantique.. ) @CFaillet', CAST(0x0000A73700F3C459 AS DateTime), CAST(0x0000A70600A261EC AS DateTime), N'DTIWorkshop,', N'@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824195898246828032', N'#DTIWorkshop : Plus de je consomme plus l’algo me propose un service taillé pour mes besoins ( Netflix, Spotify ) #DeepLearning - @CFaillet', CAST(0x0000A73700F3C454 AS DateTime), CAST(0x0000A70600A5A8FC AS DateTime), N'DTIWorkshop,DeepLearning,', N'@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824196137183834116', N'@AmerBenouda Merci beaucoup pour le partage ;)', CAST(0x0000A73700F3C44D AS DateTime), CAST(0x0000A70600A5EBC8 AS DateTime), N'', N'@AmerBenouda,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824200972222296065', N'#DTIWorkshop : L’économie partagée est au coeur du web 3.0 - @CFaillet', CAST(0x0000A73700F3C446 AS DateTime), CAST(0x0000A70600AB32F4 AS DateTime), N'DTIWorkshop,', N'@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824202023436427265', N'#DTIWorkshop : L’entreprise 3.0 ne communique pas mais innove pour faciliter la vie de ses clients et collaborateurs - @CFaillet', CAST(0x0000A73700F3C43F AS DateTime), CAST(0x0000A70600AC57EC AS DateTime), N'DTIWorkshop,', N'@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824213058620977153', N'"Les mystères du Ralenti ! - [Science 2.0]" https://t.co/XeuYSIxrfp', CAST(0x0000A73700F3F5F0 AS DateTime), CAST(0x0000A70600B86320 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824214969814253568', N'#DTIworkshop : Le digital est en même temps un moyen et un fin ( tout dépend du business model ) - @CFaillet', CAST(0x0000A73700F3C43A AS DateTime), CAST(0x0000A70600BA7980 AS DateTime), N'DTIworkshop,', N'@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824232365929152512', N'#DTIWorkshop : Etude de Cas " Groupe Urgo " en cours ! @CFaillet https://t.co/CSdQE5TjGv', CAST(0x0000A73700F3C434 AS DateTime), CAST(0x0000A70600CD7670 AS DateTime), N'DTIWorkshop,', N'@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824234610376798208', N'Séminaire " La guerre du digital " https://t.co/xmyPEt7NV2', CAST(0x0000A73700F3C42F AS DateTime), CAST(0x0000A70600CFE964 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824236166874615808', N'#DTIWorkshop : La meilleure façon marketing d’approcher ses futures clients est de les écouter - @CFaillet https://t.co/LIGcyfBsju', CAST(0x0000A73700F3C429 AS DateTime), CAST(0x0000A70600D19C28 AS DateTime), N'DTIWorkshop,', N'@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824267043625177088', N'تحية كبرة للناس صحاب "المغرب أجمل بلد في العالم" :D :D :D https://t.co/eK2njoffYe', CAST(0x0000A73700F1BBA4 AS DateTime), CAST(0x0000A70600F34E54 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824325303975739405', N'Pour une fois je suis en train de rentrer chez moi à 18h.. plus fatigué que ça je peux pas #casa https://t.co/l4DFoDy7ri', CAST(0x0000A73700F3C423 AS DateTime), CAST(0x0000A7060132E4D8 AS DateTime), N'casa,', N'', N'183278308', N'WahidROUHLI', 33017, 833, N'El Maarif', N'043051f4e4ba4f15', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824332769539014656', N'RT @CFaillet: @WahidROUHLI merci Wahid pour le live tweet de la journée :-) à bientôt à Casa j''espère !', CAST(0x0000A73700F3C41B AS DateTime), CAST(0x0000A706013B0AC8 AS DateTime), N'', N'@CFaillet,@WahidROUHLI,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824333099320406016', N'@CFaillet à très bientôt :) c''était un énorme plaisir d''échanger avec toi. Tu es 👌🏻👌🏻', CAST(0x0000A73700F3C415 AS DateTime), CAST(0x0000A706013B6630 AS DateTime), N'', N'@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, N'Morocco', N'b5fc43481ea8b89a', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824334317321093125', N'@CFaillet haa dire que ce climat inhabituel ne fait qu''aggraver la situation.', CAST(0x0000A73700F3C40A AS DateTime), CAST(0x0000A706013CBB34 AS DateTime), N'', N'@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, N'Morocco', N'b5fc43481ea8b89a', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824334533122260992', N'@Mnboug tient.. on se Follow déjà :)', CAST(0x0000A73700F3C404 AS DateTime), CAST(0x0000A706013CF6F8 AS DateTime), N'', N'@Mnboug,', N'183278308', N'WahidROUHLI', 33017, 833, N'Ben M''sick', N'2c87e3b1b55eec2c', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824358187612667909', N'ابذِل مجهوداً في اصلاح ذاتِك بدلاً من تدخُلك فِي شُؤون الأخرين.', CAST(0x0000A73700F1BBA1 AS DateTime), CAST(0x0000A7060156C858 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824567999843733506', N'@CFaillet heureusement :) sinon, le froid à casa est 2fois plus intense que celui de Paris à cause de l''humidité :/ déjà à Paris ?', CAST(0x0000A73700F3C3FC AS DateTime), CAST(0x0000A70700B0430C AS DateTime), N'', N'@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, N'Casablanca', N'05e531dc6e2e5365', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824640089607245824', N'@JeanDenisG @Cabinet_Bolero @CFaillet possible de nous illuminer 😊?', CAST(0x0000A73700F3C2F5 AS DateTime), CAST(0x0000A70700FEF13C AS DateTime), N'', N'@JeanDenisG,@Cabinet_Bolero,@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824640469930016768', N'@youpiJob welcome', CAST(0x0000A73700F3C2EF AS DateTime), CAST(0x0000A70700FF5AB4 AS DateTime), N'', N'@YoupiJob,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824640649068744704', N'@az_amiral free yourself', CAST(0x0000A73700F3C2E8 AS DateTime), CAST(0x0000A70700FF8D18 AS DateTime), N'', N'@az_amiral,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824644959009644548', N'@JeanDenisG @Cabinet_Bolero @CFaillet oui oui.. je suis d''accord .. néanmoins étant un user intense.. les reco changent par moment', CAST(0x0000A73700F3C2DD AS DateTime), CAST(0x0000A707010441C8 AS DateTime), N'', N'@JeanDenisG,@Cabinet_Bolero,@CFaillet,', N'183278308', N'WahidROUHLI', 33017, 833, N'Morocco', N'b5fc43481ea8b89a', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824675873894830087', N'My friends in the Middle east ! Share and Join us ! ;) https://t.co/vsJqZ5ciFX', CAST(0x0000A73700F3C2DB AS DateTime), CAST(0x0000A7070125FE80 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824697054572191749', N'RT @K7al_L3afta: فّاسة ماخلاو لينا حنا العروبية حتى حاجة الدولة شادينها المناصب ديالهم الشركات ديالهم حتى من الـﯕـمل داوه لينا 😭😭', CAST(0x0000A73700F1BB93 AS DateTime), CAST(0x0000A707013D1C78 AS DateTime), N'', N'@K7al_L3afta,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'824698153110794241', N'@Spikoza ياكما الاخ من تما ههههه', CAST(0x0000A73700F1BB85 AS DateTime), CAST(0x0000A707013E4F80 AS DateTime), N'', N'@Spikoza,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825063817101058052', N'للناس لي باغيين مسلسل تشويق شوية. شوفو #StrangerThings مابيهش.', CAST(0x0000A73700F1BB7F AS DateTime), CAST(0x0000A7080141E2BC AS DateTime), N'StrangerThings,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825063900794195968', N'RT @babaksahbi: تقطع الورقة ديال #tramway #casablanca و تسناه نص ساعة و فالاخر ما يجيش و تبغي تخرج بحالك مايردو ليك حتا درهم #casa_transpor…', CAST(0x0000A73700F1BB6A AS DateTime), CAST(0x0000A7080141FA2C AS DateTime), N'tramway,casablanca,', N'@babaksahbi,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825063948294684675', N'RT @elkrari: Gmail bloque les piÃšces jointes JavaScript, vecteur courant de malwares https://t.co/IQiJJfxJSr https://t.co/JtrzN6DN1U', CAST(0x0000A73700F1BB5D AS DateTime), CAST(0x0000A70801420710 AS DateTime), N'', N'@elkrari,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825064169275797504', N'@Nisrine__el متفق تماما', CAST(0x0000A73700F1BB56 AS DateTime), CAST(0x0000A7080142452C AS DateTime), N'', N'@Nisrine__el,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825064570603573248', N'البنات لي دايرين تويتر كيعاودو لينا اش طرا لحظة بلحظة الماكلة السطاج القراية الخدمة و الدراري لي كيتبسلو عليهم....حق ربي وي دونت گيف ا فاك.', CAST(0x0000A73700F1BB50 AS DateTime), CAST(0x0000A7080142B5AC AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825104197255360513', N'Pour une fois je partage quelque chose de chouftv.. Utiliser le buzz autour de la jeune policière et son image... https://t.co/1FmyHUeaqJ', CAST(0x0000A73700F3C2D9 AS DateTime), CAST(0x0000A708016DF460 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825112592406437890', N'en train de regarder xXx Rectivated à MEGARAMA https://t.co/NpF11QZZEo', CAST(0x0000A73700F3C2D6 AS DateTime), CAST(0x0000A70801771E78 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825291235845894144', N'الزواج 😢😢😭😭 https://t.co/ZDbNxyzPgb', CAST(0x0000A73700F1BB49 AS DateTime), CAST(0x0000A70900AE94F8 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825292856940191744', N'RT @Klmat_Eng: "حرقوا جسر الوصل، ويسألوني عن سبب عدم زيارتي !" https://t.co/mY2tX6bC4m', CAST(0x0000A73700F1BB45 AS DateTime), CAST(0x0000A70900B05950 AS DateTime), N'', N'@Klmat_Eng,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825358224761176068', N'I''m addicted to shopping on AliExpress! Wanna join me? Here''s a US $4.00 coupon.
 https://t.co/8wybWg7sJM 
(from Al… https://t.co/5lUrnzZAks', CAST(0x0000A73700F1BB3C AS DateTime), CAST(0x0000A70900F7B0FC AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Hay-Hassani', N'b58a1611c14353a6', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825378612530577408', N'4 Education Marketing Trends to Keep an Eye on in 2017 https://t.co/H2p9EiwASy', CAST(0x0000A73700F3C2D5 AS DateTime), CAST(0x0000A709010DF178 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825381701220196352', N'3 Smart Resources That Help with Influencer Marketing https://t.co/ZkU9xr3qQu', CAST(0x0000A73700F3C2D3 AS DateTime), CAST(0x0000A70901115124 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825381701257924609', N'Case Study: Using influencers to quickly build an audience for your content https://t.co/e8Jajftu5U', CAST(0x0000A73700F3C2D1 AS DateTime), CAST(0x0000A70901115124 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825389275772514305', N'The Dark Side of Being A Social Media Influencer https://t.co/xWOBdXfjvR', CAST(0x0000A73700F3C2CF AS DateTime), CAST(0x0000A70901199460 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825399337702264834', N'LinkedIn ranks the 20 highest paying jobs https://t.co/uHgwkIUiLN', CAST(0x0000A73700F3C2CD AS DateTime), CAST(0x0000A70901248FB4 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825414428036329472', N'Which cities are hashtagged most on Instagram? New report ranks top 30 — sorry, Seattle https://t.co/AaEC24KvTW', CAST(0x0000A73700F3C2CB AS DateTime), CAST(0x0000A7090135081C AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825463160589139970', N'آخر ماكاينا فالطاكسيات الصغار فكازا ههههههه
شيرت لطاكسي قبيلا شوية...و قلت ليه "المستقبل سيدي معروف" قال ليا... https://t.co/2QKn3RRXqm', CAST(0x0000A73700F1BB39 AS DateTime), CAST(0x0000A709016A3820 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825468865979244546', N'مصر السيسي غنربحوهم وخا بونيا✌', CAST(0x0000A73700F2070F AS DateTime), CAST(0x0000A709017071E0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825674375697412098', N'RT @joshtrujillo: Video from earlier as thousands descended on Sea-Tac Airport near Seattle #seatacprotest #RefugeeBan #MuslimBan #OccupyAi…', CAST(0x0000A73700F3C2C8 AS DateTime), CAST(0x0000A70A00C53B68 AS DateTime), N'seatacprotest,RefugeeBan,MuslimBan,', N'@joshtrujillo,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825676576469745664', N'RT @RMadridBabe: Salute to all non-muslims voices against #MuslimBan, You restored my faith in humanity. #NoBanNoWall https://t.co/AWimQxRD…', CAST(0x0000A73700F3C2C6 AS DateTime), CAST(0x0000A70A00C7A178 AS DateTime), N'MuslimBan,NoBanNoWall,', N'@RMadridBabe,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825730159835770880', N'Le hashtag #deleteuber est en trending depuis hier sur les réseaux sociaux et la raison derrière est que... https://t.co/p5vWb7nRBR', CAST(0x0000A73700F3C2BE AS DateTime), CAST(0x0000A70A01021D58 AS DateTime), N'deleteuber,', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825733726227353602', N'And that is a strike https://t.co/VnOGQxjCZI', CAST(0x0000A73700F3C2BD AS DateTime), CAST(0x0000A70A01060170 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825740832284241920', N'@lyft hits @uber in the face. They donated 1M$ to @Aclu to fight against #Trump nonsense #deleteuber', CAST(0x0000A73700F3C2BA AS DateTime), CAST(0x0000A70A010DC298 AS DateTime), N'Trump,deleteuber,', N'@lyft,@Uber,@ACLU,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825741861407031296', N'RT @Alex_Verbeek: 🇺🇸 

Please RT

#DeleteUber. Uber''s CEO supports Trump.

Download @lyft that donates $1M to @ACLU. 

#DeleteUber #Downloa…', CAST(0x0000A73700F3C2B7 AS DateTime), CAST(0x0000A70A010EE1B4 AS DateTime), N'DeleteUber,DeleteUber,', N'@Alex_Verbeek,@lyft,@ACLU,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825810404530126848', N'@juventusfcen @MedhiBenatia you should send him back to his home for what he did today. #shame', CAST(0x0000A73700F3C2B6 AS DateTime), CAST(0x0000A70A0159B07C AS DateTime), N'shame,', N'@juventusfcen,@MedhiBenatia,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825810789659447302', N'الجلدة لا تريد😓', CAST(0x0000A73700F20702 AS DateTime), CAST(0x0000A70A015A1C4C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825813702637191168', N'RT @lopinion_inter: Comment Mohammed VI gère son grand retour dans la famille de l’Union africaine https://t.co/kwBiKP1HsS', CAST(0x0000A73700F3C2B4 AS DateTime), CAST(0x0000A70A015D4AC0 AS DateTime), N'', N'@lopinion_inter,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825817893690626048', N'Et le Maroc de divise en attaques et félicitations! Vous êtes dans quel clans ?', CAST(0x0000A73700F3C2B1 AS DateTime), CAST(0x0000A70A0161DD74 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'825994510157099008', N'Inbound Marketing Tips and Tricks for 2017 https://t.co/q92FuQkopD', CAST(0x0000A73700F3C2AF AS DateTime), CAST(0x0000A70B00971DF0 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826037515622707200', N'22 Social Media Resources for a Stunning Social Strategy https://t.co/Ieg19BuHmH', CAST(0x0000A73700F3C2AD AS DateTime), CAST(0x0000A70B00C60D2C AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826072491676282882', N'التشادي "موسى فكي" يفوز ويخلف "زوما" على رأس مفوضية الاتحاد الإفريقي https://t.co/d9EnbYeoed', CAST(0x0000A73700F206FE AS DateTime), CAST(0x0000A70B00EC3970 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826086418577506304', N'Budget Planning, Hiring, Training &amp; More: The Complete 2017 Marketing Strategy Kit [Free Download] https://t.co/kUvYkT3B1D', CAST(0x0000A73700F3C2AB AS DateTime), CAST(0x0000A70B00FB6C10 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826092661849341954', N'Today at @Starbucks Casaanfa, my CC didn''t work, so the manager offered me a free drink! Thank you guys ! That''s the spirit of community !', CAST(0x0000A73700F3C2A9 AS DateTime), CAST(0x0000A70B01023CFC AS DateTime), N'', N'@Starbucks,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826119609254342656', N'Le #Maroc réintègre officiellement l''union africaine ! #twittoma #economy #AfricanUnion', CAST(0x0000A73700F3C2A7 AS DateTime), CAST(0x0000A70B011FA648 AS DateTime), N'Maroc,twittoma,economy,AfricanUnion,', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826120449608314880', N'Le #Maroc reçoit une majorité écrasante de 42 voix ! Donc, nous faisons officiellement partie de... https://t.co/LNAbRZch0b', CAST(0x0000A73700F3C2A5 AS DateTime), CAST(0x0000A70B012090A8 AS DateTime), N'Maroc,', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826126643936763904', N'Books for Thought Leaders in 2017 https://t.co/6YoBSjHCj6', CAST(0x0000A73700F3C2A2 AS DateTime), CAST(0x0000A70B01275384 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826136525222117380', N'Quelqu''un pour m''indiquer la procédure de fermeture d''un compte #BMCIMaroc ? @BNPParibas_SAV Merci pour votre aide ! #twittoma #RT', CAST(0x0000A73700F3C2A0 AS DateTime), CAST(0x0000A70B01321C74 AS DateTime), N'BMCIMaroc,twittoma,RT,', N'@BNPParibas_SAV,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826139211845791744', N'@BNPParibas_SAV Si oui, allez voir avec eux ? c''est ça la réponse ?', CAST(0x0000A73700F3C29D AS DateTime), CAST(0x0000A70B01350A74 AS DateTime), N'', N'@BNPParibas_SAV,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826146136981385216', N'المال....هذاك لي كيفكر فالحب يعاودها لمو. من لخر. https://t.co/rc3RN3FZv8', CAST(0x0000A73700F1BB36 AS DateTime), CAST(0x0000A70B013C9938 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826193289703522312', N'@GhizlaneRadi haaaa', CAST(0x0000A73700F3C29B AS DateTime), CAST(0x0000A70B01700F70 AS DateTime), N'', N'@GhizlaneRadi,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826355249245995008', N'@GhizlaneRadi but likable', CAST(0x0000A73700F3C298 AS DateTime), CAST(0x0000A70C00955164 AS DateTime), N'', N'@GhizlaneRadi,', N'183278308', N'WahidROUHLI', 33017, 833, N'Ben M''sick', N'2c87e3b1b55eec2c', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'826944232057364480', N'@OrangeMaroc : J''ai fait une portabilité de @Maroc_Telecom vers vous. Mais la couverture est nulle même en pleine Casa. IAM top... tt Maroc.', CAST(0x0000A73700F1BB32 AS DateTime), CAST(0x0000A70E00011CC4 AS DateTime), N'', N'@OrangeMaroc,@Maroc_Telecom,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827133882222968832', N'مجلس فاس خصص 340 مليون درهم للبنيات الثقافية.. وهذا كان الخبر المهم في دورة مجلس الجماعة لشهر فبراير... لكن البعض... https://t.co/pmubKzk5bu', CAST(0x0000A73700F206F9 AS DateTime), CAST(0x0000A70E00D01844 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827147589443280896', N'Hi @JanaHainsworth ! I hope you''re doing fine ;)', CAST(0x0000A73700F3C295 AS DateTime), CAST(0x0000A70E00DF0DF4 AS DateTime), N'', N'@JanaHainsworth,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827151029410082817', N'@JanaHainsworth I don''t know if you''re aware of it, but @Eurochild_org might be eligible for a monthly Grant of $10,000 from #Google in #Ads', CAST(0x0000A73700F3C292 AS DateTime), CAST(0x0000A70E00E2CEE4 AS DateTime), N'Google,Ads,', N'@JanaHainsworth,@Eurochild_org,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827151581518905344', N'@JanaHainsworth U could recruit more volunteers, attract more donations &amp; share your story with audiences all over the globe @Eurochild_org', CAST(0x0000A73700F3C290 AS DateTime), CAST(0x0000A70E00E36994 AS DateTime), N'', N'@JanaHainsworth,@Eurochild_org,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827163830606262272', N'"لكم" يكشف حقيقة منع "الأزمي" لمحلات التدليك المختلطة بفاس (+ وثيقة القرار الجماعي) https://t.co/OpScgRmi6Y', CAST(0x0000A73700F206F4 AS DateTime), CAST(0x0000A70E00F0C774 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827184237308674048', N'توضيح: انا مع الغاء مساهمة الدولة في معاشات البرلمانيين والوزراء ومع تقليص اجور الموظفون السامونة وكبار... https://t.co/BfrwEdX3k4', CAST(0x0000A73700F206F0 AS DateTime), CAST(0x0000A70E01070DCC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827226513351258112', N'Est-il le bon moment pour s''intéresser un peu à la bourse africaine après la réintégration du maroc ? Avis d''expert plzz @BoursedeCasa', CAST(0x0000A73700F3C28D AS DateTime), CAST(0x0000A70E01353120 AS DateTime), N'', N'@BoursedeCasa,', N'183278308', N'WahidROUHLI', 33017, 833, N'Morocco', N'b5fc43481ea8b89a', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827283642565132289', N'Hey ! quelqu''un connait une application d''édition de chèques Marocains?', CAST(0x0000A73700F3C28A AS DateTime), CAST(0x0000A70E01738B3C AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827451135078301696', N'@ajonart welcome! I guess this might interest you or your friends https://t.co/oYmVnhaa0l cc @FaridYandouz', CAST(0x0000A73700F3C287 AS DateTime), CAST(0x0000A70F009ED5B8 AS DateTime), N'', N'@ajonart,@FaridYandouz,', N'183278308', N'WahidROUHLI', 33017, 833, N'Ben M''sick', N'2c87e3b1b55eec2c', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827510101057687552', N'لازلت مصرا على ان الحملة التي يتم شنها على البرلمان، غير بريئة بالمرة.. من يعرق عمل المؤسسات بالبلد.؟ عليه ان... https://t.co/UTITudVbe0', CAST(0x0000A73700F206EB AS DateTime), CAST(0x0000A70F00DF311C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827557623310516225', N'رحم الله ادريس بنعلي https://t.co/lnVP4hw26Z', CAST(0x0000A73700F206E1 AS DateTime), CAST(0x0000A70F01130E74 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827592682943963138', N'شي وحدين ف حياتك دايرين فحال شي  أغاني لي ف بورطابلك ماتقدر تسمع ليهم...ماتقدر تمسحهم...المهم كاينين.', CAST(0x0000A73700F1BB2F AS DateTime), CAST(0x0000A70F01395228 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827594925348888576', N'@Soulaimaniya c''est tbeg ou midona avec un language purement 3robi 😁😁😁', CAST(0x0000A73700F1BB2C AS DateTime), CAST(0x0000A70F013BC3F0 AS DateTime), N'', N'@Soulaimaniya,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827661232396197891', N'60 person already ! You might be interested in meeting me and my friends in Rabat . https://t.co/9HomRZJHwh', CAST(0x0000A73700F3C285 AS DateTime), CAST(0x0000A70F0184221C AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827686585466486785', N'@JanaHainsworth it''s a 10000$ in kind grant given every month, to members of #GoogleNonProfits, for free ads on https://t.co/5dLsO8EpbF 1/2', CAST(0x0000A73700F3C282 AS DateTime), CAST(0x0000A71000144C18 AS DateTime), N'GoogleNonProfits,', N'@JanaHainsworth,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827687066125352963', N'@JanaHainsworth Check their website to learn more and make sure you are eligible ! if so, you need to enroll : https://t.co/zZjvg9Qres 2/2', CAST(0x0000A73700F3C27B AS DateTime), CAST(0x0000A7100014D1B0 AS DateTime), N'', N'@JanaHainsworth,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827940064911093760', N'Mohamed El Ouali - LAM3AFER (Exclusive Music Video) | محمد الوالي - لمعفر: https://t.co/B86Ghc6agS via @YouTube', CAST(0x0000A73700F1BB25 AS DateTime), CAST(0x0000A7100128F130 AS DateTime), N'', N'@YouTube,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'827985834091671552', N'Aujourd''hui c''est terreur ! — en train de regarder Rings Movie à MEGARAMA https://t.co/RIqpDRVJak', CAST(0x0000A73700F3C279 AS DateTime), CAST(0x0000A710015AE4B0 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828042402489303040', N'RT @KimDotcom: https://t.co/DN0ajm5gdU https://t.co/pRo5LiP71g', CAST(0x0000A73700F3C277 AS DateTime), CAST(0x0000A711000D1FC4 AS DateTime), N'', N'@KimDotcom,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828205103685451776', N'وتستمر مهزلة @inwi 
#TouchePasAMa4G
#JeNeRecommandePlusInwi
#LeForfait30InwiGoEstUneArnaque https://t.co/JOwXFKMmS9', CAST(0x0000A73700F3F5E3 AS DateTime), CAST(0x0000A71100BEB1F8 AS DateTime), N'TouchePasAMa4G,JeNeRecommandePlusInwi,LeForfait30InwiGoEstUneArnaque,', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828352963731214340', N'@Almuraqiba لا غير سيرتو اللي إباحية.. وكلامو خاسر لا يصلح للأطفال', CAST(0x0000A73700F39BD5 AS DateTime), CAST(0x0000A71101601214 AS DateTime), N'', N'@Almuraqiba,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828368398455361538', N'RT @waiel65: الأكثر مدعاة للحزن، من الهزيمة في الكرة، هي الهزيمة الحضارية التي ينتعش معها محصول الوطنية الفاسدة والوطنية المزيفة.', CAST(0x0000A73700F39BD1 AS DateTime), CAST(0x0000A7110170EA94 AS DateTime), N'', N'@waiel65,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828375866119958528', N'@zouhirliberty https://t.co/h9mrnWj5Kq', CAST(0x0000A73700F39BCC AS DateTime), CAST(0x0000A71101791084 AS DateTime), N'', N'@zouhirliberty,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828398482574671874', N'RT @alhayat_Cul: «الكميون الثقافي» ...فرح لأطفال المناطق الحدودية التونسية
https://t.co/aYbDZsw6SD
#مجتمع #ثقافة #تونس https://t.co/vnfmRFA…', CAST(0x0000A73700F39BC8 AS DateTime), CAST(0x0000A71200063D44 AS DateTime), N'مجتمع,ثقافة,تونس,', N'@alhayat_Cul,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828671504992845824', N'البنت مسكينة باغية واحد زوين, لاباس عليه, عندو الطوموبيل, خدمة واعرة, الدار, و الأفكار الوردية, و گاع داكشي لي... https://t.co/c8UwF6l1o4', CAST(0x0000A73700F1BB21 AS DateTime), CAST(0x0000A7120130374C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828732508569210880', N'Yes you do ! https://t.co/jnLJBXB5lL', CAST(0x0000A73700F3C271 AS DateTime), CAST(0x0000A7120172CB0C AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828743779762974720', N'@aborifi لم يكن هناك معلمين أصحاب شواهد مما اضطر الدولة لتوظيف ما دون البكالوريا لأن الإستعمار الفرنسي مارس التجهيل
https://t.co/k9tzSKN0N2', CAST(0x0000A73700F39BC3 AS DateTime), CAST(0x0000A712017F190C AS DateTime), N'', N'@aborifi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828745251837898752', N'@aborifi غير تاريخ 1942 كان المغرب تحت الإستعمار .. ربما كان تعليم في المدارس الخاصة التي أسسها الوطنيون', CAST(0x0000A73700F39BBE AS DateTime), CAST(0x0000A7120180B460 AS DateTime), N'', N'@aborifi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828746705554243589', N'@hamza_beurdy  هل تعلم أن ماروخا ماشي شكلاط', CAST(0x0000A73700F39BBA AS DateTime), CAST(0x0000A712018249D8 AS DateTime), N'', N'@hamza_beurdy,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828749142717562884', N'@hamza_beurdy الطفولة ديالنا دازت وحنا ما عرفيش أش كانوا يوكلونا بدل الشكلاط', CAST(0x0000A73700F39BB6 AS DateTime), CAST(0x0000A7120184F2B4 AS DateTime), N'', N'@hamza_beurdy,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828750861920849921', N'RT @feryate: الموقع الشهير ketab 
 دار تحديث للائحة :  2065  رواية للتحميل
https://t.co/V0x2Ndl7dV', CAST(0x0000A73700F39BB1 AS DateTime), CAST(0x0000A7120186D32C AS DateTime), N'', N'@feryate,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828755060494577664', N'أكثر من 15 ألف طبيب يشتغل في أمريكا من الدول الإسلامية السبعة التي يمسها حظر ترامب 
https://t.co/lacgCgrNKu', CAST(0x0000A73700F39BAD AS DateTime), CAST(0x0000A712018B6838 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828758268675780610', N'بالمناسبة، في المغرب حوالي 18 ألف طبيب لأكثر من 30 مليون مواطن', CAST(0x0000A73700F39BA8 AS DateTime), CAST(0x0000A713000366B4 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828759760346415105', N'RT @ajmubasher: اشتباكات بين الشرطة المغربية ومحتجين شمالي البلاد | الجزيرة مباشر https://t.co/WOuemWjo7I https://t.co/5tDPunJwnE', CAST(0x0000A73700F39BA3 AS DateTime), CAST(0x0000A713000507E4 AS DateTime), N'', N'@ajmubasher,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828760243425402881', N'تذكرت "الآنسة قواعد" هههه 
https://t.co/BUFXOY0k9I', CAST(0x0000A73700F39B9E AS DateTime), CAST(0x0000A71300058EA8 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828763705571676160', N'عجيب :|
"مسابقة القفز في نفق هوائي بإسبانيا"
 https://t.co/4QrbuwNiYO', CAST(0x0000A73700F39B9A AS DateTime), CAST(0x0000A71300095574 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828767786851786754', N'RT @SaidBahraoui: @blafrancia  ولا الذي يكتب : الغير متزوجات / لا   تتزوجين / لا تساهمين / أقطعي، والأصح غير المتزوجات / لا تتزوجي / لا تسا…', CAST(0x0000A73700F39B96 AS DateTime), CAST(0x0000A713000DC9B0 AS DateTime), N'', N'@SaidBahraoui,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828769023135457280', N'إعلان جميل للقناة الثانية للدنمارك يدعو للاعتزاز بمجتمع متنوع وعدم وضع "الآخر" في "خانات جاهزة"
 All That We Share 
https://t.co/4l5fs2rDc5', CAST(0x0000A73700F39B91 AS DateTime), CAST(0x0000A713000F2364 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'828918268412862465', N'Ceci est ma #meilleure découverte de l''année 2017 à cet instant !
Tant de choses à dire mais je vous laisse avec... https://t.co/tqoMkrwxd1', CAST(0x0000A73700F3C25E AS DateTime), CAST(0x0000A71300B20638 AS DateTime), N'meilleure,', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829065257914134528', N'@rachiidiii hahahahah, yes :D @OrangeMaroc @Maroc_Telecom', CAST(0x0000A73700F1BB1E AS DateTime), CAST(0x0000A71301527294 AS DateTime), N'', N'@rachiidiii,@OrangeMaroc,@Maroc_Telecom,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'lv')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829066190811168768', N'@cesef pas si cool, il est ça va le film :)', CAST(0x0000A73700F1BB1B AS DateTime), CAST(0x0000A713015376BC AS DateTime), N'', N'@cesef,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829067135884394496', N'@cesef je crois celui là est bon... https://t.co/4wyn0X9aYu', CAST(0x0000A73700F1BB18 AS DateTime), CAST(0x0000A71301547F94 AS DateTime), N'', N'@cesef,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829067642690494464', N'C''est qui Salim Cheikh?', CAST(0x0000A73700F1BB14 AS DateTime), CAST(0x0000A71301550D60 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829068598287200262', N'@HdayaDouz je vais googler et voir ach wa93, merci :)', CAST(0x0000A73700F1BB11 AS DateTime), CAST(0x0000A71301561764 AS DateTime), N'', N'@HdayaDouz,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829069106896842752', N'@take_a_taff @a7dadi حنا ما لقينا لا لي يدخل لتويتر على ودنا لا لي يشاطي معانا و هو حدانا ههههه', CAST(0x0000A73700F1BB0E AS DateTime), CAST(0x0000A7130156A65C AS DateTime), N'', N'@a7dadi,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829069568417132545', N'@K7al_L3afta صافي؟ اصلا ولاو فيهم البوسان و العرى على الجهد دابا هههه', CAST(0x0000A73700F1BB0B AS DateTime), CAST(0x0000A71301572744 AS DateTime), N'', N'@K7al_L3afta,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829073192698388483', N'ﺍﻷ‌ﻃﺒﺎﺀ كايقولو : " ﺍﻟﺴﻬﺮ ﻣﻀﺮ ﺑﺎﻟﺼﺤﺔ "
ﻭ ﺍﻟﺤﻜﻤﺎﺀ كايقولو : " ﻣﻦ ﺃﺭﺍﺩ ﺍﻟﻌﻠﻰ ﺳﻬﺮ ﺍﻟﻠﻴﺎﻟﻲ "
و أنا غا نگوليك بلا... https://t.co/uAIzbUSNr4', CAST(0x0000A73700F1BB08 AS DateTime), CAST(0x0000A713015B1BC4 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829073845999005696', N'#ملي أندرويد تايحسب بالميلادي، #إينوي متشبتة بالأصالة، تاتحسب بالهجري !
#RT_Souhaité… https://t.co/f8WCfiyxxb', CAST(0x0000A73700F3F5DE AS DateTime), CAST(0x0000A713015BD168 AS DateTime), N'ملي,إينوي,RT_Souhaité,', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829112116300886018', N'@Fahdos Ce que je vais faire c''est que je vais pas me taire ! 😉 @inwi', CAST(0x0000A73700F3F5D8 AS DateTime), CAST(0x0000A713018596C4 AS DateTime), N'', N'@Fahdos,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829119458803347456', N'@Fahdos Je compte bien publier un article sur mon blog dès que je trouve le temps.. @inwi', CAST(0x0000A73700F3F5D2 AS DateTime), CAST(0x0000A7140002178C AS DateTime), N'', N'@Fahdos,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829126676395261952', N'RT @AmnestyAR: شاهدوا هذا الفيديو المبني على أحداث واقعية سردها حراس ومسؤولون سابقون، ومعتقلون تم احتجازهم في سجن #صيدنايا https://t.co/SWC…', CAST(0x0000A73700F39B8D AS DateTime), CAST(0x0000A7140009F858 AS DateTime), N'صيدنايا,', N'@AmnestyAR,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829127336767414272', N'RT @AmnestyAR: الإبادة الممنهجة في سجن #صيدنايا #سوريا: بامكانكم تحميل التقرير الكامل باللغتين العربية والانكليزية على هذا الرابط https://t…', CAST(0x0000A73700F39B89 AS DateTime), CAST(0x0000A714000AB180 AS DateTime), N'صيدنايا,سوريا,', N'@AmnestyAR,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829127562605510656', N'RT @AmnestyAR: علينا أن نتحرك لإيقاف الجرائم ضد الإنسانية في #صيدنايا. شاركوا في حملتنا لممارسة الضغط الدولي على الحكومة السورية https://t.…', CAST(0x0000A73700F39B84 AS DateTime), CAST(0x0000A714000AF0C8 AS DateTime), N'صيدنايا,', N'@AmnestyAR,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829141202721263616', N'How is it that you don''t respect your employees rights in #Morocco ! Shame on you @dell @MichaelDell https://t.co/eW2Ar2xEX8', CAST(0x0000A73700F3C25A AS DateTime), CAST(0x0000A7140019D3B8 AS DateTime), N'Morocco,', N'@Dell,@MichaelDell,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829468166002769920', N'RT @Bou_nouara: هاد السؤال جاني فالواتساب و ما عرفتش نجاوب عليه 😔 https://t.co/aEG4ySS5If', CAST(0x0000A73700F39B7F AS DateTime), CAST(0x0000A714017EAC10 AS DateTime), N'', N'@Bou_nouara,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829473136588496897', N'RT @Quran_Chart: @Bou_nouara @blafrancia الجواب: "ر" وهو واحد من 10 أفعال أمر كلها عبارة عن حرف واحد..مثال...وقى يقي ق ..وأى يئي إ..وعى يعي…', CAST(0x0000A73700F39B42 AS DateTime), CAST(0x0000A714018418BC AS DateTime), N'', N'@Quran_Chart,@Bou_nouara,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829475478176165888', N'RT @alddadmag: تصفح جميع أعداد #مجلة_الضاد_للغة_العربية وعلم طفلك أفضل القصص والدروس الممتعة التي تتناول #اللغة_العربية 
https://t.co/GwY8K…', CAST(0x0000A73700F39B3C AS DateTime), CAST(0x0000A7140186A6A4 AS DateTime), N'مجلة_الضاد_للغة_العربية,اللغة_العربية,', N'@alddadmag,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829476557190262784', N'RT @Moncef_Marzouki: المضحكات المبكيات 
وزير خارجية السفاح يتهمني بأنني حرّضت الشباب التونسي على الذهاب لسوريا لقتل السوريين...
https://t.c…', CAST(0x0000A73700F39B37 AS DateTime), CAST(0x0000A7140187D3D0 AS DateTime), N'', N'@Moncef_Marzouki,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829491969747464194', N'"الحب ماخاصكش تقلب عليه...الحب كيجي بوحدو حتى لعندك"

-خديجة. الملقبة ب كاتي عند المقربين ...73 سنة سيليباطير.', CAST(0x0000A73700F1BB05 AS DateTime), CAST(0x0000A715000D2474 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829672638234628096', N'Are we gonna have our own version of the flash? And all these metahumans.. https://t.co/xS2tGmm7qa', CAST(0x0000A73700F3C256 AS DateTime), CAST(0x0000A71500D252F8 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829680650538086402', N'😍
https://t.co/NSQLNWYUdu', CAST(0x0000A73700F3F5CD AS DateTime), CAST(0x0000A71500DB1140 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829700314718679041', N'Quelle perception pour ce marketing social ? https://t.co/VfXtEidpMO', CAST(0x0000A73700F3C254 AS DateTime), CAST(0x0000A71500F08700 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829724499977322498', N'السياسة بسالت فهاد البلاد... هادشي لا يبشر بالخير.', CAST(0x0000A73700F206DD AS DateTime), CAST(0x0000A715010AEC08 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829731149203251200', N'واحد الصديقة عزيزة التقيتها بالأمس.. قالت لي: كنفرح شي نهار فاش كنلقاك مكتبتيش على بنكيران او البجيدي.. وصديق أخر... https://t.co/Vw74J9tR6h', CAST(0x0000A73700F206D1 AS DateTime), CAST(0x0000A71501122EA0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829738750544605185', N'#NowPlaying Un Peu De Soleil de Martial ♫ https://t.co/uWLAo6Wolb', CAST(0x0000A73700F3C253 AS DateTime), CAST(0x0000A715011A7A10 AS DateTime), N'NowPlaying,', N'', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829758055977984000', N'اذا صح كلام أرسلان.. فهذه تسمى ممارسات فاشية ..اين الجمعيات الحقوقيات من والمثقفين والاصوات الحرة؟؟ هذه الممارسات... https://t.co/9syEqKu1Qm', CAST(0x0000A73700F206CE AS DateTime), CAST(0x0000A715012F8C34 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829766620834828288', N'Du nouveau dans mon problème #TouchePasAMa4G avec @inwi, ce matin ils ont reconnu qu''il y a erreur et qu''il vont me… https://t.co/YCiogZlo9y', CAST(0x0000A73700F3F5C8 AS DateTime), CAST(0x0000A7150138E52C AS DateTime), N'TouchePasAMa4G,', N'@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829767216279252996', N'@Tic_Maroc Pas toujours reçu l''sms de confirmation pour faire la fête 🎉 @inwi', CAST(0x0000A73700F3F5C2 AS DateTime), CAST(0x0000A71501398B94 AS DateTime), N'', N'@Tic_Maroc,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829768381129703424', N'@Tic_Maroc croisons les doigts... @inwi', CAST(0x0000A73700F3F5BD AS DateTime), CAST(0x0000A715013AD15C AS DateTime), N'', N'@Tic_Maroc,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'829825289312165888', N'واحد تايسول من نيتو ف فيسبوكو: "عندي حساب في الفايسبوك هادي 8 سنوات آش نقدر ندير بيه باش ندخل فلوس.؟"

-تقدر تقرى... https://t.co/j2l6ntcRAo', CAST(0x0000A73700F1BB02 AS DateTime), CAST(0x0000A7150178ED5C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830032607647768576', N'@Smael_Sebti tu t''y mets aussi ! J''adore le tweet', CAST(0x0000A73700F3C251 AS DateTime), CAST(0x0000A71600CFAECC AS DateTime), N'', N'@Smael_Sebti,', N'183278308', N'WahidROUHLI', 33017, 833, N'Ben M''sick', N'2c87e3b1b55eec2c', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830038764919590914', N'Hello chère @NouamaH ! Je t''avoue que je suis aussi à la recherche d''un dev! Sinon pour quel besoin ton webmaster pptre que j''en connais..', CAST(0x0000A73700F3C24F AS DateTime), CAST(0x0000A71600D6671C AS DateTime), N'', N'@NouamaH,', N'183278308', N'WahidROUHLI', 33017, 833, N'Ben M''sick', N'2c87e3b1b55eec2c', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830045957265977346', N'واحد خونا في الفيسبوك، قال لي نجيب والله حلمت بك البارح..خير وسلام اسي ؟.. رد: حلمت دوزت انا وياك وعبد الرحيم... https://t.co/S5gavFmnU9', CAST(0x0000A73700F206CA AS DateTime), CAST(0x0000A71600DE40E0 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830071127724720129', N'RT @AZERTYquerty006: #اللغة_العربية تزيح #اللغة_الفرنسية من عرش #الفايسبوك المغربي وتصبح اللغة الأكثر استعمالا من طرف رواد الموقع الأزرق في…', CAST(0x0000A73700F39B32 AS DateTime), CAST(0x0000A71600F9B94C AS DateTime), N'اللغة_العربية,اللغة_الفرنسية,الفايسبوك,', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830075645652779009', N'Recroisons les doigts ! #TouchePasAMa4G https://t.co/WOJzOLytsS', CAST(0x0000A73700F3F5B7 AS DateTime), CAST(0x0000A71600FEA768 AS DateTime), N'TouchePasAMa4G,', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830075811696955393', N'@Fahdos Dommage pour ceux qui ne se sont pas rendu compte... @inwi', CAST(0x0000A73700F3F5AA AS DateTime), CAST(0x0000A71600FED648 AS DateTime), N'', N'@Fahdos,@inwi,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830082790465089537', N'حسن أوريد: عندما نسمع رئيس دولة لا يحسن اللغة العربية ولا يحترم قواعدها، فهذا يخلف أثرا لدى شعبه
https://t.co/anZ9kIWvCV', CAST(0x0000A73700F39B2C AS DateTime), CAST(0x0000A71601067448 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830083606555029505', N'حسن أوريد: المثقف الذي يتحدث بالفرنسية ويكتب بها أصبح أقل تأثيرا.. ولا يجب أن تكون الفرنسية وسيلة لاستعلاء البعض وإعطاء الدروس للجمهور..', CAST(0x0000A73700F39B27 AS DateTime), CAST(0x0000A716010757A0 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830103974900531206', N'نعاود لكم أش حلمت ولا بلاش؟. خفت نعاود وميصدقش صحيح وخفت نسكت ويصدق صحيح.. :D', CAST(0x0000A73700F206C7 AS DateTime), CAST(0x0000A716011D9240 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830111449842319360', N'المهم خير وسلام يا أهل السياسة والاحلام؟: حلمت انتخابات تعاودت واعتقالات في صفوف قيادات العدل والاحسان وشي بركة... https://t.co/riRCMay0aN', CAST(0x0000A73700F206C3 AS DateTime), CAST(0x0000A7160125BBB4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830129433168207872', N'-اشنو غادي تهديني ف عيد الحُب؟
-أنا لا أُهدي و انت لا تُهدي، و لكن الله يُهدي من يشاء...

صافي نقصو شوية علينا من هاد الموضوع.', CAST(0x0000A73700F1BAFC AS DateTime), CAST(0x0000A71601395B88 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830129898106789889', N'@FaridYandouz @essec @centralesupelec je t''en parlerai dès que je te vois.. data science', CAST(0x0000A73700F3C245 AS DateTime), CAST(0x0000A7160139DD9C AS DateTime), N'', N'@FaridYandouz,@essec,@centralesupelec,', N'183278308', N'WahidROUHLI', 33017, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830161527244279809', N'RT @SaidBahraoui: @blafrancia وهذا هو الملاحظ في وسائل التواصل الإجتماعي حيث أضحت العربية أو الدارجة من أهم لغات التواصل من بعض المؤثرين في…', CAST(0x0000A73700F39B21 AS DateTime), CAST(0x0000A716015C62B8 AS DateTime), N'', N'@SaidBahraoui,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830165298535886849', N'RT @dw_arabic: الصحفي والخبير في الشؤون الأوروبية، أكثم سليمان، يشرح الآلية التي تؤدي إلى ابتعاد النخبة السياسية عن المواطن العادي في ألمان…', CAST(0x0000A73700F39B1B AS DateTime), CAST(0x0000A7160160803C AS DateTime), N'', N'@dw_arabic,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830168252634509312', N'كاتبدا تضرب فالعدس حتى كا تسكر و تجي تكتب فالفيسبوك " أنا و شوكولاطة نوتيلا...قصة عشق لا تنتهي".

اه اختي، نوتيلا حبوب.', CAST(0x0000A73700F1BAF9 AS DateTime), CAST(0x0000A7160163B93C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830176015997612032', N'"السلم والحرب في أوروبا خلال 400 سنة الأخيرة"
ربما الشرق الأوسط لا يزال يعيش عام 1800 

via @moriscbandoler https://t.co/IN6tmihEt8', CAST(0x0000A73700F39B12 AS DateTime), CAST(0x0000A716016C3260 AS DateTime), N'', N'@moriscbandoler,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830177976759226369', N'RT @Bla_Francia: انتقادات للحكومة المغربية بسبب تقرير وزاري عن حقوق الإنسان ... تم تقديمه للبرلمان باللغة الفرنسية! 
https://t.co/0atXQkODF5', CAST(0x0000A73700F39B08 AS DateTime), CAST(0x0000A716016E56D0 AS DateTime), N'', N'@Bla_Francia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830180964773007360', N'RT @hrw_ar: #بورما: اغتصاب نساء الروهينغا لم يكن عشوائيا أو فرديا، بل كان جزءا من هجوم منسق ومنهجي دافعه الانتماء الديني والعرقي https://t.…', CAST(0x0000A73700F39B01 AS DateTime), CAST(0x0000A71601719930 AS DateTime), N'بورما,', N'@hrw_ar,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830184213420838913', N'@chehbi الرحالة محمد بن الحسن', CAST(0x0000A73700F39AFA AS DateTime), CAST(0x0000A71601752564 AS DateTime), N'', N'@chehbi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830187637520658433', N'الممانعة.. نسخة 2017 
"الأسد يرحب بالجيش الأميركي لقتال داعش في سوريا.. شريطة التعاون مع النظام"', CAST(0x0000A73700F39AF4 AS DateTime), CAST(0x0000A7160178E1A4 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830193358270238720', N'RT @shaikh_al3arab: @blafrancia @Bla_Francia @eahram الأنكى أن تسمع رئيس دولة لغتها الرسمية هي العربية و يلقي خطابا بلغة المستعمر في محفل ر…', CAST(0x0000A73700F39AED AS DateTime), CAST(0x0000A716017F2014 AS DateTime), N'', N'@shaikh_al3arab,@blafrancia,@Bla_Francia,@eahram,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830200982680252419', N'@CordassaY الشعارات الفارغة', CAST(0x0000A73700F39AE5 AS DateTime), CAST(0x0000A7160187728C AS DateTime), N'', N'@CordassaY,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830201224972599296', N'RT @Snowden: Finally: irrefutable evidence that I never cooperated with Russian intel. No country trades away spies, as the rest would fear…', CAST(0x0000A73700F39ADF AS DateTime), CAST(0x0000A7160187B684 AS DateTime), N'', N'@Snowden,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830201807712436224', N'@soureal_ ماشي بعيد.. ولكن بوتين يقدر يبان ضعيف إلى دارها', CAST(0x0000A73700F39AD9 AS DateTime), CAST(0x0000A71601885968 AS DateTime), N'', N'@soureal_,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830203908551221248', N'@yass1nz @soureal_ لا أعتقد بأن بوتن سيضحي بالصورة التي يحاول أن يسوقها لروسيا كقوة في مواجهة "هيمنة" أمريكا', CAST(0x0000A73700F39AD1 AS DateTime), CAST(0x0000A716018AA358 AS DateTime), N'', N'@yass1nz,@soureal_,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830206795708788736', N'كلها وهمو .. البرلمانيين المغاربة: دايخين مع تعدد الأجور وتعدد الزوجات :))
https://t.co/NBegggYmKG
via @Omar_H_', CAST(0x0000A73700F39ACA AS DateTime), CAST(0x0000A717000248C4 AS DateTime), N'', N'@Omar_H_,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830207317547286528', N'@yass1nz @soureal_ ربما يعطيوه أوكرانيا', CAST(0x0000A73700F39AC5 AS DateTime), CAST(0x0000A7170002DA14 AS DateTime), N'', N'@yass1nz,@soureal_,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830397099149778944', N'واخا معنديش مع بحال هاد المواقع لي كتولي موضة...ولكن مافيها باس نعرفو الناس اشنو كتظن فينا...يالله اتحفوني 😂😂😂😂 https://t.co/i6pJyLbghh', CAST(0x0000A73700F1BAF6 AS DateTime), CAST(0x0000A71700D1FB14 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830399296382103552', N'https://t.co/CtdzzgrbeZ', CAST(0x0000A72F018B21DE AS DateTime), CAST(0x0000A71700D45FF8 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830414132797128704', N'التخلي عن رئاسة الحكومة سيكون من اجل قطاع الطرق والبانضية والفاشلين سياسيا...اما الوطن فيحتاج للتشبت بنتائج... https://t.co/jiAQYLNEIW', CAST(0x0000A73700F206BF AS DateTime), CAST(0x0000A71700E49210 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830420570693058560', N'@TaiebouneS @Maroc_Telecom ils vont rien faire ! M''ont fait la même chose..', CAST(0x0000A72F018B21D1 AS DateTime), CAST(0x0000A71700EB98E4 AS DateTime), N'', N'@TaiebouneS,@Maroc_Telecom,', N'183278308', N'WahidROUHLI', 33014, 832, N'Ben M''sick', N'2c87e3b1b55eec2c', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830453116638265344', N'Morocco’s High-Speed Train Tests Launched This Week
https://t.co/ZqXwsTnrA7', CAST(0x0000A72F018B21CB AS DateTime), CAST(0x0000A717010F1D78 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830456375184601088', N'RT @iHibo: الفرق بين المدير والقائد https://t.co/cu6tcDAA79', CAST(0x0000A73700F39ABF AS DateTime), CAST(0x0000A7170112AC04 AS DateTime), N'', N'@iHibo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830457109942775808', N'@yahiakarim حتال غذا', CAST(0x0000A72F018B21C4 AS DateTime), CAST(0x0000A71701137918 AS DateTime), N'', N'@yahiakarim,', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830458293592215553', N'RT @ajplusarabi: كوجينا، سيمانة، بيرو.. هل تعرفون هذه العبارات؟ 
من أين أتت برأيكم؟ https://t.co/JsyLMFNzDo', CAST(0x0000A73700F39ABA AS DateTime), CAST(0x0000A7170114C4BC AS DateTime), N'', N'@ajplusarabi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830459147183329280', N'@weddady اللغة العربية نفسها ليس عليها إجماع خاصة مع إنتشار دعاة خلق لغات محلية', CAST(0x0000A73700F39AB3 AS DateTime), CAST(0x0000A7170115B2A0 AS DateTime), N'', N'@weddady,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830462041169211392', N'@weddady الجهوية في مواجهة العولمة', CAST(0x0000A73700F39AAC AS DateTime), CAST(0x0000A7170118DB38 AS DateTime), N'', N'@weddady,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830462479037788160', N'Moroccan Ministry of Interior Files Lawsuit Against Chabat over Accusations of Murder
https://t.co/fcl4eA3lm5', CAST(0x0000A72F018B21BD AS DateTime), CAST(0x0000A71701195518 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830463192665042945', N'RT @awzan: تحدثك بلغة أجنبية مع عربي مثلك ، لا يدل إطلاقا على أنك إنسان مثقف ، بل على أنك إنسان متبجح ، تعاني "عقدة الأجنبي" ، و جاهل بلغتك…', CAST(0x0000A73700F39AA6 AS DateTime), CAST(0x0000A717011A1D7C AS DateTime), N'', N'@awzan,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830464414809743360', N'@weddady مثلا في التلفزيون المغربي، أصبح هامش اللغة العربية يقتصر على نشرة الأخبار و "النشاط الملكي".. الباقي لهجات وفرنسية', CAST(0x0000A73700F39AA0 AS DateTime), CAST(0x0000A717011B7280 AS DateTime), N'', N'@weddady,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830472936586899456', N'حوالي 3600 قتيل في حوادث السير بالمغرب.. أو قتيل لكل 10 آلاف مواطن في كل عام 
https://t.co/zI6muyeaYJ', CAST(0x0000A73700F39A9A AS DateTime), CAST(0x0000A7170124BFC0 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830475547822153728', N'تصور لو سقطت طائرتين في الشهر في المغرب هل كان الناس سيركبون الطائرات؟
3600 قتيل في حوادث السير يعادل عدد ضحايا سقوط طائرتين في كل شهر!', CAST(0x0000A73700F39A93 AS DateTime), CAST(0x0000A717012798A8 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830475948629831681', N'RT @Dimiq33: دليل على ضرورة التفريق بين التاء المربوطة والمفتوحة ياشباب 😅 https://t.co/kXOawVEhvs', CAST(0x0000A73700F39A8B AS DateTime), CAST(0x0000A71701280928 AS DateTime), N'', N'@Dimiq33,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830476817718980608', N'.@iHibo المؤسف أن الحوادث تقع في كل العالم ومرتبطة بطريقة تصميم السيارات والطرقات .. يموت أكثر من مليون شخص في العالم سنويا بحوادث السير', CAST(0x0000A73700F39A85 AS DateTime), CAST(0x0000A7170128FBBC AS DateTime), N'', N'@iHibo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830476931355254785', N'@Jbilou__ بلا حساب', CAST(0x0000A73700F39A7F AS DateTime), CAST(0x0000A71701291B60 AS DateTime), N'', N'@Jbilou__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830478761346871296', N'لسبب ما يتجاهل الناس خطورة السيارات ولن يتوقفوا عن استعمالها. والحل ربما في السيارات الذكية وخاصة التي تقود نفسها لتقليص عامل الخطأ البشري', CAST(0x0000A73700F39A79 AS DateTime), CAST(0x0000A717012B1A50 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830481438814375936', N'RT @Mhmed_ALhassan: @blafrancia 
للأسف لدينا في السعودية دبل هذا الرقم، 17 قتيل يوميا بسبب حوادث السير', CAST(0x0000A73700F39A6C AS DateTime), CAST(0x0000A717012E0724 AS DateTime), N'', N'@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830482527588597760', N'Steve Bannon الرجل الخطير وراء ترامب .. 
(أو ادريس البصري ديال ميريكان ) https://t.co/GTwOlgAZmj', CAST(0x0000A73700F398D8 AS DateTime), CAST(0x0000A717012F36A8 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830485518064447489', N'RT @ZouM__: @blafrancia البصري كان الرجل المنفد لأوامر سيده، بانون يسير ترامب من الخلف', CAST(0x0000A73700F398D2 AS DateTime), CAST(0x0000A71701327A34 AS DateTime), N'', N'@ZouM__,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830486349358780416', N'@ZouM__ البصري بدوره كان يدبر ويخطط لما فيه مصلحة المخزن', CAST(0x0000A73700F398C5 AS DateTime), CAST(0x0000A71701336368 AS DateTime), N'', N'@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830488510352203776', N'@ZouM__ أفكار ترامب لا تختلف عن أفكار بانون (استعلاء الجنس الأبيض ، كراهية الأجنبي  (أمريكا الجنوبية والمسلمين ..) والمنظمات الدولية)..', CAST(0x0000A73700F398BE AS DateTime), CAST(0x0000A7170135BEEC AS DateTime), N'', N'@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830489661080494081', N'.@ZouM__ بانون خريج هاردفرد.. واكثر ثقافة من ترامب الذي يتقن فقط حسن إلقاء الشعارات الشعبوية... في الأخير شعارات ترامب ستطبق بسياسات بانون', CAST(0x0000A73700F398B7 AS DateTime), CAST(0x0000A71701370004 AS DateTime), N'', N'@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830490285822062592', N'@MohaOuBr https://t.co/GvdEtz7PBa', CAST(0x0000A73700F398B0 AS DateTime), CAST(0x0000A7170137AEA0 AS DateTime), N'', N'@MohaOuBr,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830490474817400832', N'RT @mkhoumania: @ZouM__ @blafrancia الله يرحمو كان قال أنا كنت عبد مشرط الحناك قالها و هو فخور بعبودية ديالو', CAST(0x0000A73700F398AA AS DateTime), CAST(0x0000A7170137E35C AS DateTime), N'', N'@mkhoumania,@ZouM__,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830491604322545665', N'.@ZouM__ ترامب له شخصيا سيكوباتية لكن لا ينفي ذلك أن له أيضا معتقدات إيديولوجية تتقاطع مع معتقدات اليمين المتطرف
https://t.co/uk3YcbZEMm', CAST(0x0000A73700F398A7 AS DateTime), CAST(0x0000A71701391E98 AS DateTime), N'', N'@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830494501168889856', N'@ZouM__ ورث الثروة لكن كل مشروعاته كانت تنتهي بالإفلاس .. الشيء الوحيد الذي نجح فيه هو برنامج تلفزيون الواقع الذي رفع من قيمة إسمه في السوق', CAST(0x0000A73700F398A3 AS DateTime), CAST(0x0000A717013C485C AS DateTime), N'', N'@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830495943166423044', N'@ZouM__ بعد نجاحه في التلفزيون وفشله في بناء مشاريع بدأ ب"كراء" إسمه التجاري (brand) ليوضع على عقارات لا يملكها مقابل عائدات', CAST(0x0000A73700F398A0 AS DateTime), CAST(0x0000A717013DDB7C AS DateTime), N'', N'@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830496959765037057', N'@HElghafoud @iHibo في الدول الفقيرة بسبب سيارات قديمة وطرق صعبة .. في الدول الغنية بسبب السرعة والخمر ،،، تعددت الأسباب والموت واحد', CAST(0x0000A73700F3989B AS DateTime), CAST(0x0000A717013EF714 AS DateTime), N'', N'@HElghafoud,@iHibo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830497653561647104', N'@ZouM__ عنده سنطيحة ولسان أما التدبير فلا يتقنه لأنه لا يستطيع التدبر والتفكير العميق  ... في البرنامج التلفزيوني يقوم بدور ويتلقى المال', CAST(0x0000A73700F39898 AS DateTime), CAST(0x0000A717013FB99C AS DateTime), N'', N'@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830497737842053120', N'RT @HElghafoud: @blafrancia مثلا في إسبانيا نزلوا عدد الضحايا من 5940 ل 1126 مع العلم أن عدد السيارات في إسبانيا أكثر بكثير عن عددها في الم…', CAST(0x0000A73700F39895 AS DateTime), CAST(0x0000A717013FD10C AS DateTime), N'', N'@HElghafoud,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830502725544792064', N'@ZouM__ ترامب حاول الترشح لعدة مرات. لكن الظروف لم تكن مواتية له حتى جاء رئيس أسود الذي خلق ردة فعل لدى اليمين 
https://t.co/RMWqA6QIMv', CAST(0x0000A73700F39892 AS DateTime), CAST(0x0000A71701454268 AS DateTime), N'', N'@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830511259904856064', N'@ZouM__ اليمين الأمريكي تبنى أدبيات المتطرفين الأوربيين.. بعد نجاح أوباما ظهرت حركة Tea Party للبيض الذين كرهوا التغيير الذي يحدث للمجتمع', CAST(0x0000A73700F3988E AS DateTime), CAST(0x0000A717014E932C AS DateTime), N'', N'@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830512116570456065', N'@ZouM__ حركة البيض تحت غطاء مطالب إقتصادية نجحت في الكونغرس وقطعت الطريق على أوباما وترمب نفسه قاد حملة ضد أوباما مدعيا أنه مولود في كينيا', CAST(0x0000A73700F3988A AS DateTime), CAST(0x0000A717014F823C AS DateTime), N'', N'@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830513513718304768', N'@ZouM__ ترامب عرف كيف يستغل الإعلام بخلق ضجات إعلامية مكنته للوصول للناخبين البيض في المناطق الفقيرة مستغلا كراهيتهم لأوباما والاجانب', CAST(0x0000A73700F39887 AS DateTime), CAST(0x0000A71701510878 AS DateTime), N'', N'@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830513774872375297', N'@mohamedASLAF ربما..  الهمة أكثر دهاء من البصري', CAST(0x0000A73700F39881 AS DateTime), CAST(0x0000A71701515120 AS DateTime), N'', N'@mohamedASLAF,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830516733224026112', N'RT @AlbankAldawli: إجمالي مستخدمي الإنترنت في العالم 🌎 https://t.co/auIhVqBkdz https://t.co/ksnPd6uvSJ', CAST(0x0000A73700F3987D AS DateTime), CAST(0x0000A71701548C78 AS DateTime), N'', N'@AlbankAldawli,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830517020055711745', N'RT @AP: German government says 91 mosques were attacked in the country in 2016. https://t.co/yhZ538rZTW', CAST(0x0000A73700F39879 AS DateTime), CAST(0x0000A7170154DC28 AS DateTime), N'', N'@AP,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830554226166231042', N'RT @AJABlogs: عن أسباب ابتعادنا عن اللغة العربية، وهل الأمر مرتبط بطرق تدريسها بالعالم العربي أم لا ؟
@MRAJABY
https://t.co/nNUGtpVxKM', CAST(0x0000A73700F39875 AS DateTime), CAST(0x0000A717017D77DC AS DateTime), N'', N'@AJABlogs,@MRAJABY,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830556736104910849', N'دعني أغني.. والقيثارة في يدي
أنا إيطالي.. حقيقي وافتخر :))
Lasciatemi cantare
Con la chitarra in mano

-Toto Cutugno
https://t.co/VC0DPCsG1x', CAST(0x0000A73700F39871 AS DateTime), CAST(0x0000A717018034A4 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830559631617454080', N'@ouafa إسباني زعما ؟', CAST(0x0000A73700F3986D AS DateTime), CAST(0x0000A71701835D3C AS DateTime), N'', N'@ouafa,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830561782318190594', N'انتشرت فيديوهات من دول كثيرة بعنوان "اجعل بلدنا الثاني" تسخر من شعار ترامب "أمريكا أولا"..
هذه النسخة المغربية 
https://t.co/rgLOGuW5bP', CAST(0x0000A73700F3986A AS DateTime), CAST(0x0000A7170185B668 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830562745946869760', N'@ouafa شفت 10 ثواني منها .. كاين حتى النسخة المصرية', CAST(0x0000A73700F39866 AS DateTime), CAST(0x0000A7170186C3F0 AS DateTime), N'', N'@Ouafa,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830565082966917120', N'@ouafa كادت الوطنية أن تصبح وثنية', CAST(0x0000A73700F39863 AS DateTime), CAST(0x0000A717018950AC AS DateTime), N'', N'@Ouafa,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830571466638897154', N'@mohsine_ @Maghribi_1 فقصونا بأمة مهزومة .. الأمة فيها مليار ونص ... شي لاباس عليه.. وشي معذباه الأنظمة ديالو .. الدول الفاشلة أقل من 10%', CAST(0x0000A73700F3985E AS DateTime), CAST(0x0000A7180004C644 AS DateTime), N'', N'@mohsine_,@Maghribi_1,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830745655693963264', N'طفلة تتعرض للتعنيف من طرف مُعلمة...و تتسبب بوفاتها. https://t.co/j74RT8fFCD', CAST(0x0000A73700F1BAF1 AS DateTime), CAST(0x0000A71800C2E23C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830819029988306944', N'مندوبية التخطيط: مليون و685 ألف شاب ( أعمارهم ما بين 15 و24 سنة) على المستوى الوطني لا يعملون ولا يدرسون ولا يتابعون أي تكوين.', CAST(0x0000A73700F206BB AS DateTime), CAST(0x0000A7180112F704 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830824296943595522', N'RT @s_moudden: It''s always fun to meet and talk to you bro @anouarnach 
#AttawjihCamp #Smiles #fun https://t.co/KqrufxB1W8', CAST(0x0000A73700F1BAEB AS DateTime), CAST(0x0000A7180118B6E4 AS DateTime), N'AttawjihCamp,Smiles,fun,', N'@s_moudden,@AnouarNACH,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830824404095471616', N'@yasowal ممكن', CAST(0x0000A73700F1BAE1 AS DateTime), CAST(0x0000A7180118D430 AS DateTime), N'', N'@yasowal,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830828908257873920', N'@unemarocaine 
مَشروع: (اسم)
الجمع : مشروعات و مشاريعُ
https://t.co/MhPNA3JjcF
لا يعني أنني لا أكثر الأخطاء ;)
@ZouM__', CAST(0x0000A73700F3985B AS DateTime), CAST(0x0000A718011DBEC8 AS DateTime), N'', N'@unemarocaine,@ZouM__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830831439650369538', N'دخلات للفيسبوك و كتبات " عندما ارى خدودي...أشك في أنني روسية الأصل 👱".
شوفي ركابيك كيف كوحل، و قطعي الشك باليقين.
لا شكر على واجب.', CAST(0x0000A73700F1BADD AS DateTime), CAST(0x0000A7180120816C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830842102347075584', N'RT @mayziyada: #معرض_الدار_البيضاء_الدولي_للكتاب23
البرنامج الثقافي للمعرض 
https://t.co/Izxo82R99W', CAST(0x0000A73700F39857 AS DateTime), CAST(0x0000A718012C2580 AS DateTime), N'معرض_الدار_البيضاء_الدولي_للكتاب23,', N'@mayziyada,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830843640872312832', N'RT @wef: Beyond the headlines: quantifying the economic contributions of migrants @WesternUnionCEO https://t.co/pDf0aDaLoG #wef17 https://t…', CAST(0x0000A73700F39853 AS DateTime), CAST(0x0000A718012DD268 AS DateTime), N'wef17,', N'@wef,@WesternUnionCEO,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830846080732581888', N'..هل يمكن للسيد أخنوش ان يخرج بتوضيحات للمغاربة حول شبهة مراكمته للثروة من المال العام؟؟ على الأقل احتراما لديك... https://t.co/DhBT5uQ3kl', CAST(0x0000A73700F206B8 AS DateTime), CAST(0x0000A71801307C70 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830847155007025158', N'"كيف استباحت فرنسا القارة السمراء.. ولسنوات طويلة؟" -- فيلم وثائقي 
 https://t.co/3wrnZIaLY3 
#Africa #France', CAST(0x0000A73700F3984F AS DateTime), CAST(0x0000A7180131A870 AS DateTime), N'Africa,France,', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830878578288029697', N'3304 هو عدد المنشورات الصادرة في المغرب خلال 2016 
(2807 كتب و497 مجلات أكاديمية)
82.5 % من العناوين باللغة العربية
 https://t.co/3sVLOipTdv', CAST(0x0000A73700F3984B AS DateTime), CAST(0x0000A7180153F420 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830880238854881280', N'النشر بالفرنسية بالمغرب تراجع من ~40% في الثمانينيات إلى 14.5% في 2016.. 
بينما النشر باللغات الأخرى (الأمازيغية والإنجليزية..) لا يتعدى 3%', CAST(0x0000A73700F39848 AS DateTime), CAST(0x0000A7180155C430 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830881578154938368', N'@S_L2018 نعم حسب التقرير أعلاه النشر بالعربية في تزايد (82.5%)', CAST(0x0000A73700F39843 AS DateTime), CAST(0x0000A71801573A04 AS DateTime), N'', N'@S_L2018,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830882619252416512', N'لا تقولونها لداعش 
https://t.co/6e1kd62Clu', CAST(0x0000A73700F39840 AS DateTime), CAST(0x0000A71801585DD0 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830898083106009092', N'@mohsine_ ربما ;)', CAST(0x0000A73700F3983C AS DateTime), CAST(0x0000A71801693E84 AS DateTime), N'', N'@mohsine_,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830900389067292673', N'@ahmed_bagri إقرأ التفاصيل أولا', CAST(0x0000A73700F39839 AS DateTime), CAST(0x0000A718016BC1E0 AS DateTime), N'', N'@ahmed_bagri,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830901562692210690', N'@MohammedSAHLI @aissam الساحلي وعصام هنا ... أشعر أنني في عام 2007', CAST(0x0000A73700F39835 AS DateTime), CAST(0x0000A718016D0A00 AS DateTime), N'', N'@MohammedSAHLI,@aissam,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830902588153483265', N'RT @Kharabeesh: سيدة #سعودية بـ #الطائف تنشئ اول مقهى للنساء فقط يعمل به فتيات #سعوديات وتطلق عليه اسم “كيف”
#حياتك2 https://t.co/ZOK2aKR9ra', CAST(0x0000A73700F39832 AS DateTime), CAST(0x0000A718016E291C AS DateTime), N'سعودية,الطائف,سعوديات,حياتك2,', N'@Kharabeesh,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830905542491017216', N'@ahmed_bagri  زر أي مكتبة ..القراءة بالفرنسية في تراجع : الكتب أو المجلات وهذا شيء معروف ... الأدباء المغاربة الذي يكتبون بالفرنسية قليلون', CAST(0x0000A73700F3982E AS DateTime), CAST(0x0000A7180171621C AS DateTime), N'', N'@ahmed_bagri,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830905791163072512', N'الناس لي تتعرف بقيمة الحب..راه ممكن تخرجو زكاة نهار سانفلانتين للناس لي قهرهم البرد وتوحدانييت..ريحة، كتاب، شمعة، شكلاط،....وشكرا 😆', CAST(0x0000A73700F206B3 AS DateTime), CAST(0x0000A7180171A740 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830906691969490944', N'المغرب : وزارة الداخلية أغلقت 7 مدارس تركية (لعلاقتها بجماعة كولن).. وتم تسريح 490 إطار و 2400 تلميذ 
https://t.co/V2UKOKvC65', CAST(0x0000A73700F3982A AS DateTime), CAST(0x0000A7180172A334 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830908323021148161', N'"مؤسسة الفاتح تعتمد على برامج تعليمية بالإنكليزية/ بدل الفرنسية"
الغريب أن القرار جاء من وزارة الداخلية وليس التعليم', CAST(0x0000A73700F39827 AS DateTime), CAST(0x0000A71801746B10 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830908829252591616', N'@ahmed_bagri 82% .. ابحث عن حجم مبيعات الجرائد المغربية .. وعدد المشاهدين في التلفزيون .. الفرنسية في تراجع', CAST(0x0000A73700F39822 AS DateTime), CAST(0x0000A7180174F8DC AS DateTime), N'', N'@ahmed_bagri,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830911772190244864', N'المغرب: "شاب من بين أربعة تتراوح أعمارهم بين 15 و24 سنة لا يعملون ولا يدرسون"
https://t.co/imtKJnSoVa', CAST(0x0000A73700F3981F AS DateTime), CAST(0x0000A71801782E58 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830930256995446784', N'RT @ouafa: الحمدلله تم ايصال المساعدات للاسبوع الثاني ليشمل جميع دواوير منطقة تيزي ن تاست 💫 https://t.co/qwd7sZ7hzq', CAST(0x0000A73700F3981B AS DateTime), CAST(0x0000A7190000D8CC AS DateTime), N'', N'@Ouafa,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'830930486247714818', N'RT @psisco2: ناس اوكادير. المسامحة https://t.co/gfQW4QkdDD', CAST(0x0000A73700F36829 AS DateTime), CAST(0x0000A71900011940 AS DateTime), N'', N'@psisco2,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831068526618214400', N'RT @lalibrebe: #Grammys Le palmarès complet  👉 https://t.co/UaRgQA2OzU https://t.co/dA0t8ML0od', CAST(0x0000A73700F1BAD6 AS DateTime), CAST(0x0000A7190097C0D4 AS DateTime), N'Grammys,', N'@lalibrebe,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831069000545218560', N'@bouziane_a شفتييييي', CAST(0x0000A73700F1BABF AS DateTime), CAST(0x0000A71900984540 AS DateTime), N'', N'@bouziane_a,', N'43256664', N'AnouarNACH', 5448, 1022, N'Hay-Hassani', N'b58a1611c14353a6', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831127804137861120', N'اينوي نهار الجمعة كانو متاقيين الله اعترفوا بالخطأ 
اليوما نكرو كولشي! 
حسبي الله و نعم الوكيل! 
 #TouchePasAMa4G… https://t.co/uUCov5LPei', CAST(0x0000A7300019BFC2 AS DateTime), CAST(0x0000A71900D872F0 AS DateTime), N'TouchePasAMa4G,', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831133011139784704', N'يالله اش بيتو تعرفو؟ تفضلو الى كلافيي :p https://t.co/81HKWj5hTT', CAST(0x0000A73700F206AB AS DateTime), CAST(0x0000A71900DE2268 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831173413737791489', N'الرسائل المهيمة على بصراحة.. تخص بنكيران والبجيدي :(.. واش هادو اسئلة غادي تكتبهم بسرية؟؟ ممكن تكتبتهم بشكل علني... https://t.co/hMp3S4IiEn', CAST(0x0000A73700F206A6 AS DateTime), CAST(0x0000A719010A39E8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831177596360605696', N'أنا و أعوذ بالله من قولة أنا, ملي كنشوف شي طوموبيل وااااااااعرة....كنشوف الكمارة لي سايݣها واش يستاهلها ولا... https://t.co/GsQwnfno2o', CAST(0x0000A73700F1BAB8 AS DateTime), CAST(0x0000A719010ECB70 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831181167395274753', N'بصراحة دائما.. أصحاب اسئلة ."كيري" و"كنخاف منك" و"الحلزونة" و"الكارو".. سيرو راكم معروفين :D', CAST(0x0000A73700F206A3 AS DateTime), CAST(0x0000A7190112B0B4 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831231091000348672', N'عيد الحب منتوج خالص لليبرالية المتوحشة من اجل التحكم في مشاعرنا وتمييعها وجعلها مرتبطة بمنتوجات للاستهلاك... https://t.co/a4vdpCLHQy', CAST(0x0000A73700F20698 AS DateTime), CAST(0x0000A71901492D88 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831264639463936000', N'انا ابن تجربة البرنامج المرحلي ..واول ابجديات العمل السياسي تلقيتها في هذا التيار القاعدي. العنف الجامعي الكل... https://t.co/AS1haI2bAe', CAST(0x0000A73700F20695 AS DateTime), CAST(0x0000A719016DCA30 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831456292623491072', N'Qui, entre vous, avait des expériences avec la publicité sur Instagram? #Twittoma', CAST(0x0000A73700F1BAB3 AS DateTime), CAST(0x0000A71A00B373D8 AS DateTime), N'Twittoma,', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831458794098028544', N'في إطار تكريس ثقافة التعايش والقبول بالأخر.. عواشر مبارك لكل الأحبة وكل عام وأنتم بخير. :D', CAST(0x0000A73700F20691 AS DateTime), CAST(0x0000A71A00B62E48 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831460729152798720', N'سوء حظ أو مؤامرة ماسونية؟ 
 https://t.co/gL6SjGNK9Q', CAST(0x0000A7300019BFBB AS DateTime), CAST(0x0000A71A00B84BB0 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831467652006703104', N'#Spotify a préparé une belle playlist d''amoureux pour moi aujourd''hui ! Vous ne serez pas déçus... https://t.co/1yDGi9zRWH', CAST(0x0000A72F018B21AB AS DateTime), CAST(0x0000A71A00BFD948 AS DateTime), N'Spotify,', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831469903781720065', N'توضيح: لم اقم بحذف حتى شي واحد من لائحة الاصدقاء..اعتقد الفيسبوك تسطى وكحيد الناس.. لهذا لي تحيد ممكن يكتب تعليق باش نرجعو', CAST(0x0000A73700F2068E AS DateTime), CAST(0x0000A71A00C24E94 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831483874400202753', N'يا حبيبي العنف الجامعي لا يمكن الدفاع عنه او انكار مساهمتك فيه كفصيل طلابي.. الانكار هو دليل على انك لم تتخلص بعد... https://t.co/1BGRzgBqPb', CAST(0x0000A73700F20686 AS DateTime), CAST(0x0000A71A00D18E18 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831495282886049792', N'في أدبيات فصيل طلبة البرنامج المرحلي ورقة 86، لا يوجد هناك تأسيس فكري ونظري للعنف. ورغم ذلك فالعنف مدان حتى لو... https://t.co/mhR6NpvDkr', CAST(0x0000A73700F20683 AS DateTime), CAST(0x0000A71A00DE0198 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831522156987240448', N'30 fois plus de types de ransomwares en 2016 qu''en 2015 https://t.co/H7m5Lxax0O', CAST(0x0000A7300019BFA5 AS DateTime), CAST(0x0000A71A00FB55CC AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831541500127375360', N'العنصر: كيفاش غادي يشوف فينا الرأي العام الدولي والوطني، والحكومة بأغلبية ومجلس النواب يترأسه حزب معارض!! 
تعليق:... https://t.co/rn6fYKyJq3', CAST(0x0000A73700F20680 AS DateTime), CAST(0x0000A71A0110727C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831547053884989442', N'Mahjoub Jojob Feryatr محاكمة جديدة لزعيم حركة الدرب المضيء في البيرو
فين التضامن الرفيق مع زعيم ديالكم؟؟', CAST(0x0000A73700F2067D AS DateTime), CAST(0x0000A71A0116820C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831582903767355392', N'نقلْ فؤادك حيثُ شئتَ من الهوى ما الحبُّ إلا للحبيبِ الأولِ
كمْ منزل في الأرضِ يألفه الفتى وحنينُه أبداً لأولِ منزلِ
أبو تمام', CAST(0x0000A73700F20678 AS DateTime), CAST(0x0000A71A013DA210 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6970, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'831583915655704576', N'بنادم لي مطلع البعرة لداك أبو جاد و سارة.', CAST(0x0000A73700F1BAAE AS DateTime), CAST(0x0000A71A013EBDA8 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'ar')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832242308741472256', N'صورة جماعية لبعض الأشخاص لي تعرفت عليهم فحياتي
🐒🐕🐎🐂🐄🐷🐖🐐🐀🐔🐍🐢🐊🦂🐩

😂😂😂😂', CAST(0x0000A73700F1BAA9 AS DateTime), CAST(0x0000A71C00F64A64 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832361451809538048', N'"جيل لالا" .. لا قراية لا خدمة! 
@moriscbandoler 
https://t.co/MvfytuyBRH', CAST(0x0000A73700F36822 AS DateTime), CAST(0x0000A71C017852AC AS DateTime), N'', N'@moriscbandoler,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832364551807102977', N'RT @moriscbandoler: ملك إسبانيا: لغتنا كنز وثروة ثقافية، تمثل 16٪ من الناتج المحلي الإجمالي و ثلاثة ملايين  ونصف وظيفة. https://t.co/1ABd7J…', CAST(0x0000A73700F3681C AS DateTime), CAST(0x0000A71C017BB4B0 AS DateTime), N'', N'@moriscbandoler,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832364582777810944', N'RT @moriscbandoler: #LT اللغة الإسبانية تتقدم على الفرنسية كلغة ثانية في أوروبا وبدأت تزاحم الإنجليزية.', CAST(0x0000A73700F3680E AS DateTime), CAST(0x0000A71C017BBCE4 AS DateTime), N'LT,', N'@moriscbandoler,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832369085149224960', N'RT @AlziadiQ8: فيديو/ د. المنصف المرزوقي من برنامج #المقابلة: فخور بأنني خرجت من الحكم دون أن تسيل قطرة دم .. https://t.co/lVUxY5XDFT', CAST(0x0000A73700F36807 AS DateTime), CAST(0x0000A71C0180A77C AS DateTime), N'المقابلة,', N'@AlziadiQ8,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832369355912515584', N'RT @NasNacera: Le mannequin Halima Aden défile voilée pour Kanye West à la fashion week de New York. 
Si c''était à Paris, je vous dis pas l…', CAST(0x0000A73700F367FF AS DateTime), CAST(0x0000A71C0180F27C AS DateTime), N'', N'@NasNacera,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832369753356398592', N'RT @AlziadiQ8: فيديو/ د. المنصف المرزوقي من برنامج #المقابلة: مشكلتي مع القوميين منذ أن رفضت الغزو العراقي للكويت.. فأخرجوني من الملة وجعلو…', CAST(0x0000A73700F367F4 AS DateTime), CAST(0x0000A71C018161D0 AS DateTime), N'المقابلة,', N'@AlziadiQ8,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832381558115930113', N'“العدل والإحسان تعلن حصيلة مؤقتة لحملة إعفاء أطرها من المناصب الحكومية" 
https://t.co/G1hXUa5EJe
ف2016 كتبت مازحا:
https://t.co/DuCFTXp7c7', CAST(0x0000A73700F367EE AS DateTime), CAST(0x0000A71D0002C2A4 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832713218720096256', N'صافي...هو گاليك شهرين و يجي يخطبك من داركم...
ما تبقايش كل عام فارعا ليه راسو.', CAST(0x0000A73700F1BAA6 AS DateTime), CAST(0x0000A71D016CBB7C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832956370890653696', N'"L''espace Client" sur le site et l''application #OrangeEtMoi ne marche pas!
@OrangeMaroc #OrangeMaroc https://t.co/0HaFZ2jZqU', CAST(0x0000A73700F1BAA3 AS DateTime), CAST(0x0000A71E00EA996C AS DateTime), N'OrangeEtMoi,OrangeMaroc,', N'@OrangeMaroc,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832971707430350848', N'MATRIX -  Les détails que vous n''aviez jamais remarqués ! https://t.co/F0ME8hD2Mh', CAST(0x0000A7300019BF5B AS DateTime), CAST(0x0000A71E00FB55CC AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832973469600116736', N'RT @nippon_ar: العذرية أصبحت أكثر شيوعاً في #اليابان حاليا
https://t.co/MSOL5HUEeD', CAST(0x0000A73700F367E8 AS DateTime), CAST(0x0000A71E00FD41FC AS DateTime), N'اليابان,', N'@nippon_ar,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832974303876505600', N'"باليابان، قرابة نصف المتزوجين لم يمارسوا الجنس لأكثر من شهر ... وهو ما يُطلق عليه زواج بلا جنس"
https://t.co/sJ0P3GPLRX', CAST(0x0000A73700F367E3 AS DateTime), CAST(0x0000A71E00FE2B30 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832975886051852288', N'Hello people! 
#Casa #Casablanca #Maroc #Morocco #Moroccan #الدارالبيضاء #الدار_البيضاء #المغرب… https://t.co/ZDKjOrxZ4l', CAST(0x0000A73700F1BAA1 AS DateTime), CAST(0x0000A71E00FFE4FC AS DateTime), N'Casa,Casablanca,Maroc,Morocco,Moroccan,الدارالبيضاء,الدار_البيضاء,المغرب,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', N'  33.58306914,  -7.62106414', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'832981385543614465', N'That moment
فاش الواليدة ديالك كتقول ليك ألف وحدة تتمناك... و فاش كتجي تبغي تحسبهم كتلقا 
500 وحدة كتبغيك و لكن... https://t.co/x0OBZdt4rL', CAST(0x0000A73700F1BA9D AS DateTime), CAST(0x0000A71E0105E67C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833267293052403712', N'@OrangeMaroc Bonjour, c''était un problème général pour tous les clients. Le problème est réglé maintenant. Thanks.', CAST(0x0000A73700F1BA9A AS DateTime), CAST(0x0000A71F00B26D58 AS DateTime), N'', N'@OrangeMaroc,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833283950663573505', N'@MohamedDekkak1 What are these questions for ? Are you out of content dear mohamed?', CAST(0x0000A72F018B21A5 AS DateTime), CAST(0x0000A71F00C49C08 AS DateTime), N'', N'@MohamedDekkak1,', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833390379185688576', N'RT @muta_Rabbil: @blafrancia @moriscbandoler 
من هنا جات مجموعة جيل جيلالا', CAST(0x0000A73700F367DC AS DateTime), CAST(0x0000A71F0138C330 AS DateTime), N'', N'@muta_Rabbil,@blafrancia,@moriscbandoler,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833393747534737408', N'RT @MohaOuBr: 6 مبيانات تؤكد أن العالم أصبح أفضل ممّا كان عليه من قبل.. 
https://t.co/sXlOQawkcS', CAST(0x0000A73700F367D6 AS DateTime), CAST(0x0000A71F013C7034 AS DateTime), N'', N'@MohaOuBr,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833404457933238272', N'رئيس وزراء السويد السابق يسخر من ترامب: هذا محشش؟ 
#lastnightinsweden https://t.co/s3g1LZhSPC', CAST(0x0000A73700F367D1 AS DateTime), CAST(0x0000A71F0148212C AS DateTime), N'lastnightinsweden,', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833405824051662848', N'قياديين في الاتحاد الاشتراكي يحاولون الركوب على توظيف سياسوي لتصريح رئيس الحكومة من قبل جبهة البوليساريو، من اجل... https://t.co/ziCKd1NB7g', CAST(0x0000A72F017655F7 AS DateTime), CAST(0x0000A71F01499F34 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833408105648119810', N'RT @Arabi21News: #بوستة.. رحيل زعيم مغربي رفض رئاسة حكومة بشروط الحسن الثاني
رابط بديل: https://t.co/IJSOjfqRqP
    https://t.co/vgThFSLepO', CAST(0x0000A73700F367CD AS DateTime), CAST(0x0000A71F014C1CB4 AS DateTime), N'بوستة,', N'@Arabi21News,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833411723579232256', N'RT @moriscbandoler: إسبانيا: ست سنوات سجن لصهر صاحب الجلالة بتهمة اختلاس المال العام

https://t.co/hZWY6INYri', CAST(0x0000A73700F367C4 AS DateTime), CAST(0x0000A71F01500EDC AS DateTime), N'', N'@moriscbandoler,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833411836984844289', N'RT @moriscbandoler: القضاء الإسباني يقضي أحكام سجن بعشرات السنين بحق شخصيات كبيرة في الحزب الشعبي الحاكم  وأدخلهم اليوم لسجن بلنسيا مخافة ه…', CAST(0x0000A73700F367BC AS DateTime), CAST(0x0000A71F01502E80 AS DateTime), N'', N'@moriscbandoler,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833418802025074690', N'دليل خاص للطلبة الراغبين في الدراسة الجامعية باليابان 
https://t.co/YJCIyKXSt5
@nippon_ar', CAST(0x0000A73700F3677D AS DateTime), CAST(0x0000A71F0157C8FC AS DateTime), N'', N'@nippon_ar,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833424895543484418', N'ملاحظة: في السنوات العشر الأولى لحكم محمد السادس، كان لا يغادر المغرب إلا نادرا. أما في السنوات الأخيرة فتجده في زيارات رسمية وخاصة لا تنقطع', CAST(0x0000A73700F3676E AS DateTime), CAST(0x0000A71F015E6FB8 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833427265627226113', N'زيارات محمد 6 للخارج تتميزت بسلسلة من الجولات الإفريقية، قصد فيها دولا لم نكن نسمع عنها إلا في أخبار الإنقلابات.. وكذلك الهند وروسيا وتركيا', CAST(0x0000A73700F3675A AS DateTime), CAST(0x0000A71F016105D4 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833433502263701504', N'الخدمة راه موجودة فالمغرب...غير نتوما معندكومش المعارف.', CAST(0x0000A73700F1BA97 AS DateTime), CAST(0x0000A71F0167D468 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833449173613682688', N'@mmsamni شكرا .. معلومات أسمعها لأول مرة', CAST(0x0000A73700F36748 AS DateTime), CAST(0x0000A71F0178EE88 AS DateTime), N'', N'@mmsamni,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833452290405179396', N'تجربتان مذهلتان لإسبانية وأمريكي تعلما اللغة العربية وعشقاها
 https://t.co/WSwo1fmoos', CAST(0x0000A73700F36727 AS DateTime), CAST(0x0000A71F017C553C AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833462535743479810', N'ماعنديش مع نظريات المؤامرة ولكن عجيب أن المخزن قرر يطرد موظفين تابعين للعدل و الإحسان مع ذكرى 20 فبراير.. علاش ؟

https://t.co/4h1URZWcpd', CAST(0x0000A73700F36703 AS DateTime), CAST(0x0000A71F01878420 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833463610118639616', N'ست سنوات على الحراك الاجتماعي والسياسي ل20 فبراير: في اعتقادي كشاب شارك في الحراك كباقي المغاربة الذي خرجوا... https://t.co/3hBTohyVXr', CAST(0x0000A72F017655EF AS DateTime), CAST(0x0000A71F0188B020 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833465577624702976', N'@ma_ybi حتى جهة ما خايفة ولكن فين باغين يوصلوا البلاد ؟', CAST(0x0000A73700F366E2 AS DateTime), CAST(0x0000A71F018AD5BC AS DateTime), N'', N'@ma_ybi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833468013282258949', N'واش الداخلية (نص المخزن) لقاو الملك غابر في إفريقيا وهوما يقلبوا في الملفات القدام، ولا شي وحدين باغيين يرجعوا ل"أيام العز" ديال البصري؟', CAST(0x0000A73700F366C4 AS DateTime), CAST(0x0000A7200001FC98 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833468848699502592', N'@ma_ybi --&gt; 2011 https://t.co/e4UqOwilxF', CAST(0x0000A73700F366A3 AS DateTime), CAST(0x0000A7200002E5CC AS DateTime), N'', N'@ma_ybi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833624088388239360', N'قبل ست سنوات( 2011) خلال تسيير جمع عام لتنسيقية 20فبراير بالرباط..صباح الحرية والكرامة وغد افضل لكل الشباب... https://t.co/d984xldDas', CAST(0x0000A72F017655E4 AS DateTime), CAST(0x0000A72000AC533C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833703100036833281', N'@PizzaHutMaOFF bienvenue :)', CAST(0x0000A72F018B21A0 AS DateTime), CAST(0x0000A72001028F04 AS DateTime), N'', N'@PizzaHutMaOFF,', N'183278308', N'WahidROUHLI', 33014, 832, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833729430761652224', N'What happens one hour after you drink a can of #COKE https://t.co/UaMMKiTbiQ', CAST(0x0000A72F018B219B AS DateTime), CAST(0x0000A720011F4AE0 AS DateTime), N'COKE,', N'', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833774284858335233', N'@HElghafoud وماهو دور إيران وتركيا... في حلمه', CAST(0x0000A73700F3669C AS DateTime), CAST(0x0000A72001503EE8 AS DateTime), N'', N'@HElghafoud,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833774833783672832', N'@imoghrid وربما بعد سنوات ستكون.. دولة غرب جنوب السودان .. ودولة شرق جنوب السودان :))', CAST(0x0000A73700F36691 AS DateTime), CAST(0x0000A7200150D86C AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833778333192245248', N'في 20 فبراير،
كانت المطالبة بديمقراطية برلمانية،
وكانت النتيجة دستور جديد،
ومنصب رئيس الوزراء،
بعد 6 سنوات،
تفشل الأحزاب،
وتنتظر عودة الملك', CAST(0x0000A73700F36688 AS DateTime), CAST(0x0000A7200154AAF0 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833779830869090304', N'ويبدو أن الملك مشغول بجولاته 
وبالمفاوضات مع زعماء الدول الإفريقية 
وليس لديه وقت لإعطاء الأوامر لزعماء الأحزاب 
ليختاروا تحالفاتهم', CAST(0x0000A73700F3667E AS DateTime), CAST(0x0000A72001564D4C AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833783913000611840', N'في 20 فبراير 2011 كان الإعتقاد أن الأحزاب قادرة على تدبير شؤون ملكية برلمانية
في 2016، تبين أنها لا تستطيع اتخاذ أي موقف بنفسها 
#المغرب', CAST(0x0000A73700F3666B AS DateTime), CAST(0x0000A720015AC188 AS DateTime), N'المغرب,', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833784752519921666', N'@AZadamZ 
كتبت 2016 هههه 
نعم التنظير سهل', CAST(0x0000A73700F36659 AS DateTime), CAST(0x0000A720015BABE8 AS DateTime), N'', N'@AZadamZ,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833788775587274752', N'من 2006 وواحد السيد
باغي يعلم الناس التدوين
وباغي يعلمهم النضال الرقمي
وباغي يعلمهم الديموقراطية
وغبر مدة وجا باغي الفلوس
باش يلعن دين امهم', CAST(0x0000A73700F3664D AS DateTime), CAST(0x0000A72001600FBC AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833789393240457216', N'RT @hrw_ar: سلطات #المغرب تشن منذ عامين (وأكثر) حملة ضد الجمعية المغربية لحقوق الإنسان. تفاصيل في تقرير @hrw_ar https://t.co/e7keIBbI0X htt…', CAST(0x0000A73700F36645 AS DateTime), CAST(0x0000A7200160BD2C AS DateTime), N'المغرب,', N'@hrw_ar,@hrw_ar,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833792821236727810', N'شي مغاربة مساكين 
واحد الزعيم قالهم: "أنتم أوباش!"
وجمعوا راسهم ومشاو لهولندا 
ودازت أعوام 
وجا زعيم في هولندا وقالهم: "أنتم حثالة!"
:|', CAST(0x0000A73700F36638 AS DateTime), CAST(0x0000A72001647A98 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833795545294573568', N'@CordassaY حتى هذا رأي ... ولكن الملك راه ماشي في المغرب باش غادية البلاد ؟', CAST(0x0000A73700F36628 AS DateTime), CAST(0x0000A72001677324 AS DateTime), N'', N'@CordassaY,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833796463591321600', N'@CordassaY ماكانش يحساب لى رشيد داخل في السياسة ؟ شنو المواقف ديالو من الصراع السياسي ؟', CAST(0x0000A73700F36621 AS DateTime), CAST(0x0000A720016873C8 AS DateTime), N'', N'@CordassaY,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833797964602736640', N'@CordassaY عمري ماشفتو مع زعماء الأحزاب من غير في الجنائز .. وعمري ما سمعت تدخل في شي شأن سياسي من غير قراءة خطاب محمد 6', CAST(0x0000A73700F3660E AS DateTime), CAST(0x0000A720016A1750 AS DateTime), N'', N'@CordassaY,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833798972993105921', N'RT @Raseef22: "لوهلة لم أصدق أنني في #جدة"..  مسرح، موسيقى، أضواء، رجال ونساء وأطفال، والكثير من الشخصيات الكرتونية في #السعودية
#سعودي_كوم…', CAST(0x0000A73700F36606 AS DateTime), CAST(0x0000A720016B31BC AS DateTime), N'جدة,السعودية,', N'@Raseef22,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833801418071011337', N'RT @ats_unhq: 21 شباط/فبراير: #اليوم_الدولي_للغة_الأم. 
#xl8 #1nt #MotherLanguageDay https://t.co/vXpPvsSfTk', CAST(0x0000A73700F365F9 AS DateTime), CAST(0x0000A720016DDCF0 AS DateTime), N'اليوم_الدولي_للغة_الأم,xl8,1nt,MotherLanguageDay,', N'@ats_unhq,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833802063775748096', N'كيهضر مع عشرين بنت، و عشرة ديال الارملات و خمسة ديال المطلقات و ثلاثة ديال المخطوبات...و كيقول ليك "اللهم ارزقني... https://t.co/It8wYmsCe8', CAST(0x0000A73700F1BA94 AS DateTime), CAST(0x0000A720016E903C AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833802828745416708', N'@ZorroOfMorocco كون غير بقينا في أوروبا :))', CAST(0x0000A73700F365E9 AS DateTime), CAST(0x0000A720016F66B0 AS DateTime), N'', N'@ZorroOfMorocco,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833803266836283392', N'اليوم العالمي للغة الأم:
"الله يرضي عليك يا ولدي.."
:)', CAST(0x0000A73700F365DC AS DateTime), CAST(0x0000A720016FE090 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833803668344406021', N'@BatataSayad كلامي واضح', CAST(0x0000A73700F365D1 AS DateTime), CAST(0x0000A72001705110 AS DateTime), N'', N'@BatataSayad,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833805241615253504', N'@ZorroOfMorocco 
ماشفت ش الصورة الثانية .. وهاديك حقيقة تاريخية :)) https://t.co/chdO0mlscr', CAST(0x0000A73700F365C9 AS DateTime), CAST(0x0000A72001720884 AS DateTime), N'', N'@ZorroOfMorocco,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833805636630675456', N'@BatataSayad حنا ماشي في الفيسبوك .. الناس ديال تويتر فايقين وعايقين هههه', CAST(0x0000A73700F365C4 AS DateTime), CAST(0x0000A720017276AC AS DateTime), N'', N'@BatataSayad,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833806174667554816', N'@HabbajFaouzi الأسد اللي عاود  هاديك الهضرة ديال المؤامرات جابها ف راسو ... محمد السادس فهم كاين مشكل ودار شي حاجة', CAST(0x0000A73700F365BE AS DateTime), CAST(0x0000A72001730DD8 AS DateTime), N'', N'@HabbajFaouzi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833807807564619779', N'@BatataSayad 
الله يهديك .. القضية معروفة وموجدين المقالات عن الموضوع .. حتى شي حد ما محتاج لي نوضح الواضحات', CAST(0x0000A73700F365BB AS DateTime), CAST(0x0000A7200174D5B4 AS DateTime), N'', N'@BatataSayad,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833812707166003200', N'@BatataSayad دابا دخلتي لقلبي وعرفتي شنو فيه ... باز', CAST(0x0000A73700F365B7 AS DateTime), CAST(0x0000A720017A2E74 AS DateTime), N'', N'@BatataSayad,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833813932561285122', N'بعد صعود اليمين المتطرف في أروبا وأمريكا ... ربما بعد سنوات، لن يبق للمغاربة المهاجرين من مهرب سوى الهبوط للدول الإفريقية الشقيقة :/', CAST(0x0000A73700F365B1 AS DateTime), CAST(0x0000A720017B84A4 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833815321265987584', N'RT @moriscbandoler: الإمام الشافعي: من زعم أنه يرى الجن أبطلنا شهادته', CAST(0x0000A73700F365AE AS DateTime), CAST(0x0000A720017D0888 AS DateTime), N'', N'@moriscbandoler,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833815475188547588', N'RT @AJABlogs: "لقد تعلمت كيف أحترم التنوع والاختلاف، وأعدت اكتشاف نفسي من جديد بفضل اللغة العربية"
من الصين تكتب لنا:منال林昕煜
https://t.co/H…', CAST(0x0000A73700F365AA AS DateTime), CAST(0x0000A720017D33E4 AS DateTime), N'', N'@AJABlogs,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833816095714922496', N'@zi_agharabo أش واقع ؟', CAST(0x0000A73700F365A6 AS DateTime), CAST(0x0000A720017DE154 AS DateTime), N'', N'@zi_agharabo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833817140323024896', N'كون عندي مع التجارة، كون تبعت الملك فين ما مشى ونبيع الجلابة المغربية في الدول الإفريقية :) https://t.co/pA6EZR2cS6', CAST(0x0000A73700F365A3 AS DateTime), CAST(0x0000A720017F0520 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833817403255582722', N'@zi_agharabo يا لطيف .. غادي يفرح ترامب', CAST(0x0000A73700F3659F AS DateTime), CAST(0x0000A720017F4EF4 AS DateTime), N'', N'@zi_agharabo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833819395361296384', N'@zi_agharabo تبع الناس اللي غادي يعطيوك قيمة مضافة ... ماشي مشكل في اختلاف الرأي ، إذا كان الرأي مبني على معطيات حقيقية', CAST(0x0000A73700F3659B AS DateTime), CAST(0x0000A72001817B98 AS DateTime), N'', N'@zi_agharabo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833819624412176385', N'@salmaboujidi الأفارقة تيعجبوهم الألوان الزاهية', CAST(0x0000A73700F36597 AS DateTime), CAST(0x0000A7200181BAE0 AS DateTime), N'', N'@salmaboujidi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833819911424196613', N'@mahdi_racid الحسن الثاني ... و فريديرير  ولا شنو سميتو', CAST(0x0000A73700F36593 AS DateTime), CAST(0x0000A72001820BBC AS DateTime), N'', N'@mahdi_racid,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833825058330177536', N'@0Hamzaaaaa0 ف راس المال "المخاطر" فين بقات :))', CAST(0x0000A73700F3658F AS DateTime), CAST(0x0000A7200187A9A0 AS DateTime), N'', N'@0Hamzaaaaa0,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833828482203414528', N'ربما سيساهم المغرب بأكثر من 10 ملايين دولار في ميزانية الإتحاد الإفريقي.. (نسبة من الناتج الداخلي الخام)
https://t.co/DWGTRW1wMw
V @sb93108', CAST(0x0000A73700F3658C AS DateTime), CAST(0x0000A720018B65E0 AS DateTime), N'', N'@sb93108,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833829050506498048', N'RT @mcherifi: يوم خرج المغاربة يطالبون بالحرية والكرامة والعدالة الإجتماعية تغير الدستور في 3أشهر، السياسيين ديالنا اليوم 4 أشهر مقدروش يشك…', CAST(0x0000A73700F36582 AS DateTime), CAST(0x0000A72100008340 AS DateTime), N'', N'@mcherifi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833830477656113153', N'@feryate 
يمكن MAP مازال عايشين في التسعينات وعندهم مشكل في كلافيي أراب :))
cc @MAP_Information', CAST(0x0000A73700F3657F AS DateTime), CAST(0x0000A721000211B0 AS DateTime), N'', N'@feryate,@MAP_Information,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833831288519983104', N'.@0Hamzaaaaa0  المشاركة في الإتحاد تقتضي المساهمة في ميزانيته. في المقال جنوب إفريقيا تساهم ب 33 مليون واقتصادها يساوي 3 مرات اقتصاد المغرب', CAST(0x0000A73700F3657B AS DateTime), CAST(0x0000A7210002F3DC AS DateTime), N'', N'@0Hamzaaaaa0,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833831695308697600', N'@K7al_L3afta المشكل أن عادل إمام يسخر من الديكتاتوريين الأجانب ويقبل يد دكتاتور بلده', CAST(0x0000A73700F36567 AS DateTime), CAST(0x0000A72100036588 AS DateTime), N'', N'@K7al_L3afta,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833834591089782790', N'.@0Hamzaaaaa0 
بالإضافة لذلك غادي تكون ضريبة جديدة على أغلب واردات المغرب قيمة  0.2 % غادي تمشي للإتحاد الإفريقي .. 
https://t.co/tvWEDoSgE3', CAST(0x0000A73700F36563 AS DateTime), CAST(0x0000A72100068F4C AS DateTime), N'', N'@0Hamzaaaaa0,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833834812930740226', N'RT @jamila_safira: "لئن حكمت الأقدار بخراب #أكادير، فإن بنائها موكول الى إرادتنا و إيماننا" #حائط_الذكرى #المغرب https://t.co/VKd83X7JSP', CAST(0x0000A73700F3655F AS DateTime), CAST(0x0000A7210006CC3C AS DateTime), N'أكادير,حائط_الذكرى,المغرب,', N'@jamila_safira,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833836706491199490', N'@0Hamzaaaaa0 لقاءات مع الديكتاتوريين الأفارقة... وفرص استثمار  هههه', CAST(0x0000A73700F3655B AS DateTime), CAST(0x0000A7210008DDEC AS DateTime), N'', N'@0Hamzaaaaa0,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'833836994467917824', N'@sb93108 عايشين على الصدقة', CAST(0x0000A73700F36557 AS DateTime), CAST(0x0000A72100092EC8 AS DateTime), N'', N'@sb93108,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834079284293681153', N'@najlaebb اش من صورة؟ مشفتهاش!', CAST(0x0000A72F017650F1 AS DateTime), CAST(0x0000A72101119D50 AS DateTime), N'', N'@najlaebb,', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834114037793316864', N'@Youssefyamani ch7al dhakt 3lih 9bila hahahahahah :D', CAST(0x0000A73700F1BA91 AS DateTime), CAST(0x0000A72101378B78 AS DateTime), N'', N'@Youssefyamani,', N'43256664', N'AnouarNACH', 5448, 1022, N'El Maarif', N'043051f4e4ba4f15', NULL, N'in')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834200984779886596', N'@chehbi @E_picure كيفاش وليتي مع اليمين المتطرف ؟', CAST(0x0000A73700F36548 AS DateTime), CAST(0x0000A722000AEE70 AS DateTime), N'', N'@chehbi,@E_picure,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834202987903983617', N'@chehbi @E_picure خصك شي تحسينه بحال هادي https://t.co/sDxGKgMLFk', CAST(0x0000A73700F36545 AS DateTime), CAST(0x0000A722000D1D6C AS DateTime), N'', N'@chehbi,@E_picure,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834205224638246912', N'RT @kylegriffin1: The ''Muslims Unite to Repair Jewish Cemetery'' LaunchGood raised more than $25,000 in a 24-hour period. https://t.co/OhvwD…', CAST(0x0000A73700F36541 AS DateTime), CAST(0x0000A722000F8E08 AS DateTime), N'', N'@kylegriffin1,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'en')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834483121844273152', N'شوارما و تكون مزيتة. https://t.co/YBH841oDgf', CAST(0x0000A73700F1BA8E AS DateTime), CAST(0x0000A722013ED9C8 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834501562722557953', N'الغُرور عندو علاجين :
-الكاميرا القدامية ديال التيليفون
-التصويرة ديال لاكارط ناسيونال', CAST(0x0000A73700F1BA8B AS DateTime), CAST(0x0000A7220152FA84 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834530891284246529', N'@mohsine_ @DarkTunel_ @pactu10 
عصام بشيرى شاب دانماركي من أصل مغربي
https://t.co/YusC0OCaMF', CAST(0x0000A73700F3653D AS DateTime), CAST(0x0000A7220172FC44 AS DateTime), N'', N'@mohsine_,@DarkTunel_,@pactu10,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834533904547602433', N'السياسي داير بحال الشيفور ديال طوموبيل، عليه فاش كيكون في البولا، النظر في المرايا شكون من وراه، لكن اذا بقا... https://t.co/Ab8LXZ6C41', CAST(0x0000A72F0176499C AS DateTime), CAST(0x0000A722017646D8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834534384120295424', N'RT @IslamScienceNet: مبادرة لتعريف أطفال المنطقة بإرث المسلمين العلمي - https://t.co/n9bYR2gyQn الشرق الأوسط وشمال أفريقيا https://t.co/r0e…', CAST(0x0000A73700F36539 AS DateTime), CAST(0x0000A7220176CC70 AS DateTime), N'', N'@IslamScienceNet,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834534607131381760', N'RT @NidhalGuessoum: على الطائر: الإكتشاف = نجم قزم أحمر حوله 7 كواكب كلها شبيهة بالأرض وبعضها قد يحمل محيطات من المياه... https://t.co/DDRg…', CAST(0x0000A73700F36533 AS DateTime), CAST(0x0000A72201770A8C AS DateTime), N'', N'@NidhalGuessoum,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834534718259486720', N'RT @NidhalGuessoum: وكما ذكرت آنفا، هناك 3 علماء فلك عرب ضمن فريق البحث (30 باحث) الذين نشروا هذا البحث التاريخي... يتبع', CAST(0x0000A73700F36530 AS DateTime), CAST(0x0000A72201772A30 AS DateTime), N'', N'@NidhalGuessoum,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834534760903016448', N'RT @NidhalGuessoum: شارك في الإكتشاف إذن مرصد أوكيمدن قرب مراكش في المغرب على ارتفاع 2700 م ويحوي مجموعة من التلسكوبات والأجهزة المتقدمة..…', CAST(0x0000A73700F3652D AS DateTime), CAST(0x0000A722017735E8 AS DateTime), N'', N'@NidhalGuessoum,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834535378015105024', N'RT @NidhalGuessoum: العلماء هم: د. خالد بركاوي ود. زهير بن خلدون من المغرب، ود. ياسين المليكي من السعودية.. 
مبروك لهم ولنا جميعا! 
مزيدا م…', CAST(0x0000A73700F36529 AS DateTime), CAST(0x0000A7220177E22C AS DateTime), N'', N'@NidhalGuessoum,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834536792141549568', N'السؤال الذي يطرح نفسه: ما الفائدة من صرف الملايير في اكتشاف كواكب أخرى وسكان كوكب الأرض يموتون جوعا؟', CAST(0x0000A73700F36525 AS DateTime), CAST(0x0000A72201796D18 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834542057817534465', N'@7didane ميزانية ناسا 18 مليار دولار 
https://t.co/xlxyoDQZmQ', CAST(0x0000A73700F36522 AS DateTime), CAST(0x0000A722017F2CF8 AS DateTime), N'', N'@7didane,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834543249981374465', N'خاض المغاربة طوال سنوات معركة شرسة ضد المخزن والعائلات والتكنوقراط، من اجل الحق في الاشراك في القرار والثروة..لكن... https://t.co/v1DFlSxnex', CAST(0x0000A72F0176488D AS DateTime), CAST(0x0000A722018079C8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834543970038460418', N'@7didane Hubble Telescope = $1.5 Billion', CAST(0x0000A73700F3651D AS DateTime), CAST(0x0000A72201814358 AS DateTime), N'', N'@7didane,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834549571065896960', N'@7didane قلها للجوعانين في إفريقيا ;)', CAST(0x0000A73700F36519 AS DateTime), CAST(0x0000A72201875FCC AS DateTime), N'', N'@7didane,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834550611760787457', N'@7didane علم الفلك = الهروب من الواقع هههه', CAST(0x0000A73700F36516 AS DateTime), CAST(0x0000A7220188826C AS DateTime), N'', N'@7didane,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834763884963696640', N'السيد "اخنوش اغراس باشا"، عليه الخروج للرأي العام للتوضيح والكشف عن مصادر ثروته وعلاقتها بالمال العام والاستفادة... https://t.co/9PO5OGTUNu', CAST(0x0000A72F01764721 AS DateTime), CAST(0x0000A72300E5C3EC AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834838720662626304', N'RT @ChadiYazid: @AlWaziir @K7al_L3afta @Elmounafri @AbrakiAbra @Ait_Bennani @Othomatique @Spikoza @ToToPoStOoOo https://t.co/75gocHaGkV', CAST(0x0000A73700F1BA88 AS DateTime), CAST(0x0000A723013771B0 AS DateTime), N'', N'@ChadiYazid,@AlWaziir,@K7al_L3afta,@Elmounafri,@AbrakiAbra,@Ait_Bennani,@Othomatique,@Spikoza,@ToToPoStOoOo,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834839085890023424', N'RT @gadelmaleh: Maman j''ai 7m de followers sur Twitter 😂😂😂😂 https://t.co/Ra3VJdVJpp', CAST(0x0000A73700F1BA82 AS DateTime), CAST(0x0000A7230137D7A4 AS DateTime), N'', N'@gadelmaleh,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834844249690632193', N'ﺷﺤﺎﻝ ﻣﻦ ﻭﺍﺣﺪ حاسب راسو رﺍﺟﻞ ﻭﺻﺎﺣﺒﺘﻮ كاتبا ﻓﻨﻤﺮﺓ ﺩﻳﺎﻟﻮ "خالتي مليكة"...ولا "عمتي الباتول".', CAST(0x0000A73700F1BA7F AS DateTime), CAST(0x0000A723013D7A38 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834895870713806852', N'RT @ImanMohamedAli: @blafrancia العلوم مترابطة. مثلا أبحاث هابر لدعم الصناعو الحربية لبلده أسفرت كذلك عن اكتشاف الأسمدة الآزوتية التي أنقذت…', CAST(0x0000A73700F36512 AS DateTime), CAST(0x0000A7230175D07C AS DateTime), N'', N'@ImanMohamedAli,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834901439625510912', N'@WrnherVonBraun شكرا على رفع المعنويات ;)', CAST(0x0000A73700F3650E AS DateTime), CAST(0x0000A723017BE4BC AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834903866072313856', N'@K7al_L3afta بقا تقلبوا على سكان الفضاء حتى يجيوا .. ويرجعوا بنادم فئران تجارب ديالهم هههه', CAST(0x0000A73700F3650A AS DateTime), CAST(0x0000A723017E8B40 AS DateTime), N'', N'@K7al_L3afta,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834905123612733440', N'@mohsine_ ضريح الكواكبي', CAST(0x0000A73700F36507 AS DateTime), CAST(0x0000A723017FE9A4 AS DateTime), N'', N'@mohsine_,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834911823690362880', N'RT @zi_agharabo: غادي نقري ولادي فالمدرسة العمومية بحال لي قراوني فيها واليديا واخا كان عندهم اختيار البعثة. الأسباب متعددة. انك تهجرها را…', CAST(0x0000A73700F36503 AS DateTime), CAST(0x0000A72301873A4C AS DateTime), N'', N'@zi_agharabo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834912201211318272', N'RT @Raseef22: خسر #المغرب 320 مليون دولار في 6 أشهر بسبب قطع المكالمات الصوتية والمرئية التي توفرها التطبيقات...  https://t.co/By5AP7ZfiP', CAST(0x0000A73700F364FE AS DateTime), CAST(0x0000A7230187A3C4 AS DateTime), N'المغرب,', N'@Raseef22,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834914887348420609', N'@zi_agharabo الوضع يرثى له .. في المغرب أصبح رجال التعليم أنفسهم يدرسون أبناءهم في المدارس الخاصة', CAST(0x0000A73700F364FA AS DateTime), CAST(0x0000A723018A91C4 AS DateTime), N'', N'@zi_agharabo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834918527878451200', N'@7didane --&gt; https://t.co/YsA84wLgjU', CAST(0x0000A73700F364F7 AS DateTime), CAST(0x0000A724000308F4 AS DateTime), N'', N'@7didane,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834920132271026176', N'RT @Pontifex_ar: كم مرّة يطلب الرب منا، في الكتاب المقدّس، أن نقبل المهاجرين والغرباء ويذكّرنا أننا بدورنا غرباء!', CAST(0x0000A73700F364F3 AS DateTime), CAST(0x0000A7240004C9C8 AS DateTime), N'', N'@Pontifex_ar,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834920738557673472', N'RT @Pontifex_ar: إن كان الشرُّ معدٍ فكذلك الخير أيضًا. لنسمح إذًا للخير أن يُعدينا ولنُعدِ الآخرين به!', CAST(0x0000A73700F364EF AS DateTime), CAST(0x0000A72400057288 AS DateTime), N'', N'@Pontifex_ar,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'834934083973152769', N'حملة قوية من اجل تحميل البجيدي مسؤولية فيضانات سلا..رغم ان المسؤول الاول عن تدبير الازمات والكوارث هي وزارة... https://t.co/lP2HPFBEKw', CAST(0x0000A72F01764606 AS DateTime), CAST(0x0000A72400140370 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835057188196478976', N'https://t.co/Fr9bsxMvsU', CAST(0x0000A73000022253 AS DateTime), CAST(0x0000A724009A5DF8 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835235172467507200', N'الـ FDT تدعو إلى توقيف برنامج التيجيني.. وتصفه بـ "المهزلة" https://t.co/z7ISg8NENP', CAST(0x0000A7300002224E AS DateTime), CAST(0x0000A724015C9E7C AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835269751958036480', N'RT @mayziyada: النخبة ليسوا أولئك الذين يتحدثون عن الثقافة صباح مساء، بل هم من يملك الوعي والفهم ويترجم ثقافته مواقف ومبادئ.', CAST(0x0000A73700F364EC AS DateTime), CAST(0x0000A72401825C98 AS DateTime), N'', N'@mayziyada,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835270293128110080', N'@Almuraqiba 
"حرقت القرآن عدة مرات وأعرف الكثير من الناس ممن فعل نفس الشئ..."
https://t.co/aFcWRsf23d', CAST(0x0000A73700F364E8 AS DateTime), CAST(0x0000A7240182F3C4 AS DateTime), N'', N'@Almuraqiba,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835276217775443968', N'@chehbi 
مفكر ماشي مهنة 
https://t.co/91FECWyJdq', CAST(0x0000A73700F364E4 AS DateTime), CAST(0x0000A72401896A74 AS DateTime), N'', N'@chehbi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835279618504552449', N'قطاع التعليم بالمغرب .. اشكاليات تدبير الموارد البشرية
(برنامج مواطن اليوم)
 https://t.co/Wt6g7ultKO', CAST(0x0000A73700F364DF AS DateTime), CAST(0x0000A72500019ED8 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835504640502480897', N'#Tetuan #Tetouan #Tétouan #Maroc #Morocco #Chamal #Tanger #Tangier 
#تطوان #الشمال #طنجة #المغرب… https://t.co/yObfwZnuEo', CAST(0x0000A73700F1BA7C AS DateTime), CAST(0x0000A72500F734C4 AS DateTime), N'Tetuan,Tetouan,Tétouan,Maroc,Morocco,Chamal,Tanger,Tangier,تطوان,الشمال,طنجة,المغرب,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Tétouan', N'18513045971f5e3b', N'  35.5667,  -5.3667', N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835513168503930880', N'إعرف تاريخك تعرف من أنت ☺', CAST(0x0000A7270020ED7E AS DateTime), CAST(0x0000A7250100845C AS DateTime), N'', N'', N'834785658174578688', N'RkibiOthmane', 3, 23, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835522377803001856', N'شكرا يا أخي  :)
https://t.co/7tnYHPQ9qz', CAST(0x0000A73700F364DB AS DateTime), CAST(0x0000A725010A90A0 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835528438488379393', N'RT @coalitionarabe: في المغرب.. الطب ينطق بالعربية منهيا احتكار الفرنسية https://t.co/46Zb5cOWln', CAST(0x0000A73700F364D7 AS DateTime), CAST(0x0000A72501112DFC AS DateTime), N'', N'@coalitionarabe,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835530263392288769', N'جامعة القاضي عياض بمراكش ساهمت الى جانب الوكالة الفضاء الامريكية ناسا في اكتشاف الكواكب السبعة
https://t.co/C76BXMEqDH', CAST(0x0000A73700F364D3 AS DateTime), CAST(0x0000A72501132BC0 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835537058059943936', N'تبعد السبع كواكب عن الأرض ب40 سنة ضوئية  أي 278 ألف مليار كيلومتر !.. ولو أرسلنا مركبة تجري ب60 ألف كلم/ساعة ستصل إلى هناك بعد 800 ألف عام!', CAST(0x0000A73700F364CE AS DateTime), CAST(0x0000A725011A9630 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835540495396966400', N'شكرا لمن تفاعل مع السؤال،  ليس هدفي احتقار العلم، لكن للأبحاث الفضائية جوانب مدنية وعسكرية، أي تجمع الخير والشر... ربما ككل العلوم ;)', CAST(0x0000A73700F364C9 AS DateTime), CAST(0x0000A725011E5720 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835541464817991680', N'.@MohaOuBr Bill Gates يستثمر في أبحاث ستسهل تغذية ملايير أكثر. زائد أنه عندما تغنى المجتمعات تنقص نسبة الإنجاب ودول كثيرة تعرف تناقص السكان', CAST(0x0000A73700F34365 AS DateTime), CAST(0x0000A725011F65D4 AS DateTime), N'', N'@MohaOuBr,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835542235089350656', N'.@cdnmai ربما عندما يكتشفون دواء الموت أو على الأقل عندما يصبح الإنسان يعيش 500 سنة.. سيصبح مستعدا لركوب رحلة 40 سنة ;)', CAST(0x0000A73700F3435E AS DateTime), CAST(0x0000A72501203D74 AS DateTime), N'', N'@cdnmai,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835542780382441476', N'@DonChuchote لا أعرف تلك الكواليس.. لكن ككل المؤسسات ... ناسا تحتاج إلى تبرير ميزانيتها :)', CAST(0x0000A73700F34355 AS DateTime), CAST(0x0000A7250120D5CC AS DateTime), N'', N'@DonChuchote,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835543617666170881', N'@ToToPoStOoOo تحالف الكاف ما بين الكويت وكتبانستان', CAST(0x0000A73700F3434F AS DateTime), CAST(0x0000A7250121BF00 AS DateTime), N'', N'@ToToPoStOoOo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835544142335918081', N'RT @cdnmai: تصدر اليابان 200 كتاب يوميا. لو 1% فقط يجب ترجمته فينبغي أن نترجم 700 كتاب سنويا، يعني محتاجين حوالي 100 مترجم. لو النص من لغة…', CAST(0x0000A73700F34346 AS DateTime), CAST(0x0000A7250122517C AS DateTime), N'', N'@cdnmai,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835545658224480257', N'رحم الله حسن الجندي ... 
السؤال الذي حيرني في فلم "الرسالة"، لماذا أعطيت أدوار كفار قريش للممثلين المغاربة؟ (الجندي والزروالى مثلا)', CAST(0x0000A73700F34341 AS DateTime), CAST(0x0000A7250123F9B4 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835549032701431811', N'@DonChuchote ما بقيتش عاقل لكن كان واحد بو شعكاكة.. الصديقي ؟', CAST(0x0000A73700F3433B AS DateTime), CAST(0x0000A7250127A7E4 AS DateTime), N'', N'@DonChuchote,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835549413141581825', N'@noureddine07BH هههه ربما  .. لكن قد يكون الجواب صعبا', CAST(0x0000A73700F34336 AS DateTime), CAST(0x0000A72501281288 AS DateTime), N'', N'@noureddine07BH,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835549497245716480', N'RT @yahia_aziz: @blafrancia أبحث دائما عن الساسة هم من يجعلوا القمر الصناعي يوجه صاروخا بالستياً لحيك السكني بدلا من اكتشاف المياه الجوفية…', CAST(0x0000A73700F34330 AS DateTime), CAST(0x0000A725012829F8 AS DateTime), N'', N'@yahia_aziz,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835550511961149440', N'@HabbajFaouzi شكرا على المعلومة', CAST(0x0000A73700F34329 AS DateTime), CAST(0x0000A72501294590 AS DateTime), N'', N'@HabbajFaouzi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835550646929612809', N'@noureddine07BH مخرج الفيلم أمريكي', CAST(0x0000A73700F34323 AS DateTime), CAST(0x0000A72501296B10 AS DateTime), N'', N'@noureddine07BH,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835551394954371077', N'أليسون.. مسلم ينافس على قيادة الحزب الديمقراطي الأميركي https://t.co/x0AMtPL5Gj 
@keithellison', CAST(0x0000A73700F3431D AS DateTime), CAST(0x0000A725012A3CD4 AS DateTime), N'', N'@keithellison,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835551784051552260', N'RT @DonChuchote: @blafrancia 
اه الطيب الصديقي دور الوليد .. حسن الجندي دور ابا جهل .. محمد مفتاح دور صهيب الرومي ..', CAST(0x0000A73700F34317 AS DateTime), CAST(0x0000A725012AA8A4 AS DateTime), N'', N'@DonChuchote,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835553244931817472', N'@psisco2 محششين ههه', CAST(0x0000A73700F34312 AS DateTime), CAST(0x0000A725012C41A0 AS DateTime), N'', N'@psisco2,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835553819840954370', N'@MohaOuBr أنت من المتشائمين ;)', CAST(0x0000A73700F3430B AS DateTime), CAST(0x0000A725012CE22C AS DateTime), N'', N'@MohaOuBr,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835555709714632704', N'@MohaOuBr فكرة بيل غيتس أن الأرض تتسع لأكثر .. لو غيرنا طريقة أكلنا .. اعتماد على النباتات بدل الحيوانات التي تستهلك الكثير من الطاقة', CAST(0x0000A73700F34305 AS DateTime), CAST(0x0000A725012EF184 AS DateTime), N'', N'@MohaOuBr,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835556708529340417', N'الغريب أن الداعم الأساسي للمرشح المسلم أليسون.... هو اليهودي "بيرني ساندرز" الذي كان ينافس هيلاري لرئاسة أمريكا 
@BernieSanders', CAST(0x0000A73700F34300 AS DateTime), CAST(0x0000A7250130086C AS DateTime), N'', N'@BernieSanders,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835560100236492800', N'@MohaOuBr تحدث مالتوس على نفس الشيء في عام 1780 ولم يحصل شيئا 
https://t.co/8tGYafqlTv', CAST(0x0000A73700F342F9 AS DateTime), CAST(0x0000A7250133BC78 AS DateTime), N'', N'@MohaOuBr,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835560158768033792', N'RT @haya2237: @blafrancia 
ليس دائماً محمد المفتاح أخذ دور حمزه في مسلسل عمر أيضاً عبدالسلام الحسيني أخذ دور عبدالله بن سهيل في مسلسل عمر', CAST(0x0000A73700F342F2 AS DateTime), CAST(0x0000A7250133CCE0 AS DateTime), N'', N'@haya2237,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835564747215028224', N'فيديو ينشره اليمين العنصري في فرنسا.. يهول من نمو عدد المسلمين في أوروبا لأنهم "سيصبحون غالبية في أروبا خلال عقود"
https://t.co/jfSg1nmOWf', CAST(0x0000A73700F342EA AS DateTime), CAST(0x0000A7250138CEE8 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835565776073543680', N'https://t.co/aHCXrSz7Ra', CAST(0x0000A7270020ED73 AS DateTime), CAST(0x0000A7250139EE04 AS DateTime), N'', N'', N'835315605993635844', N'AlhanfifAmine', 12, 147, N'Benslimane', N'1ffd06ae60e041d9', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835565950430822402', N'سطاج الوحش 
https://t.co/L4t8Qg6ht6', CAST(0x0000A7270020ED63 AS DateTime), CAST(0x0000A725013A1F3C AS DateTime), N'', N'', N'834785658174578688', N'RkibiOthmane', 3, 23, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835568349039964161', N'RT @HassanIkzarn: @DonChuchote @blafrancia الزروالي أكيد شارك لكن لم ينطق بحرف وهو الذي يثرثر لساعات على الركح !
وأيضا الزعري والداسوكين ون…', CAST(0x0000A73700F342E3 AS DateTime), CAST(0x0000A725013CBD8C AS DateTime), N'', N'@HassanIkzarn,@DonChuchote,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835568441314656260', N'RT @haya2237: @blafrancia مافي عنصريه المشرق يحبكم 💕للي يقول عنصرية المشرق😂', CAST(0x0000A73700F342DD AS DateTime), CAST(0x0000A725013CD754 AS DateTime), N'', N'@haya2237,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835571884142002180', N'سطاج الوحش 

https://t.co/L4t8Qg6ht6', CAST(0x0000A7270020ED57 AS DateTime), CAST(0x0000A72501409970 AS DateTime), N'', N'', N'834785658174578688', N'RkibiOthmane', 3, 23, N'Skhirate Témara', N'28d5be254223fefb', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835573417130799104', N'@kabbazal75 الحسين أوباما أصبح رئيسا ... في واحد الزمان :))', CAST(0x0000A73700F342D5 AS DateTime), CAST(0x0000A7250142452C AS DateTime), N'', N'@kabbazal75,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835574348224335872', N'RT @haya2237: من أعماله دوره في مسلسل عمر بدور عتبة بن ربيعة https://t.co/hipzlPntQt', CAST(0x0000A73700F342CC AS DateTime), CAST(0x0000A72501434954 AS DateTime), N'', N'@haya2237,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835574368302419973', N'RT @haya2237: أخذ دور أبو جهل بفلم الرساله بالنسخه العربية ودور كسرى بالنسخه الإنجليزيه.', CAST(0x0000A73700F342C4 AS DateTime), CAST(0x0000A72501434F30 AS DateTime), N'', N'@haya2237,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835575970790850563', N'RT @moriscbandoler: تحديات تواجه مسلمي أوروبا وسط حملات الكراهية والتخويف
https://t.co/PjWf2o5zVz', CAST(0x0000A73700F342BA AS DateTime), CAST(0x0000A72501450ED8 AS DateTime), N'', N'@moriscbandoler,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835579066401099776', N'@ToToPoStOoOo بخير يا عقيد .. أطال الله في عمرك', CAST(0x0000A73700F342B3 AS DateTime), CAST(0x0000A72501486FB0 AS DateTime), N'', N'@ToToPoStOoOo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835595346696863744', N'رجل أعمال كندي ينفق 1.5 مليون دولار على 58 أسرة سورية
https://t.co/UIrfjnQwsA', CAST(0x0000A73700F342AD AS DateTime), CAST(0x0000A725015A33BC AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835596860584771584', N'RT @chautta1: ذ.امحمد العثماني والد #سعدالدين_العثماني@Elotmanisaadفي شهادة د.أمرير في كتابه العصاميون السوسيون في الدار البيضاء
https://t.…', CAST(0x0000A73700F342A7 AS DateTime), CAST(0x0000A725015BDAC8 AS DateTime), N'سعدالدين_العثماني,', N'@chautta1,@Elotmanisaad,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835599362638118912', N'https://t.co/yppTJlpe8C', CAST(0x0000A73000022248 AS DateTime), CAST(0x0000A725015E9664 AS DateTime), N'', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835600947258798082', N'لقبوه ب "أبو جهل" ... ها ما قلنا 

https://t.co/57IkjIxAsq', CAST(0x0000A73700F3429F AS DateTime), CAST(0x0000A7250160515C AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835609820069769218', N'غالطين في العنوان :))
https://t.co/34waUOkfN4', CAST(0x0000A73700F34234 AS DateTime), CAST(0x0000A7250169FFE0 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835612363344707584', N'RT @Anfassdemo: كتاب شهادات لنشطاء 20 فبراير 
https://t.co/oT3xNeeU1K', CAST(0x0000A73700F3422D AS DateTime), CAST(0x0000A725016CC734 AS DateTime), N'', N'@Anfassdemo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835628028772384769', N'المرشح المسلم أليسون لم يفز برئاسة الحزب الديموقراطي.. لكن الفائز عينه نائب الرئيس 
https://t.co/OfDugsE1zT', CAST(0x0000A73700F34226 AS DateTime), CAST(0x0000A725017DDEFC AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835628359971454976', N'RT @chehbi: تتفرج فالقنوات المغربية ؟

(ريتويت بليز)', CAST(0x0000A73700F34219 AS DateTime), CAST(0x0000A725017E3B90 AS DateTime), N'', N'@chehbi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835629040186851329', N'RT @8dadLA: @blafrancia لماذا تم تعيينه؟ لان نخبة الحزب لا يريدون خسارة الشباب الديمقراطي المتحمس..الذين يؤيدون كيث. يريدونه رئيساً لتجديد…', CAST(0x0000A73700F34210 AS DateTime), CAST(0x0000A725017EFA94 AS DateTime), N'', N'@8dadLA,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835887497301327878', N'-Le beau par sa beauté est timide, et le moche si seulement Dieu le guide.

-الزين يحشم على زينو، و الخايب غير... https://t.co/25ivSs9uhm', CAST(0x0000A73700F1BA79 AS DateTime), CAST(0x0000A726010D8CB0 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835907283787919360', N'Just posted a photo @ Benslimane https://t.co/F3p8OwaS7F', CAST(0x0000A72700209638 AS DateTime), CAST(0x0000A7260123246C AS DateTime), N'', N'', N'827174226', N'SalmaStrong', 278, 73, N'Benslimane', N'1ffd06ae60e041d9', N'  33.6122,  -7.12111', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835907407498838017', N'😌 @ Benslimane https://t.co/9Sto2ZFJ4C', CAST(0x0000A72700202811 AS DateTime), CAST(0x0000A72601234794 AS DateTime), N'', N'', N'827174226', N'SalmaStrong', 278, 73, N'Benslimane', N'1ffd06ae60e041d9', N'  33.6122,  -7.12111', N'lt')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835948275748450305', N'@Un_Marocain مجرد استعارة للإسم ...', CAST(0x0000A73700F3420A AS DateTime), CAST(0x0000A726014FE128 AS DateTime), N'', N'@Un_Marocain,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835948766167461888', N'RT @najibelmokhtari: من طنجة للكويرة..
عفوا بغيت نقول من طنجة للقرقارات..
اه كيفاش؟ القرقارات مبقاتش ديالنا؟
من طنجة لبير غندوز دابا... htt…', CAST(0x0000A73700F34205 AS DateTime), CAST(0x0000A72601506A44 AS DateTime), N'', N'@najibelmokhtari,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835949252572479488', N'ربما خطوتين إلى الوراء من أجل خطوة إلى الأمام 
@najibelmokhtari', CAST(0x0000A73700F341FF AS DateTime), CAST(0x0000A7260150F234 AS DateTime), N'', N'@najibelmokhtari,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835951406242795520', N'كيف تنشر العنصرية مارين لوبين (مرشحة الرئاسة الفرنسية) كراهية المسلمين في العالم وكيف خدعتهم بقضية زيارة مفتي لبنان؟
https://t.co/ovfEp87wuf', CAST(0x0000A73700F341FA AS DateTime), CAST(0x0000A72601534C8C AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835957696788561920', N'أجور العمال في الصين تضاعفت خلال 10 سنوات وأصبحت أعلى من أجور البرازيل والارجنتين وقريبة من أجور اليونان والبرتغال… https://t.co/3EbayWBFNj', CAST(0x0000A73700F341F5 AS DateTime), CAST(0x0000A726015A2930 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835960933239386113', N'شركة نوكيا المتخصصة الآن في معدات الإتصالات فقط رخصت لشركة فنلندية HMD اسم NOKIA لتسويق هواتف جديدة 
https://t.co/YAHK01D1am
@Un_Marocain', CAST(0x0000A73700F341EF AS DateTime), CAST(0x0000A726015DB1E0 AS DateTime), N'', N'@Un_Marocain,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835963655783137281', N'@Un_Marocain ربما بعض الأشخاص. مايكروسفت اشترت NOKIA لكن بعد فشل هواتف مايكروسفت .. أغلقت المعامل وسرحت العمال لكنها تحتفظ ببراءات الإختراع', CAST(0x0000A73700F341E9 AS DateTime), CAST(0x0000A7260160AA6C AS DateTime), N'', N'@Un_Marocain,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835965918731710465', N'GAC شركة سيارات صينية تعتمد على الروبوتات أكثر من العمال .. تنتج سيارة باسم TRUMPCHI .. الأسطورة ولا علاقة مع ترامب 
https://t.co/KYEBG9j2u4', CAST(0x0000A73700F341E4 AS DateTime), CAST(0x0000A7260163233C AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835966911372460032', N'الصيني مؤسس شركة صناعة السيارات GAC كان يشتغل مصمما لسيارات ميرسيدس.. الشركة تنوي الدخول إلى السوق الأمريكي لكن دون أستخدام ماركة TRUMPCHI', CAST(0x0000A73700F341DF AS DateTime), CAST(0x0000A726016437CC AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835968139775119365', N'ما تقيسش جارتي 
https://t.co/D8QACpOpo6', CAST(0x0000A73700F341DA AS DateTime), CAST(0x0000A72601658F28 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835983197011836928', N'@sb93108 هو رجل كبير السن.. وهي استغلت الوضع لخلق ضجة', CAST(0x0000A73700F341D5 AS DateTime), CAST(0x0000A7260175FE30 AS DateTime), N'', N'@sb93108,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835989589680504832', N'@sb93108 هادشي علاش في المقال الكاتبة قالت بأن الأمر مدبر ... "لقاتهم نية" ... وربما مفتي لبنان لا يتابع السياسة في فرنسا', CAST(0x0000A73700F341D0 AS DateTime), CAST(0x0000A726017CF820 AS DateTime), N'', N'@sb93108,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'835991994509979648', N'@sb93108 لبنان كامل غادي غير بالبركة', CAST(0x0000A73700F341C9 AS DateTime), CAST(0x0000A726017F98C8 AS DateTime), N'', N'@sb93108,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836171774001876996', N'LES 5 JEUX PRÉFÉRÉS D''ALEXANDRE ASTIER ! https://t.co/tlwkT3BuXz', CAST(0x0000A7300019BEDB AS DateTime), CAST(0x0000A72700B84BB0 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836208003384819713', N'عدنا من جديد .. غير صبرو معنا الله يزازيكم :p', CAST(0x0000A72F0176442D AS DateTime), CAST(0x0000A72700DFD658 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836229966702444546', N'Men can meet but the mountains cannot ! @ Benslimane https://t.co/oiNvwEynE5', CAST(0x0000A727017624AD AS DateTime), CAST(0x0000A72700F7CF74 AS DateTime), N'', N'', N'18526308', N'YasserMonkachi', 10931, 2390, N'Benslimane', N'1ffd06ae60e041d9', N'  33.6122,  -7.12111', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836233256831975425', N'Le Nokia 3310 est de retour ! - MWC 2017 https://t.co/7KTMBTqfdM', CAST(0x0000A7300019BED2 AS DateTime), CAST(0x0000A72700FB6634 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836349702807433216', N'RT @DonChuchote: د. #طارق_سويدان للمغاربة : الفرنسية لغة متخلفة، ويجب أن تتخلصوا من التبعية للفرونكوفونية.

استمع 👇

#الدون_هتيرو https://t…', CAST(0x0000A73700F341C3 AS DateTime), CAST(0x0000A727017A7CF8 AS DateTime), N'طارق_سويدان,الدون_هتيرو,', N'@DonChuchote,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836354927903518721', N'RT @DonChuchote: لكثرة التساؤلات بعد منشوري عن الأمازيغية، هنا التفاصيل بخصوص الأمازيغية واختيار حرف "تيفيناغ". 👇

#الدون_هتيرو https://t.c…', CAST(0x0000A73700F341B4 AS DateTime), CAST(0x0000A72701803120 AS DateTime), N'الدون_هتيرو,', N'@DonChuchote,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836355956506308608', N'@Fatima_zahra050 ربما يقصدون الإنسان اللي ما تعارفيهش .. بحال مرحبا .. أنت شيعي ؟', CAST(0x0000A73700F341AD AS DateTime), CAST(0x0000A7270181503C AS DateTime), N'', N'@Fatima_zahra050,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836359624387411968', N'RT @Arabi21News: ليبيراسيون: هل بدأت حملة غلق المدارس الإسلامية في فرنسا؟ https://t.co/ZzzWbpvMNI', CAST(0x0000A73700F341A5 AS DateTime), CAST(0x0000A72701855074 AS DateTime), N'', N'@Arabi21News,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836490711830790144', N'#vonvon https://t.co/mmy5wmHc4x', CAST(0x0000A73000022243 AS DateTime), CAST(0x0000A7280088E03C AS DateTime), N'vonvon,', N'', N'371279952', N'YatimM', 6602, 387, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836576111907782657', N'فالمغرب...الشعب كامل عارف فين كيتباع الحشيش.
إلا البوليس مساكن. – optimiste', CAST(0x0000A73700F1BA76 AS DateTime), CAST(0x0000A72800E614C8 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836651657169620992', N'يا ما أحلى الفسحة يا عيني  على رأس البر
والقمر نور   عيني يا عيني يا عيني   على موج البحر https://t.co/E4Fiix5Ku4', CAST(0x0000A72F01763DB8 AS DateTime), CAST(0x0000A7280138876C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836703022155722752', N'« Sozi » dans Linux Pratique 100 (Mars-Avril 2017) https://t.co/dMyJedNvjX', CAST(0x0000A7300019BECA AS DateTime), CAST(0x0000A72801709760 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836734504362520576', N'@MohaOuBr 
فيلم ابن بطوطة
https://t.co/oWnysYGtYU', CAST(0x0000A73700F34181 AS DateTime), CAST(0x0000A72900077178 AS DateTime), N'', N'@MohaOuBr,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'836935573650690050', N'Good day!

#Patatra #Patata #patat #Patate #Lunch #Food #foodie #Maroc #Morocco
#المغرب #المغربي… https://t.co/4p4Z6iWWRs', CAST(0x0000A73700F1BA6D AS DateTime), CAST(0x0000A72900E2E2D0 AS DateTime), N'Patatra,Patata,patat,Patate,Lunch,Food,foodie,Maroc,Morocco,المغرب,المغربي,', N'', N'43256664', N'AnouarNACH', 5448, 1022, N'Mers Sultan', N'3c800db26fed7972', N'  33.574261,  -7.6127359', N'en')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837316296182272000', N'Funding Plateform for Startups https://t.co/UrzWgfbBa6', CAST(0x0000A73700F1BA60 AS DateTime), CAST(0x0000A72A00F6E640 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837316578110763008', N'للناس لي عندهم مشاريع أول غادي يبداو ماشريع جديدة
جاوبو هنا على بعض الأسئلة متعلقة بالتمويل ! https://t.co/S5WPUZdLyv', CAST(0x0000A73700F1B59B AS DateTime), CAST(0x0000A72A00F734C4 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837329273379770369', N'موالين "الفلوس ماكيشريوش السعادة" والحزقة زعما هي ليكتمتعك بالسعادة ياك ؟
 😂😂😝', CAST(0x0000A73500F7B7AF AS DateTime), CAST(0x0000A72A01051008 AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837337360991936512', N'بالفيديو.. الخبز المر.. الشرطة الاسبانية تعتدي بالعصي على مغربيات التهريب المعاشي https://t.co/RLsBsEAbU7', CAST(0x0000A72F0176285D AS DateTime), CAST(0x0000A72A010DE368 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837377782267146241', N'@duffwoman_ @Anas_BOUGATAYA @docteurho ah oui j''ai oublié ! Nous serons à encgC le jeudi prochain ^^', CAST(0x0000A72F018B2150 AS DateTime), CAST(0x0000A72A013A00C4 AS DateTime), N'', N'@duffwoman_,@Anas_BOUGATAYA,@docteurho,', N'183278308', N'WahidROUHLI', 33014, 832, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837379366543831041', N'This Gmail Change Will Make Your Life Better. https://t.co/x6VORnLnnK', CAST(0x0000A73101124EC5 AS DateTime), CAST(0x0000A72A013BBBBC AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5440, 1020, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837389561235976193', N'https://t.co/dtEdpX9CDV', CAST(0x0000A730001A71F4 AS DateTime), CAST(0x0000A72A0146DC90 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837390609484759040', N'Face2Face: Real-time Face Capture and Reenactment of RGB Videos (CVPR 2016 Oral) https://t.co/gnPWDzv5DA', CAST(0x0000A730001A71E8 AS DateTime), CAST(0x0000A72A0148005C AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837405157772181504', N'Nouveau format publicitaire par @OrangeMaroc 
شكل اشهاري جديد من اورونج. https://t.co/2EMPQ3xOAy', CAST(0x0000A73101124EB9 AS DateTime), CAST(0x0000A72A0157E198 AS DateTime), N'', N'@OrangeMaroc,', N'43256664', N'AnouarNACH', 5440, 1020, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837405243486908418', N'RT @OusamaKhadraoui: المؤتمر الوطني الرابع للغة العربية يومي الجمعة و السبت 11 - 12 جمادى الآخر 1438 هـ الموافق لـ 10 - 11 مارس 2017م بالمك…', CAST(0x0000A73700F3417D AS DateTime), CAST(0x0000A72A0157F908 AS DateTime), N'', N'@OusamaKhadraoui,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837405546915430400', N'@aimadnet Je l''ai jamais vu, 7it kent @Maroc_Telecom  @OrangeMaroc', CAST(0x0000A73101124EA5 AS DateTime), CAST(0x0000A72A01584E94 AS DateTime), N'', N'@aimadnet,@Maroc_Telecom,@OrangeMaroc,', N'43256664', N'AnouarNACH', 5440, 1020, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837405763895242752', N'@K7al_L3afta اول مرة كنشوفو ملي وليت اورونج...نتا موثاقاااااف البزخ ههههه @OrangeMaroc', CAST(0x0000A73101124E86 AS DateTime), CAST(0x0000A72A01588B84 AS DateTime), N'', N'@K7al_L3afta,@OrangeMaroc,', N'43256664', N'AnouarNACH', 5440, 1020, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837410022627950594', N'قال لي بقال: موظف كلاه ف 36 ألف ريال. واحد النهار شافو شاري باربول جديد:|
 الكريدي أصبح طريقة عيش لكثير من المغاربة!
https://t.co/05y7MlEGsb', CAST(0x0000A73700F34178 AS DateTime), CAST(0x0000A72A015D30F8 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837414009984942080', N'RT @moriscbandoler: "حكاية ويكيبيديا"  كتاب حديث من تأليف الزميل عباد ديرانية @AbbadDira 
https://t.co/EZOJM25DeX', CAST(0x0000A73700F34166 AS DateTime), CAST(0x0000A72A01618B6C AS DateTime), N'', N'@moriscbandoler,@AbbadDira,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837420142040604673', N'NASA released a ton of software for free and here’s some you should try https://t.co/G43qC95lNW', CAST(0x0000A730001A71D3 AS DateTime), CAST(0x0000A72A01683CB4 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837440426936315906', N'https://t.co/8y88MHaZpd', CAST(0x0000A730001A71B5 AS DateTime), CAST(0x0000A72A017E5FE4 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837446783525601280', N'@bouziane_a non ça n''a rien avoir avec le web ou Internet, @K7al_L3afta a confirmé que c''est une ancienne technique : Cell Broadcast.', CAST(0x0000A73101124E81 AS DateTime), CAST(0x0000A72A01854F48 AS DateTime), N'', N'@bouziane_a,@K7al_L3afta,', N'43256664', N'AnouarNACH', 5440, 1020, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837447419054985216', N'شاروخان https://t.co/NuzEzDqMJQ', CAST(0x0000A73101124E7C AS DateTime), CAST(0x0000A72A01860168 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5440, 1020, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837610507775397888', N'كندا يا كندا https://t.co/6iER9JPUHc', CAST(0x0000A73500F7B798 AS DateTime), CAST(0x0000A72B00AC7D6C AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837640730038296577', N'كان عندي هدف نبيل، و أحلام جميلة.
و الحمد لله، نبيل مات...جميلة خدامة رقاصة و الهدف طلع تسلل واضح.
جمعة مُباركة.', CAST(0x0000A73101124E78 AS DateTime), CAST(0x0000A72B00CD79F4 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5440, 1020, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837675270056333312', N'La génération Erasmus à la rescousse de l’Europe ? https://t.co/zsZleq8YVV', CAST(0x0000A730001A71A8 AS DateTime), CAST(0x0000A72B00F32C58 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837715080687075328', N'RT @DonChuchote: خطيب الجمعة تحدث عن استثمارات المغرب في إفريقيا، بتوجيهات من أمير المؤمنين.

👇 https://t.co/OkX1VqLgFL', CAST(0x0000A73700F3413B AS DateTime), CAST(0x0000A72B011E9E9C AS DateTime), N'', N'@DonChuchote,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837718107011563520', N'هل استثمارات المغرب في إفريقيا ستفتح أبواب الهجرة إلى دول جنوب الصحراء أمام العاطلين المغاربة؟', CAST(0x0000A73700F34122 AS DateTime), CAST(0x0000A72B0121ECB4 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837719005158846465', N'@DonChuchote الله يتبثنا على الشهادة .. أش دخل البزنس في الدين', CAST(0x0000A73700F34115 AS DateTime), CAST(0x0000A72B0122E77C AS DateTime), N'', N'@DonChuchote,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837719584656478217', N'RT @coalitionarabe: ائتلاف يطالب بوسعيد بوقف “الحيف” عن العربية في وثائق الضرائب https://t.co/mJaSrLMjNf', CAST(0x0000A73700F3410D AS DateTime), CAST(0x0000A72B01238934 AS DateTime), N'', N'@coalitionarabe,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837724291999334400', N'@Jbilou__ هادشي إلى ما كنتش هاديك غير مشاريع وهمية (من غير قطاع الأبناك والإتصالات )... ;)', CAST(0x0000A73700F34107 AS DateTime), CAST(0x0000A72B0128AD38 AS DateTime), N'', N'@Jbilou__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837727198312345605', N'@Jbilou__ وهل ستفتح الأبواب أمام المهاجرين الأفارقة إلى المغرب ؟', CAST(0x0000A73700F34101 AS DateTime), CAST(0x0000A72B012BD828 AS DateTime), N'', N'@Jbilou__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837741677687230465', N'@Jbilou__ واش غادي يكون عندهم الحق يخدموا في المغرب ؟  واخا يمكن بزاف غادي يبغيوا المغرب غير طريق لأروبا', CAST(0x0000A73700F340F9 AS DateTime), CAST(0x0000A72B013BA6A4 AS DateTime), N'', N'@Jbilou__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837742016498913281', N'RT @ToToPoStOoOo: سبع سنوات من النضال فتويتر ضد السنوبيزم و العياقة و غلمان الفرنجة و لحاسين الكابة 
لقد ولى زمن تويتر الفرنجي 
كلنا ولاد ت…', CAST(0x0000A73700F340F2 AS DateTime), CAST(0x0000A72B013C0464 AS DateTime), N'', N'@ToToPoStOoOo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837745699701817345', N'RT @Fabu_louza: كيف جاتكم هاد كسيوه؟؟ 👗 https://t.co/rytLnGJOeB', CAST(0x0000A73101124E73 AS DateTime), CAST(0x0000A72B01400A78 AS DateTime), N'', N'@Fabu_louza,', N'43256664', N'AnouarNACH', 5440, 1020, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837745748011778048', N'@Jbilou__ أنا ماشي عنصري', CAST(0x0000A73700F340E5 AS DateTime), CAST(0x0000A72B0140175C AS DateTime), N'', N'@Jbilou__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837745756949868545', N'RT @Fabu_louza: كيف جاتكم اول محاوله 👔 https://t.co/71jTGPqxLb', CAST(0x0000A73101124E6D AS DateTime), CAST(0x0000A72B014019B4 AS DateTime), N'', N'@Fabu_louza,', N'43256664', N'AnouarNACH', 5440, 1020, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837747567425388545', N'@Jbilou__ القبول بالآخر تيجي من بعد الإحتكاك به ...  تجربتي مع الطلبة الأفارقة ، كان عاجبهوم الحال والناس تتعامل معاهم عادي', CAST(0x0000A73700F340D7 AS DateTime), CAST(0x0000A72B014213F4 AS DateTime), N'', N'@Jbilou__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837749705245343744', N'@ToToPoStOoOo مبروك السبعة .. أنت قيمة مضافة كبيرة لمجتمع تويتر المغربي', CAST(0x0000A73700F340D3 AS DateTime), CAST(0x0000A72B0144699C AS DateTime), N'', N'@ToToPoStOoOo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837750785404461062', N'@Jbilou__ نهار غادي تتعامل مع الغريب غادي تتعلم تحترموا. العنصرية موجودة  ف كل العالم (تأثير للوطنية) لكن من المبالغة القول "المغرب  عنصري"', CAST(0x0000A73700F340CC AS DateTime), CAST(0x0000A72B014596C8 AS DateTime), N'', N'@Jbilou__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837761622852665346', N'#نصيحة_لوجه_الله : 

أي بلاصة مشيتو ليها على قبل خدمة ، خاصكم تعرفو انكم غير ملزمين باش تخلصو ، سولو على راسكم... https://t.co/xXqN8CT0Bi', CAST(0x0000A73101124E69 AS DateTime), CAST(0x0000A72B01516AE8 AS DateTime), N'نصيحة_لوجه_الله,', N'', N'43256664', N'AnouarNACH', 5440, 1020, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837768229154086913', N'A must-visit my dears!

#CapeSpartel #CapSpartel #capsparteltanger #CapSpartelTangier #Maroc… https://t.co/d6vAZB6aFC', CAST(0x0000A73101124E53 AS DateTime), CAST(0x0000A72B0158A09C AS DateTime), N'CapeSpartel,CapSpartel,capsparteltanger,CapSpartelTangier,Maroc,', N'', N'43256664', N'AnouarNACH', 5440, 1020, N'Tangier Medina', N'97bd47ee2a153a97', N'  35.78482308,  -5.92648721', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837768275652149248', N'RT @Oussameleon: #bouteflika serait mort ça a l''air officiel mais attendons des sources sûres!', CAST(0x0000A730001A719A AS DateTime), CAST(0x0000A72B0158AD80 AS DateTime), N'bouteflika,', N'@Oussameleon,', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837770520514920450', N'https://t.co/EztjwoDDFn', CAST(0x0000A730001A7193 AS DateTime), CAST(0x0000A72B015B2074 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837791199297679360', N'RT @sb93108: Un débat politique débile prétendant d''éduquer le citoyen marocain ordinaire qui ne comprend guère le français. La3fou https:/…', CAST(0x0000A73700F340C5 AS DateTime), CAST(0x0000A72B0171B1CC AS DateTime), N'', N'@sb93108,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837793329337233410', N'@ToToPoStOoOo ما تديهاش في كلام الناس ... شنو الأغنية "كلام الناس" هههه', CAST(0x0000A73700F340C2 AS DateTime), CAST(0x0000A72B0174051C AS DateTime), N'', N'@ToToPoStOoOo,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837793450913370117', N'RT @CordassaY: @blafrancia احتمال وارد .. الجالية اللبنانية الموجودة في افريقيا كلها تعمل في مشاريع للبنانية تم توطينها منذ عشرات السنين بد…', CAST(0x0000A73700F340C0 AS DateTime), CAST(0x0000A72B01742718 AS DateTime), N'', N'@CordassaY,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837795015850086401', N'@Jbilou__ بلا ما ندخلو في نقاش بيزنطي .. المغاربة ماشي واحد .. كاين صراعات وطبقات ولكن ما كينش في المغرب أبارتياد وكيطو  ...', CAST(0x0000A73700F340BD AS DateTime), CAST(0x0000A72B0175DC34 AS DateTime), N'', N'@Jbilou__,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837805326544011265', N'من الأقليات التي حكمت المغرب، جيش "عبيد البخاري" الذي هيمن على المجال السياسي ووصل إلى حد تنصيب وعزل السلاطين… https://t.co/qerkLCmpfg', CAST(0x0000A73700F340BB AS DateTime), CAST(0x0000A72B01811DD8 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837807086499160066', N'ملك المغرب إسماعيل (و 1727 ) منع امتلاك العبيد وكون منهم جيش "عبيد البخاري" على شاكلة الجيش الإنكشاري العثماني  
https://t.co/mFEJ6cgpG7', CAST(0x0000A73700F340B9 AS DateTime), CAST(0x0000A72B018308DC AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837811068617568257', N'تطور منع امتلاك العبيد وشرائهم من قبل الدولة ليصل إلى إلزام ''جميع السود'' ولو كانوا احرارا الاندماج في جيش البخاري
https://t.co/Ry1Y3efYEr', CAST(0x0000A73700F340B7 AS DateTime), CAST(0x0000A72B01876224 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837814315243700224', N'@chehbi ماشيفهومش؟ .. أنت كابر مع الكوار هههه', CAST(0x0000A73700F340B4 AS DateTime), CAST(0x0000A72B018AED2C AS DateTime), N'', N'@chehbi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837815465271517184', N'.@chehbi حسب ويكيبيديا: جيش "عبيد البخاري" تحول إلى جيش "الحرس الملكي"
https://t.co/Ry1Y3efYEr', CAST(0x0000A73700F340AF AS DateTime), CAST(0x0000A72C0000AC44 AS DateTime), N'', N'@chehbi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837815808298467328', N'@CordassaY فرنسا منعت العبيد في المغرب', CAST(0x0000A73700F340AD AS DateTime), CAST(0x0000A72C00010C5C AS DateTime), N'', N'@CordassaY,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837816580348260352', N'.@chehbi "..ومنهم من يشتغل في داخل القصور للعناية بالخيول والسيارات وبقية الخدمات وهم المعروفون ب«الفرايكية»، ومنهم أصحاب الوضوء الملكي"!!', CAST(0x0000A73700F340AB AS DateTime), CAST(0x0000A72C0001E3FC AS DateTime), N'', N'@chehbi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837817105969995776', N'.@CordassaY فرنسا ما كنتش باغي تمحي الأمية ... قراو شوية ديال الناس لخدمة مصالحهم.. والبقية كانوا في الكرفي .. وحروب أوروبا ولاندو شين', CAST(0x0000A73700F340A8 AS DateTime), CAST(0x0000A72C00027678 AS DateTime), N'', N'@CordassaY,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837817523412348928', N'@chehbi عندك شي رقم على العدد؟ ماشي غريب أنهم توزعوا في المغرب واندمجوا في المجتمع', CAST(0x0000A73700F340A6 AS DateTime), CAST(0x0000A72C0002EBA8 AS DateTime), N'', N'@chehbi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837898022998663173', N'Dormir tranquille est un luxe pour les SDF, et ce bus veut le mettre à leur portée https://t.co/OOmlZFR8Ju', CAST(0x0000A730001A7178 AS DateTime), CAST(0x0000A72C005AC648 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'837983712910405632', N'La Théorie des Jeux — Science étonnante #39 https://t.co/I8DHg4TKL5', CAST(0x0000A7300019BEC3 AS DateTime), CAST(0x0000A72C00B84BB0 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838026169391906817', N'الاغنية اللي قريبة الى قلبي تصل الى 34 مليون مشاهدة ❤️ #madarna_walo #ihabamir https://t.co/s7IC8DoskL', CAST(0x0000A73500F81237 AS DateTime), CAST(0x0000A72C00E6A294 AS DateTime), N'madarna_walo,ihabamir,', N'', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838075690322915331', N'@salmaboujidi @CordassaY نهار خرجت فرنسا الناس اللي كان عندهم  الباك محسوبين', CAST(0x0000A73700F340A4 AS DateTime), CAST(0x0000A72C011CADBC AS DateTime), N'', N'@salmaboujidi,@CordassaY,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838089712363532300', N'♫ يستمع الآن "بالزاف عليهم" من أسامة بالحسن على #انغامي https://t.co/CeOFavdbnT', CAST(0x0000A73500F7B78C AS DateTime), CAST(0x0000A72C012BFC7C AS DateTime), N'انغامي,', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838092230472708102', N'هناك احتمال كبير أن تفوز مارين لوبين، مرشحة حزب عنصري، برئاسة فرنسا ...  يبدو أن الغرب بدأ يتدعشن https://t.co/zMrgNxU6mm', CAST(0x0000A73700F340A2 AS DateTime), CAST(0x0000A72C012EBB9C AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838092602587086848', N'@EncreRebel شي راس تيقول لي نمسح التغريدة .. لا يفهموها الناس غلط هههه', CAST(0x0000A73700F340A0 AS DateTime), CAST(0x0000A72C012F23E8 AS DateTime), N'', N'@EncreRebel,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838093199113613312', N'-هاد القهوة مامحتاجاشي السُكٙرْ...او لا؟
-نسولك نتا اخاي هههههه، نتا لي كتشربها.

#قهوة #شوقي #Qahwa #Chawki', CAST(0x0000A73101124E4E AS DateTime), CAST(0x0000A72C012FCA50 AS DateTime), N'قهوة,شوقي,Qahwa,Chawki,', N'', N'43256664', N'AnouarNACH', 5440, 1020, N'Hassan', N'7479862a63906ec7', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838095343728406529', N'فوز مارين لوبين برئاسة فرنسا كان شبه مستحيلا قبل سنوات. يبدو أن الأفكار العنصرية أصبحت تلقى رواجا ولم يعد يستحي كثير من الفرنسيين من تقبلها', CAST(0x0000A73700F3409E AS DateTime), CAST(0x0000A72C01322124 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838097653514788866', N'RT @PolicyUnitMA: @blafrancia تفسير غير صحيح. نتيجة الإنتخابات ستحدد في الدور الثاني. يعني من قابل لوبين سيفوز لأن منتخبيها لا يتعدون 30%.', CAST(0x0000A73700F3409B AS DateTime), CAST(0x0000A72C0134A6D8 AS DateTime), N'', N'@PolicyUnitMA,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838099030727065605', N'.@PolicyUnitMA نسبة الأصوات لصالح لوبين في الدور الثاني تقارب40~ 45 % .. وهو رقم كبير بالنسبة لحزب عنصري .. ما يعني تعاطف أكبر من الناخبين؟', CAST(0x0000A73700F34099 AS DateTime), CAST(0x0000A72C01362738 AS DateTime), N'', N'@PolicyUnitMA,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838100238288228353', N'@salmaboujidi @CordassaY الفكرة أن فرنسا في المغرب ما كنش جاية دير عمل إنساني وتقري المغاربة وتنورهم ... هاد الهضرة ديال بروبغندا', CAST(0x0000A73700F34097 AS DateTime), CAST(0x0000A72C013778B8 AS DateTime), N'', N'@salmaboujidi,@CordassaY,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838101846489198593', N'@a_rafi9 كيفوجو على بنادم هههه', CAST(0x0000A73101124E3D AS DateTime), CAST(0x0000A72C01393AB8 AS DateTime), N'', N'@a_rafi9,', N'43256664', N'AnouarNACH', 5440, 1020, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838102084654350336', N'@PolicyUnitMA @ucef79 فوز ترامب كان من سابع المستحيلات قبل سنوات ..   ظروف الإرهاب والإقتصاد.. دفع المحافظين إلى تقبل كراهية الأجانب ..', CAST(0x0000A73700F34094 AS DateTime), CAST(0x0000A72C01397C58 AS DateTime), N'', N'@PolicyUnitMA,@ucef79,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838102505305354240', N'@salmaboujidi اللي قراو مع الفرنسيين هوما ولاد المخزن اللي كانوا يتعاونوا مع الإستعمار', CAST(0x0000A73700F34091 AS DateTime), CAST(0x0000A72C0139F2B4 AS DateTime), N'', N'@salmaboujidi,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838105421869166593', N'@CordassaY @PolicyUnitMA فرنسا استعمرتنا بعد بناء تمثال الحرية بعقود .. وحديد برج  إيفل ربما مسروق من الجزائر  ههه', CAST(0x0000A73700F3408E AS DateTime), CAST(0x0000A72C013D2128 AS DateTime), N'', N'@CordassaY,@PolicyUnitMA,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838106682131681281', N'فازت لوبين أم لم تفز .. المخيف أن شعبيتها تزيد بسرعة ... عام 2012 حصلت فقط على 17% من أصوات الدور لأول.. هذا العام قد تحصل على 30%..', CAST(0x0000A73700F3408C AS DateTime), CAST(0x0000A72C013E80B8 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838107291882766336', N'RT @Sirius_MR: @blafrancia فرنسا تدعشنت منذ زمن طويل ! اليسار الحاكم اليوم أصبح أكثر يمينية من الجبهة الوطنية (فالس مثلاً) !', CAST(0x0000A73700F3408A AS DateTime), CAST(0x0000A72C013F2BD0 AS DateTime), N'', N'@Sirius_MR,@blafrancia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838109548909064192', N'RT @Un_Marocain: هاد قضية خلط اللغات فالأصل دليل على ضعف لغوي شخصي، ماعرفتش كيفاش حتى ولات مرادف للرقي الذوقي والثقافي والإجتماعي، وبطبيعة…', CAST(0x0000A73700F34088 AS DateTime), CAST(0x0000A72C0141A248 AS DateTime), N'', N'@Un_Marocain,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838112447559008258', N'@Sirius_MR لكن شعبية مكرون في زيادة .. ما هي حظوظه ؟', CAST(0x0000A73700F34085 AS DateTime), CAST(0x0000A72C0144CC0C AS DateTime), N'', N'@Sirius_MR,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838113004101206016', N'@CordassaY يعني فرنسا ديال عصر "الأنوار" بحال المغرب ديال "العصور الوسطى" ؟ ههه @PolicyUnitMA', CAST(0x0000A73700F34083 AS DateTime), CAST(0x0000A72C014567E8 AS DateTime), N'', N'@CordassaY,@PolicyUnitMA,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838113438584950785', N'@Ha2em1 داكشي .. المخيف عندي هو زيادة حجم قاعدة اليمين المتطرف', CAST(0x0000A73700F3406A AS DateTime), CAST(0x0000A72C0145E09C AS DateTime), N'', N'@Ha2em1,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838115051324260358', N'ربما برنامج لوبين ضد الأقليات والمهاجرين يلقى قبولا لكن قد تجد صعوبة في إقناع أغلبية الفرنسيين بالخروج من الإتحاد الأوروبي ومن الحلف الأطلسي', CAST(0x0000A73700F34067 AS DateTime), CAST(0x0000A72C0147A3C8 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838135484371058693', N'لأول مرة.. محكمة بالمغرب تقر ب "حق الطفل المولود خارج إطار الزواج في انتسابه لأبيه البيولوجي وحق الأم في التعويض"
https://t.co/77wSjUezla', CAST(0x0000A73700F34064 AS DateTime), CAST(0x0000A72C015DEFFC AS DateTime), N'', N'', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838144038729629696', N'كيحيروني هادوك الي تيكتبوا #مقصودة اولا #Msg_envoyé فشي سطاتو يا ودي سيفط الرسالة لداك المقصود فبريفي أولا خايف... https://t.co/R7VIx9q3XC', CAST(0x0000A73101124E38 AS DateTime), CAST(0x0000A72C0167469C AS DateTime), N'مقصودة,Msg_envoyé,', N'', N'43256664', N'AnouarNACH', 5440, 1020, NULL, NULL, NULL, N'ar')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838360490610929664', N'اجي حتى نتا تفهم تحرير الدرهم شنو كيعني، شنو الايجابيات و شنو السلبيات....

شكرا سوينگا Elmustapha Elfakkak https://t.co/lDtVRMA7Xd', CAST(0x0000A73101124E34 AS DateTime), CAST(0x0000A72D00C80064 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5440, 1020, NULL, NULL, NULL, N'fa')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838362304488046594', N'هاد الموقع زوين و الدراري لي موراه كلهم زوينين. كيستحق نصوتو ليه لنيل جائزة احسن موقع مغربي في ماروك ويب... https://t.co/ImgwbreCU6', CAST(0x0000A73101124E2F AS DateTime), CAST(0x0000A72D00C9FBD0 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5440, 1020, NULL, NULL, NULL, N'ar')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838492017500045312', N'RT @GJP_recordz: Check out @Ihab_Amir fans!

#iHabAmir | #Arab | #Music https://t.co/M3XXzi16sS', CAST(0x0000A73500F8122D AS DateTime), CAST(0x0000A72D01578D38 AS DateTime), N'iHabAmir,Arab,Music,', N'@GJP_recordz,@Ihab_Amir,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838492037167083520', N'RT @alkhabarpressma: هذه أثمنة تذاكر حفل إيهاب أمير بمسرح محمد السادس

https://t.co/4hx4uwmojv https://t.co/wxpbqh90pM', CAST(0x0000A73500F8122A AS DateTime), CAST(0x0000A72D015791E8 AS DateTime), N'', N'@alkhabarpressma,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838492110106071040', N'RT @chadafm: ناني يغني أجمل بارودي جوج كلمات لإيهاب أمير في عيد ميلاد ريم و عماد فلاراديو.. | https://t.co/Hvw0FqfuW9', CAST(0x0000A73500F81227 AS DateTime), CAST(0x0000A72D0157A700 AS DateTime), N'', N'@chadafm,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838492138107191296', N'RT @ilaikinet: لأّول مرة.. خطوة مهمة في حياة إيهاب أمير https://t.co/jduyn6aAKO', CAST(0x0000A73500F81218 AS DateTime), CAST(0x0000A72D0157AE08 AS DateTime), N'', N'@ilaikinet,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838492154938916865', N'RT @kifachinfo: لأول مرة في المغرب.. إيهاب أمير يحيي حفلا فنيا

https://t.co/QxBldYHHRd https://t.co/JyNmIslSaF', CAST(0x0000A73500F81200 AS DateTime), CAST(0x0000A72D0157B2B8 AS DateTime), N'', N'@kifachinfo,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838492191408418817', N'RT @TOPTiVi: بالصورة: ايهاب أمير ينشر له صورة قبل الشهرة ويعلق عليها https://t.co/rOGUYUilhh', CAST(0x0000A73500F811F6 AS DateTime), CAST(0x0000A72D0157BD44 AS DateTime), N'', N'@TOPTiVi,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838510729607200769', N'@MohaOuBr  إن شاء الله', CAST(0x0000A73000025D17 AS DateTime), CAST(0x0000A72D016BF8F4 AS DateTime), N'', N'@MohaOuBr,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838510811605762048', N'@elhajjmalcolmx شكرا', CAST(0x0000A73000025D13 AS DateTime), CAST(0x0000A72D016C0F38 AS DateTime), N'', N'@elhajjmalcolmx,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838527607482232832', N'@MustaphaSwinga @0Hamzaaaaa0 @MohaOuBr بغيت غير نقول تبارك الله عليك', CAST(0x0000A73000025CF8 AS DateTime), CAST(0x0000A72D017E6494 AS DateTime), N'', N'@MustaphaSwinga,@0Hamzaaaaa0,@MohaOuBr,', N'61656018', N'blafrancia', 21372, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838530572318277633', N'@hassanSDK les bonnes et loyales disquettes à 1,2 Mo :) @AMybatit', CAST(0x0000A7300019BDE6 AS DateTime), CAST(0x0000A72D0181A118 AS DateTime), N'', N'@hassanSDK,@AMybatit,', N'15111281', N'Nabil79', 3398, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'838566083086987265', N'@bougamzaatif فين غبر', CAST(0x0000A73101124E2B AS DateTime), CAST(0x0000A72E001CE030 AS DateTime), N'', N'@bougamzaatif,', N'43256664', N'AnouarNACH', 5440, 1020, NULL, NULL, NULL, N'ar')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839084683887579137', N'RT @Arabsounds: Mabrouk @Ihab_Amir for being the new #1 in this week''s Arab Top 10! #2kelmat #ihabamir #arabsounds
https://t.co/aBFeg3eLbF', CAST(0x0000A73500F811BB AS DateTime), CAST(0x0000A72F00C75D80 AS DateTime), N'2kelmat,ihabamir,arabsounds,', N'@Arabsounds,@Ihab_Amir,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839093396035747842', N'Le Maroc aurait déployé des forces spéciales dans la zone d’El Guerguarat https://t.co/RjJE1k9fuX', CAST(0x0000A730001A7143 AS DateTime), CAST(0x0000A72F00D0DF7C AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839117750861721602', N'فكما يستحيل لمن يسترزق #الملكية_المخزنية في ترويج لبروبغندا أن يكون موضوعيا فملف الصحراء
نفس الشئ مع مرتزقة $ بروبغندا جهات داعمة لبوليزريو', CAST(0x0000A72F0180E7AF AS DateTime), CAST(0x0000A72F00EB7490 AS DateTime), N'الملكية_المخزنية,', N'', N'270533272', N'aborifi', 1536, 2, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839120129069821952', N'♫ J''écoute "Bzaf 3lihom" par Oussama Belhcen sur #Anghami https://t.co/mxKc9YGx7x', CAST(0x0000A73500F7B788 AS DateTime), CAST(0x0000A72F00EE0D04 AS DateTime), N'Anghami,', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839120134946111488', N'♫ J''écoute "Bzaf 3lihom" par @OussamaBelhcen sur #Anghami https://t.co/fPSrWBdyeU', CAST(0x0000A73500F7B77F AS DateTime), CAST(0x0000A72F00EE0E30 AS DateTime), N'Anghami,', N'@OussamaBelhcen,', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'fr')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839156328979394560', N'كيفكم يا غاليين ❤️؟ #ihabamir', CAST(0x0000A73500F811B6 AS DateTime), CAST(0x0000A72F01158F78 AS DateTime), N'ihabamir,', N'', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
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
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839190394663469056', N'@Oussameleon Pour moi c''est @SoultanAhmed, @OUM_ELGHAIT, Amine AUB, Barry...', CAST(0x0000A73101124E25 AS DateTime), CAST(0x0000A72F013ABD70 AS DateTime), N'', N'@Oussameleon,@SoultanAhmed,@OUM_ELGHAIT,', N'43256664', N'AnouarNACH', 5440, 1020, N'El Maarif', N'043051f4e4ba4f15', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839192075174359040', N'Saisissez l''opportunité de faire décoller #casablanca et la mettre sur la vague IoT à temps 
Enregistrez vous sur... https://t.co/bH7y9TLJmC', CAST(0x0000A730001A7117 AS DateTime), CAST(0x0000A72F013C9230 AS DateTime), N'casablanca,', N'', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839199482524880897', N'RT @elourouba: Saisissez l''opportunité de faire décoller #casablanca et la mettre sur la vague IoT à temps 
Enregistrez vous sur... https:/…', CAST(0x0000A730001A7114 AS DateTime), CAST(0x0000A72F0144A7B8 AS DateTime), N'casablanca,', N'@elourouba,', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839199525126488066', N'RT @TTNCasablanca: https://t.co/IhpJCCCaH2', CAST(0x0000A730001A7098 AS DateTime), CAST(0x0000A72F0144B49C AS DateTime), N'', N'@TTNCasablanca,', N'48277270', N'elourouba', 5425, 987, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839224889286483969', N'الأخ الطالبي العلمي يرأس الاجتماع الأول للجنة التحضيرية للمؤتمر الوطني... https://t.co/8T66zjKTTe', CAST(0x0000A73101123807 AS DateTime), CAST(0x0000A72F016062F0 AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 987, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839231480320651264', N'يا معذبهم 😂
#HalaMadrid', CAST(0x0000A73500F7B77B AS DateTime), CAST(0x0000A72F016793F4 AS DateTime), N'HalaMadrid,', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839241582926839819', N'ما سر التمسك بدخول الاتحاد الاشتراكي للحكومة؟ | الموقع الإلكتروني لحزب العدالة والتنمية https://t.co/SbWuJ7NlIt', CAST(0x0000A73101128022 AS DateTime), CAST(0x0000A72F01729B00 AS DateTime), N'', N'', N'371279952', N'YatimM', 6601, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839245739955998721', N'#CIA is so cool https://t.co/uhzCwQpc7X', CAST(0x0000A73101123803 AS DateTime), CAST(0x0000A72F01772454 AS DateTime), N'CIA,', N'', N'48277270', N'elourouba', 5426, 987, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839276641260011522', N'Pourquoi devient-on professeur de Yoga ? https://t.co/leU9rkXAoE', CAST(0x0000A73101121729 AS DateTime), CAST(0x0000A730000D5B88 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33018, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839279053249122309', N'مقتل برلماني مغربي بالرصاص في البيضاء | اليوم 24 https://t.co/FsJy1clH3L via @alyaoum24', CAST(0x0000A73101124E21 AS DateTime), CAST(0x0000A730000FFE88 AS DateTime), N'', N'@alyaoum24,', N'43256664', N'AnouarNACH', 5440, 1020, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839279331364990977', N'Viol collectif d''El Hasnae: le verdict est tombé https://t.co/oJhXGpg5di', CAST(0x0000A73101124E1B AS DateTime), CAST(0x0000A73000104BE0 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5440, 1020, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839395115974148096', N'Casablanca - The Things Network https://t.co/hK9A3Y8KMK', CAST(0x0000A73101123800 AS DateTime), CAST(0x0000A730008EA97C AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 987, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839410208631828480', N'Good morning &lt;3 https://t.co/Ycjr6Ghmm9', CAST(0x0000A73500F7B772 AS DateTime), CAST(0x0000A730009F21E4 AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839415516116709376', N'https://t.co/RiOlVwYsdg', CAST(0x0000A7310112801D AS DateTime), CAST(0x0000A73000A4ED7C AS DateTime), N'', N'', N'371279952', N'YatimM', 6601, 387, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839446877552709633', N'كل عام و المرأة بخير ❤️ كل عام و أمهاتنا و أخواتنا بخير ❤️#ihabamir', CAST(0x0000A73500F811B3 AS DateTime), CAST(0x0000A73000C72798 AS DateTime), N'', N'', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839446903527976961', N'RT @MarocTopNews: L''artiste préfèré des marocaines https://t.co/8S21W9PXa8', CAST(0x0000A73500F811AE AS DateTime), CAST(0x0000A73000C72EA0 AS DateTime), N'', N'@MarocTopNews,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839446955226976261', N'RT @kifachinfo: إيهاب أمير: كنوجد 3 أغاني جديدة

https://t.co/FftR6w1LHL https://t.co/al4cC8r95N', CAST(0x0000A73500F811AA AS DateTime), CAST(0x0000A73000C73CB0 AS DateTime), N'', N'@kifachinfo,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839446970741698560', N'RT @2awaelnews: .  جديد إيهاب أمير “الأيام” https://t.co/BuJ6zc8OZ8', CAST(0x0000A73500F811A7 AS DateTime), CAST(0x0000A73000C74160 AS DateTime), N'', N'@2awaelnews,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839446990584938497', N'RT @74hms: #إيهاب_أمير يلتقي محبيه في حفل خاص ب #الدار_البيضاء بعد حفلة #طنجة
#IhabAmir #حسين_سرور
https://t.co/atZFPeXUNN https://t.co/n5W…', CAST(0x0000A73500F811A0 AS DateTime), CAST(0x0000A73000C7473C AS DateTime), N'إيهاب_أمير,الدار_البيضاء,طنجة,IhabAmir,حسين_سرور,', N'@74hms,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839447009883013120', N'RT @bth1433: إيهاب أمير يلتقي محبيه في حفل خاص بالدار البيضاء https://t.co/YgLlmYH24a https://t.co/8kgcFt6Z7Y', CAST(0x0000A73500F81195 AS DateTime), CAST(0x0000A73000C74BEC AS DateTime), N'', N'@bth1433,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839461655838863360', N'هذيان صحافة الزنقة والكذب والارتزاق .. ماذا جنيتم طيلة خمس سنوات من الهذيان والتحريض وقلب الحقائق !! تحاليل مقرفة وفاقدة للمصداقية !!', CAST(0x0000A73101128018 AS DateTime), CAST(0x0000A73000D7481C AS DateTime), N'', N'', N'371279952', N'YatimM', 6601, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839492348371419136', N'Happy women''s day
Happy men''s night !
:p', CAST(0x0000A73500F7B761 AS DateTime), CAST(0x0000A73000F8C7E4 AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839497044112859137', N'https://t.co/Hd8XYJWohJ', CAST(0x0000A731011237FC AS DateTime), CAST(0x0000A73000FDE864 AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 987, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839497259028996096', N'@Eus_services_Mo  sure ! Being an Ex @Dell employee I guess I''ll be helpful.. what can I exactly do for you?', CAST(0x0000A73101121717 AS DateTime), CAST(0x0000A73000FE2428 AS DateTime), N'', N'@Eus_services_Mo,@Dell,', N'183278308', N'WahidROUHLI', 33018, 833, N'Morocco', N'b5fc43481ea8b89a', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839497397965303809', N'#NouvellePhotoDeProfil https://t.co/vFTlKNXRDQ', CAST(0x0000A73101121704 AS DateTime), CAST(0x0000A73000FE4AD4 AS DateTime), N'NouvellePhotoDeProfil,', N'', N'183278308', N'WahidROUHLI', 33018, 833, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839520639530725376', N'Il était temps https://t.co/qRGdoClFF2', CAST(0x0000A731011237ED AS DateTime), CAST(0x0000A7300117A830 AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839532352544129024', N'Je rends hommage aux femmes marocaines et aux femmes du ministère de l''industrie et des organismes sous la tutelle… https://t.co/tKSVPmVcdS', CAST(0x0000A73500F8F219 AS DateTime), CAST(0x0000A7300124713C AS DateTime), N'', N'', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839532523285786624', N'@MyHafidElalamy أقدم أسمى عبارات التهنئة والتقدير لكل النساء المغربيات وبالخصوص لكل نساء وزارة الصناعة  و المؤسسات التابعة للوزارة', CAST(0x0000A73500F8F214 AS DateTime), CAST(0x0000A7300124A01C AS DateTime), N'', N'@MyHafidElalamy,', N'390869031', N'MyHafidElalamy', 180296, 140, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839553373124849665', N'L’Algérie décrète l’Etat d’alerte maximale dans sa 3ème région militaire de Tindouf https://t.co/LAzkYeFOaW', CAST(0x0000A731011237E7 AS DateTime), CAST(0x0000A730013B6180 AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839577998869278723', N'هيا يا برشلونة ⁦⁦⁦⚽⚽⚽⚽', CAST(0x0000A73500F7B75A AS DateTime), CAST(0x0000A730015642C0 AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839578398271885317', N'عيطو لسرجيو راموس 📞⚽⚽', CAST(0x0000A73500F7B74E AS DateTime), CAST(0x0000A7300156B214 AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839584936134905857', N'بداو من زيرو 😂', CAST(0x0000A73500F7B748 AS DateTime), CAST(0x0000A730015DD508 AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839597669446209536', N'Imaginez un seul instant si le député assassiné était du PJD 
Imaginez la victimisation et le nombre de théories... https://t.co/fZob2f4TyR', CAST(0x0000A731011237E3 AS DateTime), CAST(0x0000A730016BBAD8 AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839602997265068034', N'برشلونة يكتب التاريخ أفضل فريق في العالم ❤️❤️❤️❤️❤️#viscabarca #barca #ihabamir', CAST(0x0000A73500F81188 AS DateTime), CAST(0x0000A73001718B20 AS DateTime), N'barca,ihabamir,', N'', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839606864593702913', N'Storing data in a single atom proved possible by IBM researchers https://t.co/HwSFbayaWS', CAST(0x0000A731011237DE AS DateTime), CAST(0x0000A7300175C398 AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 987, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839610913950953472', N'تستاهل والله تستاهل ... بالحق غير سمحولي ريال مدريد لي غتديها .. بكييييييو هههه', CAST(0x0000A73500F7B734 AS DateTime), CAST(0x0000A730017A2E74 AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839624956682055680', N'متخلفين وهجيج هههههه 😂😂😂', CAST(0x0000A73500F7B72B AS DateTime), CAST(0x0000A730018981E4 AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839761554937679872', N'@moncefbelkhayat RACHAD Bernoussi a besoin d''être sauvé et il est mieux que kasba Tadla :)', CAST(0x0000A731011237DB AS DateTime), CAST(0x0000A73100931584 AS DateTime), N'', N'@moncefbelkhayat,', N'48277270', N'elourouba', 5426, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839770963365490689', N'The Queen is pictured still riding at 90 - and without a helmet - as she heads out on her pony near Windsor Castle https://t.co/AhDLjwd4Tm', CAST(0x0000A731011237D7 AS DateTime), CAST(0x0000A731009D5A08 AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 987, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839775077101096962', N'Le 9 Mars 2011, Sa Majesté avait prononcé un discours historique dont la jeunesse était au centre.

7 ans après,... https://t.co/fjYm9NpQR5', CAST(0x0000A731011237D2 AS DateTime), CAST(0x0000A73100A1D7A4 AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 987, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839804184895586304', N'Palo Alto startup predicts retail failure via satellite images https://t.co/zCvtdnmdO9', CAST(0x0000A73500F6FDB4 AS DateTime), CAST(0x0000A73100C19C74 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839815362589962240', N'و ماننساوش "الرجال" لي داخلين ب الأسماء ديال البنات فالفيسبوك, يوم نساء سعيد حتا نتوما أخوتي :D :D :D', CAST(0x0000A73500F6F017 AS DateTime), CAST(0x0000A73100CDCF80 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5447, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839817391668408320', N'بنكيران مكلف بتشكيل الحكومة، بعد احتلال حزبه للمرتبة الأولى في الانتخابات.. عن اي نهاية يتحدث البعض؟؟ .. هل اعيدت... https://t.co/S9w4EHyqAt', CAST(0x0000A73500F6C33B AS DateTime), CAST(0x0000A73100D00584 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839823019027673089', N'https://t.co/TyrSv3LQ7L', CAST(0x0000A73500F6FDAA AS DateTime), CAST(0x0000A73100D62A2C AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839843455329263617', N'RT @BednaNehkiFan: يستعد الفنان #إيهاب_أمير لطرح أغنيته الجديدة "الأيام" قريباً وهي من كلماته وألحانه. @Ihab_Amir https://t.co/vBbyJ76K4r', CAST(0x0000A73500F81184 AS DateTime), CAST(0x0000A73100EC778C AS DateTime), N'إيهاب_أمير,', N'@BednaNehkiFan,@Ihab_Amir,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839843469011083265', N'RT @TodayPalestine: #إيهاب_أمير يكشف أن أعماله المقبلة ستختلف عن أغانيه الأخيرة 
https://t.co/aBvBqtfDfo @TodayPalestine', CAST(0x0000A73500F81180 AS DateTime), CAST(0x0000A73100EC7C3C AS DateTime), N'إيهاب_أمير,', N'@TodayPalestine,@TodayPalestine,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839864786112364545', N'https://t.co/irJoF8ZEO0', CAST(0x0000A73500F6FDA4 AS DateTime), CAST(0x0000A7310103BFB4 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839906964738035714', N'انا كنتو قطعتوه عليا كثر من 10 ايام, و ايضا الأغلبية ديال الزبناء.
هاد الهضرة ديال بلا انقطاع هضرة خاوية :) https://t.co/mlSP51uSi6', CAST(0x0000A73500F6F012 AS DateTime), CAST(0x0000A7310131C814 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5447, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839928394934599680', N'هاني مرضت ليكم — suis malade', CAST(0x0000A73500F6C32E AS DateTime), CAST(0x0000A73101492C5C AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839943022985023489', N'https://t.co/xvDr4dHCCF', CAST(0x0000A73500F6FD4C AS DateTime), CAST(0x0000A731015922B0 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839947496738672641', N'واحد السيد بغا يبني حمام جديد و سولو المقاول واش بغيتي  مرحاض عربي أو مرحاض غربي ؟
السيد سولو شنو هو اﻟﻔﺮﻕ ﺑﻴﻦ (... https://t.co/zh6sUlvvrW', CAST(0x0000A73500F6F00D AS DateTime), CAST(0x0000A731015E0514 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5447, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839959165598650368', N'بقاو معانا متنعسوش تشوفو واحد حاجة زوينة #Ihabamir', CAST(0x0000A73500F8117D AS DateTime), CAST(0x0000A731016AC13C AS DateTime), N'Ihabamir,', N'', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'839963463371915265', N'بنكيران: أتمنى لقاء الملك قريبا .. ولشكر مرفوض في الحكومة https://t.co/6xkChxiBe4', CAST(0x0000A735010517D0 AS DateTime), CAST(0x0000A731016F7268 AS DateTime), N'', N'', N'371279952', N'YatimM', 6611, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840132905422659587', N'توصلت بهذه الصورة  مع المكتب الوطني لجمعية أطفال الديسليكسيا مصحوبة بالتعليق التالي :
أطفال الديسليكسيا ممنون... https://t.co/JgNvt5uMOj', CAST(0x0000A735010517CD AS DateTime), CAST(0x0000A732009CDDD0 AS DateTime), N'', N'', N'371279952', N'YatimM', 6611, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840133603094749184', N'Je l''avais pourtant toujours pensé et c''est justement la raison pourquoi j''ai diminué mon usage de ces réseaux..... https://t.co/LrVfWwOt9O', CAST(0x0000A73500F6D848 AS DateTime), CAST(0x0000A732009DA058 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33010, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840137468879880193', N'٨ مواس و٩ مارس
في اليومين الماضيين احتفلنا بعيد المراة  عيد اعادة الاعتبار والتمكين لها  واقرار حقوقها ومقاومة... https://t.co/I1IbLPRdgd', CAST(0x0000A735010517C3 AS DateTime), CAST(0x0000A73200A1D8D0 AS DateTime), N'', N'', N'371279952', N'YatimM', 6611, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840142078411587585', N'Paris Is About to Spend Nearly $40 Billion on Its Suburbs https://t.co/7zb1Z90jZW', CAST(0x0000A73500F6FD42 AS DateTime), CAST(0x0000A73200A6E0B4 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840149397090521088', N'Follow @TTNCasablanca', CAST(0x0000A73500F6FD3D AS DateTime), CAST(0x0000A73200AEDDA0 AS DateTime), N'', N'@TTNCasablanca,', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840156135877443584', N'@festivalcasa1 https://t.co/jMDDSHn47i', CAST(0x0000A73500F7B715 AS DateTime), CAST(0x0000A73200B637A8 AS DateTime), N'', N'@festivalcasa1,', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840164994620772352', N'واش كاين مشكل عند ميديتيل في الانترنت تروا جي بالرباط، ام فقط انا لي عندي مشكل؟ .. المرجو الإفادة وشكرا', CAST(0x0000A73500F6C310 AS DateTime), CAST(0x0000A73200BFE2A8 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840166490032730114', N'@AbdouRiffi عجيب انا مشات من منتصف ليلة امس ولم تعد😒', CAST(0x0000A73500F6C144 AS DateTime), CAST(0x0000A73200C18504 AS DateTime), N'', N'@AbdouRiffi,', N'116966743', N'najibchaouki', 6972, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840179573484580864', N'https://t.co/o6uNHtN2B3', CAST(0x0000A73500F6FD2D AS DateTime), CAST(0x0000A73200CFCC18 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840206204773289984', N'محمد يتيم يكتب: بين 8 مارس و9 مارس | الموقع الإلكتروني لحزب العدالة والتنمية https://t.co/rhDkvQicnG', CAST(0x0000A735010517B9 AS DateTime), CAST(0x0000A73200ECDD80 AS DateTime), N'', N'', N'371279952', N'YatimM', 6611, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840206229108584448', N'Samuel Eto''o : Le Maroc aura tout mon soutien s’il est candidat https://t.co/vImW6TtpOO', CAST(0x0000A73500F6FD21 AS DateTime), CAST(0x0000A73200ECE35C AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840224499056427009', N'برومو إنطلاق القناة الإلكترونية لحزب العدالة والتنمية https://t.co/VeX1z1A8gO', CAST(0x0000A735010517B2 AS DateTime), CAST(0x0000A7320100D40C AS DateTime), N'', N'', N'371279952', N'YatimM', 6611, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840224753487081472', N'RT @HITRADIOMA: يستعد الفنان @Ihab_Amir لإحياء أول حفل منفرد بالدار البيضاء!
https://t.co/EEiq9mO3hU', CAST(0x0000A73500F8116A AS DateTime), CAST(0x0000A73201011B88 AS DateTime), N'', N'@HITRADIOMA,@Ihab_Amir,', N'3916363932', N'Ihab_Amir', 230804, 135, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840250172949037056', N'X-MEN 2 -  Les DÉTAILS que vous n''aviez jamais REMARQUÉS ! https://t.co/malQmZf5dR', CAST(0x0000A73500F70B3C AS DateTime), CAST(0x0000A732011CD918 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3401, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840252092648476673', N'Google’s Cloud Platform improves its free tier and adds always-free compute and storage services https://t.co/UmyjTKEDhz', CAST(0x0000A73500F6FD1D AS DateTime), CAST(0x0000A732011EF1D0 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840286971566120960', N'كلمة ابن كيران في المؤتمر الرابع للإئتلاف الوطني من أجل اللغة العربية https://t.co/4PfCKNrTFY', CAST(0x0000A73501051785 AS DateTime), CAST(0x0000A73201450320 AS DateTime), N'', N'', N'371279952', N'YatimM', 6611, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840314410426105858', N'C''est toujours un plaisir de partager son savoir avec les jeunes. Merci à tous les organisateurs ainsi que toutes... https://t.co/uEWx2nmL9t', CAST(0x0000A73500F6D83A AS DateTime), CAST(0x0000A7320162F588 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33010, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840342610883551234', N'Flynn was paid to lobby for Turkey while attending Trump intel briefings: report https://t.co/GEHrmCXXgk', CAST(0x0000A73500F6FD19 AS DateTime), CAST(0x0000A7320181BC0C AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840345763309867010', N'Énorme, surtout son méchant rire final :) https://t.co/Q1h5ZsLxPb', CAST(0x0000A73500F6FD0A AS DateTime), CAST(0x0000A73201852D4C AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840346167158423553', N'الوزير الاول ام ريئس الحكومة في خطاب 9 مارس 2009

بعض التافهين من المنتسبين ظلما وعدوانا للصحافة ظنوا انهم وقعوا... https://t.co/JvICYwF18p', CAST(0x0000A7350105177E AS DateTime), CAST(0x0000A73201859DCC AS DateTime), N'', N'', N'371279952', N'YatimM', 6611, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840478238891741184', N'Le pouvoir algérien imprime des billets de banque à grande échelle, révèle Ali Benouari! (Vidéo) https://t.co/4hmVayQiYW', CAST(0x0000A73500F6FD05 AS DateTime), CAST(0x0000A733008A40F8 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840497393627992064', N'اريد فقط ان افهم - حجج الاتحاد الاشتراكي في اصراره على الدخول الى الحكومة   ! 
ما الذي يمنع حزبا في المعارضة ان... https://t.co/VUu3lcWCMr', CAST(0x0000A73501051775 AS DateTime), CAST(0x0000A733009F27C0 AS DateTime), N'', N'', N'371279952', N'YatimM', 6611, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840599005633626112', N'اذا كان المغرب فحال هاكا....ف كيفاش غادي تكون جهنم؟', CAST(0x0000A73500F6F004 AS DateTime), CAST(0x0000A733010E0EC4 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5447, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840602787616546816', N'#Lol https://t.co/RDYxx4wxpR', CAST(0x0000A73501032BB4 AS DateTime), CAST(0x0000A73301122EA0 AS DateTime), N'Lol,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840604442865070080', N'https://t.co/XJSNsYXJc9', CAST(0x0000A73501051767 AS DateTime), CAST(0x0000A7330113FD84 AS DateTime), N'', N'', N'371279952', N'YatimM', 6611, 387, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840632693771628546', N'Stay positive. Good things will happen.', CAST(0x0000A73501032BAD AS DateTime), CAST(0x0000A7330132D344 AS DateTime), N'', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840665556005056512', N'سمح لنا على الإزعاج 
المهم الصلير غادي يدخل راس الشهر و تنسى هاد التعكير لي درنا ليك https://t.co/7nLtvrQVvF', CAST(0x0000A73500F6FCE1 AS DateTime), CAST(0x0000A7330156B0E8 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840686650246221825', N'الصراحة واخا هاكاك المغرب زوييييين.
خاصو غا الحُب و الحبٌة ... و حُبوب منع الحمل.', CAST(0x0000A73500F6EFFE AS DateTime), CAST(0x0000A733016DB644 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5447, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840687317559963650', N'زِد هاذي على "انتهى الكلام" و على قصة حزب الاستقلال
بنكيران لم يتعلم الدرس بعد https://t.co/DjY4itymTA', CAST(0x0000A73500F6FCD0 AS DateTime), CAST(0x0000A733016E7098 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840704198933135360', N'https://t.co/H5P7Eg6gwo', CAST(0x0000A73500F6FCB5 AS DateTime), CAST(0x0000A7330180DD64 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840711217073291264', N'#True https://t.co/NfIFRNFIrv', CAST(0x0000A73501032B9E AS DateTime), CAST(0x0000A733018885F0 AS DateTime), N'True,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840711373671809024', N'شكون محتاج شي #فلوس https://t.co/3mEzAKOXyK', CAST(0x0000A73501032B9A AS DateTime), CAST(0x0000A7330188B14C AS DateTime), N'فلوس,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840717627769135105', N'@Almuraqiba القضية حامضة .. وهادشي يقدر يطلع اليمين المتطرف في الإنتخابات الهولندية ؟', CAST(0x0000A73501030A5A AS DateTime), CAST(0x0000A73400040290 AS DateTime), N'', N'@Almuraqiba,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840734283694247936', N'"الله يخرب بيت الحرب اللي تخليكم تعيشوا في مخيم"
 #أنتم_المستقبل 
#ArabsGotTalent https://t.co/bueCSv2oc3', CAST(0x0000A73500F6EFE4 AS DateTime), CAST(0x0000A73400163014 AS DateTime), N'أنتم_المستقبل,ArabsGotTalent,', N'', N'43256664', N'AnouarNACH', 5447, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840849344056197122', N'https://t.co/VlpIiWm5Rc', CAST(0x0000A73500F7B6C9 AS DateTime), CAST(0x0000A7340093C420 AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840870853592064000', N'RT @Youssef90210: @Simobb_ clinique chifa Casablanca décès de la mère du mec qui déglingue tt sur son passage 😭😭😭', CAST(0x0000A73501032B96 AS DateTime), CAST(0x0000A73400AB3D80 AS DateTime), N'', N'@Youssef90210,@Simobb_,', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840881355475034113', N'😂 https://t.co/5YRp64mnTf', CAST(0x0000A73501032B8D AS DateTime), CAST(0x0000A73400B6B3E0 AS DateTime), N'', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840886858196344833', N'#Expressshaving https://t.co/tuF8UjChaE', CAST(0x0000A73501032B7D AS DateTime), CAST(0x0000A73400BCB560 AS DateTime), N'Expressshaving,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840887249600409601', N'#wTF https://t.co/wx9ye6NsVa', CAST(0x0000A73501032B73 AS DateTime), CAST(0x0000A73400BD225C AS DateTime), N'wTF,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840897011155099648', N'#Allo #Maman https://t.co/tWUwVo4tJT', CAST(0x0000A73501032B6F AS DateTime), CAST(0x0000A73400C7CA7C AS DateTime), N'Allo,Maman,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840906780154691584', N'#Erdogan exécute la mission que lui a confié #Poutine en échange de son pardon', CAST(0x0000A73500F6FCA5 AS DateTime), CAST(0x0000A73400D273C8 AS DateTime), N'Erdogan,Poutine,', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840955315592056833', N'كابتن ماجد ديال بصح https://t.co/4N1uHSukSQ', CAST(0x0000A73500F6FCA1 AS DateTime), CAST(0x0000A73401076CB8 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840962492008411136', N'Cats Got Tanlents https://t.co/CItzKAo2at', CAST(0x0000A73501032B65 AS DateTime), CAST(0x0000A734010F41CC AS DateTime), N'', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840967066920337408', N'المغاربة عاقوا https://t.co/pRi5Y2OB7Q', CAST(0x0000A73500F6FC97 AS DateTime), CAST(0x0000A73401143F24 AS DateTime), N'', N'', N'48277270', N'elourouba', 5427, 986, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840982711015755776', N'عكس فرنسا، هولندا دولة ديمقراطية منفتحة وتقبل التعدد الثقافي ونجح المهاجرون المسلمون في الإندماج حتى ظهر هذا العنصري
https://t.co/UbreWULhWS', CAST(0x0000A73501030A4F AS DateTime), CAST(0x0000A7340125523C AS DateTime), N'', N'', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840986291781173248', N'I''m at Al Tazaj https://t.co/abfdHd5yvn https://t.co/8MDgMPBf6V', CAST(0x0000A73500F6EFDA AS DateTime), CAST(0x0000A73401293B04 AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5447, 1022, N'Anfa', N'93e879312241ce12', N'  33.59620267,  -7.67440376', N'ht')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840988042395549696', N'RT @haya2237: @blafrancia على فكرة خيرت فليدرز سب المغاربه أيضاً ببداية حملته الإنتخابية عنصري .', CAST(0x0000A73501030A43 AS DateTime), CAST(0x0000A734012B23B0 AS DateTime), N'', N'@haya2237,@blafrancia,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840988712595030016', N'RT @Raasikh: ساعات الليل والنهار عند العرب من كتاب فقه اللغة للثعالبي رحمه الله.
#اللغة_العربية 
#معرض_الرياض_الدولي_للكتاب https://t.co/Fw…', CAST(0x0000A73501030A3E AS DateTime), CAST(0x0000A734012BDF30 AS DateTime), N'اللغة_العربية,معرض_الرياض_الدولي_للكتاب,', N'@Raasikh,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840990185995325440', N'RT @UNHCR_Arabic: استقبلت تركيا أكبر عدد من اللاجئين عالمياً، حيث استضافت 2.8 مليون منهم حتى منتصف عام 2016.
https://t.co/GvdfxomNIg https:…', CAST(0x0000A73501030A30 AS DateTime), CAST(0x0000A734012D7A84 AS DateTime), N'', N'@UNHCR_Arabic,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840991215948570624', N'RT @UNHCR_Arabic: بقي السوريون أكبر مجموعة من اللاجئين في كافة أنحاء العالم، مشكلين ما يصل إلى 32% في عام 2016.
https://t.co/GvdfxomNIg htt…', CAST(0x0000A735010309FE AS DateTime), CAST(0x0000A734012E9ACC AS DateTime), N'', N'@UNHCR_Arabic,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840995633699946500', N'UEFA Champions League: REPETICION DEL PARTIDO PSG-F.C BARCELONA - Signez la pétition! https://t.co/XiKmHTJWnx', CAST(0x0000A73500F7B6C2 AS DateTime), CAST(0x0000A73401336CC8 AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840995696639647745', N'UEFA Champions League: REPETICION DEL PARTIDO PSG-F.C BARCELONA - Signez la pétition! https://t.co/jEELNiHEJV', CAST(0x0000A73500F7B6B5 AS DateTime), CAST(0x0000A73401337E5C AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840995719033061377', N'UEFA Champions League: REPETICION DEL PARTIDO PSG-F.C BARCELONA - Signez la pétition! https://t.co/jkwKj0Ny5p via @Change', CAST(0x0000A73500F7B6A6 AS DateTime), CAST(0x0000A73401338564 AS DateTime), N'', N'@Change,', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840996755273601033', N'22.8 مليون نسمة يعيشون في القاهرة الكبرى.. أي ربع سكان مصر الذين يبلغ عددهم 92 مليون نسمة
https://t.co/OzRYIXJY7F', CAST(0x0000A735010309EE AS DateTime), CAST(0x0000A7340134A6D8 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840997519744196608', N'تذكير من 2015
https://t.co/PRukOHqxx2', CAST(0x0000A735010309E0 AS DateTime), CAST(0x0000A73401357C20 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840997958917226497', N'RT @blafrancia: لم أكن أتوقع أن يكون عدد سكان إيران أقل من سكان مصر.. ومعدل الخصوبة (1.8) أقل من المغرب (2.1)
http://t.co/Lh7PMc0tlH http:/…', CAST(0x0000A735010309D9 AS DateTime), CAST(0x0000A7340135F72C AS DateTime), N'', N'@blafrancia,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'840998079658635264', N'I''m at McDonald''s in Casablanca, Morocco https://t.co/TKTEUbFM9i https://t.co/o6DYf5NiF8', CAST(0x0000A73500F6EFB9 AS DateTime), CAST(0x0000A734013617FC AS DateTime), N'', N'', N'43256664', N'AnouarNACH', 5447, 1022, N'Anfa', N'93e879312241ce12', N'  33.59580063,  -7.67785549', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841003688533590018', N'سكان مصر أكبر من سكان إيران و تركيا وأي دولة أوروبية:
مصر: 92 مليون نسمة 
ألمانيا: 82
تركيا: 79
إيران: 79
فرنسا: 66
بريطانيا: 65
إيطاليا: 60', CAST(0x0000A735010309CB AS DateTime), CAST(0x0000A734013C37F4 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841004337207861248', N'@Un_Marocain مدينة أكبر من دولة قطر بعشرين مرة', CAST(0x0000A73501030989 AS DateTime), CAST(0x0000A734013CEC6C AS DateTime), N'', N'@Un_Marocain,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841032266981740544', N'#Hiking TIME @ #LosAngeles
https://t.co/6lz2q7mQ6J', CAST(0x0000A73501032B5E AS DateTime), CAST(0x0000A734015B67F0 AS DateTime), N'Hiking,LosAngeles,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841032641864450050', N'@mohsine_ @A_Loukili رئيس الوزراء الحالي يبدو أنه يريد كسب أصوات اليمين المتطرف', CAST(0x0000A7350103097C AS DateTime), CAST(0x0000A734015BD168 AS DateTime), N'', N'@mohsine_,@A_Loukili,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841034357154435072', N'توحشت النشاط #المغربي في لوس انجلس https://t.co/9HWezepPPn', CAST(0x0000A73501032B56 AS DateTime), CAST(0x0000A734015DB0B4 AS DateTime), N'المغربي,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841034670313627648', N'@Yannsinejebli @NRJMaroc @MAP_Information @Atourabi Dommage Shooting Time @ #LosAngeles', CAST(0x0000A73501032B21 AS DateTime), CAST(0x0000A734015E076C AS DateTime), N'LosAngeles,', N'@Yannsinejebli,@NRJMaroc,@MAP_Information,@Atourabi,', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841035387736850434', N'عكس ما نشر في تويتر العربي، المرأة الأسيوية التي كانت تحاول منع الأطفال من الظهور في اللقاء التلفزيوني الشهير هي زو… https://t.co/BIfEPf0hFW', CAST(0x0000A73501030976 AS DateTime), CAST(0x0000A734015ECFD0 AS DateTime), N'', N'', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841043375604289536', N'يــــا حـــارقهم هههعه 😂😂
#HalaMadrid', CAST(0x0000A73500F7B698 AS DateTime), CAST(0x0000A7340167883C AS DateTime), N'HalaMadrid,', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841044820726599681', N'RT @Leonnus: @blafrancia @mohsine_ @A_Loukili الأمر معقد ولكن هولندا عندها استراتيجية لقطع الحبل السري للمهاجرين مع وطنهم الأم، المغرب مشمو…', CAST(0x0000A73501030969 AS DateTime), CAST(0x0000A73401691B5C AS DateTime), N'', N'@Leonnus,@blafrancia,@mohsine_,@A_Loukili,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841044883305562112', N'RT @Leonnus: @blafrancia @mohsine_ @A_Loukili زيارات ومراسلات رسمية في السنين الماضية،تتبع أملاك المواطنين ذوي الجنسيات المزدوجة، الغش في ت…', CAST(0x0000A73501030956 AS DateTime), CAST(0x0000A73401692CF0 AS DateTime), N'', N'@Leonnus,@blafrancia,@mohsine_,@A_Loukili,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841045378329907200', N'I ❤#Dogs #LosAngeles https://t.co/4PbulI4RRW', CAST(0x0000A73501032B12 AS DateTime), CAST(0x0000A7340169B738 AS DateTime), N'Dogs,LosAngeles,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841050746460262404', N'RT @L7argouss: Cours de lobbying, paragraphe 1 https://t.co/eBLnZt5wJ2', CAST(0x0000A73501030952 AS DateTime), CAST(0x0000A734016F9338 AS DateTime), N'', N'@L7argouss,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841052703451172864', N'@Leonnus ماشي البارصا اللي لابسين شعار "قطر"؟', CAST(0x0000A73501030945 AS DateTime), CAST(0x0000A7340171B67C AS DateTime), N'', N'@Leonnus,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841052963888087045', N'@Leonnus هذا شغل التلفزيون الحكومي', CAST(0x0000A7350103093B AS DateTime), CAST(0x0000A7340171FF24 AS DateTime), N'', N'@Leonnus,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841054295806083073', N'@Leonnus يمكن مسخوط الوالدين ماشي عيب في قطر هههه', CAST(0x0000A73501030931 AS DateTime), CAST(0x0000A734017372A0 AS DateTime), N'', N'@Leonnus,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841069110213640193', N'@SaadNBB نسيتي الصين وأمريكا', CAST(0x0000A735010308BE AS DateTime), CAST(0x0000A73401839DB0 AS DateTime), N'', N'@SaadNBB,', N'61656018', N'blafrancia', 21387, 2977, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841075373634908161', N'I ❤ having brunch @ #Cecconis 
https://t.co/rlztWjuGng', CAST(0x0000A73501032B0C AS DateTime), CAST(0x0000A734018A7478 AS DateTime), N'Cecconis,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841110622217617410', N'I ❤️ #Cecconis #Westhollywood https://t.co/zWxXDhsOFl', CAST(0x0000A73501032B01 AS DateTime), CAST(0x0000A73500256AE8 AS DateTime), N'Cecconis,Westhollywood,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841149942701912064', N'I am convinced that different people bring out different sides of you.', CAST(0x0000A73501032AF2 AS DateTime), CAST(0x0000A73500505410 AS DateTime), N'', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841183702457683968', N'#Popcorn TIME @ #LosAngeles https://t.co/Zn8oakqdSc', CAST(0x0000A73501032AE0 AS DateTime), CAST(0x0000A73500752C7C AS DateTime), N'Popcorn,LosAngeles,', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841222822760468480', N'يا سلاااام 😷 https://t.co/5zrE5M7Nnk', CAST(0x0000A73500F7B686 AS DateTime), CAST(0x0000A735009FDE90 AS DateTime), N'', N'', N'106838097', N'OussamaBelhcen', 883, 417, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841229196559028224', N'"إذا صنعت معروفًا مع إنسان.. فلا تتذكره
وإذا صنع إنسان معك معروفًا.. فلا تنساه"

⁧', CAST(0x0000A73501032AD9 AS DateTime), CAST(0x0000A73500A6D3D0 AS DateTime), N'', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841229226036596737', N'Be sure to do what is right for you. No one else is walking in your shoes.', CAST(0x0000A73501032ACC AS DateTime), CAST(0x0000A73500A6DC04 AS DateTime), N'', N'', N'41645163', N'Simobb_', 18688, 1894, NULL, NULL, NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841246602660573184', N'Voilà ! Vous me comprenez mieux maintenant quand je vous dis que je ne commence ma journée qu''à partir de 10h..... https://t.co/Vqog98Wd7t', CAST(0x0000A73501717F58 AS DateTime), CAST(0x0000A73500B9D318 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33013, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841265960136916992', N'Pourquoi l''Algérie fait elle cela ? 
Qu''est ce que le Maroc a fait à l''Algérie pour qu''elle le vise avec ses... https://t.co/iu8riIURji', CAST(0x0000A7350128537E AS DateTime), CAST(0x0000A73500CEF34C AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 986, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841267919992545280', N'When you try to get an arty shot of arches 
#meknes #herimansour #morocco #roadtrip @ Heri… https://t.co/QOLyFpcnOK', CAST(0x0000A73501295BBC AS DateTime), CAST(0x0000A73500D11690 AS DateTime), N'meknes,herimansour,morocco,roadtrip,', N'', N'449136907', N'EvelineK96', 94, 152, N'Meknes', N'6f2f1dff9a9e3b8b', N'  33.8667,  -5.56667', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841270617068441600', N'👽👽 @ Meknes, Morocco https://t.co/heW3Fmdic4', CAST(0x0000A73501295B24 AS DateTime), CAST(0x0000A73500D40814 AS DateTime), N'', N'', N'1490986548', N'adibfaklani1', 33, 61, N'Meknes', N'6f2f1dff9a9e3b8b', N'  33.8973,  -5.55293', N'hu')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841320158308253697', N'عبّر 52% من المستجوبين بالمنطقة العربية عن مخاوف محدودة أو كبيرة من زيادة نفوذ الأحزاب الإسلامية السياسية، مقابل... https://t.co/IwGqlyWjXM', CAST(0x0000A735017148B6 AS DateTime), CAST(0x0000A735010A1A44 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6971, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841329755714543617', N'@ChawkiOfficial مول القهوة
داير الاشهار فاليوتيوب :) https://t.co/RVufmYPwV2', CAST(0x0000A73501715B31 AS DateTime), CAST(0x0000A73501149384 AS DateTime), N'', N'@ChawkiOfficial,', N'43256664', N'AnouarNACH', 5448, 1022, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841337830509019136', N'@lesyakines ont rencontré l''ATED, asso engagée ds la promotion du #tourismedurable à #Chefchaouen - #voyagedurable
https://t.co/VbXm1iJ9ko', CAST(0x0000A735016FFF2E AS DateTime), CAST(0x0000A735011D6360 AS DateTime), N'tourismedurable,Chefchaouen,voyagedurable,', N'@lesyakines,', N'3600071597', N'MarocDurable', 788, 254, N'El Maarif', N'043051f4e4ba4f15', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841337873769103360', N'#MADRIDISTAS, ¿¿Queréis saber todas las noticias acerca de nuestro #MADRID @realmadrid?? Os recomiendo esta página:… https://t.co/927IhqA6uA', CAST(0x0000A735016FFE57 AS DateTime), CAST(0x0000A735011D7044 AS DateTime), N'MADRIDISTAS,MADRID,', N'@realmadrid,', N'1630787130', N'MidoChouiakh', 1455, 447, N'Tétouan', N'18513045971f5e3b', NULL, N'es')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841338095421259778', N'@hanif_rawi performm 😆 https://t.co/XlQ2vfwJJ3', CAST(0x0000A735017041C9 AS DateTime), CAST(0x0000A735011DAD34 AS DateTime), N'', N'@hanif_rawi,', N'2496740334', N'wanrifqii', 144, 140, N'Mohammedia', N'0e5d07c93c8f4fbb', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841339017933266944', N'Bref.... retour à la réalité #Reprise', CAST(0x0000A73501712C8D AS DateTime), CAST(0x0000A735011EAF04 AS DateTime), N'Reprise,', N'', N'209220396', N'Mehdiboukhari', 1876, 512, N'Aîn Sebaâ', N'8ed1a99efa1a3ca6', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841342828097785856', N'Question sérieuse ❓
Qu''est-ce-que je représente pour toi❔

Toute réponse est acceptée.', CAST(0x0000A73600B1D8F2 AS DateTime), CAST(0x0000A7350122D840 AS DateTime), N'', N'', N'183278308', N'WahidROUHLI', 33015, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841345653846466561', N'@tritki sympaa c''est déjà pas mal tu me vois :)', CAST(0x0000A73600B1D8E7 AS DateTime), CAST(0x0000A7350125ECEC AS DateTime), N'', N'@tritki,', N'183278308', N'WahidROUHLI', 33015, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841348974451781632', N'@tritki mais les joies généralement :)', CAST(0x0000A73600B1D8D9 AS DateTime), CAST(0x0000A73501298D0C AS DateTime), N'', N'@tritki,', N'183278308', N'WahidROUHLI', 33015, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841349453684580352', N'@tritki absolument :) ça me fait plaisir de te lire', CAST(0x0000A73600B1D8D1 AS DateTime), CAST(0x0000A735012A12A4 AS DateTime), N'', N'@tritki,', N'183278308', N'WahidROUHLI', 33015, 833, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841358842076233729', N'7bkooom wa9ila tstit', CAST(0x0000A735018703AD AS DateTime), CAST(0x0000A73501345278 AS DateTime), N'', N'', N'368440966', N'UsernameOssafi', 770, 272, N'Hassan', N'7479862a63906ec7', NULL, N'tl')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841365197822558208', N'Diapo. Le drapeau marocain flotte au-dessus du siège de l’Union africaine https://t.co/6FbCYpjZqm', CAST(0x0000A73600B1CDD3 AS DateTime), CAST(0x0000A735013B41DC AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 986, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841369742107635712', N'https://t.co/FyI56p8brp', CAST(0x0000A73600B1CDC9 AS DateTime), CAST(0x0000A7350140382C AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 986, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841400979572559874', N'@OrangeMaroc 
كيفاش بغيتو تنافسو الرائد (@Maroc_Telecom ) لي كانت الكونيكسيون عندي كتفوت ثلاثين ميغا فاي وقت فالسيم… https://t.co/ucwPTi06xL', CAST(0x0000A73600B1C070 AS DateTime), CAST(0x0000A73501624F20 AS DateTime), N'', N'@OrangeMaroc,@Maroc_Telecom,', N'43256664', N'AnouarNACH', 5448, 1022, N'Aîn Chock', N'9fa2d1e9e59deaf8', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841429985189584896', N'جلالة الملك يطالب بالتصدي لأفكار التطرف والظلامية ورفض المزايدة على الإسلام - الموقع الإلكتروني لحزب التجمع... https://t.co/sqhvAibrHP', CAST(0x0000A73600B1CDC1 AS DateTime), CAST(0x0000A7350181F7D0 AS DateTime), N'', N'', N'48277270', N'elourouba', 5426, 986, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841545298673598464', N'صباح النور https://t.co/k8ws32bSyW', CAST(0x0000A73600C6EA83 AS DateTime), CAST(0x0000A7360074502C AS DateTime), N'', N'', N'789601050089103362', N'simerib7', 401, 290, N'Tangier Medina', N'97bd47ee2a153a97', NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841589264295051264', N'لم تمر سوى بضعة ايام على 8 مارس حتى سمعنا ...

تناقلت وسائل التواصل الاجتماعي فضيحة بجلاجل مسرحها كان هو القنصلية... https://t.co/Uy4bLzpfUs', CAST(0x0000A73600F85FDA AS DateTime), CAST(0x0000A73600A44BC4 AS DateTime), N'', N'', N'371279952', N'YatimM', 6616, 387, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841603315842596864', N'Près d’un demi-million de morts dans les listes électorales en Algérie! https://t.co/jLZJN0wMKb', CAST(0x0000A736011CCF8B AS DateTime), CAST(0x0000A73600B3A18C AS DateTime), N'', N'', N'48277270', N'elourouba', 5424, 986, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841605972070092802', N'#quoteoftheday Même en 3 lorsque je suis ici #welcometomylife 😎 @ Rabat Hay Riad https://t.co/kRwF7hG6ya', CAST(0x0000A7360109082E AS DateTime), CAST(0x0000A73600B68758 AS DateTime), N'quoteoftheday,welcometomylife,', N'', N'59481027', N'AudreyFarah', 68, 175, N'Agdal Riyad', N'b5ba21c5db1c99e9', N'  33.95806628,  -6.87546217', N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841642736621105153', N'Juppé a le devoir d''écarter Fillon.
Cet homme a trop de casseroles et ce n''est qu''une partie visible de l''iceberg https://t.co/c71ZHY3Qxr', CAST(0x0000A736017D128C AS DateTime), CAST(0x0000A73600DEA800 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 986, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841668894326681600', N'Carnets de voyages du nombre pi https://t.co/p3PwDeetDZ', CAST(0x0000A736017D42B2 AS DateTime), CAST(0x0000A73600FB33D0 AS DateTime), N'', N'', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841670203817750529', N'Juppé https://t.co/aGhWsMDb1K', CAST(0x0000A736017D1283 AS DateTime), CAST(0x0000A73600FCA170 AS DateTime), N'', N'', N'48277270', N'elourouba', 5425, 986, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841670744501280769', N'@Almuraqiba https://t.co/yOwWZFzw8v', CAST(0x0000A736017D3486 AS DateTime), CAST(0x0000A73600FD389C AS DateTime), N'', N'@Almuraqiba,', N'61656018', N'blafrancia', 21385, 2976, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841681658520698880', N'RT @blafrancia: ربما لم أسمع من قبل أن الرمز الرياضي Pi  π  له مقابل بالعربية "ط"
http://t.co/i3WaDwFuYs
يوم 14 مارس هو اليوم العالمي ل"پاي…', CAST(0x0000A736017D347C AS DateTime), CAST(0x0000A736010921D4 AS DateTime), N'', N'@blafrancia,', N'61656018', N'blafrancia', 21385, 2976, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841681959550091265', N'فرنسا تتوفر بالمغرب على 40 مؤسسة تعليمية، فضلا عن أزيد من 30 ألف طفل متمدرس و60 ألف شخص ينخرطون سنويا في النظام التعليمي الفرنسي. :o', CAST(0x0000A736017CF085 AS DateTime), CAST(0x0000A73601097634 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6971, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841683519306887169', N'14 مليون أمريكي سيفقدون التغطية الصحية خلال 2017 . ونحو 52 مليون شخص سيفقدون التغطية الصحية سنة 2026 بأمريكا، في... https://t.co/UVoBnyzrTa', CAST(0x0000A736017CF077 AS DateTime), CAST(0x0000A736010B2A24 AS DateTime), N'', N'', N'116966743', N'najibchaouki', 6971, 1840, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841712526769442816', N'@voetzoeker87 @ajboekestijn @wierdduk Is overigens wel te hopen ,anders meer EU ,meer Immi, meer geld Brussel om Ita/Gr te helpen enz...', CAST(0x0000A736017D6986 AS DateTime), CAST(0x0000A736012AD2D4 AS DateTime), N'', N'@voetzoeker87,@ajboekestijn,@wierdduk,', N'1632757099', N'migarubia', 40, 18, N'Spain', N'ecdce75d48b13b64', NULL, N'nl')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841712565273124864', N'Bonjour', CAST(0x0000A736017D6971 AS DateTime), CAST(0x0000A736012ADD60 AS DateTime), N'', N'', N'330400305', N'____Nanou', 626, 198, N'Hassan', N'7479862a63906ec7', NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841712607908286464', N'Marrakech sunset.... https://t.co/3R1PRRCrL1', CAST(0x0000A736017D89CC AS DateTime), CAST(0x0000A736012AE918 AS DateTime), N'', N'', N'20856184', N'Orangefleece', 498, 1374, N'Marrakesh Medina', N'1dc2c187eb6ef8eb', NULL, N'de')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841718752358125568', N'RT @ArabicWikipedia: هل تعلم أن السمندل الأعمى ذو الخياشيم الخارجية يمكنه أن يعيش عشر سنوات بدون أكل؟

https://t.co/bRdxeyaDof https://t.co…', CAST(0x0000A73700C7FD52 AS DateTime), CAST(0x0000A73601319DE4 AS DateTime), N'', N'@ArabicWikipedia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841719254642753536', N'RT @ArabicWikipedia: وجهة نظر https://t.co/XDIbbXsDer', CAST(0x0000A73700C7FD47 AS DateTime), CAST(0x0000A73601322A84 AS DateTime), N'', N'@ArabicWikipedia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841719540966912002', N'RT @ArabicWikipedia: يعتقد البعض للأسف أن ويكيبيديا فوضوية و"أي شخص يستطيع تعديلها" نعم الجميع يستطيع تحريرها ولكن هناك أيضا متطوعون يراقبو…', CAST(0x0000A73700C7FD3A AS DateTime), CAST(0x0000A73601327A34 AS DateTime), N'', N'@ArabicWikipedia,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841722800884838400', N'@PCPowers there certainly is.  It is also not the subject.', CAST(0x0000A73601888F16 AS DateTime), CAST(0x0000A736013608C0 AS DateTime), N'', N'@PCPowers,', N'1268245674', N'DomHuntman', 484, 41, N'Agdal Riyad', N'b5ba21c5db1c99e9', NULL, N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841722830647566336', N'She makes it all look easy, even playful! #roguexpeditions #runtheworld #runmorocco @ Atlas… https://t.co/7CHimcqZL3', CAST(0x0000A73601888EF7 AS DateTime), CAST(0x0000A736013610F4 AS DateTime), N'roguexpeditions,runtheworld,runmorocco,', N'', N'37015683', N'doddsjames', 228, 197, N'Toubkal', N'43b1d193ef58bd3d', N'  31.061667,  -7.915833', N'en')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841725566793441281', N'RT @MajdiBekir: عندما نظم بن علي استفتاء للموافقة ع حصوله ع ولاية رابعة، اقترح TUNeZINE إستفتاءه الخاص: هل تونس جمهورية أم مملكة أم حديقة ح…', CAST(0x0000A73700C7FD30 AS DateTime), CAST(0x0000A73601390E30 AS DateTime), N'', N'@MajdiBekir,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841727158783475714', N'RT @EdSamuelFCO: نرى اليوم نساءا عربيات وأمازيغيات في شمال أفريقيا تلعبن دورا قويا في تسوية الخلافات ونرى أمهات فلسطينيات وإسرائيليات تعملن…', CAST(0x0000A73700C7FCFE AS DateTime), CAST(0x0000A736013ACA54 AS DateTime), N'', N'@EdSamuelFCO,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841732343375228929', N'https://t.co/OOuOmlUIuC', CAST(0x0000A73700C7D7AD AS DateTime), CAST(0x0000A736014072C4 AS DateTime), N'', N'', N'48277270', N'elourouba', 5429, 986, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841732664759635969', N'Le Roi du Maroc recevant le President Algérien https://t.co/kARSHLhVDQ', CAST(0x0000A73700C7D7A7 AS DateTime), CAST(0x0000A7360140CD00 AS DateTime), N'', N'', N'48277270', N'elourouba', 5429, 986, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841739628994539522', N'@willou_du80 😍😍😍😍', CAST(0x0000A73700C983C9 AS DateTime), CAST(0x0000A73601486650 AS DateTime), N'', N'@willou_du80,', N'15111281', N'Nabil79', 3402, 1504, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841741295483793408', N'.@ArabicWikipedia "يمكنه أن يعيش 10 سنوات بدون أكل" هذه  المعلومة غير موجودة في ويكيبيديا العربية! لكنها في وكي الإنجليزية 
 @moriscbandoler', CAST(0x0000A73700C7FCF6 AS DateTime), CAST(0x0000A736014A38B8 AS DateTime), N'', N'@ArabicWikipedia,@moriscbandoler,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841743902403133440', N'.@EdSamuelFCO جميل أنك تخاطب العرب بلغتهم. أثارتني صورة البورفيل لك مع "بدوي في الصحراء".. صورة نمطية للعرب مستوحاة من Lawrence of Arabia؟', CAST(0x0000A73700C7FCEE AS DateTime), CAST(0x0000A736014D1074 AS DateTime), N'', N'@EdSamuelFCO,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841760894048714752', N'@AlWaziir @MohaOuBr أش جاب العلاقات الدولية للتبوريدة ؟ ولا يمكن كاينة العلاقة  هههه', CAST(0x0000A73700C7FCDF AS DateTime), CAST(0x0000A736015F9BB8 AS DateTime), N'', N'@AlWaziir,@MohaOuBr,', N'61656018', N'blafrancia', 21385, 2975, NULL, NULL, NULL, N'ar')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841780080498118656', N'https://t.co/BS9ehWyhyv', CAST(0x0000A73700C7D79B AS DateTime), CAST(0x0000A73601748D0C AS DateTime), N'', N'', N'48277270', N'elourouba', 5429, 986, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841781113483845632', N'Le Maroc a choisi la meilleure stratégie. Pour preuve leur chef des armées blessé par balles sans qu''on bouge le... https://t.co/WNpOYKvf9E', CAST(0x0000A73700C7D78A AS DateTime), CAST(0x0000A7360175AD54 AS DateTime), N'', N'', N'48277270', N'elourouba', 5429, 986, NULL, NULL, NULL, N'fr')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841782965818556416', N'https://t.co/vDu7vTrIyC', CAST(0x0000A73700C7D77E AS DateTime), CAST(0x0000A7360177B34C AS DateTime), N'', N'', N'48277270', N'elourouba', 5429, 986, NULL, NULL, NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841910642873384960', N'LO DIJO UN SABIO Y SABÍA LO QUE DECÍA.... https://t.co/zHk0NcQCu3', CAST(0x0000A73700CA3B99 AS DateTime), CAST(0x0000A7370077892C AS DateTime), N'', N'', N'825550443384287233', N'MaraLuisaMart10', 23, 31, N'Ceuta', N'8d06f0fe2df028f2', NULL, N'es')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841910675396038657', N'Tristurri Valverde eliminat per l''Apoel i Sanpanoli pel Leicester.
Gran tria. Que passi el següent.', CAST(0x0000A73700CA3B94 AS DateTime), CAST(0x0000A7370077928C AS DateTime), N'', N'', N'211087576', N'Lennycccp', 3144, 351, N'Spain', N'ecdce75d48b13b64', NULL, N'und')
GO
INSERT [dbo].[TweetSet] ([Tweet_Id], [TweetText], [DateDownload], [DateCreated], [HashTags], [Mentions], [UserId], [ScreenName], [FollowersCount], [FriendsCouunt], [PlaceName], [PlaceId], [LatLong], [Language]) VALUES (N'841910718790270979', N'@JotaGH_ Pero q dices!?!?!?! Madre mía madre mía', CAST(0x0000A73700CA3B8D AS DateTime), CAST(0x0000A73700779E44 AS DateTime), N'', N'@JotaGH_,', N'30890979', N'Diana_Vega', 2332, 937, N'Spain', N'ecdce75d48b13b64', NULL, N'es')
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
USE [master]
GO
ALTER DATABASE [ScrapyWeb] SET  READ_WRITE 
GO
