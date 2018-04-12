// its the thx sound LOL
(
~thx = {
	var midi_pitch = 14.5;
	var numVoices = 30;
	var divisor = 3; // set to 6.5 for real thx madness

	// generating initial random fundamentals
	var fundamentals = ({rrand(200.0, 400.0)}!numVoices).sort.reverse;

	// for every voice in numVoices "nv"
	var finalPitches = (numVoices.collect({|nv|
		if(((nv/(numVoices/divisor)).floor == (nv/(numVoices/divisor)).round) ,
			(nv/(numVoices/divisor)).floor * 12 ,
			(nv/(numVoices/divisor)).floor * 12 + 7);
	}) + 14.5).midicps;

	var outerEnv = EnvGen.kr(Env([0, 0.1, 1], [8, 4], [2, 4])); // middle time
	var ampEnvelope = EnvGen.kr(Env([0, 1, 1, 0], [3, 21, 3], [2, 0, -4]), doneAction: 2);
	var snd = Mix
	({|numTone|
		var initRandomFreq = fundamentals[numTone] + LFNoise2.kr(0.5, 6 * (numVoices - (numTone + 1)));
		var destinationFreq = finalPitches[numTone] + LFNoise2.kr(0.1, (numTone / 3));
		var sweepEnv =
		EnvGen.kr(
			Env([0, rrand(0.1, 0.2), 1], [rrand(5.5, 6), rrand(8.5, 9)],
				[rrand(2.0, 3.0), rrand(4.0, 5.0)]));
		var freq = ((1 - sweepEnv) * initRandomFreq) + (sweepEnv * destinationFreq);
		Pan2.ar
		(
			BLowPass.ar(Saw.ar(freq), freq * 6, 0.6),
			rrand(-0.5, 0.5),
			(1 - (1/(numTone + 1))) * 1.5
		) / numVoices
	}!numVoices);
	Limiter.ar(BLowPass.ar(snd, 2000 + (outerEnv * 18000), 0.5, (2 + outerEnv) * ampEnvelope));
};

~thx2 = {
	var midi_pitch = 14.5;
	var numVoices = 30;
	var divisor = 1; // set to 6.5 for real thx madness

	// generating initial random fundamentals
	var fundamentals = ({rrand(50.0, 150.0)}!numVoices).sort.reverse;

	// for every voice in numVoices "nv"
	var finalPitches = (numVoices.collect({|nv|
		if(((nv/(numVoices/divisor)).floor == (nv/(numVoices/divisor)).round) ,
			(nv/(numVoices/divisor)).floor * 12 ,
			(nv/(numVoices/divisor)).floor * 12 + 7);
	}) + 14.5).midicps;

	var outerEnv = EnvGen.kr(Env([0, 0.1, 1], [8, 4], [2, 4])); // middle time
	var ampEnvelope = EnvGen.kr(Env([0, 1, 1, 0], [3, 21, 3], [2, 0, -4]), doneAction: 2);
	var snd = Mix
	({|numTone|
		var initRandomFreq = fundamentals[numTone] + LFNoise2.kr(0.5, 6 * (numVoices - (numTone + 1)));
		var destinationFreq = finalPitches[numTone] + LFNoise2.kr(0.1, (numTone / 3));
		var sweepEnv =
		EnvGen.kr(
			Env([0, rrand(0.1, 0.2), 1], [rrand(5.5, 6), rrand(8.5, 9)],
				[rrand(2.0, 3.0), rrand(4.0, 5.0)]));
		var freq = ((1 - sweepEnv) * initRandomFreq) + (sweepEnv * destinationFreq);
		Pan2.ar
		(
			BLowPass.ar(Saw.ar(freq), freq * 6, 0.6),
			rrand(-0.5, 0.5),
			(1 - (1/(numTone + 1))) * 1.5
		) / numVoices
	}!numVoices);
	Limiter.ar(BLowPass.ar(snd, 2000 + (outerEnv * 18000), 0.5, (2 + outerEnv) * ampEnvelope));
};
)
