// Cosmic Meditation
// by Jackie Fazekas
// Written April 2018

// To play this piece, start the server, then highlight and run this code.

(
// load sounds
"Initializing".postln;
"...".postln;

// uncomment and load this if your computer does not have enough memory allocated to the server
"meditationMemory.scd".loadRelative;

"meditationBees.scd".loadRelative;
"meditationFall.scd".loadRelative;
"meditationBells.scd".loadRelative;

// start GUI
"meditationGUI.scd".loadRelative;
)
