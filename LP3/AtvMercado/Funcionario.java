import java.util.Map;

import com.Painel;

import java.util.HashMap;

public class Funcionario {
    private String id;
    private boolean logado = false;
    private HashMap<String, Double> estoque;
    private Mercado mercado;

    public Funcionario(String id_inicial, Mercado trabalho){
        id = id_inicial;
        mercado = trabalho;
        this.setEstoque(mercado.getEstoque());
    }

    public boolean fazerLogin(String login){
        if (login == id) {
            logado = true;
            System.out.println("Login efetuado com sucesso! Bem-vindo(a)\n");
            return true;
        }else{
            System.out.println("Credenciáis inválidas.\n");
            return false;
        }
    }

    public String getLogin(){
        return id;
    }

    public void setLogin(String login){
        id = login;
    }

    public void setEstoque(HashMap<String, Double> stq){
        estoque = stq;
    }

    public void adicionarProduto(String item, Double preco){
        if(!logado){
            System.out.println("Usuário não logado, faça login.");
            return;
        }
        if(estoque == null){
            System.out.println("Estoque não inicializado.");
            return;
        }
        estoque.put(item, preco);
    }

    public void removerProduto(String item){
        if(!logado){
            System.out.println("Usuário não logado, faça login.");
            return;
        }
        if(estoque == null){
            System.out.println("Estoque não inicializado.");
            return;
        }
        if(estoque.get(item) == null){
            System.out.println("Produto '" + item + "' não encontrado.\n");
        }else{
            estoque.remove(item);
        }
    }

    public void verEstoque(){
        if(!logado){
            System.out.println("Usuário não logado, faça login.");
            return;
        }
        if(estoque == null){
            System.out.println("Estoque não inicializado.");
            return;
        }
        System.out.println("Estoque do Mercado:");
        for(Map.Entry<String, Double> item: estoque.entrySet()) {
            System.out.println("Item: " + item.getKey() + " | Preço: " + item.getValue());
        }
        System.out.println("");
    }

    public boolean verificaNoEstoque(String item){
        if(estoque.get(item) != null){
            return true;
        }else{
            return false;
        }
    }

    public void extrato(Cliente cliente){
        double totalDaCesta = 0;
        String mensagem = "";
        for(Map.Entry<String, Integer> item: cliente.cestaDeProdutos.entrySet()) {
            double precoTotal = 0;
            double precoDoItem = estoque.get(item.getKey());
            
            precoTotal = precoDoItem * item.getValue();

            mensagem = mensagem + item.getValue() + "x " + item.getKey() + " = R$" + precoTotal + " (R$" + precoDoItem + " cada)\n";

            totalDaCesta += precoTotal;
        }
        mensagem = mensagem + "Total da Cesta: R$" + totalDaCesta;
        Painel.mensagem(mensagem, "Total:");
    }

    public void venderPara(Cliente cliente){
        double total = mercado.totalDaCesta(cliente);
        Painel.finalizarCompra(total);
        Painel.mensagem("Compra Finalizada!");
        cliente.limparCesta();
    }
}
