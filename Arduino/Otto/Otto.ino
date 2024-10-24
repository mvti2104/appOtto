#include <SoftwareSerial.h>
// #include <Arduino.h>
#include <EEPROM.h>
#include <Otto.h>

Otto Otto;

#define LEFTLEG 2
#define RIGHTLEG 3
#define LEFTFOOT 4
#define RIGHTFOOT 5
#define LEFTARM 6
#define RIGHTARM 7
#define BUZZER 13

int positions[4] = {90, 90, 90, 90};
int8_t trims[4] = {0, 0, 0, 0};

String tipo; 
int mov, speed;
int height;
unsigned long previousMillis=0;

SoftwareSerial BTSerial(11, 12); // RX ligada TX do HC-05, TX ligada na RX do HC-05

String readBT="";

void set_trims() {
  Otto.setTrims(trims[0], trims[1], trims[2], trims[3]);
  Otto._moveServos(10, positions);
}

// calibração
void read_char(int cmd) {
  
  if (cmd == 3){
    trims[1]++;
    set_trims();
    Serial.println(trims[1], DEC);
  }else

  if (cmd == 4){
    trims[1]--;
    set_trims();
    Serial.println(trims[1], DEC);
  }else

  if (cmd == 1){
    trims[0]++;
    set_trims();
    Serial.println(trims[0], DEC);
  }else

  if (cmd == 2){
    trims[0]--;
    set_trims();
    Serial.println(trims[0], DEC);
  }else

  if (cmd == 6){
    trims[3]++;
    set_trims();
    Serial.println(trims[3], DEC);
  }else

  if (cmd == 5){
      trims[3]--;
      set_trims();
      Serial.println(trims[3], DEC);
  }else

  if (cmd == 8){
    trims[2]++;
    set_trims();
    Serial.println(trims[2], DEC);
  }else

  if (cmd == 7){
    trims[2]--;
    set_trims();
    Serial.println(trims[2], DEC);
  }else

  if (cmd == 13){
    for (int i = 0; i <= 3; i++) {
        EEPROM.write(i, trims[i]);
    }
    delay(500);
    Otto.sing(S_superHappy);
    Otto.sing(OttoHappy);
    Otto.sing(S_happy_short);
  }
}

// movimentos manuais (frente, trás, esquera, direita)
void manualMov(int cmd){

  if (cmd == 1){
    Otto.walk(2,speed,1);
  }else

  if (cmd == 2){
    Otto.walk(2,speed,-1);
  }else

  if(cmd == 3){
    Otto.turn(4,speed,1);
  }else

  if (cmd == 4){
    Otto.turn(4,speed,-1);
  }

  Otto.home();
}

// movimentos + posição Home
void moves(int cmd){

  if (mov == 1) {
    Otto.init(LEFTLEG, RIGHTLEG, LEFTFOOT, RIGHTFOOT, true, BUZZER);
    Otto.home();
    Otto.sing(S_confused);
  }

  // passos, tempo, direção

  if (cmd == 2){
    Otto.bend(2,speed,-1);
  }else

  if (cmd == 3){
    Otto.bend(2,speed,1);
  }else

  if (cmd == 4){
    Otto.shakeLeg(1,speed + 1200,-1);
  }else

  if (cmd == 5){
    Otto.shakeLeg(1,speed + 1200,1);
  }else 

  if (cmd == 6){
    Otto.moonwalker(3,speed,height, 1);
  }else   

  if (cmd == 7){
    Otto.moonwalker(3,speed,height, -1);
  }else     

  if (cmd == 8){
    Otto.crusaito(2,speed,height, 1);
  }else

  if (cmd == 9){
    Otto.crusaito(2,speed,height, -1);
  }else 

  if (cmd == 10){
    Otto.flapping(2, speed, 20,1);
  }else 

  if (cmd == 11){
    Otto.flapping(2, speed, 20,-1);
  }else

  if (cmd == 12){
    Otto.swing(2, speed, 20);
  }else

  if (cmd == 13){
    Otto.tiptoeSwing(2, speed, 20);
  }else

  if (cmd == 14){
    Otto.jitter(2, speed, 20);
  }else

  if (cmd == 15){
    Otto.updown(2, speed, 20);
  }else        

  if (cmd == 16){
    Otto.ascendingTurn(2, speed, 50);
  } 
}
 
 // gestos
