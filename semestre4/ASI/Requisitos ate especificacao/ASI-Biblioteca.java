public class Livro{
    private int id;
    private Categoria categoria;
    private String autor;
    private String editora
    private String status;
    
    public boolean verifica(int id){
        // return true/false;
    }
}

public class Emprestimo{
    private int id;
    private Date dataDeInicio;
    private Date dataDeDevolucao;
    private Double valorMulta;
    private int idDoLivro;
    private int idDoUsuario;
    private int idDaBibliotecaria;
    
    public void criarEmprestimo(int idDoLivro, int idDoUsuario, int idDaBibliotecaria, double valorMulta, Date dataDeInicio, Date dataDeDevolucao){

    }

    public void finalizarEmprestimo(int id){

    }
}
                                           
// ! Livro
// ? id
// ? categoria
// ? autor
// ? editora
// ? status
// * verificar()

                                           
// ! Empréstimo
// ? id
// ? dataDeInicio
// ? dataDeDevolucao
// ? valorMulta
// ? idDoLivro
// ? idDoUsuario
// ? idDaBibliotecaria
// * criarEmprestimo()
// * finalizarEmprestimo()
                                          