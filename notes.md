# Skladistenje podataka i otkrivanje znanja I deo projekta - Teorija;

## OLTP baza podataka?

</br>

**OLTP** predstavlja skracenicu od **online transaction processing** i odnosi se na baze podataka koje cuvaju podatke o **svakodnevnom funkcionisanju organizacije (operativne podatke)**.

Problem kod ovih sistema _(baza podataka)_ jeste taj sto **nikada nisu bili projektovani** za pruzanje **podrske procesu odlucivanja**.

Svaka organizacija obicno ima veci broj OLTP baza podataka koji se cesto preklapaju.

</br>
</br>

## Data warehouse?

</br>

**Data warehouse** je jedno od mogucih resenja koje omogucava pruzanje podrske procesu odlucivanja i prihvatanja podataka iz razlicitih OLTP izvora podataka.

Kao izvor podataka za popunjavanje Data warehous-a, mozemo da koristimo bilo sta, od obicnih CSV fajlova, do nekih NoSQL baza podataka.

Nije potrebno da sve podatke iz OLTP baza podataka ucitamo u data warehouse, vec samo one koji nam mogu pomoci oko procesa donosenja poslovnih odluka, tako recimo ukoliko imamo tabelu klijent, i pokusavamo da izvucemo neke statistike oko racuna, podatak kao sto je adresa klijenta, godiste, broj telefona i slicno nisu uopste relevantni za poslovni proces koji mi posmatramo, dok su recimo transakcije koje je obavio od velikog znacaja. Takodje, moze da se desi da je cela tabela potrebna, ali ovo zavisi od slucaja do slucaja.

## Data mart?

</br>

Kreiranje data-warehous-a je veoma skup i komplikovan proces,pogotovo za projekte koji su jako obimni i za organizacije koje cuvaju podatke o svojim poslovanjima u nekoliko razlicitih baza (_razlicitih tipova baza, razlicitim fajlovima, razlicitim formatima..._), tako da je nekad potrebno pokriti samo neke poslovne procese.

Ovde je uloga data mart-a bas to, da proces kreiranja data warehouse-a razbije na manje delove, odnosno na razlicite poslovne procese koji su relativno nezavisni jedan od drugog, cime se ne samo olaksava proces kreiranja data warehouse-a, vec i ranije dobijamo pomoc u procesu donosenja za odredjene poslovne procese.

