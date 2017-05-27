
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/27/2017 16:33:20
-- Generated from EDMX file: C:\Users\Yahia Alaoui\Desktop\DEV\170215OADRJNLPMLDC\ScrapyWeb\Models\ScrapyWeb.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ScrapyWeb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TweetSets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TweetSets];
GO
IF OBJECT_ID(N'[dbo].[TwitterApplications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TwitterApplications];
GO
IF OBJECT_ID(N'[dbo].[FacebookGroupFeeds]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FacebookGroupFeeds];
GO
IF OBJECT_ID(N'[dbo].[FBGroups]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FBGroups];
GO
IF OBJECT_ID(N'[dbo].[FBApplications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FBApplications];
GO
IF OBJECT_ID(N'[dbo].[FBFeedComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FBFeedComments];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TweetSets'
CREATE TABLE [dbo].[TweetSets] (
    [Tweet_Id] varchar(150)  NOT NULL,
    [TweetText] nvarchar(150)  NOT NULL,
    [DateDownload] datetime  NOT NULL,
    [DateCreated] datetime  NULL,
    [HashTags] nvarchar(150)  NULL,
    [Mentions] nvarchar(150)  NULL,
    [UserId] varchar(50)  NULL,
    [ScreenName] nvarchar(50)  NULL,
    [FollowersCount] int  NULL,
    [FriendsCouunt] int  NULL,
    [PlaceName] varchar(50)  NULL,
    [PlaceId] varchar(50)  NULL,
    [LatLong] varchar(100)  NULL,
    [Language] varchar(50)  NULL
);
GO

-- Creating table 'TwitterApplications'
CREATE TABLE [dbo].[TwitterApplications] (
    [ApplicationId] int IDENTITY(1,1) NOT NULL,
    [ApplicationName] varchar(150)  NOT NULL,
    [ConsumerKey] varchar(150)  NOT NULL,
    [ConsumerSecret] varchar(150)  NOT NULL,
    [AccessToken] varchar(150)  NOT NULL,
    [AccessTokenSecret] varchar(150)  NOT NULL
);
GO

-- Creating table 'FacebookGroupFeeds'
CREATE TABLE [dbo].[FacebookGroupFeeds] (
    [GroupPostId] varchar(150)  NOT NULL,
    [PostText] nvarchar(max)  NOT NULL,
    [UpdatedTime] datetime  NOT NULL
);
GO

-- Creating table 'FBGroups'
CREATE TABLE [dbo].[FBGroups] (
    [GroupId] int IDENTITY(1,1) NOT NULL,
    [FbGroupId] varchar(50)  NOT NULL,
    [GroupName] varchar(50)  NOT NULL
);
GO

-- Creating table 'FBApplications'
CREATE TABLE [dbo].[FBApplications] (
    [ApplicationId] int IDENTITY(1,1) NOT NULL,
    [ApplicationName] varchar(50)  NOT NULL,
    [FbAppId] varchar(50)  NOT NULL,
    [FbAppSecret] varchar(150)  NOT NULL
);
GO

-- Creating table 'FBFeedComments'
CREATE TABLE [dbo].[FBFeedComments] (
    [Id] varchar(150)  NOT NULL,
    [message] nvarchar(max)  NOT NULL,
    [created_time] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Tweet_Id] in table 'TweetSets'
ALTER TABLE [dbo].[TweetSets]
ADD CONSTRAINT [PK_TweetSets]
    PRIMARY KEY CLUSTERED ([Tweet_Id] ASC);
GO

-- Creating primary key on [ApplicationId] in table 'TwitterApplications'
ALTER TABLE [dbo].[TwitterApplications]
ADD CONSTRAINT [PK_TwitterApplications]
    PRIMARY KEY CLUSTERED ([ApplicationId] ASC);
GO

-- Creating primary key on [GroupPostId] in table 'FacebookGroupFeeds'
ALTER TABLE [dbo].[FacebookGroupFeeds]
ADD CONSTRAINT [PK_FacebookGroupFeeds]
    PRIMARY KEY CLUSTERED ([GroupPostId] ASC);
GO

-- Creating primary key on [GroupId] in table 'FBGroups'
ALTER TABLE [dbo].[FBGroups]
ADD CONSTRAINT [PK_FBGroups]
    PRIMARY KEY CLUSTERED ([GroupId] ASC);
GO

-- Creating primary key on [FbAppId] in table 'FBApplications'
ALTER TABLE [dbo].[FBApplications]
ADD CONSTRAINT [PK_FBApplications]
    PRIMARY KEY CLUSTERED ([FbAppId] ASC);
GO

-- Creating primary key on [Id] in table 'FBFeedComments'
ALTER TABLE [dbo].[FBFeedComments]
ADD CONSTRAINT [PK_FBFeedComments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------