# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/duhan/Desktop/C++/Grasper

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/duhan/Desktop/C++/Grasper/cmake-build-debug

# Include any dependencies generated for this target.
include driver/CMakeFiles/client.dir/depend.make
# Include the progress variables for this target.
include driver/CMakeFiles/client.dir/progress.make

# Include the compile flags for this target's objects.
include driver/CMakeFiles/client.dir/flags.make

driver/CMakeFiles/client.dir/client.cpp.o: driver/CMakeFiles/client.dir/flags.make
driver/CMakeFiles/client.dir/client.cpp.o: ../driver/client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/duhan/Desktop/C++/Grasper/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object driver/CMakeFiles/client.dir/client.cpp.o"
	cd /Users/duhan/Desktop/C++/Grasper/cmake-build-debug/driver && /home/s164864/home/mpich/bin/mpic++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/client.cpp.o -c /Users/duhan/Desktop/C++/Grasper/driver/client.cpp

driver/CMakeFiles/client.dir/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/client.cpp.i"
	cd /Users/duhan/Desktop/C++/Grasper/cmake-build-debug/driver && /home/s164864/home/mpich/bin/mpic++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/duhan/Desktop/C++/Grasper/driver/client.cpp > CMakeFiles/client.dir/client.cpp.i

driver/CMakeFiles/client.dir/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/client.cpp.s"
	cd /Users/duhan/Desktop/C++/Grasper/cmake-build-debug/driver && /home/s164864/home/mpich/bin/mpic++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/duhan/Desktop/C++/Grasper/driver/client.cpp -o CMakeFiles/client.dir/client.cpp.s

# Object files for target client
client_OBJECTS = \
"CMakeFiles/client.dir/client.cpp.o"

# External object files for target client
client_EXTERNAL_OBJECTS =

../release/client: driver/CMakeFiles/client.dir/client.cpp.o
../release/client: driver/CMakeFiles/client.dir/build.make
../release/client: driver/liball-deps.a
../release/client: /home/s164864/home/glog/lib64/libglog.so
../release/client: /home/s164864/home/lib/libzmq/lib64/libzmq.so
../release/client: /home/s164864/intel/oneapi/tbb/latest/lib/intel64/gcc4.8/libtbb.so
../release/client: driver/CMakeFiles/client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/duhan/Desktop/C++/Grasper/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../release/client"
	cd /Users/duhan/Desktop/C++/Grasper/cmake-build-debug/driver && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
driver/CMakeFiles/client.dir/build: ../release/client
.PHONY : driver/CMakeFiles/client.dir/build

driver/CMakeFiles/client.dir/clean:
	cd /Users/duhan/Desktop/C++/Grasper/cmake-build-debug/driver && $(CMAKE_COMMAND) -P CMakeFiles/client.dir/cmake_clean.cmake
.PHONY : driver/CMakeFiles/client.dir/clean

driver/CMakeFiles/client.dir/depend:
	cd /Users/duhan/Desktop/C++/Grasper/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/duhan/Desktop/C++/Grasper /Users/duhan/Desktop/C++/Grasper/driver /Users/duhan/Desktop/C++/Grasper/cmake-build-debug /Users/duhan/Desktop/C++/Grasper/cmake-build-debug/driver /Users/duhan/Desktop/C++/Grasper/cmake-build-debug/driver/CMakeFiles/client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : driver/CMakeFiles/client.dir/depend

