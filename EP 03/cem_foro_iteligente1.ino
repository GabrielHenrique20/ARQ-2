/*
ARDUINO 02
SEMÁFORO
*/

int led11 = 11; // LED VERDE
int led12 = 12; // LED AMARELO
int led13 = 13; // LED VERMELHO

void setup(){
  // configura os pinos como saidas digitais
  pinMode(led11,OUTPUT);
  pinMode(led12,OUTPUT);
  pinMode(led13,OUTPUT);
}

void loop(){
  
  // Vermelho fica 3 segundos piscando
  digitalWrite(led13, HIGH); // nivel logico alto
  delay(3500);
  digitalWrite(led13,LOW); // nivel logico baixo
  delay(1000);
  
  // Amarelo fica 2 segundos piscando
  digitalWrite(led12,HIGH); // nivel logico alto
  delay(2400);
  digitalWrite(led12,LOW); // nivel logico baixo
  delay(1000);
  
  // Verde fica 4 segundos piscando
  digitalWrite(led11,HIGH); // nivel logico alto
  delay(4500);
  digitalWrite(led11,LOW); // nivel logico baixo
  delay(1000);
}


	