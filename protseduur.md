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
```
<img width="226" height="267" alt="{13B0EDC1-B709-4EDF-843F-A113CB41F460}" src="https://github.com/user-attachments/assets/ac7f1d32-5f79-484d-a927-5cdaade03f12" />
<img width="489" height="213" alt="{B8C2CD50-095B-4493-B4FB-B75259E83D80}" src="https://github.com/user-attachments/assets/de09eb15-ee9f-4d70-aa60-ec418f5f57c1" />

