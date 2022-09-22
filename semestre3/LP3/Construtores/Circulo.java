import java.lang.Math;

public class Circulo {
        private float raio;
        
        public Circulo(float r){
            this.raio = r;
        }
        
        public float calcularArea() {
                float area = (float)Math.PI*(float)Math.pow(raio,2);
                return area;
        }

        public float calcularPerimetro() {
                return 2*(float)Math.PI*raio;
        }

        public void imprimir() {
                System.out.println("O Raio é " + raio);
        }

        public void setRaio(float r) {
                raio = r;
        }

}