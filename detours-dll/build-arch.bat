@echo off

if "%1" == "" (
    echo Missing platform
    exit /b -1
)

if /i "%1" == "arm" (
    set "vc_arch=x86_arm"
) else if /i "%1" == "arm64" (
    set "vc_arch=x86_arm64"
) else (
    set "vc_arch=%1"
)

if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" %vc_arch%
) else if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" (
    call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" %vc_arch%
) else if exist "C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Auxiliary\Build\vcvarsall.bat" (
    call "C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Auxiliary\Build\vcvarsall.bat" %vc_arch%
) else (
    echo vcvarsall.bat not found
    exit /b -1
)

if exist bin.%1 (
    @rmdir /S /Q bin.%1
)

mkdir bin.%1
pushd bin.%1
cl.exe /I "..\..\detours\include" /nologo /LD /TP -DUNICODE /DWIN32 /D_WINDOWS /EHsc /W4 /WX /Zi /O2 /Ob1 /DNDEBUG -std:c++latest ../detours.cpp /link /DEF:../detours.def ../../detours/lib.%1/detours.lib
popd