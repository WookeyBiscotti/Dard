#!/snap/bin/rdmd

import std.stdio;
import std.file;
import std.path;
import std.process;
import std.exception;

enum scriptPath = absolutePath(__FILE_FULL_PATH__);
enum rootPath = dirName(__FILE_FULL_PATH__);

enum tplPath = buildPath(rootPath, "3rdparty");
enum toolsPath = buildPath(rootPath, "tools");
enum bindingsPath = buildPath(rootPath, "bindings");

enum dppPath = buildPath(toolsPath, "dpp");
enum dppExePath = buildPath(dppPath, "bin", "d++");
enum sdlPath = buildPath(tplPath, "SDL");
enum sdlBindingsPath = buildPath(bindingsPath, "sdl");
enum sdlBindingsDppPath = buildPath(sdlBindingsPath, "sdl.dpp");

void buildDpp() {
    // sudo apt-get install -y -qq libclang-10-dev
    // sudo ln -s path_to_llvm/lib/libclang-12.so.1 /lib/x86_64-linux-gnu/libclang.so
    // sudo ln -s /usr/lib/llvm-12/lib/libclang-12.so.1 /lib/x86_64-linux-gnu/libclang.so

    auto currentDir = getcwd();
    scope (exit) {
        chdir(currentDir);
    }
    chdir(dppPath);
    enforce(wait(spawnProcess(["dub", "build", "--compiler=dmd"])) == 0);
}

void buildSdlBindings() {
    enforce(wait(spawnProcess([dppExePath, sdlBindingsDppPath])) == 0);
}

void main(string[] args) {
    writeln("Root dir: ", rootPath);
    writeln("3rdparty dir: ", tplPath);
    writeln("tools dir: ", toolsPath);

    buildDpp();
    buildSdlBindings();
}
