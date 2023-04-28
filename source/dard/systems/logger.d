module dard.systems.logger;

import std.logger;
import std.stdio;

import dard.base.system;
import dard.base.context;

public import std.logger : log, trace, info, warning, critical, fatal;

class Logger : System {
public:
    this(Context context) {
        super(context);
        _logger = new FileLogger(stdout);
        sharedLog = cast(shared)(_logger);
    }

private:
    FileLogger _logger;
}
