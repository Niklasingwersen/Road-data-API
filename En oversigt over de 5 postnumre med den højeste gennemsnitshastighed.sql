--Viser En oversigt over de 5 postnumre med den højeste gennemsnitshastighed.


use Db_RoadData
SELECT TOP (5) 
	POSTAL_CODE
      ,AVG([avgSpeed]) AS Gennemsnitsfart
  FROM 
	( 
	(
	SELECT  POINT_1_POSTAL_CODE AS POSTAL_CODE,[avgSpeed]
	FROM
  [Db_RoadData].[dbo].[Fact_RealtidsTrafikdata] AS A
  LEFT JOIN Dim_RuteOgMålepunkter AS B
  ON A.REPORT_ID = B.REPORT_ID
  WHERE POINT_1_POSTAL_CODE IS NOT NULL
  )
  UNION
  (SELECT POINT_2_POSTAL_CODE AS POSTAL_CODE,[avgSpeed]
	FROM
  [Db_RoadData].[dbo].[Fact_RealtidsTrafikdata] AS A
  
  LEFT JOIN Dim_RuteOgMålepunkter AS B
  ON A.REPORT_ID = B.REPORT_ID
 WHERE POINT_1_POSTAL_CODE<>POINT_2_POSTAL_CODE AND POINT_2_POSTAL_CODE IS NOT NULL
  )
  ) AS T
  GROUP BY POSTAL_CODE
  ORDER BY AVG(avgSpeed) DESC
