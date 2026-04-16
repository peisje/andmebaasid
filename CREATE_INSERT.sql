CREATE DATABASE kovalenkobaas;

--ab kustutamine
DROP DATABASE TITpv24kovalenko;

use kovalenkobaas;
--tabeli loomine
CREATE TABLE opilan(
opilanID int Primary key identity(1,1), --automaatselt täidab numbritega
eesnimi varchar(25),
perenimi varchar(30) NOT NULL,
synniaeg DATE,
stip bit,
mobiil varchar(13),
aadres TEXT,
keskmineHinne decimal(2,1) );--(2--kokku, 1- peale komat nt 4.5)

SELECT * FROM opilan;

--tabeli täitmine
INSERT INTO opilan
VALUES ('dasa','kovalenko', '2008-08-10', 1, '+493080', 'talinn', 4.5);

INSERT INTO opilan(perenimi, eesnimi, keskmineHinne)
VALUES ('sereda', 'ivan', 4.2),
('holovanov', 'ivan', 4.2),
('suvorov', 'marko', 5.0);

--andmete uuendamine tabelis
UPDATE opilan SET stip=1, aadres='tallinn'

UPDATE opilan SET stip=1, aadres='tartu' WHERE opilanID=5;

--kustutamine
--tabeli kustutamine
DROP TABLE opilan;
--andmete kustutamine tabelis
DELETE FROM opilan WHERE opilanID=1;
Select * from opilan;

--FOREIGN KEY
CREATE TABLE opetamine(
opetamineId int PRIMARY KEY identity(1,1),
kuupaev DATE,
oppeaine varchar(30),
opilanID int,
FOREIGN KEY (opilanID) REFERENCES opilan(opilanID),
hinne int CHECK(hinne<=5));

SELECT * FROM opetamine;
SELECT * FROM opilan;
--täidame tabeli
INSERT INTO opetamine
VALUES ('2026-04-16', 'andmebaasid', 4, 5)

CREATE TABLE opetaja(
opetajaID int Primary key identity(1,1), --automaatselt täidab numbritega
eesnimi varchar(25) NOT NULL,
epost varchar(35) NOT NULL,
ruum int);

INSERT INTO opetaja(eesnimi,epost, ruum)
VALUES ('maria','maria5@gmail.com', 243);

SELECT * FROM opetaja;
SELECT * FROM tundd;
SELECT * FROM opetamine;
SELECT * FROM opilan;


CREATE TABLE tundd(
tundId int PRIMARY KEY identity(1,1),
kuupaev DATE,
tundiNimi varchar(50),
opetajaID int,
FOREIGN KEY (opetajaID) REFERENCES opetaja(opetajaID),
opetamineId int,
FOREIGN KEY (opetamineId) REFERENCES opetamine(opetamineId));

INSERT INTO tundd(kuupaev, tundiNimi,opetajaID, opetamineId)
VALUES ('2026-04-16','eesti keel', 1, 2);
