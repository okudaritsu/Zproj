open System

[<EntryPoint>]
let main argv =
    if argv.Length > 0 then
        printfn "First argument: %s" argv[0]
    0