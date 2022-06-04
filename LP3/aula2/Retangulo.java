public class Retangulo {
        private float base;
        private float altura;

        public float calcularArea() {
                float area = base*altura;
                return area;
        }

        public float calcularPerimetro() {
                float perimetro = 2*base + 2*altura;
                return perimetro;
        }

        public void imprimir() {
                System.out.println("A Altura é " + base);
        }

        public void setBaseEAltura(float b, float a) {
                base = b;
                altura = a;
        }

}