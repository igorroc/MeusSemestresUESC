import java.lang.Math;

public class Triangulo {
        private float base;
        private float altura;
        
        public Triangulo(float base, float altura){
            this.base = base;
            this.altura = altura;
        }
        
        public float calcularArea() {
                return base*altura/2;
        }

        public float calcularPerimetro() {
                float ladoTemp =(float)Math.sqrt((Math.pow(base,2))+(Math.pow(altura,2)));
                System.out.println(ladoTemp);
                float perimetro = ladoTemp+altura+base;
                return perimetro;
        }

        public void imprimir() {
                System.out.println("A Altura é " + altura + ", a base é " + base);
        }

        public void setBaseEAltura(float b, float a) {
                base = b;
                altura = a;
        }

}