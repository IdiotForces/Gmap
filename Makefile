OBJECTS = Abstract.o ObjectManger.o Anim.o Pathfinder.o CameraObject.o \
		Physics.o Cell.o PhysicsGeneral.o Common.o RayTest.o Config.o \
		RayTest_Interface.o Debug.o RenderElement.o Generic.o \
		RenderElementsContainer.o Gmap_Interface.o Session.o InternalDraw.o \
		Techno.o LWindow.o Test.o LuaInterface.o Transform.o LuaUtils.o \
		Type_Abstract.o Map.o Type_Anim.o Object.o Type_Object.o \
		ObjectArrayImpl.o Type_Techno.o

PATH_LUA=./extlibs/lua
PATH_SFML=./extlibs/sfml
PATH_ARMADILLO=./extlibs/armadillo
PATH_LUABRIDGE=./extlibs/luabridge
PATH_BULLET_DARWIN=./extlibs/Bullet3
PATH_BULLET_MINGW=./extlibs/Bullet2

OUTPUT_DARWIN=gamemk
OUTPUT_MINGW=gamemk.exe

BUILD_PATH = ./build/
BINARY_PARH = ./bin/
SOURCE_PATH = ./src/

RESFILE = ./misc/ver.rc
RESFILE_OUTPUT = ver.res

CXXFLAGS_=-Wall -std=c++11 -O2 -isystem$(PATH_LUA)/include \
			-isystem$(PATH_SFML)/include -isystem$(PATH_ARMADILLO)/include \
			-isystem$(PATH_LUABRIDGE)/ 

CXXFLAGS_DARWIN=-isystem$(PATH_BULLET_DARWIN)/include -I$(PATH_BULLET_DARWIN)/include/Bullet
CXXFLAGS_MINGW=-Wl,-Bstatic -static -fpermissive -isystem$(PATH_BULLET_MINGW)/include -I$(PATH_BULLET_MINGW)/include/Bullet

LDFLAGS_= -L$(PATH_LUA)/lib -L$(PATH_SFML)/lib \
		-lsfml-window -lsfml-graphics -lsfml-system

LDFLAGS_DARWIN=-L$(PATH_BULLET_DARWIN)/lib -llua.5.2 -lLinearMath_xcode4_x64_release \
		-lBulletDynamics_xcode4_x64_release -lBulletCollision_xcode4_x64_release

LDFLAGS_MINGW=-L$(PATH_BULLET_MINGW)/lib -Wl,-Bstatic -static -llua523_static_mingw -lBulletDynamics -lBulletCollision -lLinearMath
RESCMP_ = windres

_OBJECTS=$(addprefix $(BUILD_PATH),$(OBJECTS))
_RESFILE_OUTPUT=$(addprefix $(BUILD_PATH),$(RESFILE_OUTPUT))

LINK_OBJECTS_MINGW = $(_OBJECTS) $(_RESFILE_OUTPUT)
LINK_OBJECTS_DARWIN = $(_OBJECTS)

OS := $(shell uname)

ifeq ($(OS), Darwin)
CXXFLAGS = $(CXXFLAGS_) $(CXXFLAGS_DARWIN)
LDFLAGS = $(LDFLAGS_) $(LDFLAGS_DARWIN)
LINK_OBJECTS = $(LINK_OBJECTS_DARWIN)
OUTPUT=$(OUTPUT_DARWIN)
RESCMP=echo
else
CXXFLAGS = $(CXXFLAGS_) $(CXXFLAGS_MINGW)
LDFLAGS = $(LDFLAGS_) $(LDFLAGS_MINGW)
LINK_OBJECTS = $(LINK_OBJECTS_MINGW)
OUTPUT=$(OUTPUT_MINGW)
RESCMP=$(RESCMP_)
endif

main: ready objects res link final

clean:
	@rm -rf $(_OBJECTS)
	@echo Clean completed.

run:
	@gamemk.exe

$(BUILD_PATH)%.o: $(SOURCE_PATH)%.cpp
	@echo Compiling $< ...
	@$(CXX) -c $<		$(CXXFLAGS) -o		$@

ready:

final:
	@echo Build finished.

objects: $(_OBJECTS)

res: $(RESFILE)
	@echo Compiling Resource file...
	@$(RESCMP) $? -O coff -o $(_RESFILE_OUTPUT)

link:
	@echo Linking...
	@$(CXX) -o $(BINARY_PARH)/$(OUTPUT) $(LINK_OBJECTS) $(LDFLAGS)