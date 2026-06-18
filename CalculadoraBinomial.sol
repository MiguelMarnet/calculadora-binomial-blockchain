// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Calculadora de Números Binomiais
/// @notice Calcula fatorial, coeficiente binomial (combinação) e valida entradas.
/// @dev Usa uint256: números negativos e não-inteiros já são impossíveis por tipo.
contract CalculadoraBinomial {

    /// @notice Fatorial: n! = n * (n-1) * ... * 1
    /// @dev 57! é o maior valor que cabe em uint256 (58! estoura).
    function fatorial(uint256 n) public pure returns (uint256) {
        require(n <= 57, "n muito grande: 57! e o maximo que cabe em uint256");

        uint256 resultado = 1;
        for (uint256 i = 2; i <= n; i++) {
            resultado = resultado * i;
        }
        return resultado; // 0! e 1! retornam 1 automaticamente
    }

    /// @notice Combinacao C(n, p) = n! / (p! * (n - p)!)
    /// @dev Cálculo iterativo: evita estourar mesmo para n grandes,
    ///      pois nunca monta o fatorial inteiro. Cada divisão é exata.
    function combinacao(uint256 n, uint256 p) public pure returns (uint256) {
        // VALIDAÇÃO PRINCIPAL: não dá pra escolher p elementos de n se p > n
        require(p <= n, "Entrada invalida: p nao pode ser maior que n");

        // C(n, p) == C(n, n-p): usar o menor reduz o número de passos e o risco de overflow
        if (p > n - p) {
            p = n - p;
        }

        uint256 resultado = 1;
        for (uint256 i = 0; i < p; i++) {
            // resultado passa por C(n,1), C(n,2), ... e cada divisão dá inteiro exato
            resultado = resultado * (n - i) / (i + 1);
        }
        return resultado; // C(n,0) e C(n,n) retornam 1
    }

    /// @notice Versão "didática" usando a fórmula com fatoriais explícitos.
    /// @dev Mais fiel ao enunciado, porém limitada a n <= 57 por causa do fatorial.
    function combinacaoComFatorial(uint256 n, uint256 p) public pure returns (uint256) {
        require(p <= n, "Entrada invalida: p nao pode ser maior que n");
        require(n <= 57, "n muito grande para o calculo via fatorial");

        return fatorial(n) / (fatorial(p) * fatorial(n - p));
    }
}
