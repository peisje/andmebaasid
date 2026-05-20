## SQL Server – Kasutajate autentimine ja õiguste haldamine
Mis on autentimine SQL Serveris?
 ### Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverisse sisse logida.

## SQL Serveris kasutatakse kahte peamist autentimise tüüpi:

1. Windows Authentication
Selle puhul kasutatakse samu kasutajaandmeid, millega logitakse sisse Windows operatsioonisüsteemi.

>Kasutajanimi ja parool on seotud Windowsiga
>Turvalisem lahendus
>Paroole haldab Windows
>Kasutaja ei pea eraldi SQL Serveri parooli teadma

2. SQL Server Authentication
>Selle puhul luuakse kasutaja otse SQL Serverisse.
>Kasutaja ei ole seotud Windowsiga
>Määratakse eraldi kasutajanimi ja parool
>Sobib veebirakenduste jaoks: direktor dasa
>Näide kasutajast: DirectorNimi
>Parool: director
>Kasutaja loomine SQL Serveris

1. Serveritaseme kasutaja loomine (Login)
Sammud
Ava:
Security → Logins
Tee paremklikk ja vali:
New Login...
<img width="703" height="659" alt="{638799D5-D4F1-4890-9AC1-AB9D1795195A}" src="https://github.com/user-attachments/assets/49c791c8-6d56-4fd8-b33b-eabc8db272b2" />

>Harjutamiseks võib eemaldada linnukese:  User must change password at next login
Server Roles
Menüüst Server Roles saab määrata serveri üldised õigused.

>Tavaliselt piisab rollist: public
<img width="699" height="655" alt="{5FC69F94-B4D8-40F2-8237-9FA60B3FA3BD}" src="https://github.com/user-attachments/assets/0bbee161-b833-4c0d-9fda-03e18d9a5ff6" />
