/*
ARDUINO 01
SEMÁFORO
*/

// define a variavel para o LED azul
int led10 = 10; // Led azul

void setup(){
  // configura os pinos como saidas digitais
  pinMode(led10,OUTPUT);
}

// O led Azul deverá sempre piscar de um em um segundo.
void loop(){
  digitalWrite(led10,HIGH);
  delay(1000);
  digitalWrite(led10,LOW);
  delay(500);
  
}

  