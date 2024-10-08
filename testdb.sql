USE [master]
GO
/****** Object:  Database [testdb]    Script Date: 09/06/2024 23:54:44 ******/
CREATE DATABASE [testdb] ON  PRIMARY 
( NAME = N'testdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\testdb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'testdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\testdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [testdb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testdb] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [testdb] SET ANSI_NULLS OFF
GO
ALTER DATABASE [testdb] SET ANSI_PADDING OFF
GO
ALTER DATABASE [testdb] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [testdb] SET ARITHABORT OFF
GO
ALTER DATABASE [testdb] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [testdb] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [testdb] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [testdb] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [testdb] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [testdb] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [testdb] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [testdb] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [testdb] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [testdb] SET  DISABLE_BROKER
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [testdb] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [testdb] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [testdb] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [testdb] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [testdb] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [testdb] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [testdb] SET  READ_WRITE
GO
ALTER DATABASE [testdb] SET RECOVERY SIMPLE
GO
ALTER DATABASE [testdb] SET  MULTI_USER
GO
ALTER DATABASE [testdb] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [testdb] SET DB_CHAINING OFF
GO
USE [testdb]
GO
/****** Object:  Table [dbo].[tblCourses]    Script Date: 09/06/2024 23:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_select]    Script Date: 09/06/2024 23:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_select]
	-- Add the parameters for the stored procedure here
	@id as Int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblCourses where Id>@id
END
GO
/****** Object:  Default [DF_tblCourses_Date]    Script Date: 09/06/2024 23:54:45 ******/
ALTER TABLE [dbo].[tblCourses] ADD  CONSTRAINT [DF_tblCourses_Date]  DEFAULT (getdate()) FOR [Date]
GO
