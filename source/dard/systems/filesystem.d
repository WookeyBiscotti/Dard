module dard.systems.filesystem;

import dard.base.system;
import dard.types.string;
import dard.systems.config;

import std.file;

alias Path = String;

class FileSystem : System {
    this(Context context) {
        super(context);
    }

    Path dynamicConfigPath() {
        import std.process;

        version (Posix) {
            String homeDir = environment.get("HOME");
            homeDir ~= "/.config/" ~ context().system!ConfigSystem
                .value!String(APPLICATION_NAME) ~ "/";

            return homeDir;
        }
        version (Windows) {
            String homeDir = environment.get("USERPROFILE");
            homeDir ~= context().system!ConfigSystem
                .value!String(APPLICATION_NAME) ~ "/";

            return homeDir;
        }
    }

}
