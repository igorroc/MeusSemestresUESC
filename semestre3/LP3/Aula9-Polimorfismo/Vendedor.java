
public class Vendedor extends Funcionario
{
    double comissao;
    
    public Vendedor(int matricula, String nome, double salarioBase, double comissao) {
        super(matricula, nome, salarioBase);
        this.comissao = comissao;
    }
    
    public double calcularSalario() {
        return this.getSalarioBase() + this.getSalarioBase()*this.comissao;
    }
}
