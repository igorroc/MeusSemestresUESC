import java.io.BufferedWriter;
import java.io.File;
// import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;

public class EscritorDeArquivo {

    public static void escrever(String nomeDoArquivo) {
        File arquivo = new File(nomeDoArquivo);

        try {
            BufferedWriter escritor = new BufferedWriter(new FileWriter(arquivo));
            String dados = "Terceira linha\nQuarta linha";

            escritor.write(dados);
            escritor.close();
        } catch (IOException e) {
            System.out.println(e);
        }
        
    }
    public static void main(String[] args) throws Exception {
        escrever("teste.txt");
    }
}
