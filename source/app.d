// import std.stdio;
// import std.format;
// import core.thread;
// import automem.ref_counted;
// import std.exception;
// import std.string : toStringz;
// import sdl;

import std.algorithm.mutation;
import std.typecons;

import dard.systems.config;
import dard.systems.engine;

import dard.base.context;
import dard.types.smart_ptr;

void main() {
	auto config = Config.predefinedValues();

	auto ctx = scoped!Context;

	ctx.createSystem!Config(config);
	ctx.createSystem!Engine().run();

	// ctx.get().createSystem!Config(config);
	// ctx.get().createSystem!Window();
	// enforce(0 == SDL_Init(SDL_InitFlags.SDL_INIT_VIDEO));

	// auto w = SDL_CreateWindow(toStringz("qwe"), cast(uint) 600, cast(uint) 800, 2);
	// enforce(w);
	// enforce(SDL_ShowWindow(w) == 0);
	// writeln("WTF");

	// SDL_Surface *ws = SDL_GetWindowSurface(w);

	// SDL_UpdateWindowSurface(w);

	// SDL_Event e = void;
	// // writeln(cast(Uint32) SDL_EventType.SDL_QUIT);

	// bool exit = false;
	// while (!exit) {
	// 	while (SDL_PollEvent(&e)) {
	// 		writeln(cast(SDL_EventType)e.type);
	// 		if (e.type == SDL_EventType.SDL_EVENT_QUIT) {
	// 			exit = true;
	// 		}
	// 	}
	// }

	// writeln("WTF2");

	// // Thread.sleep(dur!"seconds"(5));
	// // SDL_Quit();
}
