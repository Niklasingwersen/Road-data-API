----- ## ROAD DATA CASE README ## -----

1. Opret database
 K�r scriptet 'Create Db_Roaddata' i SSMS
 - den er oprettet med default indstillinger, intet �vre max p� lagring

2. Opret tabeller
 K�r scriptet 'dbo.Fact_RealtidsTrafikdata.Table' og 'dbo.Dim_RuteOgM�lepunkter.Table'

 - OBS hvis man kalder API'et til Realtids trafikdata hvert 5min, s� vil databasen vokse ca. 2,9gb om �ret, og fact tabellen 'Fact_RealtidsTrafikdata'
   vil vokse med ca. 100 millioner r�kker om �ret.

 - Dimension tabellen 'Dim_RuteOgM�lepunkter' er oprettet med PK p� 'report_ID' og fact tabellen 'Fact_RealtidsTrafikdata' er oprette med FK p� 'report_ID'.
   Det er gjort for at �ge performance ved dataforesp�rgsler ligesom dem der �nske i denne case. Man kan ogs� oprette indexes, hvis man ved hvilke foresp�rgesel man �nbsker i fremtiden.
 - V�r opm�rksom p� at der er en PK i 'Dim_RuteOgM�lepunkter', hvilket man skal huske hvis man vil opdatere denne tabel.

3. K�r python projectet 'RoadDataAPI'
 - Her henter du f�rst Rute Og M�lepunkter, som l�ses ind i 'Dim_RuteOgM�lepunkter'
   * i en driftssituation vil jeg have en dialog med forretningen om behovet for at opdatere denne tabel, m�ske det er noget der kun skal g�res ved nye m�lepunkters tilkomst.

 - Dern�st hentes Realtids Trafikdata, som l�ses ind i 'Fact_RealtidsTrafikdata'
   * i Drift t�nker jegf at det giver bedste mening at kalde dette API hvert 5min. Dog er der nogle m�lepunkter som ikke opdateres hvert femte min.
     Her mener jeg man b�r have en dialog med forretningen om hvad man g�r(ift analyse) med m�lepunkter der ikke opdateres hvert femte min.
   * OBS hvis man kalder API'et til Realtids trafikdata hvert 5min, s� vil databasen vokse ca. 2,9gb om �ret, og fact tabellen 'Fact_RealtidsTrafikdata'
     vil vokse med ca. 100 millioner r�kker om �ret.
 
 - dvs at du nu har engangsudtr�k af data og du kan nu lave din analyse.

4. Analyse
 
 Nedenfor ser du hvordan du kan replicere analyserne, samt se resultaterne:
	

 - De 50 mest trafikerede m�lepunkter (baseret p� antal k�ret�jer), hvor vi kender b�de vejnavn og postnummer.
   * K�r scriptet 'De 50 mest trafikerede m�lepunkter.sql' i SSMS - se resultatet i 'De 50 mest trafikerede veje m�lt p� antal biler.txt'
 
 - En oversigt over de 10 mest trafikerede veje.
    * K�r scriptet 'En oversigt over de 10 mest trafikerede veje.sql' i SSMS - se resultatet i 'De 10 mest trafikerede veje.txt'
 
- En oversigt over de 5 postnumre med den h�jeste gennemsnitshastighed.
    * K�r scriptet 'En oversigt over de 5 postnumre med den h�jeste gennemsnitshastighed.sql' i SSMS - se resultatet i 'De 5 postnumre h�jeste gennemsnitsfart.txt'





