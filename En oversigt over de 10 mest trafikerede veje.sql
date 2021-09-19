--En oversigt over de 10 mest trafikerede veje
--Viser En oversigt over de 5 postnumre med den højeste gennemsnitshastighed.


use Db_RoadData
SELECT TOP (10) 
		Street
      ,SUM(vehicleCount) AS AntalBiler
  FROM 
	( 
	(
	SELECT POINT_1_STREET AS Street, vehicleCount
	FROM
  [Db_RoadData].[dbo].[Fact_RealtidsTrafikdata] AS A
  LEFT JOIN Dim_RuteOgMålepunkter AS B
  ON A.REPORT_ID = B.REPORT_ID
  )
  UNION
  (SELECT POINT_2_STREET AS Street, vehicleCount
	FROM
  [Db_RoadData].[dbo].[Fact_RealtidsTrafikdata] AS A
  LEFT JOIN Dim_RuteOgMålepunkter AS B
  ON A.REPORT_ID = B.REPORT_ID
  WHERE POINT_1_STREET<>POINT_2_STREET
  )
  ) AS T
  WHERE Street IS NOT NULL
  GROUP BY Street
  ORDER BY SUM(vehicleCount) DESC
