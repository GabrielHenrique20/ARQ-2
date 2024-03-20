int entrada1 = 0;
int entrada2 = 0;
int entrada3 = 0;

// LEDs
int led13 = 13;
int led12 = 12;
int led11 = 11;
int led10 = 10;

int saida;

void setup(){
  Serial.begin(9600);
  pinMode(led13,OUTPUT);
  pinMode(led12,OUTPUT);
  pinMode(led11,OUTPUT);
  pinMode(led10,OUTPUT);
}

// portas logicas
void loop(){
  if(Serial.available()> 0){
    entrada1 = Serial.parseInt();
    entrada2 = Serial.parseInt();
    entrada3 = Serial.parseInt();
    
    // Digitar entrada1
    Serial.print("entrada1= ");
    Serial.print(entrada1);
    if(entrada1 == 1){
      digitalWrite(led13,HIGH);
    }
    Serial.println();
    
    // Digitar entrada2
    Serial.print("entrada2= ");
    Serial.print(entrada2);
    if(entrada2 == 1){
      digitalWrite(led12,HIGH);
    }
    Serial.println();
    
    // Digitar entrada3
    Serial.print("entrada3= ");
    Serial.print(entrada3);
    Serial.println();
    
    // AND
    if(entrada3 == 0){
      saida = portaand(entrada1,entrada2);
      Serial.print("and = ");
      Serial.print(saida);
      if(saida == 1){
        digitalWrite(led11,HIGH);
      }
      Serial.println();
    }
    
    // OR
    if(entrada3 == 1){
      saida = portaor(entrada1,entrada2);
      Serial.print("or= ");
      Serial.print(saida);
      if(saida == 1){
        digitalWrite(led11,HIGH);
      }
      Serial.println();
    }
    
    // NOT
    if(entrada3 == 2){
      saida = portanot(entrada1);
      Serial.print("not= ");
      Serial.print(saida);
      if(saida == 1){
        digitalWrite(led11,HIGH);
      }
      Serial.println();
    }
    
    // SOMA
    if(entrada3 == 3){
      saida = portasoma(entrada1,entrada2);
      Serial.print("soma= ");
      Serial.print(saida);
      if(saida == 1){
        digitalWrite(led11,HIGH);
      }
      Serial.println();
    }
    
    // Desligar LEDs
    delay(9000);
    digitalWrite(led13,LOW);
    digitalWrite(led12,LOW);
    digitalWrite(led11,LOW);
    digitalWrite(led10,LOW);
    
  } // END IF
} // END VOID LOOP

// Funcoes

int portaor(int a, int b){
  return(a|b);
}

int portaand(int a, int b){
  return(a&b);
}

int portanot(int a){
  return(~a + 2);
}

int portasoma(int a, int b){
  return (a + b);
}

int mostra(int a){
  if(a == 1){
    digitalWrite(led13,1);
  }
  else{
    digitalWrite(led13,0);
  }
}

// Fim do programa    