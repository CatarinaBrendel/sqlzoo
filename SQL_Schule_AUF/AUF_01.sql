-- 1. Lassen Sie alle Datenbank anzeogen
SHOW DATABASES

-- Lassen Sie alle Tabellen anzeigen
SHOW TABLES

-- Lassen Sie die Struktur einzelner Tabellen ausgeben
DESCRIBE <Tabelle_Name>

-- Erstellen Sie ein Tabelle Freunde <Ihr_Name>  it Feldern Name Vorname
CREATE TABLE ihr_name (Name varchar(20), Vorname varchar(20))

-- Erganzen Sie die Tabelle um die Spalte Telefon mit 5 Zeichen
ALTER TABLE ihr_name ADD (Telefon int(5))

-- Korrigieren Sie den Feldtyp von Telefon auf varchar20
ALTER TABLE ihr_name MODIFY (Telefon varchar(20))

-- Tragen Sie zwei Datensätze ein (komplett)
INSERT INTO ihr_name VALUES ('Brendel', 'Catarina', '12345')
INSERT INTO ihr_name VALUES ('Brendel', 'Philipp', '45678')

-- Tragen Sie einen Datensatz ein (teilweise) (Kontrolle mit select * from Tab-Name)
INSERT INTO ihr_name (name, vorname) VALUES ('Dantas', 'Camila')
SELECT * FROM ihr_name

-- Korrigieren Sie die Telefonnummer eines eingetragen Datensatzes
UPDATE ihr_name SET Telefon = '123456' WHERE Name = 'Dantas' AND Vorname = 'Camila'

-- Löschen Sie einen Datensatz
DELETE FROM ihr_name WHERE Vorname = 'Camila'

-- Löschen Sie alle Datensätze
DELETE FROM ihr_name

-- Löschen Sie de Tabellenstruktur
DROP TABLE ihr_name

-- Lassen Sie zur Kontrolle alle Tabellen anzeigen
SHOW TABLES