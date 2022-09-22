import java.util.ArrayList;


public class Estoque
{
    ArrayList<String> brinquedos;
    ArrayList<String> roupas;
    ArrayList<String> comidas;
    
    public Estoque()
    {
        ArrayList<String> brinquedos = new ArrayList();
        ArrayList<String> roupas = new ArrayList();
        ArrayList<String> comidas = new ArrayList();
    }
    
    public void entrada(Produto p){
        if(p.categoria == "brinquedo"){
            System.out.printf("Adicionando %s na categoria %s", p.nome, p.categoria);
            brinquedos.add(p.nome);
        }
        else if(p.categoria == "roupa"){
            roupas.add(p.nome);
        }
        else if(p.categoria == "comida"){
            comidas.add(p.nome);
        }
        
    }
    
    public void retirada(Produto p){
        if(p.categoria == "brinquedo"){
            int n = brinquedos.size();
            for (int i=0; i<n; i++) {
                if(brinquedos.get(i) == p.nome){
                    brinquedos.remove(i);
                    break;
                }
            }
        }
        else if(p.categoria == "roupa"){
            int n = roupas.size();
            for (int i=0; i<n; i++) {
                if(roupas.get(i) == p.nome){
                    roupas.remove(i);
                    break;
                }
            }
        }
        else if(p.categoria == "comida"){
            int n = comidas.size();
            for (int i=0; i<n; i++) {
                if(comidas.get(i) == p.nome){
                    comidas.remove(i);
                    break;
                }
            }
        }
    }
    
    public void mostraCat(String cat){
        if(cat == "brinquedos"){
            int n = brinquedos.size();
            if (n == 0){
                System.out.printf("Estoque de brinquedos zerado");
            }
            for (int i=0; i<n; i++) {
                System.out.printf("Posição %d- %s\n", i, brinquedos.get(i));
            }
        }
        else if(cat == "roupas"){
            int n = roupas.size();
            if (n == 0){
                System.out.printf("Estoque de roupas zerado");
            }
            for (int i=0; i<n; i++) {
                System.out.printf("Posição %d- %s\n", i, roupas.get(i));
            }
        }
        else if(cat == "comidas"){
            int n = comidas.size();
            if (n == 0){
                System.out.printf("Estoque de comidas zerado");
            }
            for (int i=0; i<n; i++) {
                System.out.printf("Posição %d- %s\n", i, comidas.get(i));
            }
        }
        else{
            System.out.printf("Categoria não encontrada");
        }
    }
}