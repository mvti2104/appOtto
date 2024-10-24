//Incluir a biblioteca SoftwareSerial
#include "SoftwareSerial.h"

//Crie um novo serial de software
SoftwareSerial bluetooth(11, 12); //TX, RX (Bluetooth)

void setup() {
  //Inicializar o serial do hardware
  Serial.begin(9600);
  Serial.println(F("Type the AT commands:"));

  //Inicializar o serial do software
  bluetooth.begin(38400);
}

void loop() {
  //Verifique se recebeu um byte do hardware serial
  if (Serial.available()) {
    char r = Serial.read(); //Leia e guarde o byte
    bluetooth.print(r);  //Enviar o byte para bluetooth por serial de software
    Serial.print(r);  //Echo
  }
  //Verifique se recebeu um byte do bluetooth pelo serial do software
  if (bluetooth.available()) {
    char r = bluetooth.read(); //Leia e guarde o byte
    Serial.print(r); //Imprima o byte para serial de hardware
  }
}