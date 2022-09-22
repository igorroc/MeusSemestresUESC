import java.util.Map;
import java.util.HashMap;


public class Mercado {
    private HashMap<String, Double> estoque;
    private Funcionario func;

    public Mercado() {
        estoque = new HashMap<String, Double>();
        inicializaEstoque();
    }

    public Funcionario iniciaFuncionario(String login){
        func = new Funcionario(login, this);
        return func;
    }

    public Funcionario getFuncionario(){
        return func;
    }

    public HashMap<String, Double> getEstoque(){
        return estoque;
    }

    public double totalDaCesta(Cliente cliente) {
        double totalDaCesta = 0;
        for(Map.Entry<String, Integer> item: cliente.cestaDeProdutos.entrySet()) {
            double precoTotal = 0;
            double precoDoItem = estoque.get(item.getKey());

            precoTotal = precoDoItem * item.getValue();

            totalDaCesta += precoTotal;
        }
        return totalDaCesta;
    }

    public void inicializaEstoque() {
        estoque.put("batata", 3.5);
        estoque.put("biscoito", 2.0);
        estoque.put("beterraba", 4.0);
        estoque.put("banana", 5.0);
        estoque.put("detergente", 3.5);
    }
}