import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;


public class TrianguloTest
{
    private float bases[] = {2, 3, 5, 6, 7};
    private float alturas[] = {10, 2, 4, 1, 6};
    private float resultadosArea[] = {10, 3, 10, 3, 21};
    private float resultadosPerimetro[] ={22.2f, 8.6f, 15.4f, 13.08f, 22.22f};
    
    public TrianguloTest()
    {
    }

    @Before
    public void setUp()
    {
    }

    
    @Test
    public void testCalcularArea() {
        
        for(int i = 0; i < 5; i++) {
            Triangulo r1 = new Triangulo(bases[i], alturas[i]);
            float resultado = r1.calcularArea();
        
            assertEquals(resultado, resultadosArea[i], 1e-0);
        }
    }
    
    @Test
    public void testCalcularPerimetro() {
        
        for(int i = 0; i < 5; i++) {
            Triangulo r1 = new Triangulo(bases[i], alturas[i]);
            float resultado = r1.calcularPerimetro();
        
            assertEquals(resultado, resultadosPerimetro[i], 1e-0);
        }
    }
}
