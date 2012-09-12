/*
  This file is public domain. Use it as you like.
*/

#include <ardumidi.h>

int lastnote = 1;

void setup()
{
  Serial.begin(115200);
}

void loop()
{
  
  int readnote = analogRead(5);
  int note = 1;
  
  if (readnote >= 10 && readnote <= 20)
    note = 7;
  else if (readnote >= 24 && readnote <= 34)
    note = 6;
  else if (readnote >= 38 && readnote <= 48)
    note = 5;
  else if (readnote >= 52 && readnote <= 62)
    note = 4;
  else if (readnote >= 66 && readnote <= 76)
    note = 3;
  else if (readnote >= 80 && readnote <= 90)
    note = 2;
  else if (readnote >= 94 && readnote <= 104)
    note = 1;
  else
    note = lastnote;
    
  
  if (lastnote != note) {
    if (note == 1)
      midi_note_on(0, 60, 127);
    else
      midi_note_off(0, 60, 127);
    if (note == 2)
      midi_note_on(0, 64, 127);
    else
      midi_note_off(0, 64, 127);
    if (note == 3)
      midi_note_on(0, 67, 127);
    else
      midi_note_off(0, 67, 127);
    if (note == 4)
      midi_note_on(0, 72, 127);
    else
      midi_note_off(0, 72, 127);
    if (note == 5)
      midi_note_on(0, 76, 127);
    else
      midi_note_off(0, 76, 127);
    if (note == 6)
      midi_note_on(0, 79, 127);
    else
      midi_note_off(0, 79, 127);
    if (note == 7)
      midi_note_on(0, 84, 127);
    else
      midi_note_off(0, 84, 127);
  }
  
  lastnote = note;
  
  if (readnote > 110)
    lastnote = 8;
  
  delay(20);
}

// Available commands:
//
// Start/stop playing a certain note:
//   midi_note_on(byte channel, byte key, byte velocity);
//   midi_note_off(byte channel, byte key, byte velocity);
//
// Change pressure of specific keys:
//   midi_key_pressure(byte channel, byte key, byte value);
//
// Change controller value (used for knobs, etc):
//   midi_controller_change(byte channel, byte controller, byte value);
//
// Change "program" (change the instrument):
//   midi_program_change(byte channel, byte program);
//
// Change key pressure of entire channels:
//   midi_channel_pressure(byte channel, byte value);
//
// Change pitch-bend wheel:
//   midi_pitch_bend(byte channel, int value);
//
// Send a comment:
//   midi_comment(char* str);
//
// Send a series of bytes (to be interpreted by another program):
//   midi_printbytes(char* bytes, int len);
//
// Parameters:
//   channel             an integer from 0 to 15
//   pitch-bend value    an integer from 0 to 16383
//   all other values    an integer from 0 to 127
//

