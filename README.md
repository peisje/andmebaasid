## Andmebaasid
andmebaasidega seotud SQL kood ja konspektid
## Põhimõisted
- andmebaas - struktureeritut andmete kogum
- tabel = olem -сущность -entity
- veerg = väli - поле *cтолбец
- rida = kirje - записи
- andmebaasi haldussüstem - tarkvara, millega abil saab luua andmebaas: mariaDB / XAMPP, SQL SERVER managment Studio.
- <img width="300" height="350" alt="{834C33C7-CB56-413D-9248-9F789C51D8B1}" src="https://github.com/user-attachments/assets/8b04ad1b-8269-49c1-ad9d-95daa1b65247" />

- primaarne võti -PRIMARY KEY - veerg(tavaliselt id nimega), unikaalne identifikaator, mis eristab iga kirje.
- välisvõti - FOREIGN KEY -FK- veerg, mis loob seos teise tabeli primaarvõtmega.
- päring -QUERY - запрос

## Andmetüübid
```
1. Numbrilised: INT, SmallINT, float, decimal(5,2)
2. Tekst/sümboolised: varchar(255), char(5), TEXT
3. Loogilised: boolean, true/false , bit, bool
4. Kuupäeva: date, time, datetime
```

## SQL - structure Query Language - struktureeritud päringu keel
- Tabeli loomine
```sql
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
```
- Andmete sisetamine tabelisse
```sql 
--tabeli täitmine
INSERT INTO opilan
VALUES ('dasa','kovalenko', '2008-08-10', 1, '+493080', 'talinn', 4.5);

INSERT INTO opilan(perenimi, eesnimi, keskmineHinne)
VALUES ('sereda', 'ivan', 4.2),
('holovanov', 'ivan', 4.2),
('suvorov', 'marko', 5.0);
```
