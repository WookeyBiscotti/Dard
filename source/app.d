// import std.stdio;
// import std.format;
import core.thread;
// import automem.ref_counted;
// import std.exception;
// import std.string : toStringz;
// import sdl;

import std.algorithm.mutation;
import std.typecons;

import dard.systems.config;
import dard.systems.engine;

import dard.base.context;

import std.exception;
import std.string;
import sdl;

void main() {
	auto config = Config.predefinedValues();

	auto ctx = scoped!Context;
	ctx.createSystem!Config(config);
	ctx.createSystem!Engine().run();

	// enforce(0 == SDL_Init(SDL_InitFlags.SDL_INIT_VIDEO));

	// auto w = SDL_CreateWindow(toStringz("qwe"), cast(uint) 600, cast(uint) 800, 2);
	// enforce(w);
	// enforce(SDL_ShowWindow(w) == 0);
	// // writeln("WTF");

	// SDL_Surface *ws = SDL_GetWindowSurface(w);

	// SDL_UpdateWindowSurface(w);

	// // SDL_Event e = void;	SDL_Surface *ws = SDL_GetWindowSurface(w);
	// Thread.sleep(dur!"seconds"(5));
	// SDL_Quit();
}
