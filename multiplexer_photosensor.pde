import processing.serial.*; //import the Serial library so can read from arudino input via serial communication

int end = 10;    // the number 10 is ASCII for linefeed (end of serial.println), later we will look for this to break up individual messages
String serial;   // declare a new string called 'serial' 
Serial port;  // The serial port, this is a new instance of the Serial class (an Object)
int colorchange;

int light;

int x = 50;
int y = 50;

void setup() {
  background(0);
  size(displayWidth,displayHeight);
  
  //serial reading code
  port = new Serial(this, Serial.list()[8], 9600); // initializing the object by assigning a port and baud rate (must match that of Arduino)
  port.clear();  // function from serial library that throws out the first reading, in case we started reading in the middle of a string from Arduino
  serial = port.readStringUntil(end); // function that reads the string from serial port until a println and then assigns string to our string variable (called 'serial')
  serial = null; // initially, the string will be null (empty)
  

}

void draw() {
    ellipse(100,400,x,y );  //draw 8 circles that each represent a sensor
  ellipse(300,400,x,y );
  ellipse(500,400,x,y );
  ellipse(700,400,x,y );
  ellipse(900,400,x,y );
  ellipse(1100,400,x,y );
  ellipse(1300,400,x,y );
  ellipse(1500,400,x,y );
   
    //if there is data coming from the serial port read it/ store it
  while (port.available() > 0) { 
    serial = port.readStringUntil(end);
  }
  
  //if the string is not empty, do this
  if (serial != null) {  
        //capsense Input form Arduino, each value is seperated and split depending on the ','
        //and then saved in seperate cells of the array so we can access each 
        String[] nailSensorInput = split(serial, ','); 
       //can help to print these to console at this point to check it's working
       // println(nailSensorInput[]); 
        
        //convert the string inputs that are stored in the photoresistorInput array to ints so we can use them numerically
        int PRInt [];//Array that we will store the the photoresistor Input from Arduino after we have converted it to int
        PRInt = int(nailSensorInput);
        
        //print all values int values helps for recallobration
//       for(int i =0; i < PRInt.length; i++) {
//          println(PRInt[i]);
//       }

      //then if statements to this effect
         if(PRInt[0] <25 ) {
            println("pressure 1");
            background(0,0, 200);
            fill(40,40,50,90);
            ellipse(100,400,x + 100, y + 100 );
         }
          if (PRInt[1] < 50) {
            println("pressure 2");
            background(200,0, 0);
              fill(40,40,50,90);
            ellipse(300,400,x + 100,y + 100 );
         }
          if (PRInt[2] < 100) {
            println("pressure 3");
            background(0,200, 0);
            fill(40,40,50,90);
            ellipse(500,400,x + 100,y + 100 );
         }
            if (PRInt[3] < 120) {
           println("pressure 4");
           background(50,100, 200);
           fill(40,40,50,90);
           ellipse(700,400,x + 100, y + 100 );
         }
          if (PRInt[4] < 90) {
            println("pressure 5");
           background(100,0, 200);
            fill(40,40,50,90);
           ellipse(900,400,x + 100, y + 100 );
           
         }
            if (PRInt[5] < 80) {
            println("pressure 6");
            background(0,200, 200);
           fill(40,40,50,90);
           ellipse(1100,400,x + 100, y + 100 );
           
         }
          if (PRInt[6] < 500) {
           println("pressure 7");
           background(200,100,0);
           fill(40,40,50,90);
           ellipse(1300,400,x + 100, y + 100 );
         }
            if (PRInt[7] < 70) {
            println("pressure 8");
            background(50,10, 20);
            fill(40,40,50,90);
           ellipse(1500,400,x + 100, y + 100 );
         }

         
         
  ellipse(100,400,x,y );
  ellipse(300,400,x,y );
  ellipse(500,400,x,y );
  ellipse(700,400,x,y );
  ellipse(900,400,x,y );
  ellipse(1100,400,x,y );
  ellipse(1300,400,x,y );
  ellipse(1500,400,x,y );
         
    }/// this is the end of the serial if statement 
  
}
