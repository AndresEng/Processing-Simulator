float[] IK(int[] dimensiones, float[] posiciones)
{
  // Parametros auxiliares para el calculo de la cinamatica inversa
  float D,F;
  
  // Dimensiones de los eslabones del robot
  int L_B = dimensiones[0];
  int L_H = dimensiones[1];
  int L_B_S = dimensiones[2];
  int L_B_I = dimensiones[3];
  int L_E=dimensiones[4];
  
  // Posiciones del objeto a mover adaptando el origen de referencia 
  // dependiendo de las logitudes de los eslabones del robot
  float X =posiciones[0];
  float Y =-posiciones[1]-L_B-L_H;
  float Z =posiciones[2];
  float XX = sqrt(Z*Z+X*X)-L_E;
  
  // Vector con los angulos de las articulaciones del robot  
  float [] angulos={0,0,0,0};
  
  // Calculo de la cinematica inversa del robot
  
  //1º Se calcula la orientacion de la base del robot
  gamma = atan2(X, Z);
  
  // 2º Se calculan los angulos del hombro y codo del manipulador
  D=(XX*XX+Y*Y-L_B_I*L_B_I-L_B_S*L_B_S)/(2*L_B_S*L_B_S);
  F=sqrt(1-D*D);
  // Los angulos seran negativos porque el eje Y esta invertido
  beta=-acos(D);
  alpha=-atan2(XX,Y)+atan2((L_B_I*F),(L_B_S+L_B_I*D));
  
  // 3º Se calcula el angulo de la muneca para que se quede horizontal
  tetha=(PI/2-alpha-beta)+PI;

  // Se llena el vector de angulos y se pasa a la aplicacion principal
  angulos[0]=gamma;
  angulos[1]=alpha;
  angulos[2]=beta;
  angulos[3]=tetha;
  return angulos;

}
