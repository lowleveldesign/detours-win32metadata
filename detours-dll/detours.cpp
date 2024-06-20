
#include <windows.h>

BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved) {
    UNREFERENCED_PARAMETER(lpReserved);

    switch (ul_reason_for_call) {
    case DLL_PROCESS_ATTACH:
    {
        ::DisableThreadLibraryCalls(hModule);
    }
    case DLL_PROCESS_DETACH:
    {
        break;
    }
    }
    return TRUE;
}
