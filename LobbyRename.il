.assembly extern '0Harmony' {}
.assembly extern 'Assembly-CSharp' {}
.assembly extern BepInEx.Core {}
.assembly extern BepInEx.IL2CPP {}
.assembly extern netstandard {}
.assembly extern 'Assembly-CSharp-firstpass' {}

.assembly LobbyRename {}

.class public auto ansi beforefieldinit LobbyRename.Plugin extends [BepInEx.IL2CPP]BepInEx.IL2CPP.BasePlugin {
    // "LobbyRename", "LobbyRename", "1.0.0"
    .custom instance void [BepInEx.Core]BepInEx.BepInPlugin::.ctor(string, string, string) = (
		01 00 0b 4c 6f 62 62 79 52 65 6e 61 6d 65 0b 4c
		6f 62 62 79 52 65 6e 61 6d 65 05 31 2e 30 2e 30
		00 00
	)

    .method public hidebysig virtual instance void Load() cil managed
    {
        .locals init(
            [0] class[netstandard]System.Reflection.MethodInfo,
            [1] class['0Harmony']HarmonyLib.HarmonyMethod
        )

        ldstr "LobbyRename.HarmonyPatcher"
        newobj instance void class ['0Harmony']HarmonyLib.Harmony::.ctor(string)

        // ChatBox
        ldtoken class['Assembly-CSharp']MonoBehaviourPublicRaovTMinTemeColoonCoUnique
        call class[netstandard]System.Type [netstandard]System.Type::GetTypeFromHandle(valuetype [netstandard]System.RuntimeTypeHandle)

        ldstr "SendMessage"
        // method parameter types array (this is an overload so it'd throw AmbiguousMatchException if this was excluded)
        ldc.i4.1
        newarr [netstandard]System.Type
        dup
        ldc.i4.0
        ldtoken class[netstandard]System.String
        call class[netstandard]System.Type [netstandard]System.Type::GetTypeFromHandle(valuetype [netstandard]System.RuntimeTypeHandle)
        stelem class[netstandard]System.Type

        call instance class[netstandard]System.Reflection.MethodInfo [netstandard]System.Type::GetMethod(string, class[netstandard]System.Type[])
        stloc.0

        ldtoken LobbyRename.Plugin
        call [netstandard]System.Type [netstandard]System.Type::GetTypeFromHandle(valuetype [netstandard]System.RuntimeTypeHandle)
        ldstr "onMessage"
        call instance class[netstandard]System.Reflection.MethodInfo [netstandard]System.Type::GetMethod(string)
        newobj instance void ['0Harmony']HarmonyLib.HarmonyMethod::.ctor([netstandard]System.Reflection.MethodInfo)

        stloc.1
        ldloc.0
        ldloc.1

        ldnull
        ldnull
        ldnull
        ldnull

        callvirt instance class[netstandard]System.Reflection.MethodInfo ['0Harmony']HarmonyLib.Harmony::Patch(class[netstandard]System.Reflection.MethodBase, class['0Harmony']HarmonyLib.HarmonyMethod, class['0Harmony']HarmonyLib.HarmonyMethod, class['0Harmony']HarmonyLib.HarmonyMethod, class['0Harmony']HarmonyLib.HarmonyMethod, class['0Harmony']HarmonyLib.HarmonyMethod)
        pop

        ret
    }

    .method public static bool onMessage(
        class['Assembly-CSharp']MonoBehaviourPublicRaovTMinTemeColoonCoUnique __instance,
        string __0
    ){
        .locals init (
            [0] string
        )

        ldarg.1
        dup
        ldstr "/rename "
        call instance bool [netstandard]System.String::StartsWith(string)
        ldc.i4.0
        beq pop_return_true

        ldc.i4.7
        call instance string [netstandard]System.String::Substring(int32)
        call instance string [netstandard]System.String::Trim()  
        stloc.0

        call class ['Assembly-CSharp']MonoBehaviourPublicObInUIgaStCSBoStcuCSUnique ['Assembly-CSharp']MonoBehaviourPublicObInUIgaStCSBoStcuCSUnique::get_Instance()
        callvirt instance valuetype ['Assembly-CSharp-firstpass']SteamworksNative.CSteamID ['Assembly-CSharp']MonoBehaviourPublicObInUIgaStCSBoStcuCSUnique::get_currentLobby()

        ldstr "LobbyName"
        ldloc.0      
        call bool ['Assembly-CSharp-firstpass']SteamworksNative.SteamMatchmaking::SetLobbyData(['Assembly-CSharp-firstpass']SteamworksNative.CSteamID, [netstandard]System.String, [netstandard]System.String)
        pop

        ldc.i4.0// return false
        ret

pop_return_true:
        pop
        ldc.i4.1// return true
        ret
    }

    .method public rtspecialname specialname instance void .ctor() cil managed {
        .maxstack 1
        ldarg.0 
        call instance void [BepInEx.IL2CPP]BepInEx.IL2CPP.BasePlugin::.ctor()
        ret
    }
}