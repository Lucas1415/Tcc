
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL -- Senha armazenada de forma segura
    
);

INSERT INTO usuarios (nome, email, senha)
VALUES 
('João Silva', 'joao.silva@email.com', 'senha123'),
('Maria Oliveira', 'maria.oliveira@email.com', 'senha456'),
('Carlos Santos', 'carlos.santos@email.com', 'senha789');


-- Criar a tabela de textos
CREATE TABLE text_alzheimer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,               -- Título do texto
    conteudo TEXT NOT NULL,                     -- Conteúdo completo do texto
    categoria VARCHAR(100),                     -- Categoria (ex: Artigo, Notícia, Dica)
    status ENUM('ativo', 'inativo', 'rascunho') DEFAULT 'ativo',  -- Status do texto
    tags VARCHAR(255),                          -- Tags ou palavras-chave (se necessário)
    imagem_url VARCHAR(255),                    -- URL da imagem associada (opcional)
    UNIQUE(titulo)                              -- Garantir que o título seja único
);

INSERT INTO text_alzheimer (titulo, conteudo, categoria, status, tags, imagem_url)
VALUES 
('Entendendo a doença de Alzheimer', 'A doença de Alzheimer é uma condição neurodegenerativa que afeta a memória, o pensamento e o comportamento...', 'Artigo', 'ativo', 'Alzheimer, Memória, Cuidados', 'https://example.com/images/alzheimer.jpg'),
('Sintomas iniciais do Alzheimer', 'Os primeiros sinais da doença de Alzheimer geralmente incluem perda de memória recente e confusão...', 'Dica', 'ativo', 'Sintomas, Diagnóstico, Alzheimer', 'https://example.com/images/sintomas.jpg'),
('Cuidados diários para pacientes com Alzheimer', 'A rotina de cuidados diários é essencial para o bem-estar de pacientes com Alzheimer...', 'Notícia', 'ativo', 'Cuidados, Pacientes, Alzheimer', 'https://example.com/images/cuidados.jpg');


-- Criar a tabela de logs (opcional)
CREATE TABLE logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    acao VARCHAR(255) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Inserindo logs para ações dos usuários
INSERT INTO logs (usuario_id, acao)
VALUES 
(1, 'Cadastro de novo usuário'),
(2, 'Login realizado com sucesso'),
(1, 'Alteração de dados do perfil'),
(3, 'Leitura de texto sobre sintomas iniciais do Alzheimer'),
(2, 'Cadastro de novo texto sobre cuidados diários');

