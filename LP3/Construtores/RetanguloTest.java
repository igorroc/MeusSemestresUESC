import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;


public class RetanguloTest
{
    private float bases[] = {2, 3, 5, 6, 7};
    private float alturas[] = {10, 2, 4, 1, 6};
    private float resultadosArea[] = {20, 6, 20, 6, 42}; 
    private float resultadosPerimetro[] = {24, 10, 18, 14, 26};
    
    public RetanguloTest()
    {
    }

    @Before
    public void setUp()
    {
    }

    
    @Test
    public void testCalcularArea() {
        
        for(int i = 0; i < 5; i++) {
            Retangulo r1 = new Retangulo(bases[i], alturas[i]);
            float resultado = r1.calcularArea();
        
            assertEquals(resultado, resultadosArea[i], 1e-15);
        }
    }
    
    @Test
    public void testCalcularPerimetro() {
        
        for(int i = 0; i < 5; i++) {
            Retangulo r1 = new Retangulo(bases[i], alturas[i]);
            float resultado = r1.calcularPerimetro();
        
            assertEquals(resultado, resultadosPerimetro[i], 1e-15);
        }
    }
}
