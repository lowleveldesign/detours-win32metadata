@echo off

if "%1"=="" (
    echo Missing platform
    exit /b
)

if "%1" == "arm" (
    set "vc_arch=x86_arm"
) else if "%1" == "arm64" (
    set "vc_arch=x86_arm64"
) else (
    set "vc_arch=%1"
)

if EXIST "c:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" (
    call "c:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" %vc_arch%
) else (
    call "c:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" %vc_arch%
)

mkdir bin.%1
pushd bin.%1
cl.exe /I "..\..\detours\include" /nologo /LD /TP -DUNICODE /DWIN32 /D_WINDOWS /EHsc /W4 /WX /Zi /O2 /Ob1 /DNDEBUG -std:c++latest ../detours.cpp /link /DEF:../detours.def ../../detours/lib.%1/detours.lib
popd