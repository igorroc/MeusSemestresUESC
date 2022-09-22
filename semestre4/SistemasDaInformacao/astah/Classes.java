public class Cliente {
    int id;
    CarrinhoDeCompras carrinho;

    public static Produto solicitaProduto(String p) {
        // Codigo
    }

    private static void adicionaProdutoAoCarrinho(Produto p) {
        // Codigo
    }

    public static void realizaPagamento() {
        // Codigo
    }
}

public class Sistema {
    int id;

    public static String verificaStatus(Cliente c) {
        // Codigo
    }

    public static float calculaComissoes(Vendedor v) {
        // Codigo
    }
}

public class CarrinhoDeCompras {
    int id;
    Produto produtos[];

    public static void setProduto(Produto p) {
        // Codigo
    }

    public static void delProduto(Produto p) {
        // Codigo
    }
}

public class Vendedor {
    int id;

    public static Produto buscaProduto(String p) {
        // Codigo
    }

    public static void registraVenda(CarrinhoDeCompras c) {
        // Codigo
    }
}

public class Caixa {
    int id;

    public static valor verificaValor(Venda v) {
        // Codigo
    }

    public static void verificaPagamento(Cliente c) {
        // Codigo
    }

    public static NotaFiscal getNotaFiscal(Venda v) {
        // Codigo
    }
}

public class Operador {
    int id;

    public static void atualizaEstoque(Estoque e) {
        // Codigo
    }
}

public class Venda {
    int id;
    Produto produtos[];
    float valor;
    String tipoDeVenda;

    public static float getValor() {
        // Codigo
    }

    public static void setProduto(Produto p) {
        // Codigo
    }
}

public class Produto {
    int id;
    String descricao;
    String categoria;
}

public class Estoque {
    int id;
    int quantidade;
    String periodo;
    int deposito;
}

public class NotaFiscal {
    int numero;
    String data;
    String dataEntrega;
    Produto produtos[];
    Cliente dadosCliente;
    float valor;

    public static float getValor() {
        // Codigo
    }
}