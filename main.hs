-- Se necesitan estas bibliotecas para el proyecto:
import System.Random (randomRIO) -- Para generar el número aleatorio.
import Control.Monad (unless)    -- Para controlar el bucle del juego de forma elegante.

-- | Función principal que inicia el juego.
main :: IO ()
main = do
    putStrLn "¡Bienvenido a Adivina el Número en Haskell!"
    putStrLn "Estoy pensando en un número entre 1 y 100..."
    
    -- Generar el número secreto dentro de la Mónada IO
    secreto <- randomRIO (1, 100) :: IO Int 
    
    -- Iniciar el bucle del juego con el número secreto y 7 intentos
    gameLoop secreto 7

-- | El bucle principal del juego.
-- Toma el número secreto y el número de intentos restantes.
gameLoop :: Int -> Int -> IO ()
gameLoop secreto intentosRestantes = do
    -- 1. Verificar condición de derrota
    unless (intentosRestantes > 0) $ do
        putStrLn $ "¡Agotaste tus intentos! El número secreto era: " ++ show secreto
        return () -- Detiene la ejecución del 'do'
    
    -- 2. Pedir entrada al usuario
    putStrLn $ "\nIntentos restantes: " ++ show intentosRestantes
    putStr "Introduce tu suposición: "
    inputStr <- getLine
    
    -- 3. Convertir y validar la entrada (lógica pura)
    let mGuess = parseInput inputStr
    
    case mGuess of
        Nothing -> do
            putStrLn "Entrada no válida. Por favor, introduce un número."
            gameLoop secreto intentosRestantes -- Repetir sin gastar un intento
        
        Just suposicion -> 
            -- 4. Ejecutar la lógica de comparación
            if suposicion == secreto
                then putStrLn "¡Felicidades! ¡Adivinaste el número!"
                else do
                    putStrLn $ if suposicion < secreto 
                                then "Demasiado bajo. Intenta de nuevo."
                                else "Demasiado alto. Intenta de nuevo."
                    
                    -- 5. Llamada Recursiva (el corazón del bucle de juego)
                    gameLoop secreto (intentosRestantes - 1)

-- | Lógica pura para convertir la entrada de texto en un número Int.
-- Devuelve Just Int si tiene éxito, Nothing en caso de fallo.
parseInput :: String -> Maybe Int
parseInput s = 
    case reads s of
        [(n, "")] -> Just n  -- Éxito: se leyó un número 'n' y no quedó nada ("")
        _         -> Nothing -- Fallo