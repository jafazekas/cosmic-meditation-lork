(
// GUI
w = Window.new("Cosmic Meditation", Rect(500, 500, 500, 70)).layout_(
	VLayout(
		StaticText.new(w,Rect(0,0,80,30)).string_("Click Buttons to Activate Synths"),
		HLayout(
			a = Button.new(w,Rect(10,10,80,30)).states_([["Bee Swarm"],["Stop Bee Swarm"]]),
			f = Button.new(w,Rect(10,10,80,30)).states_([["Low Bee Swarm"],["Stop Low Bee Swarm"]]),
			b = Button.new(w,Rect(10,10,80,30)).states_([["All Bells"],["Stop Bells"]]),
			d = Button.new(w,Rect(10,10,80,30)).states_([["High Bells"],["Stop High Bells"]]),
			e = Button.new(w,Rect(10,10,80,30)).states_([["Low Bells"],["Stop Low Bells"]]),
			c = Button.new(w,Rect(10,10,80,30)).states_([["Fall"],["Stop Fall"]]),
		),
		TextView.new(w,Rect(10,10,160,60)).string_("To avoid abrupt endings, do not stop bells or bee swarms when they are the only sounds playing."),
	)
).front;

// bee swarm
a.action = { |a|
	if (a.value == 0) {x.free; };
	if (a.value == 1) {x = ~thx.play; };
};

// low bee swarm
f.action = { |f|
	if (f.value == 0) {x.free; };
	if (f.value == 1) {x = ~thx2.play; };
};

// all bells
b.action = { |b|
	if (b.value == 0) {
		q.stop;
		p.stop;
		t.stop;
	};
	if (b.value == 1) {
		q = Pdef(\bell_1).play;
		p = Pdef(\bell_2).play;
		t = Pdef(\bell_3).play;
		Pdef(\bell_1).fadeTime = 8.0;
		Pdef(\bell_2).fadeTime = 8.0;
		Pdef(\bell_3).fadeTime = 8.0;
	};
};

// now you're going to die
c.action = { |c|
	if (c.value == 0) {y.free; };
	if (c.value == 1) {
		y = Ndef(\fall).play;
		// fade in and out
		Ndef(\fall).fadeTime = 10;
	};
};

// high bells
d.action = { |d|
	if (d.value == 0) {
		l.stop;
		p.stop;
	};
	if (d.value == 1) {
		l = Pdef(\bell_1).play;
		p = Pdef(\bell_2).play;
		Pdef(\bell_1).fadeTime = 8.0;
		Pdef(\bell_2).fadeTime = 8.0;
	};
};

// low bells
e.action = { |e|
	if (e.value == 0) {
		t.stop;
	};
	if (e.value == 1) {
		t = Pdef(\bell_3).play;
		Pdef(\bell_3).fadeTime = 8.0;
	};
};

w.front;
)