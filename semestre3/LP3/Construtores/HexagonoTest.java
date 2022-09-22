import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;


public class HexagonoTest
{
    private float lados[] = {1,2,3,4,5};
    private float resultadosArea[] = {2,10,23,41,64};
    private float resultadosPerimetro[] ={6,12,18,24,30};
    
    public HexagonoTest()
    {
    }

    @Before
    public void setUp()
    {
    }

    
    @Test
    public void testCalcularArea() {
        
        for(int i = 0; i < 5; i++) {
            Hexagono r1 = new Hexagono(lados[i]);
            float resultado = r1.calcularArea();
        
            assertEquals(resultado, resultadosArea[i], 1e-0);
        }
    }
    
    @Test
    public void testCalcularPerimetro() {
        
        for(int i = 0; i < 5; i++) {
            Hexagono r1 = new Hexagono(lados[i]);
            float resultado = r1.calcularPerimetro();
        
            assertEquals(resultado, resultadosPerimetro[i], 1e-0);
        }
    }
}
