CREATE TABLE tb_Cidade (
  codCidade INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_cidade VARCHAR NULL,
  UF VARCHAR NULL,
  PRIMARY KEY(codCidade)
);

CREATE TABLE TB_Trecho (
  codTrecho INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  cidade_origem  INTEGER UNSIGNED NOT NULL,
  cidade_destino INTEGER UNSIGNED NOT NULL,
  distancia INTEGER UNSIGNED NULL,  
  PRIMARY KEY(codTrecho)
);

CREATE TABLE TB_Pessoa (
  codPessoa INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nomePessoa VARCHAR NULL,
  CPF INTEGER UNSIGNED NULL,
  dtNasc DATE NULL,
  sexo CHAR NULL,
  telefone VARCHAR NULL,
  email VARCHAR NULL,
  endereco INTEGER UNSIGNED NULL,
  PRIMARY KEY(codPessoa)
);

CREATE TABLE TB_Aeronave (
  codAeronave INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  modeloAeronave VARCHAR NULL,
  qtdAssentosEcon INTEGER UNSIGNED NULL,
  qtdAssentosPClas INTEGER UNSIGNED NULL,
  PRIMARY KEY(codAeronave)
);

CREATE TABLE TB_Compra (
  codCompra INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  codComprador INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(codCompra),
  FOREIGN KEY(codComprador)
    REFERENCES TB_Pessoa(codPessoa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE TB_Aeroporto (
  codAeroporto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  codCidade INTEGER UNSIGNED NOT NULL,
  nomeAeroporto VARCHAR NULL,
  sigla VARCHAR NULL,
  PRIMARY KEY(codAeroporto),
  FOREIGN KEY(codCidade)
    REFERENCES tb_Cidade(codCidade)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE TB_Voo (
  codVoo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  codTrecho INTEGER UNSIGNED NOT NULL,
  codAeronave INTEGER UNSIGNED NOT NULL,
  numVoo VARCHAR NULL,
  qtdAssentosEcon INTEGER UNSIGNED NULL,
  qtdAssentosPClas INTEGER UNSIGNED NULL,
  partida DATE NULL,
  chegada DATE NULL,
  duracao INTEGER UNSIGNED NULL,
  PRIMARY KEY(codVoo),
  FOREIGN KEY(codTrecho)
    REFERENCES TB_Trecho(codTrecho)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(codAeronave)
    REFERENCES TB_Aeronave(codAeronave)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE TB_Bilhete (
  codBilhete INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  codCompra INTEGER UNSIGNED NOT NULL,
  codPessoa INTEGER UNSIGNED NOT NULL,
  TB_Compra_TB_Pessoa_codPessoa INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(codBilhete),
  FOREIGN KEY(codCompra)
    REFERENCES TB_Compra(codCompra)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(codPessoa)
    REFERENCES TB_Pessoa(codPessoa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


