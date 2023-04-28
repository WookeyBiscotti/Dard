# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/alex/code/Dard/bindings/nanovg/cpp_source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alex/code/Dard/bindings/nanovg/cpp_source/build

# Include any dependencies generated for this target.
include CMakeFiles/nanovg.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/nanovg.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/nanovg.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/nanovg.dir/flags.make

CMakeFiles/nanovg.dir/nanovg.o: CMakeFiles/nanovg.dir/flags.make
CMakeFiles/nanovg.dir/nanovg.o: ../nanovg.cpp
CMakeFiles/nanovg.dir/nanovg.o: CMakeFiles/nanovg.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alex/code/Dard/bindings/nanovg/cpp_source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/nanovg.dir/nanovg.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/nanovg.dir/nanovg.o -MF CMakeFiles/nanovg.dir/nanovg.o.d -o CMakeFiles/nanovg.dir/nanovg.o -c /home/alex/code/Dard/bindings/nanovg/cpp_source/nanovg.cpp

CMakeFiles/nanovg.dir/nanovg.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nanovg.dir/nanovg.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alex/code/Dard/bindings/nanovg/cpp_source/nanovg.cpp > CMakeFiles/nanovg.dir/nanovg.i

CMakeFiles/nanovg.dir/nanovg.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nanovg.dir/nanovg.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alex/code/Dard/bindings/nanovg/cpp_source/nanovg.cpp -o CMakeFiles/nanovg.dir/nanovg.s

CMakeFiles/nanovg.dir/nanovg_bgfx.o: CMakeFiles/nanovg.dir/flags.make
CMakeFiles/nanovg.dir/nanovg_bgfx.o: ../nanovg_bgfx.cpp
CMakeFiles/nanovg.dir/nanovg_bgfx.o: CMakeFiles/nanovg.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alex/code/Dard/bindings/nanovg/cpp_source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/nanovg.dir/nanovg_bgfx.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/nanovg.dir/nanovg_bgfx.o -MF CMakeFiles/nanovg.dir/nanovg_bgfx.o.d -o CMakeFiles/nanovg.dir/nanovg_bgfx.o -c /home/alex/code/Dard/bindings/nanovg/cpp_source/nanovg_bgfx.cpp

CMakeFiles/nanovg.dir/nanovg_bgfx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nanovg.dir/nanovg_bgfx.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alex/code/Dard/bindings/nanovg/cpp_source/nanovg_bgfx.cpp > CMakeFiles/nanovg.dir/nanovg_bgfx.i

CMakeFiles/nanovg.dir/nanovg_bgfx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nanovg.dir/nanovg_bgfx.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alex/code/Dard/bindings/nanovg/cpp_source/nanovg_bgfx.cpp -o CMakeFiles/nanovg.dir/nanovg_bgfx.s

# Object files for target nanovg
nanovg_OBJECTS = \
"CMakeFiles/nanovg.dir/nanovg.o" \
"CMakeFiles/nanovg.dir/nanovg_bgfx.o"

# External object files for target nanovg
nanovg_EXTERNAL_OBJECTS =

libnanovg.a: CMakeFiles/nanovg.dir/nanovg.o
libnanovg.a: CMakeFiles/nanovg.dir/nanovg_bgfx.o
libnanovg.a: CMakeFiles/nanovg.dir/build.make
libnanovg.a: CMakeFiles/nanovg.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alex/code/Dard/bindings/nanovg/cpp_source/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libnanovg.a"
	$(CMAKE_COMMAND) -P CMakeFiles/nanovg.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/nanovg.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/nanovg.dir/build: libnanovg.a
.PHONY : CMakeFiles/nanovg.dir/build

CMakeFiles/nanovg.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/nanovg.dir/cmake_clean.cmake
.PHONY : CMakeFiles/nanovg.dir/clean

CMakeFiles/nanovg.dir/depend:
	cd /home/alex/code/Dard/bindings/nanovg/cpp_source/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/code/Dard/bindings/nanovg/cpp_source /home/alex/code/Dard/bindings/nanovg/cpp_source /home/alex/code/Dard/bindings/nanovg/cpp_source/build /home/alex/code/Dard/bindings/nanovg/cpp_source/build /home/alex/code/Dard/bindings/nanovg/cpp_source/build/CMakeFiles/nanovg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/nanovg.dir/depend

