/****** Object:  Table [dbo].[Dim_RuteOgMålepunkter]    Script Date: 18-09-2021 16:28:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dim_RuteOgMålepunkter]') AND type in (N'U'))
DROP TABLE [dbo].[Dim_RuteOgMålepunkter]
GO
/****** Object:  Table [dbo].[Dim_RuteOgMålepunkter]    Script Date: 18-09-2021 16:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_RuteOgMålepunkter](
	[REPORT_NAME] [nvarchar](255) NULL,
	[REPORT_ID] [int] NOT NULL,
	[ORGANISATION] [nvarchar](255) NULL,
	[RBA_ID] [int] NULL,
	[POINT_1_NAME] [nvarchar](255) NULL,
	[POINT_1_LAT] [int] NULL,
	[POINT_1_LNG] [int] NULL,
	[POINT_1_STREET] [nvarchar](255) NULL,
	[POINT_1_STREET_NUMBER] [nvarchar](255) NULL,
	[POINT_1_POSTAL_CODE] [nvarchar](255) NULL,
	[POINT_1_CITY] [nvarchar](255) NULL,
	[POINT_1_COUNTRY] [nvarchar](255) NULL,
	[POINT_2_NAME] [nvarchar](255) NULL,
	[POINT_2_LAT] [int] NULL,
	[POINT_2_LNG] [int] NULL,
	[POINT_2_STREET] [nvarchar](255) NULL,
	[POINT_2_STREET_NUMBER] [nvarchar](255) NULL,
	[POINT_2_POSTAL_CODE] [nvarchar](255) NULL,
	[POINT_2_CITY] [nvarchar](255) NULL,
	[POINT_2_COUNTRY] [nvarchar](255) NULL,
	[DURATION_IN_SEC] [int] NULL,
	[DISTANCE_IN_METERS] [int] NULL,
	[NDT_IN_KMH] [int] NULL,
	[ROAD_TYPE] [nvarchar](255) NULL,
 CONSTRAINT [PK__Dim_Rute__B106F6BB49B0252F] PRIMARY KEY CLUSTERED 
(
	[REPORT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
