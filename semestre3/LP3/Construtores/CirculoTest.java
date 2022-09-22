import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;


public class CirculoTest
{
    private float raios[] = {1,2,3,4,5};
    private float resultadosArea[] = {3,12,28,50,78};
    private float resultadosPerimetro[] ={6,12,18,25,30};
    
    public CirculoTest()
    {
    }

    @Before
    public void setUp()
    {
    }
    
    @Test
    public void testCalcularArea() {
        
        for(int i = 0; i < 5; i++) {
            Circulo r1 = new Circulo(raios[i]);
            float resultado = r1.calcularArea();
        
            assertEquals(resultado, resultadosArea[i], 1e-0);
        }
    }
    
    @Test
    public void testCalcularPerimetro() {
        
        for(int i = 0; i < 5; i++) {
            Circulo r1 = new Circulo(raios[i]);
            float resultado = r1.calcularPerimetro();
        
            assertEquals(resultado, resultadosPerimetro[i], 1e-0);
        }
    }
}
