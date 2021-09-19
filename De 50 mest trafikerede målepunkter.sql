--Viser De 50 mest trafikerede målepunkter (baseret på antal køretøjer), hvor vi kender både vejnavn og postnummer.

SELECT TOP (50) A.[REPORT_ID]
		, REPORT_NAME
		, [POINT_1_STREET]
		,[POINT_2_STREET]
      ,[TIMESTAMP]
      ,[status]
      ,[avgMeasuredTime]
      ,[medianMeasuredTime]
      ,[vehicleCount]
      ,[avgSpeed]
  FROM [Db_RoadData].[dbo].[Fact_RealtidsTrafikdata] AS A
  LEFT JOIN Dim_RuteOgMålepunkter AS B
  ON A.REPORT_ID = B.REPORT_ID
  WHERE [POINT_1_STREET] IS NOT NULL AND [POINT_2_STREET] IS NOT NULL AND POINT_1_POSTAL_CODE IS NOT NULL 
  ORDER BY vehicleCount DESC