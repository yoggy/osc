//
// sendosc.pde - How to send OSC packet in processing
//
// reference:
//     www.sojamo.de/libraries/oscP5/
//
// github :
//     https://github.com/yoggy/osc
//
// license :
//     Copyright(c) 2019 yoggy <yoggy0@gmail.com>
//     Released under the MIT license
//     http://opensource.org/licenses/mit-license.php;
//
import oscP5.*;
import netP5.*;

OscP5 oscP5;

long st = millis();

void setup() {
  size(200, 200);
  
  // setup oscP5
  oscP5 = new OscP5(this, 12345);
}

void draw() {
  background(#ffffff);

  long diff = millis() - st;
  if (diff >= 1000) {
    sendOSCPacket();
    st = millis();
  }
}

void keyPressed() {
  if (keyCode == 0x20) sendOSCPacket();
}

void info(String str) {
  println("INFO:" + millis() + ":" + str);
}

void sendOSCPacket() {
  info("sendOSCPacket()");
  
  // create OSC message
  OscMessage msg = new OscMessage("/test");
  msg.add(1234);       // integer
  msg.add(123.456f);   // float
  msg.add("test1234"); // string

  NetAddress remote_addr = new NetAddress("127.0.0.1", 7777);

  // send OSC packet
  oscP5.send(msg, remote_addr);
}
