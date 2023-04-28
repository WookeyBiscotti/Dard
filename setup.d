#!/snap/bin/rdmd

import std.stdio;
import std.file;
import std.path;
import std.process;
import std.exception;
import std.getopt;
import std.array;

enum scriptPath = absolutePath(__FILE_FULL_PATH__);
enum rootPath = dirName(__FILE_FULL_PATH__);

enum tplPath = buildPath(rootPath, "3rdparty");
enum toolsPath = buildPath(rootPath, "tools");
enum bindingsPath = buildPath(rootPath, "bindings");

enum dstepPath = buildPath(toolsPath, "dstep");

enum sdlPath = buildPath(tplPath, "SDL");
enum sdlPathInclude = buildPath(sdlPath, "include");
enum sdlBindingsPath = buildPath(bindingsPath, "sdl");
enum sdlSamplePath = buildPath(sdlBindingsPath, "sample", "sdl.c");
enum sdlSamplePreprocessedPath = buildPath(sdlBindingsPath, "sample", "sdl_preprocessed.c");
enum sdlSourcePath = buildPath(sdlBindingsPath, "source", "sdl.d");

enum bgfxPath = buildPath(tplPath, "bgfx");
enum bgfxPathInclude = buildPath(bgfxPath, "include");
enum bxPath = buildPath(tplPath, "bx");
enum bxPathInclude = buildPath(bxPath, "include");

enum nanoVGBindingsPath = buildPath(bindingsPath, "nanovg");
enum nanoVGCSourcePath = buildPath(nanoVGBindingsPath, "cpp_source", "nanovg.h");
enum nanoVGSourcePath = buildPath(nanoVGBindingsPath, "source", "nanovg.d");

enum nanoVGBgfxCSourcePath = buildPath(nanoVGBindingsPath, "cpp_source", "nanovg_bgfx.h");
enum nanoVGBgfxPreprocessedPath = buildPath(nanoVGBindingsPath, "cpp_source", "nanovg_bgfx_preprocessed.c");
enum nanoVGBgfxSourcePath = buildPath(nanoVGBindingsPath, "source", "nanovg_bgfx.d");

string defaultCCompiler = "clang";

void main(string[] args) {
    generateSDL3Source();
    generateNanoVG();
    // generateNanoVGBgfx();
}

void buildDstep() {
    chdir(dstepPath);
    scope (exit) {
        chdir(rootPath);
    }

    writefln(execute(["dub", "build"]).output);
}

void buildDstep() {
    chdir(dstepPath);
    scope (exit) {
        chdir(rootPath);
    }

    writefln(execute(["dub", "build"]).output);
}

void runDstep(string[] args) {
    chdir(dstepPath);
    scope (exit) {
        chdir(rootPath);
    }

    writefln(execute(["dub", "run", "--"] ~ args).output);
}

void generateNanoVG() {
    chdir(dstepPath);
    scope (exit) {
        chdir(rootPath);
    }

    runDstep([nanoVGCSourcePath, "-o", nanoVGSourcePath]);
}

void generateNanoVGBgfx() {
    chdir(dstepPath);
    scope (exit) {
        chdir(rootPath);
    }

    writefln(execute([
            defaultCCompiler, "-E", nanoVGBgfxCSourcePath, "-o",
            nanoVGBgfxPreprocessedPath,
            "-I", bgfxPathInclude, "-I", bxPathInclude
        ]).output);

    runDstep([nanoVGBgfxPreprocessedPath, "-o", nanoVGBgfxSourcePath]);
}

void generateSDL3Source() {
    chdir(dstepPath);
    scope (exit) {
        chdir(rootPath);
    }

    writefln(execute([
            defaultCCompiler, "-E", sdlSamplePath, "-o", sdlSamplePreprocessedPath,
            "-I", sdlPathInclude
        ]).output);

    runDstep([
        sdlSamplePreprocessedPath, "-o", sdlSourcePath, "--global-import",
        "core.stdc.stdarg"
    ]);

    std.file.write(sdlSourcePath, readText(sdlSourcePath)
            .replace("SDL_MessageBoxColor[SDL_MESSAGEBOX_COLOR_MAX]", "SDL_MessageBoxColor[SDL_MessageBoxColorType.SDL_MESSAGEBOX_COLOR_MAX]")
            .replace("xdg_surface* xdg_surface", "xdg_surface* xdg_surface_")
            .replace("xdg_toplevel* xdg_toplevel", "xdg_toplevel* xdg_toplevel_")
            .replace("xdg_popup* xdg_popup", "xdg_popup* xdg_popup_")
            .replace("xdg_positioner* xdg_positioner", "xdg_positioner* xdg_positioner_")
    );
}

void printMainInfo() {
    writeln("Root dir: ", rootPath);
    writeln("3rdparty dir: ", tplPath);
    writeln("tools dir: ", toolsPath);
}
