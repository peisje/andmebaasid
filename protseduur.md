## SQL Protseduurid
- store procedure - salvestatud protseduurif - хранимые процедуры
- sama nagu funktsioonid programmeerimises - mingid tegevused, mis käivitakse automaatselt protseduuri kasutamisel.
```sql
--protseduur, mis lisab uus guest ja kuvab tabeli
CREATE PROCEDURE lisaGuest
--@parameetrid
@uusnimi varchar(25),
@uusPerenimi varchar(30),
@kuupaev date
AS
BEGIN
--protseduuri sisu
	INSERT INTO guest(firstname, lastname, memberSince)
	VALUES (@uusnimi, @uusPerenimi, @kuupaev);
	SELECT * FROM guest
END

--kutse 
EXEC lisaGuest 'elina', 'kotsur', '2026-03-12'
```
<img width="226" height="267" alt="{13B0EDC1-B709-4EDF-843F-A113CB41F460}" src="https://github.com/user-attachments/assets/ac7f1d32-5f79-484d-a927-5cdaade03f12" />
<img width="489" height="213" alt="{B8C2CD50-095B-4493-B4FB-B75259E83D80}" src="https://github.com/user-attachments/assets/de09eb15-ee9f-4d70-aa60-ec418f5f57c1" />

--protseduur, mis kustutab guest id järgi
```sql
--protseduur, mis kustutab guest id järgi
CREATE PROCEDURE kustutaGuest
@kustutaID int
AS
BEGIN
	SELECT * FROM guest
	DELETE FROM guest WHERE guestID=@kustutaID;
	SELECT * FROM guest
END

--kutse
EXEC kustutaGuest 1;
```
<img width="323" height="337" alt="{0BB2AAA2-476C-473D-8305-1319C9F702EC}" src="https://github.com/user-attachments/assets/881b8db6-cb2a-4617-b13f-87ffca03f893" />

--protseduur otsing esimese tähe järgi
```sql
--otsing esimese tähe järgi
CREATE PROCEDURE otsing1taht
@taht char(1)
AS
BEGIN
	SELECT * FROM guest WHERE firstname LIKE @taht + '%'; --%  teised sümboolid
END

--kutse
EXEC otsing1taht 'e'
```
<img width="321" height="163" alt="{9A42D0A0-58C4-4778-A878-1051D7E23913}" src="https://github.com/user-attachments/assets/1ef85f4b-9293-4774-8b4b-df182b417430" />

--lisame uus veerg
```sql
--lisame uus veerg
ALTER TABLE guest ADD arveSumma money; 
SELECT * FROM guest

Update guest set arveSumma=100 WHERE guestID=4;
```
<img width="370" height="122" alt="{3DD834B6-4B59-4E8F-8D7F-D167125C778C}" src="https://github.com/user-attachments/assets/a2e521f0-23d0-445c-a7d1-dd9f51034976" />

--OUTPUT parameetrid (min ja max väärtus)
```sql
--OUTPUT parameetrid (min ja max väärtus)
CREATE PROCEDURE minmaxArve
    @minArve MONEY OUTPUT,
    @maxArve MONEY OUTPUT
AS
BEGIN
    SELECT 
        @minArve = MIN(arveSumma),
        @maxArve = MAX(arveSumma)
    FROM guest;
END

--kutse
DECLARE @minArve MONEY, @maxArve MONEY;
EXEC minmaxArve @minArve OUTPUT, @maxArve OUTPUT;
PRINT 'Min Arve = ' + CONVERT(varchar, @minArve);
PRINT 'Max Arve = ' + CONVERT(varchar, @maxArve);
```
<img width="527" height="308" alt="{CB27618A-2002-4F87-A303-43F53A29FF75}" src="https://github.com/user-attachments/assets/61ba62c7-ab4e-495c-a0d7-fcccc6268cfd" />

--
