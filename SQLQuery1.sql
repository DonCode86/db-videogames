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

-- 4- Selezionare tutte le recensioni scritte dal giocatore con ID = 800 (11)

SELECT *
FROM reviews
where player_id = 800;