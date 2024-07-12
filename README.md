
Detours.Win32Metadata
=====================

This project contains code to build and publish the [Detours.Win32Metadata](https://www.nuget.org/packages/Detours.Win32Metadata) nuget package. The package wraps the [Detours library](https://github.com/microsoft/Detours) into a winmd (Windows metadata) file. If you combine it with [Microsoft.Windows.CsWin32](https://www.nuget.org/packages/Microsoft.Windows.CsWin32), it will allow you to generate signatures (PInvokes) to easily use Detours functions in your executable/library.

Who is it for
-------------

You may profit from this package if you plan to use the Detours library in your project, for example, to implement a hook on a native function or to inject a DLL into a remote process.

How to use it
-------------

1. Install the required Nuget packages:

- [Microsoft.Windows.CsWin32](https://www.nuget.org/packages/Microsoft.Windows.CsWin32)
- [Detours.Win32Metadata](https://www.nuget.org/packages/Detours.Win32Metadata)

2. Create a NativeMethods.txt file in the root folder of your project and list native functions and structures (including the one from Detours) you plan to use, for example:

```
// Windows
CreateProcess
OpenProcess
VirtualAllocEx
VirtualFreeEx
WriteProcessMemory
ReadProcessMemory

WIN32_ERROR
NTSTATUS

// Detours
DetourCreateProcessWithDllsW
```

Please also check the [cswin32 project README file](https://github.com/microsoft/CsWin32/blob/main/README.md) for other configuration options of the PInvoke generators.

3. You are ready to use the native functions in your code :)

Please check [a blog post](https://lowleveldesign.wordpress.com/2024/07/11/implementing-a-native-function-detour-in-csharp/) on my blog where I present how to create a native function hook using Detours.Win32Metadata. My other project, [withdll](https://github.com/lowleveldesign/withdll), also uses this package to start a new process with an injected DLL.
