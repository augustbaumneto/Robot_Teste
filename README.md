
# Teste Robot

## Projeto de teste incompleto para explorar o Robot

## Sistema a ser Testado

**advantageonlineshopping**

## Tecnologias

Para este desafio de automação web, utilizamos os seguintes pré-requisitos:

- **Linguagem de Programação Python**:  
  - Python 3.13.0

- **Robot Framework**  
  - `robotframework==7.1.1`

- **Bibliotecas**  
  - `robotframework-seleniumlibrary==6.3.0`
  - `jsonschema==4.23.0`
  - `robotframework-jsonlibrary==0.5`
  - `robotframework-requests==0.9.7`

---

## Configuração do Ambiente

Para instalação do Robot Framework e das bibliotecas, utilizamos o gerenciador de pacotes do Python, `pip`.

A instalação dos pacotes foi realizada em um ambiente virtual Python para segregar o projeto dos pacotes do sistema.

### Criando o Ambiente Virtual

No diretório do seu projeto, execute os seguintes comandos:

```bash
python -m venv .venv
.venv\Scripts\activate.bat
pip install -r requirements
robot --version
```

Para desativar o ambiente virtual, execute:

```bash
.venv\Scripts\deactivate.bat
```

### Instalação das Bibliotecas

1. **Instalação do SeleniumLibrary**
   ```bash
   pip install robotframework-seleniumlibrary
   ```

2. **Instalação do robotframework-jsonlibrary**
   ```bash
   pip install robotframework-jsonlibrary
   ```

3. **Instalação da biblioteca para recursos de API (Requests)**
   ```bash
   pip install robotframework-requests
   ```

---

## Configuração do SeleniumLibrary

- Com o **Google Chrome**, baixe a versão correspondente do Chrome Driver do seu navegador em [chrome-for-testing](https://googlechromelabs.github.io/chrome-for-testing/).
- Após o download, descompacte e copie o arquivo `chromedriver.exe` para o diretório `Scripts` do seu ambiente virtual. Exemplo:
  ```plaintext
  <diretorio_projeto>\.venv\Scripts\chromedriver.exe
  ```

---

## Estrutura de Diretórios


- Recursos de páginas web e API:
  ```plaintext
  <diretorio_projeto>\resources\Pages\
  <diretorio_projeto>\resources\API\
  ```

- Suítes de testes:
  ```plaintext
  <diretorio_projeto>\tests\Pages\WEB
  <diretorio_projeto>\tests\Pages\API
  ```

---

## Padrão de Projeto Utilizado

Utilizamos uma implementação simplificada do padrão **Page Object Model (POM)** para manter o projeto com código reutilizável e de fácil manutenção futura.

---

## Configuração do `.gitignore`

Certifique-se de configurar seu `.gitignore` para evitar o envio de arquivos desnecessários para o repositório.

---