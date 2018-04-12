// Now you're going to die
// http://sccode.org/1-57I#c774
(
Ndef(\fall, { arg freq=200, pan=0, amp=0.1;
	var sig;
	sig = ( WhiteNoise.ar + 0.8 ) * LFSaw.ar({ exprand(10.0,10000) }!20 * ( 1 + ( SinOsc.ar((1..4).rand(0.0)/18 * XLine.kr(1,121200,80)) * 1/41 * XLine.kr(1,180,60) )));
	sig = DelayC.ar(sig, 0.2, {rrand(1/5,1/10000) * ( 1 + ( SinOsc.ar((1..2).rand(0.0)/18 * XLine.kr(1,121200,60)) * 1/41 * XLine.kr(1,180,60) ))}!4) + sig / 2;
	sig = DelayC.ar(sig, 0.2, {rrand(1/5,1/10000) * XLine.kr(1,1/1000,14)}!4) + sig / 2;
	sig = sig + BPF.ar(
		sig,
		{ ( exprand(100.0,10000) * LFNoise1.ar(1/100.0.rand).range(1,2) ).clip(20,20000) }!10,
		{ ( rand(0.01,1) * LFNoise1.ar(1/100.0.rand).range(1,2) ).clip(0.01,1) }!10
	);
	sig = BRF.ar(
		sig,
		{ ( exprand(100.0,10000) * LFNoise1.ar(1/100.0.rand).range(1,2) ).clip(20,20000) }!10,
		{ ( rand(0.01,1) * LFNoise1.ar(1/100.0.rand).range(1,2) ).clip(0.01,1) }!10
	);
	sig = LeakDC.ar(sig);
	sig = LPF.ar(sig, 17000 * XLine.kr(1/100,1,4));
	sig = sig * 5 * 3;
	sig = sig.mean;
	sig = sig * amp;
	sig;
}).add;
)