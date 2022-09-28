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