
# Desafio Inmetrics

## Testes Automatizados de UI

### Testes Automatizados de UI com Robot Framework e Selenium Library

O **Robot Framework**, em conjunto com a **Selenium Library**, permite a automação de testes de interface gráfica (UI). Essa abordagem possibilita a execução de testes repetitivos e em larga escala, proporcionando uma cobertura eficiente dos cenários de teste de UI.

**Exemplo de aplicação**: automação de testes de navegação, preenchimento de formulários e verificação de conteúdo em uma aplicação web.

---

## Sistema a ser Testado

O sistema alvo dos testes é o **advantageonlineshopping**, uma aplicação de comércio eletrônico que permite aos usuários navegar, adicionar produtos ao carrinho, realizar compras, entre outras funcionalidades. O foco dos testes será assegurar que as funcionalidades principais do sistema operam conforme esperado, cobrindo as áreas de:
- Testes funcionais
- Integração de APIs
- Interface de usuário

---

## Pré-requisitos para o Projeto

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
cd C:\projects
mkdir MyProject
cd MyProject
python -m venv .venv
.venv\Scripts\activate.bat
pip install robotframework
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

O **SeleniumLibrary** é uma ferramenta de automação para web, desktop, API, etc. Para automação web, devemos configurar o webdriver, que fará a integração entre o Robot Framework e os navegadores.

- Se você utiliza o **Google Chrome**, verifique a versão do navegador e baixe a versão correspondente do Chrome Driver em [chrome-for-testing](https://googlechromelabs.github.io/chrome-for-testing/).
- Após o download, descompacte e copie o arquivo `chromedriver.exe` para o diretório `Scripts` do seu ambiente virtual. Exemplo:
  ```plaintext
  <diretorio_projeto>\.venv\Scripts\chromedriver.exe
  ```

---

## Estrutura de Diretórios

A estrutura de diretórios adotada organiza os arquivos de recursos e suítes de testes da seguinte forma:

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

- Todos os elementos de tela foram capturados e escritos no formato **XPATH**.
- Os testes foram planejados e desenvolvidos evitando dependência entre si, assim habilitados para execuções 
  paralelas em pipeline no futuro.

---

## Configuração do `.gitignore`

Certifique-se de configurar seu `.gitignore` para evitar o envio de arquivos desnecessários para o repositório.

---

**Por enquanto é isso!**
