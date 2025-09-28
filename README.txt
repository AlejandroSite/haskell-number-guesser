# 🧠 Adivina el Número en Haskell

Un minijuego simple implementado en Haskell. El objetivo es que el jugador adivine un número secreto entre 1 y 100 en un máximo de 7 intentos.

## Características de Haskell Demostradas
* **Mónada IO:** Manejo de la entrada (`getLine`), la salida (`putStrLn`) y los efectos secundarios (generación de números aleatorios con `randomRIO`).
* **Recursión:** El bucle del juego (`gameLoop`) se implementa usando recursión, que es la forma idiomática de crear ciclos en Haskell.
* **Funciones Puras:** La lógica de validación de entrada (`parseInput`) y la lógica de comparación son puras.

## Cómo Compilar y Ejecutar

Para ejecutar este proyecto, necesitarás tener instalado el **Glasgow Haskell Compiler (GHC)**.

1.  **Clonar el repositorio:**
    ```bash
    git clone [URL_DE_TU_REPOSITORIO]
    cd haskell-number-guesser
    ```

2.  **Compilar:**
    ```bash
    ghc Main.hs
    ```

3.  **Ejecutar:**
    ```bash
    ./Main 
    # o Main.exe si estás en Windows
    ```