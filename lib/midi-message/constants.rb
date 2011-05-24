#!/usr/bin/env ruby
#

# Better way to do this? I'm not sure how to reliably locate a YAML file in a gem vs in a git clone
# Using require to load this is as a ruby file will do that

@@data = %q{
  
Status:
  Note Off: 0x8
  Note On: 0x9
  Polyphonic Aftertouch: 0xA
  Control Change: 0xB
  Program Change: 0xC
  Channel Aftertouch: 0xD
  Pitch Bend: 0xE
  System Exclusive: 0xF0
  System Common: [0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6]
  System Realtime: [0xF8, 0xF9, 0xFA, 0xFB, 0xFC, 0xFD, 0xFE, 0xFF]
  
Control Change:
  Bank Select: 0
  Modulation Wheel: 1
  Breath Controller: 2
  Foot Controller: 4
  Portamento Time: 5
  Data Entry MSB: 6
  Channel Volume: 7
  Balance: 8
  Pan: 10
  Expression Controller: 11
  General Purpose Controllers: 16
  General Purpose Controllers: 17
  General Purpose Controllers: 18
  General Purpose Controllers: 19
  LSB for controller 0: 32
  LSB for controller 1: 33
  LSB for controller 2: 34
  LSB for controller 3: 35
  LSB for controller 4: 36
  LSB for controller 5: 37
  LSB for controller 6: 38
  LSB for controller 7: 39
  LSB for controller 8: 40
  LSB for controller 9: 41
  LSB for controller 10: 42
  LSB for controller 11: 43
  LSB for controller 12: 44
  LSB for controller 13: 45
  LSB for controller 14: 46
  LSB for controller 15: 47
  LSB for controller 16: 48
  LSB for controller 17: 49
  LSB for controller 18: 50
  LSB for controller 19: 51
  LSB for controller 20: 52
  LSB for controller 21: 53
  LSB for controller 22: 54
  LSB for controller 23: 55
  LSB for controller 24: 56
  LSB for controller 25: 57
  LSB for controller 26: 58
  LSB for controller 27: 59
  LSB for controller 28: 60
  LSB for controller 29: 61
  LSB for controller 30: 62
  LSB for controller 31: 63
  Hold Pedal: 64
  Portamento: 65

Control Mode:
  All Sound Off: 120
  All Controllers Off: 121
  Local Keyboard Toggle: 122
  All Notes Off: 123
  Omni Off: 124
  Omni On: 125
  Mono: 126
  Poly: 127

System Realtime:
  Start: 0xA
  Clock: 0x8
  Continue: 0xB
  Stop: 0xC
  ActiveSense: 0xE
  Reset: 0xF  

Manufacturers:

  SequentialCircuits: 1
  BigBriar: 2
  Octave: 3
  Moog: 4
  Passport: 5
  Lexicon: 6

  PAIA: 0x11
  Simmons: 0x12
  GentleElectric: 0x13
  Fairlight: 0x14
  BonTempi: 0x20
  SIEL: 0x21
  SyntheAxe: 0x23

  Kawai: 0x40
  Roland: 0x41
  Korg: 0x42
  Yamaha: 0x43
  Casio: 0x44
  Akai: 0x47

  Emagic: [0x00, 0x20, 0x31]
  Behringer: [0x00, 0x20, 0x32]

Note:
  C-1: 0
  C#-1: 1
  Db-1: 1
  D-1: 2
  D#-1: 3
  Eb-1: 3
  E-1: 4
  E#-1: 5
  Fb-1: 4
  F-1: 5
  F#-1: 6
  Gb-1: 6
  G-1: 7
  G#-1: 8
  Ab-1: 8
  A-1: 9
  A#-1: 10
  Bb-1: 10
  B-1: 11
  B#-1: 12
  Cb0: 11
  C0: 12
  C#0: 13
  Db0: 13
  D0: 14
  D#0: 15
  Eb0: 15
  E0: 16
  E#0: 17
  Fb0: 16
  F0: 17
  F#0: 18
  Gb0: 18
  G0: 19
  G#0: 20
  Ab0: 20
  A0: 21
  A#0: 22
  Bb0: 22
  B0: 23
  B#0: 24
  Cb1: 23
  C1: 24
  C#1: 25
  Db1: 25
  D1: 26
  D#1: 27
  Eb1: 27
  E1: 28
  E#1: 29
  Fb1: 28
  F1: 29
  F#1: 30
  Gb1: 30
  G1: 31
  G#1: 32
  Ab1: 32
  A1: 33
  A#1: 34
  Bb1: 34
  B1: 35
  B#1: 36
  Cb2: 35
  C2: 36
  C#2: 37
  Db2: 37
  D2: 38
  D#2: 39
  Eb2: 39
  E2: 40
  E#2: 41
  Fb2: 40
  F2: 41
  F#2: 42
  Gb2: 42
  G2: 43
  G#2: 44
  Ab2: 44
  A2: 45
  A#2: 46
  Bb2: 46
  B2: 47
  B#2: 48
  Cb3: 47
  C3: 48
  C#3: 49
  Db3: 49
  D3: 50
  D#3: 51
  Eb3: 51
  E3: 52
  E#3: 53
  Fb3: 52
  F3: 53
  F#3: 54
  Gb3: 54
  G3: 55
  G#3: 56
  Ab3: 56
  A3: 57
  A#3: 58
  Bb3: 58
  B3: 59
  B#3: 60
  Cb4: 59
  C4: 60
  C#4: 61
  Db4: 61
  D4: 62
  D#4: 63
  Eb4: 63
  E4: 64
  E#4: 65
  Fb4: 64
  F4: 65
  F#4: 66
  Gb4: 66
  G4: 67
  G#4: 68
  Ab4: 68
  A4: 69
  A#4: 70
  Bb4: 70
  B4: 71
  B#4: 72
  Cb5: 71
  C5: 72
  C#5: 73
  Db5: 73
  D5: 74
  D#5: 75
  Eb5: 75
  E5: 76
  E#5: 77
  Fb5: 76
  F5: 77
  F#5: 78
  Gb5: 78
  G5: 79
  G#5: 80
  Ab5: 80
  A5: 81
  A#5: 82
  Bb5: 82
  B5: 83
  B#5: 84
  Cb6: 83
  C6: 84
  C#6: 85
  Db6: 85
  D6: 86
  D#6: 87
  Eb6: 87
  E6: 88
  E#6: 89
  Fb6: 88
  F6: 89
  F#6: 90
  Gb6: 90
  G6: 91
  G#6: 92
  Ab6: 92
  A6: 93
  A#6: 94
  Bb6: 94
  B6: 95
  B#6: 96
  Cb7: 95
  C7: 96
  C#7: 97
  Db7: 97
  D7: 98
  D#7: 99
  Eb7: 99
  E7: 100
  E#7: 101
  Fb7: 100
  F7: 101
  F#7: 102
  Gb7: 102
  G7: 103
  G#7: 104
  Ab7: 104
  A7: 105
  A#7: 106
  Bb7: 106
  B7: 107
  B#7: 108
  Cb8: 107
  C8: 108
  C#8: 109
  Db8: 109
  D8: 110
  D#8: 111
  Eb8: 111
  E8: 112
  E#8: 113
  Fb8: 112
  F8: 113
  F#8: 114
  Gb8: 114
  G8: 115
  G#8: 116
  Ab8: 116
  A8: 117
  A#8: 118
  Bb8: 118
  B8: 119
  B#8: 120
  Cb9: 119
  C9: 120
  C#9: 121
  Db9: 121
  D9: 122
  D#9: 123
  Eb9: 123
  E9: 124
  E#9: 125
  Fb9: 124
  F9: 125
  F#9: 126
  Gb9: 126
  G9: 127
  
}