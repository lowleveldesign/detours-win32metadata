
if EXIST "c:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" (
    @call "c:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64
) else (
    @call "c:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
)

@mkdir bin.X64
@pushd bin.X64
@cl.exe /I "..\..\detours\include" /nologo /LD /TP -DUNICODE /DWIN32 /D_WINDOWS /EHsc /W4 /WX /Zi /O2 /Ob1 /DNDEBUG -std:c++latest ../detours.cpp /link /DEF:../detours.def ../../detours/lib.X64/detours.lib
@popd