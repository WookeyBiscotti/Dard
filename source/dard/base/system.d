module dard.base.system;

public import dard.base.context;

class System {
public:
    this(Context context) {
        _context = context;
    }

    void initialize() {
    }

    Context context() {
        return _context;
    }

private:
    Context _context;
}
