ALTER TABLE [dbo].[Fact_RealtidsTrafikdata] DROP CONSTRAINT [FK__Fact_Real__REPOR__32E0915F]
GO
/****** Object:  Table [dbo].[Fact_RealtidsTrafikdata]    Script Date: 18-09-2021 16:28:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Fact_RealtidsTrafikdata]') AND type in (N'U'))
DROP TABLE [dbo].[Fact_RealtidsTrafikdata]
GO
/****** Object:  Table [dbo].[Fact_RealtidsTrafikdata]    Script Date: 18-09-2021 16:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_RealtidsTrafikdata](
	[REPORT_ID] [int] NULL,
	[TIMESTAMP] [datetime] NULL,
	[status] [nvarchar](50) NULL,
	[avgMeasuredTime] [int] NULL,
	[medianMeasuredTime] [int] NULL,
	[vehicleCount] [int] NULL,
	[avgSpeed] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fact_RealtidsTrafikdata]  WITH CHECK ADD  CONSTRAINT [FK__Fact_Real__REPOR__32E0915F] FOREIGN KEY([REPORT_ID])
REFERENCES [dbo].[Dim_RuteOgMålepunkter] ([REPORT_ID])
GO
ALTER TABLE [dbo].[Fact_RealtidsTrafikdata] CHECK CONSTRAINT [FK__Fact_Real__REPOR__32E0915F]
GO
