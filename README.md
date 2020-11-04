# fPhaseNow

## Contact
Peter Horney, Markus Möller, markus.moeller@julius-kuehn.de

## Principle approach



[URL](ftp://opendata.dwd.de/climate_environment/CDC/observations_germany/phenology/)
https://github.com/EMRAgit/fTemperatureSum''

Hallo Markus, 

anbei nun die SQL für die Berechnung der Phaenophasen (Tageslänge und Temperatursumme aus Tagesmittelwerten.
Frag bitte, wenn Du da noch eine Erklärung zu benötigst.

Übergeben wird hier in der SQL "sysdate" für das heutige Datum, "klt 202" für Winterweizen und "GRID_ID" -> woraus er sich aus der Tabelle PP_GRIDROW_DAYLENGTH die Parameter für die Tageslängenberechung zieht. 
