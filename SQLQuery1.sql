-- 1- Selezionare tutte le software house americane (3)
SELECT *
FROM software_houses
where country = 'united states';

--2- Selezionare tutti i giocatori della città di 'Rogahnland' (2)
SELECT * 
FROM players 
where city = 'Rogahnland';

--3- Selezionare tutti i giocatori il cui nome finisce per "a" (220)
SELECT *
FROM players
where name like '%a';

-- 4- Selezionare tutte le recensioni scritte dal 
--giocatore con ID = 800 (11)

SELECT *
FROM reviews
where player_id = 800;

-- 5- Contare quanti tornei ci sono stati nell'anno 2015 (9)

SELECT *
FROM tournaments
where year = 2015;

--6- Selezionare tutti i premi che contengono nella descrizione 
--la parola 'facere' (2)

SELECT *
FROM awards
where description like '%facere%';

-- 7- Selezionare tutti i videogame che hanno 
-- la categoria 2 (FPS) o 6 (RPG), 
-- mostrandoli una sola volta (del videogioco vogliamo solo l'ID) (287)

SELECT DISTINCT videogame_id
FROM category_videogame 
where category_id = 2 or category_id = 6

-- 8- Selezionare tutte le recensioni con voto compreso tra 2 e 4 (2947)

SELECT *
FROM reviews
where rating > 1 and rating < 5

-- 9- Selezionare tutti i dati dei videogiochi rilasciati nell'anno 2020 (46)

SELECT *
FROM videogames
where release_date like '%2020%'

-- 10- Selezionare gli id dei videogame che hanno ricevuto 
-- almeno una recensione da 4 stelle, mostrandoli una sola volta (443)

SELECT DISTINCT videogame_id
FROM reviews
where rating > 4

-- 11- Selezionare il numero e la media delle recensioni 
-- per il videogioco con ID = 412 (review number = 12, avg_rating = 3)

SELECT COUNT(*) AS "NumeroRecensioni", AVG(rating) AS "MediaRecensioni"
FROM reviews
WHERE videogame_id = 412;

-- 12- Selezionare il numero di videogame che la software house 
-- con ID = 1 ha rilasciato nel 2018 (13)

SELECT COUNT(*) AS "RilasciNel2018"
FROM videogames
WHERE software_house_id = 1 AND release_date like '%2018%'




-- -----------------------Query con group by ----------------------------

-- 1- Contare quante software house ci sono per ogni paese (3)

Select COUNT (*) AS "shPerPaese"
FROM software_houses
GROUP BY country

-- 2- Contare quante recensioni ha ricevuto ogni videogioco 
-- (del videogioco vogliamo solo l'ID) (500)

SELECT COUNT (videogame_id) AS "NumeroDiRecesioni"
from reviews
GROUP BY videogame_id

-- 3- Contare quanti videogiochi hanno ciascuna classificazione PEGI 
-- (della classificazione PEGI vogliamo solo l'ID) (13)
SELECT COUNT (*)
FROM pegi_label_videogame
GROUP BY pegi_label_id

-- 4- Mostrare il numero di videogiochi rilasciati ogni anno (11)

SELECT COUNT (*) AS "Rilasci/Anno"
FROM videogames
GROUP BY YEAR(release_date)

-- 5- Contare quanti videogiochi sono disponbili per ciascun device 
-- (del device vogliamo solo l'ID) (7)

SELECT COUNT (device_videogame.id) AS "DeviceID"
FROM device_videogame
GROUP BY device_id

-- 6- Ordinare i videogame in base alla media delle recensioni 
-- (del videogioco vogliamo solo l'ID) (500)

SELECT COUNT (videogame_id) AS "VideoGameID", AVG(rating) AS "MediaRecensioni"
FROM reviews
GROUP BY videogame_id
ORDER BY AVG(rating) 

-- -------------------------Query con join------------------------------

-- 1- Selezionare i dati di tutti giocatori che hanno scritto 
-- almeno una recensione, mostrandoli una sola volta (996)

SELECT DISTINCT (players.id)
FROM reviews
INNER JOIN players
ON players.id = reviews.player_id;
 
 -- 2- Sezionare tutti i videogame dei tornei tenuti nel 2016, 
 -- mostrandoli una sola volta (226)

 SELECT DISTINCT (videogames.id)
 FROM videogames
 INNER JOIN tournament_videogame
 ON videogames.id = tournament_videogame.videogame_id
 INNER JOIN tournaments 
 ON tournament_videogame.tournament_id = tournaments.id
 WHERE tournaments.year = 2016;
 
 -- 3- Mostrare le categorie di ogni videogioco (1718)

 SELECT *
 FROM videogames
 INNER JOIN category_videogame
 ON category_videogame.category_id = videogames.id

 -- 4- Selezionare i dati di tutte le software house che 
 -- hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)

SELECT *
FROM software_houses
INNER JOIN videogames