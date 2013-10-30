USE passagensaereas;
INSERT INTO aeronave (id,modeloAeronave,qtdAssentosEcon,qtdAssentosPclas)
			VALUES	 (1,'Airbus A300',200,20);
INSERT INTO aeronave (id,modeloAeronave,qtdAssentosEcon,qtdAssentosPclas)
			VALUES	 (2,'Boeing 777',300,68);
INSERT INTO aeronave (id,modeloAeronave,qtdAssentosEcon,qtdAssentosPclas)
			VALUES	 (3,'Boeing 737',190,25);
INSERT INTO aeronave (id,modeloAeronave,qtdAssentosEcon,qtdAssentosPclas)
			VALUES	 (4,'Airbus A320',120,25);
			
INSERT INTO cidade 	 (id,nomeCidade,uf)
			VALUES	 (1,'Sao Paulo','SP');
INSERT INTO cidade 	 (id,nomeCidade,uf)
			VALUES	 (2,'Rio de Janeiro','RJ');
INSERT INTO cidade 	 (id,nomeCidade,uf)
			VALUES	 (3,'Fortaleza','CE');
INSERT INTO cidade 	 (id,nomeCidade,uf)
			VALUES	 (4,'Natal','RN');
INSERT INTO cidade 	 (id,nomeCidade,uf)
			VALUES	 (5,'Porto Alegre','RS');
INSERT INTO cidade 	 (id,nomeCidade,uf)
			VALUES	 (6,'Brasilia','DF');
			
			
INSERT INTO aeroporto (id,nomeAeroporto,sigla, cidade_id)
			VALUES	 (1,'Aeroporto de Congonhas','CGH',1);
INSERT INTO aeroporto (id,nomeAeroporto,sigla, cidade_id)
			VALUES	 (2,'Aeroporto Santos Dumont','SDU',2);
INSERT INTO aeroporto (id,nomeAeroporto,sigla, cidade_id)
			VALUES	 (3,'Aeroporto Internacional Pinto Martins','FOR',3);
INSERT INTO aeroporto (id,nomeAeroporto,sigla, cidade_id)
			VALUES	 (4,'Aeroporto Internacional Augusto Severo','NAT',4);
INSERT INTO aeroporto (id,nomeAeroporto,sigla, cidade_id)
			VALUES	 (5,'Aeroporto Internacional Salgado Filho','POA',5);
INSERT INTO aeroporto (id,nomeAeroporto,sigla, cidade_id)
			VALUES	 (6,'Aeroporto Internacional Presidente Juscelino Kubitschek','BSB',6);

INSERT INTO trecho 	 (id,distancia,idCidadeDestino,idCidadeOrigem)
			VALUES	 (1,366,2,1);
INSERT INTO trecho 	 (id,distancia,idCidadeDestino,idCidadeOrigem)
			VALUES	 (2,366,1,2);
INSERT INTO trecho 	 (id,distancia,idCidadeDestino,idCidadeOrigem)
			VALUES	 (3,2100,3,6);
			
INSERT INTO voo		(id,chegada,partida,numVoo,aeronave_id,trecho_id,duracao,assentosPClasDisponiveis,assentosEconDisponiveis)
			VALUES	(1,'2013-10-30 4:00:00','2013-10-30 5:00:00',123,1,1,1,25,200)
