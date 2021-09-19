import requests
import pyodbc
import pandas as pd

#  (1) --------------------------------------------------------------------------------

# API kald til RuteOgMålepunkter
response = requests.get("https://admin.opendata.dk/api/3/action/datastore_search?resource_id=c3097987-c394-4092-ad1d-ad86a81dbf37&limit=10000")

# API data til JSON
data = response.json()

##Normalisering af API data, og udvægelse af List "records" i Dict "result"
df = pd.json_normalize(data, ["result","records"])

##Forbindelse til db_RoadData 
conn = pyodbc.connect('DRIVER={SQL Server};SERVER={Dev-advisory16};DATABASE={db_RoadData}')
cursor = conn.cursor()

##Indsætter data i tabellen Dim_RuteOgMålepunkter
for index, row in df.iterrows():
    cursor.execute("INSERT INTO Dim_RuteOgMålepunkter ([REPORT_NAME],[REPORT_ID],[ORGANISATION],[RBA_ID],[POINT_1_NAME],[POINT_1_LAT],[POINT_1_LNG],[POINT_1_STREET],[POINT_1_STREET_NUMBER],[POINT_1_POSTAL_CODE],[POINT_1_CITY],[POINT_1_COUNTRY],[POINT_2_NAME],[POINT_2_LAT],[POINT_2_LNG],[POINT_2_STREET],[POINT_2_STREET_NUMBER],[POINT_2_POSTAL_CODE],[POINT_2_CITY],[POINT_2_COUNTRY],[DURATION_IN_SEC],[DISTANCE_IN_METERS],[NDT_IN_KMH],[ROAD_TYPE]) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", row.REPORT_NAME, row.REPORT_ID, row.ORGANISATION, row.RBA_ID,row.POINT_1_NAME,row.POINT_1_LAT,row.POINT_1_LNG,row.POINT_1_STREET,row.POINT_1_STREET_NUMBER,row.POINT_1_POSTAL_CODE,row.POINT_1_CITY,row.POINT_1_COUNTRY,row.POINT_2_NAME,row.POINT_2_LAT,row.POINT_2_LNG,row.POINT_2_STREET,row.POINT_2_STREET_NUMBER,row.POINT_2_POSTAL_CODE,row.POINT_2_CITY,row.POINT_2_COUNTRY,row.DURATION_IN_SEC,row.DISTANCE_IN_METERS,row.NDT_IN_KMH,row.ROAD_TYPE)
conn.commit()
cursor.close()

#  (2) --------------------------------------------------------------------------------

# API kald til RealtidsTrafikdata
response = requests.get("https://admin.opendata.dk/api/3/action/datastore_search?resource_id=b3eeb0ff-c8a8-4824-99d6-e0a3747c8b0d&limit=10000")

# API data til JSON
data = response.json()

#Normalisering af API data, og udvægelse af List "records" i Dict "result"
df = pd.json_normalize(data, ["result","records"])

#Forbindelse til db_RoadData 
conn = pyodbc.connect('DRIVER={SQL Server};SERVER={Dev-advisory16};DATABASE={db_RoadData}')
cursor = conn.cursor()

#Indsætter data i tabellen Fact_RealtidsTrafikdata
for index, row in df.iterrows():
    cursor.execute("INSERT INTO Fact_RealtidsTrafikdata (REPORT_ID,TIMESTAMP,status,avgMeasuredTime,medianMeasuredTime,vehicleCount,avgSpeed) values(?,?,?,?,?,?,?)", row.REPORT_ID, row.TIMESTAMP, row.status, row.avgMeasuredTime,row.medianMeasuredTime,row.vehicleCount, row.avgSpeed)
conn.commit()
cursor.close()





