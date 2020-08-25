/*
    Ordenamiento QuickSort
    
    Ejemplo de ordenamiento recursivo, poco eficiente, 
    pero ilustrativo de la recursividad.
    
    Miguel Angel Norzagaray Cosío
    UABCS/DSC
*/

float[] A;
int Ancho;

Thread HiloQS = new Thread()
{
  public void run(){
    QuickSort(A, 0, A.length - 1);
  }
};

void setup() 
{
    size(800, 400);
    Ancho = 6;
    A = new float[width/Ancho];
    for ( int i = 0; i<A.length; i++ )
        A[i] = random(0, height);
    stroke(0,200,0);
    strokeWeight(Ancho);
    HiloQS.start();
}

void draw() 
{
    background(0);
    stroke(0,255,0);
    for (int i = 0; i < A.length; i++)
        line(Ancho*i, height, Ancho*i, height - A[i]);
        
    if ( !HiloQS.isAlive() ) {
        println("Hecho");
        noLoop();
    }
}

void QuickSort(float[] arr, int Ini, int Fin) 
{
    if (Ini < Fin) {
        int Pivote = partition(arr, Ini, Fin);
        QuickSort(arr, Ini, Pivote - 1);
        QuickSort(arr, Pivote + 1, Fin);
    }
}

int partition(float[] A, int Ini, int Fin) 
{
    int Pivote = Ini;
    
    for (int i =Ini; i < Fin; i++) 
        if ( A[i] < A[Fin] ) 
            swap(A, i, Pivote++);
    swap(A, Pivote, Fin);
    
    return Pivote;
}

void swap(float[] A, int a, int b) 
{
  float t = A[a];
  A[a] = A[b];
  A[b] = t;
  try {
      Thread.sleep(10);
  } catch(Exception e) {
  };
}

/* Fin de archivo */
