public class Retangulo
{
    private float base;
    private float altura;
    
    public Retangulo(){
        base = 0;
        altura = 0;
    }
    
    public void setBaseEAltura(float a, float b)
    {
        base = a;
        altura = b;
    }

    public float area()
    {
        return base * altura;
    }
}
