// Definimos las variables que contienen las geometrias
PShape base;      // Geometria de la base del robot
PShape hombro;    // Geometria del hombro del robot
PShape brazo_sup; // Geometria del segmento 1 del robot
PShape brazo_inf; // Geometria del segmento 2 del robot
PShape efector;   // Geometria del efector final

// Definimos variables para rotar la camara
float rotX, rotY;

// Definimos los angulos de cada articulacion del robot
float gamma; // Angulo de rotacion de la base
float alpha; // Angulo de rotacion del hombro
float beta;  // Angulo de rotacion del codo
float tetha; // Angulo de rotacion de la muneca
float [] angulos;

// Definimos las logitudes de los eslabones del robot 
int L_base = 67;
int L_hombro = 75;
int L_brazo_sup = 125;
int L_brazo_inf = 125;
int L_efector = 50;
int []dimensiones={L_base,L_hombro,L_brazo_sup,L_brazo_inf,L_efector};

// Definicion de la posicion espacial que queremos que adopte el objeto a mover
float[]origen={150,-200,150};
float[]posiciones={0,0,0};

// Definimos las variables para controlar la evolucion temporal de la simulacion
float t_ant=0;   // Instante de tiempo anterior en segundos
float t=0;       // Tiempo global en segundos

void setup()
{
    // Inicializamos la ventana donde representar la simulacion
    size(1200, 800, OPENGL);
    
    // Cargamos las geometrias a sus corerspondientes variables
    base = loadShape("Base.obj");
    hombro = loadShape("Hombro.obj");
    brazo_sup = loadShape("Brazo_Superior.obj");
    brazo_inf = loadShape("Brazo_Inferior.obj");
    efector = loadShape("Efector_Final.obj");
    
    // Utilizamos el comando "disableStyle" en estos segmentos para poder cambiarles el color
    hombro.disableStyle();
    brazo_sup.disableStyle();
    brazo_inf.disableStyle(); 

}

void draw()
{ 
  
   // Comandos para mover la camara al arrastrar el raton
   translate(width/2,height/2);
   rotateX(rotX);
   rotateY(-rotY);
   
   // Redibujamos la escena
   background(32);
   smooth();
   lights(); 
   directionalLight(51, 102, 126, -1, 0, 0);
   
   // A cada nuevo cuadro variamos la posicion deseada del efector final 
   posiciones=moveBall(origen);
   pushMatrix(); // Guarda la matriz de coordenadas en un momento determinado
   translate(posiciones[0], posiciones[1], posiciones[2]);
   noStroke();   // Elimina el contorno de la esfera para no ver sus poligonos
   fill (#cb08ff);
   sphere (20);
   popMatrix();  // Resetea la matriz de cordenadas para que el robot sea independiente de la esfera

    
   // Calculamos los angulos del robot con las ecuaciones de cinematica inversa 
   angulos=IK(dimensiones,posiciones);
   gamma = angulos[0];
   alpha = angulos[1];
   beta  = angulos[2];
   tetha = angulos[3];

   // Llenamos la escena con los eslabones del robot con las posiciones y los angulos calculados
   fill(#ffb608);  
   translate(0,0,0);   
   shape(base);
     
   translate(0, -L_base, 0);
   rotateY(gamma);
   shape(hombro);
      
   translate(0, -L_hombro, 0);
   rotateX(alpha);
   shape(brazo_sup);

   translate(0, -L_brazo_sup, 0);
   rotateX(beta);
   shape(brazo_inf);
      
   translate(0, -L_brazo_inf, 0);
   rotateX(tetha);
   shape(efector);
}

// Rutina para rotar la camara en funcion de lo que movamos el raton
void mouseDragged()
{
    rotY -= (mouseX - pmouseX) * 0.01;
    rotX -= (mouseY - pmouseY) * 0.01;
}

// Rutina para saber en que instante de tiempo nos encontramos
void setTime()
{
    // Si es la primera vez que consultamos el tiempo (inicializacion) estamos en t=0
    if (t_ant==0)
    {
      t=0;
      t_ant=(float)millis()/1000;
    }
    else
    {
      t=t+ (float)millis()/1000 - t_ant;
      t_ant=(float)millis()/1000;
    }
}

// Rutina para mover la pelota
float[] moveBall(float[]origen)
{
  // Consultamos que tiempo es ahora
  setTime();
  
  // Hacemos que la posicion del objeto a mover oscile una determinada 
  // cantidad respecto a las coordenadas de origen que hemos definido en las variables globales
  posiciones[0]=sin(t*PI)*20 + origen[0];
  posiciones[1]=sin(t*PI+PI/2)*40 + origen[1];
  posiciones[2]=sin(t*PI+PI/2)*30 + origen[2];
  
  return posiciones;
}
