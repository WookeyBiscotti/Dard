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

void main(string[] args) {
    writeln("Root dir: ", rootPath);
    writeln("3rdparty dir: ", tplPath);
    writeln("tools dir: ", toolsPath);
}
