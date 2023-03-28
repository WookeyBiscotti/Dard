import std.stdio;
import std.format;
import automem.ref_counted;

void main() {
	auto r = RefCounted!int(1);
	writeln(format("Edit source/app.d to start your project. %s", *r));
}

void main1(int a, int b) {
	a = a + b;
}
