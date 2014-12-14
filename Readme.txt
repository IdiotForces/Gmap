#SHORTEST PATHS PROBLEMS#

(December 14, 2014)

Gmap is an implementation of Bellman-Ford shortest path algorithm along with an visual presentation with MarXsCube Prototype Game Engine.

Contents
--------------------------------------------------------------------

+ How to compile
+ How to use
+ External libraries used by MarXsCube/Gmap

--------------------------------------------------------------------
### How to compile

You are suggested to have MinGW 4.7.2 (on Windows, you can download Dev-Cpp with MinGW 4.7.2 integrated in http://sourceforge.net/projects/orwelldevcpp/files/Portable Releases/Dev-Cpp 5.5.3 MinGW 4.7.2 Portable.7z/download) or Command Line Tools (on OS X) installed before building Gmap.

Open the Command Prompt/Terminal, use "cd" to navigate to this directory, then:

    make clean
    make

The executable "gamemk.exe" would appear in the "bin" directory after a while.

Or if you are running OS X, you can clone my repository (git@github.com:secondwtq/MarXsCube.git) and just build the Xcode project inside it.

--------------------------------------------------------------------
### How to use

* On Windows

    Double click "gamemk.exe" in the "bin" directory, wait for it initialize.

* On OS X

    Open terminal, switch to "bin" directory, execute "./gamemk".

--------------------------------------------------------------------
### External libraries used by MarXsCube/Gmap

* SFML, under zlib/png license, https://github.com/LaurentGomila/SFML.
* The Programming Language Lua, under MIT license, http://www.lua.org.
* LuaJIT, by Mike Pall, a Just-In-Time Compiler for Lua, under MIT License, http://luajit.org.
* LuaBridge, by Vinnie Falco (vinnie.falco@gmail.com), under MIT License, https://github.com/vinniefalco/LuaBridge.
* Bullet Collision Detection and Physics Library, under zlib license, http://bulletphysics.org.
* armadillo, under Mozilla Public License Version 2.0, http://arma.sourceforge.net.

--------------------------------------------------------------------
https://github.com/secondwtq/MarXsCube