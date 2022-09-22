import com.Painel;

public class App {
    public static void main(String[] args) throws Exception {
        Mercado meira = new Mercado();
        Cliente joao = new Cliente();
        Funcionario pedro = meira.iniciaFuncionario("123456");
        String menu;
        Integer opcao = 1;
        String valor;

        pedro.fazerLogin("123456");
        pedro.adicionarProduto("cenoura", 3.5);
        pedro.adicionarProduto("banana", 2.5);
        pedro.adicionarProduto("limao", 3.0);
        pedro.adicionarProduto("biscoito", 4.0);
        pedro.adicionarProduto("morango", 10.0);

        while (opcao != 0) {
            menu = Painel.mensagemInicial();
            try {
                if(menu == null){
                    opcao = 0;
                }else{
                    opcao = Integer.parseInt(menu);
                }
            } catch (Exception e) {
                opcao = -1;
                Painel.erro("Opção inválida.");
            }
            

            switch (opcao) {
                case 1:
                    valor = Painel.inputUsuario("Qual item você deseja adicionar na lista?");
                    joao.adicionarItemNaLista(valor);
                    break;
                case 2:
                    valor = Painel.inputUsuario("Qual item você deseja adicionar na cesta?\n"+
                                                "> Digite item,qtd");
                    Integer index = valor.indexOf(',');
                    String qtd = null;
                    if(index != -1){ // VERIFICA SE TEVE UMA VIRGULA
                        qtd = valor.substring(index+1);
                        valor = valor.substring(0, index);
                        Integer index2 = qtd.indexOf(',');
                        if(index2 != -1){ // VERIFICA SE TEVE 2 VIRGULAS
                            qtd = qtd.substring(0, index2);
                        }
                    }
                    if(pedro.verificaNoEstoque(valor)){
                        if(qtd != null){
                            try {
                                Integer qtd_ = Integer.parseInt(qtd);
                                joao.adicionarItemNaCesta(valor, qtd_);
                            } catch (Exception e) {
                                Painel.erro("A quantidade indicada não é um inteiro");
                            }
                        }else{
                            joao.adicionarItemNaCesta(valor);
                        }
                    }else{
                        Painel.erro("Item não encontrado no estoque.");
                    }
                    break;
                case 3:
                    joao.verLista();
                    break;
                case 4:
                    joao.verCesta();
                    break;
                case 5:
                    if(joao.qtdLista() > 0){
                        valor = Painel.inputUsuario("Qual item você deseja remover da lista?");
                        joao.removerItemDaLista(valor);
                    }else{
                        Painel.erro("Não é possível remover um item de uma lista vazia!");
                    }
                    break;
                case 6:
                    if(joao.qtdCesta() > 0){
                        valor = Painel.inputUsuario("Qual item você deseja remover da cesta?");
                        joao.removerItemDaCesta(valor);
                    }else{
                        Painel.erro("Não é possível remover um item de uma cesta vazia!");
                    }
                    break;
                case 7:
                    if(joao.qtdCesta() > 0){
                        pedro.extrato(joao);
                    }else{
                        Painel.erro("Cesta vazia, adicione um item!");
                    }
                    break;
                case 8:
                    if(joao.qtdCesta() > 0){
                        pedro.venderPara(joao);
                    }else{
                        Painel.erro("Cesta vazia, adicione um item!");
                    }
                    break;
                case 0:
                    Painel.finalizandoPrograma();
                    break;
                case -1:
                    break;
                default:
                    Painel.erro("Opção inválida.");
                    break;
            }
        }
        

        try {
            Thread.sleep(2000);
        }
        catch (InterruptedException e) {
            System.exit(0);
        }
    }

    
}