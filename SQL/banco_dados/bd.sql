CREATE TABLE heroi(
	id serial PRIMARY KEY,
	nome varchar(255),
	nivel int NOT NULL DEFAULT 0,
	forca int NOT NULL DEFAULT 1,
	defesa int NOT NULL DEFAULT 0,
	vida int NOT NULL DEFAULT 0,
	mana decimal(10,2) NOT NULL DEFAULT 0.00,
	moeda decimal(10,2) NOT NULL DEFAULT 0.00,
	xp decimal(10,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE monstro(
	id serial PRIMARY KEY,
	nome varchar(255),
	nivel int NOT NULL DEFAULT 0,
	forca int NOT NULL DEFAULT 1,
	defesa int NOT NULL DEFAULT 0,
	vida int NOT NULL DEFAULT 0,
	mana decimal(10,2) NOT NULL DEFAULT 0.00,
	tipo varchar(55) NOT NULL,
	moeda_reconpenca decimal(10,2) NOT NULL DEFAULT 0.00,
	xp_reconpenca decimal(10,2) NOT NULL DEFAULT 0.00,
	boss boolean DEFAULT FALSE,
	agressivo boolean DEFAULT FALSE
);


CREATE TABLE batalhas(
	id serial PRIMARY KEY,
	data date NOT NULL,
	hora time NOT NULL,
	heroi_ganhou boolean DEFAULT FALSE,
	multiplicador decimal(10,2) DEFAULT 1.00
);




CREATE TABLE poder(
	id serial PRIMARY KEY,
	tipo varchar(55),
	dano int NOT NULL DEFAULT 1,
	custo_mana decimal(10,2) NOT NULL DEFAULT 1.00
);


CREATE TABLE heroi_poder(
	id serial PRIMARY KEY,
	heroi_id int NOT NULL,
	poder_id int NOT NULL,
	FOREIGN KEY(heroi_id) REFERENCES heroi(id),
	FOREIGN KEY(poder_id) REFERENCES poder(id)
);


CREATE TABLE monstro_poder(
	id serial PRIMARY KEY,
	monstro_id int NOT NULL,
	poder_id int NOT NULL,
	FOREIGN KEY(monstro_id) REFERENCES monstro(id),
	FOREIGN key(poder_id) REFERENCES poder(id)
);



CREATE TABLE monstro_heroi_batalha(
	id serial PRIMARY KEY,
	monstro_id int NOT NULL,
	heroi_id int NOT NULL,
	batalha_id int NOT NULL,
	FOREIGN KEY(monstro_id) REFERENCES monstro(id),
	FOREIGN KEY(heroi_id) REFERENCES heroi(id),
	FOREIGN key(batalha_id) REFERENCES batalhas(id)
);

INSERT INTO heroi(nome,nivel,forca,defesa,vida,mana,moeda,xp)
VALUES
('Titan', 15, 210,110,2500,1050.00,1500,34010),
('Dentas', 35, 351,225,3100,1200.00,3000,65125),
('Katung', 23, 275,179,2850,1125.00,2200,45784),
('Xinguan', 9, 112,85,1450,950.00,984,19874),
('Xyra', 48, 487,370,3890,1680.00,6000,89837);


INSERT INTO monstro(nome,nivel,forca,defesa,vida,mana,moeda_reconpenca,xp_reconpenca,boss,agressivo,tipo)
VALUES
('DTent', 10, 45, 75,9500, 855,125,1200,FALSE,FALSE,'pedra'),
('Seclar', 15, 78, 120,12500, 985,250,1500,FALSE,FALSE,'agua'),
('OnderBreak', 47, 215,625,45700, 2500,3252,3520,true,FALSE,'fogo'),
('Decatete', 99, 3335,4444,85900, 3800,7252,12200,true,TRUE,'metal'),
('OnderBreak', 22, 124,320,21300, 1204,850,2200,false,TRUE,'fantasma');


INSERT INTO poder(tipo,dano,custo_mana)
values
('ataque-basico', 35,0),
('lança-chamas', 115,50),
('congela',90,35),
('aquatico', 125,47),
('magmante', 200,150),
('confusao', 35,200),
('olha-a-pedra', 55,10);


INSERT INTO batalhas (data,hora,heroi_ganhou,multiplicador)
VALUES
('2022-04-12','12:33:25',TRUE,1.5),
('2022-04-22','0:47:35',TRUE,1.5),
('2022-04-17','2:25:47',TRUE,1.5),
('2022-05-15','3:10:58',TRUE,1.5),
('2022-05-27','12:41:19',TRUE,1.5),
('2022-06-08','7:22:55',FALSE,1.5),
('2022-06-07','21:39:13',TRUE,1.5),
('2022-06-10','14:44:22',FALSE,1.5),
('2022-06-10','6:17:14',FALSE,1.5);



INSERT INTO heroi_poder(heroi_id,poder_id)
VALUES
(1,1),(1,6),(1,7),(1,3),
(2,1),(2,6),(2,7),(2,3),(2,4),(2,3),
(3,1),(3,6),(3,7),(3,3),(3,4),
(4,1),(4,6),(4,7),
(5,1),(5,6),(5,7),(5,3),(5,4),(5,3),(5,5),(5,2);
 
INSERT INTO monstro_poder (monstro_id,poder_id)
VALUES
(1,1),(1,7),
(2,1),(2,3),(2,4),
(3,1),(3,2),(2,5),(2,6),
(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),
(5,1),(1,6);


INSERT INTO monstro_heroi_batalha (heroi_id,monstro_id,batalha_id)
VALUES
(4,1,1),
(1,2,2),
(2,5,3),(3,5,3),(5,5,3),
(4,5,4),(1,5,4),
(1,3,5),
(2,4,6),(3,4,6),(4,4,6),(5,4,6),
(1,3,7),(2,3,7),(3,3,7),(4,3,7),(5,3,7),
(1,4,8),(2,4,8),(3,4,8),(4,4,8),(5,4,8),
(1,5,9);


