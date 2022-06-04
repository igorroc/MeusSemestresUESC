import java.lang.Math;

public class Hexagono {
        private float lado;
        
        public Hexagono(float l){
            this.lado = l;
        }
        
        public float calcularArea() {
                float area = (float)((3*Math.pow(lado,2)*Math.sqrt(3))/2);
                return area;
        }

        public float calcularPerimetro() {
                return 6*lado;
        }

        public void imprimir() {
                System.out.println("O Lado é " + lado);
        }

        public void setLado(float l) {
                lado = l;
        }

}