# 🧮 Calculadora de Números Binomiais — on-chain

> Um smart contract em **Solidity** que calcula fatoriais e combinações, com uma interface web que lê o resultado **diretamente da blockchain** e o destaca em um Triângulo de Pascal interativo.

![Solidity](https://img.shields.io/badge/Solidity-0.8-363636?logo=solidity&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-ethers.js-F7DF1E?logo=javascript&logoColor=black)
![Sepolia](https://img.shields.io/badge/Rede-Sepolia%20Testnet-627EEA?logo=ethereum&logoColor=white)

---

## 🔗 Demonstração

- **Interface ao vivo:** `https://<seu-usuario>.github.io/<nome-do-repositorio>/`
- **Contrato verificado na Sepolia:** [`0x<seu-endereco-do-contrato>`](https://sepolia.etherscan.io/address/0x<seu-endereco-do-contrato>)

> A interface precisa da extensão **MetaMask** na rede Sepolia para se conectar ao contrato.

## 📸 Captura de tela

![Calculadora em funcionamento](screenshots/funcionando.png)

*Cálculo de C(5, 2) = 10 lido da blockchain, com a casa correspondente destacada no Triângulo de Pascal.*

## 💡 Sobre o projeto

Projeto desenvolvido para a disciplina de Matemática Aplicada. O objetivo era construir uma calculadora de números binomiais implementando **toda a lógica matemática do zero**, sem funções prontas de combinação. Optei por levar o desafio além e implementá-la como um **contrato inteligente** publicado em uma rede blockchain de teste, com uma interface web própria — unindo matemática, programação e tecnologia Web3.

## ✨ Funcionalidades

- Cálculo de **fatorial** (`n!`) por laço de repetição.
- Cálculo de **combinação** `C(n, p)` por método iterativo, que evita estouro numérico.
- Versão didática usando a fórmula `C(n, p) = n! / (p! · (n − p)!)`.
- **Validações:** bloqueia números negativos, não inteiros, campos vazios e o caso `p > n`.
- **Triângulo de Pascal interativo** que acende a casa correspondente ao resultado.

## 🛠️ Tecnologias

- **Solidity** — lógica do contrato (fatorial e combinação).
- **ethers.js** — comunicação entre a interface e a blockchain.
- **HTML, CSS e JavaScript** — interface web.
- **MetaMask + rede de teste Sepolia** — carteira e blockchain.

## ▶️ Como executar localmente

1. Tenha a extensão **MetaMask** instalada e selecione a rede **Sepolia**.
2. Sirva a página por um servidor local (necessário para o MetaMask funcionar):
   ```bash
   py -m http.server 8000
   ```
3. Acesse `http://localhost:8000/index.html`.
4. Clique em **Conectar carteira**, cole o endereço do contrato e calcule.

## ⚙️ Como funciona

As funções do contrato são `pure` (apenas leem e retornam valores), então **calcular não gasta gas** — só a publicação do contrato teve custo. A combinação é calculada de forma iterativa, multiplicando e dividindo passo a passo, o que mantém os números intermediários pequenos e evita estourar o limite do tipo `uint256`.

## 📚 O que aprendi

- Escrever e publicar um smart contract em Solidity.
- Conectar uma interface web a um contrato usando ethers.js e MetaMask.
- Lidar com limites numéricos (`uint256`) e overflow em fatoriais.
- O fluxo completo de um projeto Web3: contrato → deploy → frontend.

## 👤 Autor

**[Seu nome]** — [seu e-mail ou LinkedIn]
