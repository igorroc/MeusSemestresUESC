import com.Painel;

import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

public class Cliente {
    private ArrayList<String> listaDeCompras;
    public HashMap<String, Integer> cestaDeProdutos;

    public Cliente(){
        listaDeCompras = new ArrayList<String>();
        cestaDeProdutos = new HashMap<String, Integer>();
    }

    public void adicionarItemNaLista(String item) {
        listaDeCompras.add(item);
    }

    public void removerItemDaLista(String item) {
        boolean achou = false;
        System.out.print(item);
        for (String produto : listaDeCompras) {
            System.out.print(produto);
            if(produto == item){
                achou = true;
            }
        }
        if(achou){
            listaDeCompras.remove(item);
            Painel.mensagem("Produto '" + item + "' removido da lista.");
        }else{
            Painel.erro("Produto '" + item + "' não encontrado.");
        }
    }

    public void adicionarItemNaCesta(String item, Integer quantidade) {
        Integer qtdExistente = cestaDeProdutos.get(item);
        if(qtdExistente != null){
            cestaDeProdutos.put(item, qtdExistente+quantidade);
        }else{
            cestaDeProdutos.put(item, quantidade);
        }
    }
    public void adicionarItemNaCesta(String item) {
        Integer qtdExistente = cestaDeProdutos.get(item);
        if(qtdExistente != null){
            cestaDeProdutos.put(item, qtdExistente+1);
        }else{
            cestaDeProdutos.put(item, 1);
        }
    }
    

    public void removerItemDaCesta(String item, Integer quantidade) {
        if(cestaDeProdutos.get(item) == null){
            Painel.erro("Produto '" + item + "' não encontrado.");
            return;
        }
        if(quantidade >= cestaDeProdutos.get(item)){
            cestaDeProdutos.remove(item);
            Painel.mensagem("Produto '" + item + "' removido da cesta.");
        }else{
            cestaDeProdutos.put(item, cestaDeProdutos.get(item)-quantidade);
            Painel.mensagem("Removido '" + quantidade + "' '" + item + "' da cesta.");
        }
        
    }
    public void removerItemDaCesta(String item) {
        if(cestaDeProdutos.get(item) == null){
            Painel.erro("Produto '" + item + "' não encontrado.");
        }else{
            cestaDeProdutos.remove(item);
            Painel.mensagem("Produto '" + item + "' removido da cesta.");
        }
    }

    public void limparCesta(){
        cestaDeProdutos.clear();
    }

    public void verLista(){
        if(listaDeCompras.size() == 0){
            Painel.erro("Lista vazia, adicione um item!");
            return;
        }
        String mensagem = "";
        for(String produto : listaDeCompras){
            mensagem = mensagem + produto + "\n";
        }
        Painel.mensagem(mensagem, "Lista de Compras:");
    }

    public void verCesta(){
        if(cestaDeProdutos.size() == 0){
            Painel.erro("Cesta vazia, adicione um item!");
            return;
        }
        String mensagem = "";
        for(Map.Entry<String, Integer> item: cestaDeProdutos.entrySet()) {
            mensagem = mensagem + item.getValue() + "x " + item.getKey() + "\n";
        }
        Painel.mensagem(mensagem, "Cesta de Produtos:");
    }

    public Integer qtdCesta(){
        return cestaDeProdutos.size();
    }

    public Integer qtdLista(){
        return listaDeCompras.size();
    }
   
}