module Main where
import qualified PROJECTNAME

import System.Environment (getArgs)
import System.Exit (exitSuccess)

main :: IO ()
main = do
    args <- getArgs
    case args of
        (firstArg:_) -> putStrLn ("First argument: " ++ firstArg)
        []           -> return ()
    exitSuccess