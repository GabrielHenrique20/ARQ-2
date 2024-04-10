// C++ code

String memoria[100]; // vetor principal
String valorX;
String valorY;
String valorW;
String instrucao;
int pc = 4;
int tam = 0;
int seta = 0;

void setup() {
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(10, OUTPUT);
  
  memoria[0] = pc;
  memoria[1] += 0;
  memoria[2] += 0;
  memoria[3] += 0;
  
  preenchevet();
  for (int i = 0; i < 9 + seta; i++)
    Serial.print(" ");

  Serial.println("v");
  seta += 4;

  for (int i = 0; i < tam + 4; i++) {
    Serial.print(memoria[i]);
    Serial.print("|");
  }
  Serial.println("");
  delay(6000);
}
void preenchevet() {
  while (Serial.available() <= 0) {
  }
  String linha = Serial.readString();
  int posicaoAnterior = 0;
  int posicaoAtual = 0; // Inicialize posicaoAtual corretamente
  while (true) {
    posicaoAtual = linha.indexOf(' ', posicaoAnterior);

    // Verifica se não encontrou mais espaços
    if (posicaoAtual == -1) {
      posicaoAtual =
          linha.length(); // Defina posicaoAtual para o final da linha
    }

    String comando = linha.substring(posicaoAnterior, posicaoAtual);
    memoria[pc + tam] = comando;
    tam++;

    // Verifica se chegou ao final da linha
    if (posicaoAtual == linha.length()) {
      break;
    }

    posicaoAnterior = posicaoAtual + 1;
  }
}

void loop() {

  if (pc == tam + 4) {
    Serial.println("FIM");
    pc++;
    return;
  } else if (pc > tam + 4)
    return;

  instrucao = memoria[pc];

  // transforma os valores de X e Y em binário para realizar as operações
  valorX = toBinary(instrucao[0]);
  valorY = toBinary(instrucao[1]);

  // aloca a instrução no vetor
  memoria[2] = instrucao[0];
  memoria[3] = instrucao[1];
  // Serial.print("X: ");
  // Serial.println(valorX);
  // Serial.print("Y: ");
  // Serial.println(valorY);

  // faz com que W receba o valor da instrução que foi dada
  valorW = analisaS(valorX, valorY, instrucao[2]);

  // chama a função que vai acender os leds do resultado da operação
  acendeLed(valorW);

  // coloca o valor Hexadecimal de W no lugar correto do vetor
  memoria[1] = toHexa(valorW);
  // Serial.print("W: ");
  // Serial.println(valorW);
  // Serial.print("pc: ");
  // Serial.println(memoria[0]);

  // incrementa a posição em +1 para próxima instrução
  pc++;

  // coloca o novo valor direcionado para a próxima intrução
  memoria[0] = pc;
  // Serial.print("memoria completo: ");

  for (int i = 0; i < 9 + seta; i++)
    Serial.print(" ");
  Serial.println("v");
  seta += 4;

  for (int i = 0; i < tam + 4; i++) { // Descobrir como printar o memoria todo
    Serial.print(memoria[i]);
    Serial.print("|");
  }
  Serial.println("");
  delay(6000);
}

String toHexa(String bin) {
  int decimalValue = 0;
  // Converter cada bit da string binária para decimal
  for (int i = 0; i < bin.length(); i++) {
    if (bin[i] == '1') {
      decimalValue = (decimalValue << 1) |
                     1; // Desloca o valor atual para a esquerda e adiciona 1
    } else if (bin[i] == '0') {
      decimalValue = decimalValue
                     << 1; // Apenas desloca o valor atual para a esquerda
    } else {
      return "";
    }
  }

  // Converter o valor decimal para hexadecimal
  char hexValue[2]; // Alocar espaço para um caracteres hexadecimais (mais um
                    // para o \n)
  sprintf(hexValue, "%X",
          decimalValue); // Converte o valor decimal para hexadecimal

  String resp = "";
  resp += hexValue[0];

  return resp;
}

String toBinary(char hex) {
  String binary = "";
  // Tabela de conversão hexadecimal para binário
  String hexChars = "0123456789ABCDEF";
  String binaryChars[16] = {"0000", "0001", "0010", "0011", "0100", "0101",
                            "0110", "0111", "1000", "1001", "1010", "1011",
                            "1100", "1101", "1110", "1111"};

  // Convertendo cada caractere hexadecimal para binário

  int index = hexChars.indexOf(hex);
  binary += binaryChars[index];

  return binary;
}

String portaAnd(String a, String b) {
  String s = "";
  for (int i = 0; i < 4; i++) {
    if (a[i] == b[i]) {
      s += a[i];
    } else {
      s += 0;
    }
  }
  return s;
}

String portaOr(String a, String b) {
  String s = "";
  for (int i = 0; i < 4; i++) {
    if (a[i] == '1' || b[i] == '1') {
      s += 1;
    } else {
      s += 0;
    }
  }
  return s;
}

String portaNot(String a) {
  String s = "";
  for (int i = 0; i < 4; i++) {
    if (a[i] == '1') {
      s += 0;
    } else {
      s += 1;
    }
  }
  return s;
}

String portaXor(String a, String b) {
  String s = "";
  for (int i = 0; i < 4; i++) {
    if (a[i] == b[i]) {
      s += 0;
    } else {
      s += 1;
    }
  }
  return s;
}

String analisaS(String x, String y, char opcode) {
  String resp = "";

  if (opcode == '0') {
    // notB
    resp = portaNot(y);
  }

  if (opcode == '1') {
    // not(notA and B)
    resp = portaNot(portaAnd(portaNot(x), y));
  }

  if (opcode == '2') {
    // notA and B
    resp = portaAnd(portaNot(x), y);
  }

  if (opcode == '3') {
    // zero
    resp += 0000;
  }

  if (opcode == '4') {
    // not(A and B)
    resp = portaNot(portaAnd(x, y));
  }

  if (opcode == '5') {
    // not A
    resp = portaNot(x);
  }

  if (opcode == '6') {
    // A xor B
    resp = portaXor(x, y);
  }

  if (opcode == '7') {
    // A and notB
    resp = portaAnd(x, portaNot(y));
  }

  if (opcode == '8') {
    // notA ou notB
    resp = portaOr(portaNot(x), portaNot(y));
  }

  if (opcode == '9') {
    // notA xor notB
    resp = portaXor(portaNot(x), portaNot(y));
  }

  if (opcode == 'A') {
    // Bcopia
    resp = y;
  }

  if (opcode == 'B') {
    // A and B
    resp = portaAnd(x, y);
  }

  if (opcode == 'C') {
    // um
    resp += 1111;
  }

  if (opcode == 'D') {
    // A or notB
    resp = portaOr(x, portaNot(y));
  }

  if (opcode == 'E') {
    // A or B
    resp = portaOr(x, y);
  }

  if (opcode == 'F') {
    // Acopia
    resp = x;
  }

  return resp;
}

void acendeLed(String w) {
  int porta = 13;
  for (int i = 0; i < 4; i++) {
    if (w[i] == '1')
      digitalWrite(porta, 1);
    else
      digitalWrite(porta, 0);
    porta--;
  }
}