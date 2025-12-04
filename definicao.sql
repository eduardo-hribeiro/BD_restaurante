DROP DATABASE IF EXISTS projeto_restaurante;
CREATE DATABASE projeto_restaurante;

USE projeto_restaurante;


-- TABELA CARGOS
DROP TABLE IF EXISTS cargos;

CREATE TABLE cargos (
	id_cargo INT AUTO_INCREMENT PRIMARY KEY,
	nome_cargo VARCHAR(100) NOT NULL,
	nivel VARCHAR(50)
);
desc cargos;


-- TABELA FUNCIONÁRIOS
DROP TABLE IF EXISTS funcionarios;

CREATE TABLE funcionarios (
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(14) NOT NULL UNIQUE,
	data_nascimento DATE,
	endereco VARCHAR(255),
	telefone VARCHAR(15) UNIQUE,
	email VARCHAR(100) UNIQUE,
	id_cargo INT,
	salario DECIMAL(10,2),
	data_admissao DATE,
	FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo)
);
desc funcionarios;


-- TABELA CLIENTES
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(14) NOT NULL UNIQUE,
	data_nascimento DATE,
	endereco VARCHAR(255),
	telefone VARCHAR(15) UNIQUE,
	email VARCHAR(100) UNIQUE,
	data_cadastro DATE
);
desc clientes;	


-- TABELAS PRODUTOS
DROP TABLE IF EXISTS produtos;

CREATE TABLE produtos (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	descricao TEXT NOT NULL,
	preco DECIMAL(10,2) NOT NULL,
	categoria VARCHAR(100)
);
desc produtos;


-- TABELA INFO_PRODUTOS
DROP TABLE IF EXISTS info_produtos;

CREATE TABLE info_produtos (
	id_info INT AUTO_INCREMENT PRIMARY KEY,
	id_produto INT NOT NULL,
	ingredientes TEXT NOT NULL,
	fornecedor VARCHAR(255) NOT NULL,
    
	FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
desc info_produtos;


-- TABELA PEDIDOS
DROP TABLE IF EXISTS pedidos;

CREATE TABLE pedidos (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT NOT NULL,
	id_funcionario INT NOT NULL,
	data_pedido DATE,
	status ENUM('Concluído','Pendente','Cancelado') DEFAULT 'Pendente',
	valor_total DECIMAL(10,2),
    
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);
desc pedidos;
                    

-- TABELA ITENS_PEDIDO
DROP TABLE IF EXISTS itens_pedido;

CREATE TABLE itens_pedido (
	id_item INT AUTO_INCREMENT PRIMARY KEY,
	id_pedido INT NOT NULL,
	id_produto INT NOT NULL,
	quantidade INT NOT NULL,
	preco_unitario DECIMAL(10,2) NOT NULL,
    
	FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
	FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
desc itens_pedido;
               
               
-- BACKUP DA TABELA PEDIDOS
CREATE TABLE backup_pedidos AS SELECT * FROM pedidos;