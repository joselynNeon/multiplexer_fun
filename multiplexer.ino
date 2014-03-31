
int activeChannels = 9;
 
// Keep count of which channel we're reading.
int channel = 0;

int pinCommon = A0;

int pinS0 =8;
int pinS1 = 9;
int pinS2 = 10;
int pinS3 = 11;

void setup()
{
  pinMode(pinS0, OUTPUT);
  pinMode(pinS1, OUTPUT);
  pinMode(pinS2, OUTPUT);
  pinMode(pinS3, OUTPUT);  

Serial.begin(9600);  
}

void loop () {
  // Loop through the channels and read each one.
  for (channel = 0; channel < activeChannels; channel++) {
   
    // Get the switch states from the channel number, and
    // send the state to the multiplexer to read from that
    // channel. This configuration covers all the channels,
    // but doesn't read them in a sequence that matches the datasheet.
    // (This works, but needs revision.)
    digitalWrite(pinS0, (channel & 15) >> 3);  // bit 4
    digitalWrite(pinS1, (channel & 7) >> 2);   // bit 3
    digitalWrite(pinS2, (channel & 3) >> 1);   // bit 2
    digitalWrite(pinS3, (channel & 1));        // bit 1
   
    // Read the common pin and send it out over serial.
    Serial.print(analogRead(pinCommon), DEC);
   
    if(channel < (activeChannels - 1)) {
      // Separate each channel with a comma.
      Serial.print(",");    
    }
    else {
      // If it's the last channel, skip the
      // period and send a line feed instead.
      Serial.println();      
    }
  }
 
  // Take a breath.
  delay(10);  
}

