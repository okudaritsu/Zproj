-module(projectname).
-export([main/1]).
main(Args) ->
    io:format("Let's run Zproj.~n"),
    case Args of
        [FirstArg | _] -> 
            io:format("First argument: ~s~n", [FirstArg]);
        [] -> 
            ok
    end,
    init:stop(0).