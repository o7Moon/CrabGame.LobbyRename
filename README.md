# CrabGame.LobbyRename
usage:
- be the host
- type `/rename <new_name>` in the chat box. it will not clear the chat box but the lobby name will be changed when you hit enter.

# why is it .il what the hell
this is part of an experiment i'm doing to see how usable non-c# cli languages are for bepinex/il2cpp modding. this one was a low hanging fruit since its essentially c#'s compile target in the first place.

# ok how do i build it
- have ilasm (this comes with VS on windows and is in a nuget package on linux)
- run build.bat on windows or build.sh on linux
- profit
