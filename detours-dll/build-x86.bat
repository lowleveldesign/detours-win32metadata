
if EXIST "c:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" (
    @call "c:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x86
) else (
    @call "c:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
)

@mkdir bin.X86
@pushd bin.X86
@cl.exe /I "..\..\detours\include" /nologo /LD /TP -DUNICODE /DWIN32 /D_WINDOWS /EHsc /W4 /WX /Zi /O2 /Ob1 /DNDEBUG -std:c++latest ../detours.cpp /link /DEF:../detours.def ../../detours/lib.X86/detours.lib
@popd