void gestures(int cmd){

  if (cmd == 1){
   Otto.playGesture(OttoHappy);
  }else

  if (cmd == 2){
    Otto.playGesture(OttoSuperHappy);
  }else

  if (cmd == 3){
    Otto.playGesture(OttoSad);
  }else

  if (cmd == 4){
    Otto.playGesture(OttoVictory);
  }else

  if (cmd == 5){
    Otto.playGesture(OttoAngry);
  }else  

  if (cmd == 6){
    Otto.playGesture(OttoSleeping);
  }else

  if (cmd == 7){
    Otto.playGesture(OttoFretful);
  }else

  if (cmd == 8){
    Otto.playGesture(OttoLove);
  }else

  if (cmd == 9){
    Otto.playGesture(OttoConfused);
  }else

  if (cmd == 10){
    Otto.playGesture(OttoFart);
  }else

  if (cmd == 11){
    Otto.playGesture(OttoWave);
  }else

  if (cmd == 12){
    Otto.playGesture(OttoMagic);
  }
  Otto.home();
}

// sons
void sounds(int cmd){

  if (cmd == 1){
    Otto.sing(S_connection);
  }else

  if (cmd == 2){
    Otto.sing(S_buttonPushed);
  }else  

  if (cmd == 3){
    Otto.sing(S_mode1);
  }else

  if (cmd == 4){
    Otto.sing(S_mode2);
  }else  

  if (cmd == 5){
    Otto.sing(S_mode3);
  }else

  if (cmd == 6){
    Otto.sing(S_surprise);
  }else  

  if (cmd == 7){
    Otto.sing(S_OhOoh);
  }else

  if (cmd == 8){
    Otto.sing(S_OhOoh2);
  }else  

  if (cmd == 9){
    Otto.sing(S_cuddly);
  }else

  if (cmd == 10){
    Otto.sing(S_sleeping);
  }else  

  if (cmd == 11){
    Otto.sing(S_happy);
  }else

  if (cmd == 12){
    Otto.sing(S_superHappy);
  }else  

  if (cmd == 13){
    Otto.sing(S_happy_short);
  }else

  if (cmd == 14){
    Otto.sing(S_sad);
  }else  

  if (cmd == 15){
    Otto.sing(S_confused);
  }else

  if (cmd == 16){
    Otto.sing(S_fart1);
  }  
}

// ===========================================================SETUP============================================================
void setup() {

   Otto.init(LEFTLEG, RIGHTLEG, LEFTFOOT, RIGHTFOOT, true, BUZZER);

  // Inicia comunicação serial com o PC
  Serial.begin(9600);

  // Inicia comunicação serial com o módulo Bluetooth
  BTSerial.begin(9600);
  Serial.println("Pronto para receber dados via Bluetooth");

  Otto.home();

}

// ============================================================LOOP============================================================
void loop() {

    //A cada 60 segundos neste modo, o Otto adormece
  if (millis()-previousMillis>=60000){
      Otto.sing(S_sleeping); //ZZzzzzz...
      previousMillis=millis();         
  }

  if (BTSerial.available()) {
    // Lê os dados do Bluetooth
    while (BTSerial.available()) {
        char receivedChar = (char)BTSerial.read();
        readBT += receivedChar;
    }

    tipo   = readBT.substring(0,1);
    mov    = readBT.substring(1,3).toInt();
    speed  = readBT.substring(4,8).toInt();
    height = readBT.substring(9, 11).toInt();
   
    Serial.print(mov);
    Serial.print(" - ");
    Serial.print(speed);
    Serial.print(" - ");
    Serial.println(height);
    // Serial.println("------------");

    if (tipo == "m"){
      moves(mov);
      moves(1);
    }

    if (tipo == "g"){
      gestures(mov);
    }

    if (tipo == "s"){
      sounds(mov);
    }    

    if (tipo == "a"){
      manualMov(mov);
    } 

    if (tipo == "c"){
      read_char(mov);
    }

    readBT = "";
             
  }

  
  delay(100); // Aguarda um pouco antes de verificar novamente

  // Esvazia o buffer Bluetooth
  // while (BTSerial.available()) {
  //     BTSerial.read();  // Lê e descarta os dados
  // }
}
