module dard.systems.logger;

import std.logger;
import std.stdio;

import dard.base.system;
import dard.base.context;
import dard.types.smart_ptr;

public import std.logger : log, trace, info, warning, critical, fatal;

class Logger : System {
public:
    this(Context context) {
        super(context);
        _logger = SharedPtr!FileLogger(stdout);
        sharedLog = cast(shared)(*_logger);
    }

private:
    SharedPtr!FileLogger _logger;
}
