//
// recvosc.pde - How to receive OSC packet in processing
//
// reference:
//     http://www.sojamo.de/libraries/oscP5/
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

void setup() {
  // setup oscP5
  oscP5 = new OscP5(this, 7777);
}

void info(String str) {
  println("INFO:" + millis() + ":" + str);
}

void err(String str) {
  println("ERR:" + millis() + ":" + str);
}
  
void oscEvent(OscMessage msg) {
  String addr = msg.addrPattern();
  
  if ("/test".equals(addr) == false) {
    err("invalid address...addr=" + addr);
    return;
  }
  
  String typetag = msg.typetag(); // "ifs"->int,float,string
  
  if ("ifs".equals(typetag) == false) {
    err("invalid message format...typetag=" + typetag);
    return;
  }
  
  int    val_i = msg.get(0).intValue();
  float  val_f = msg.get(1).floatValue();
  String val_s = msg.get(2).stringValue();

  info("oscEvent(): " 
    + "addr=" + addr + ", "
    + "typetag=" + typetag + ", "
    + "val_i=" + val_i + ", "
    + "val_f=" + val_f + ", "
    + "val_s=" + val_s
    );
}
