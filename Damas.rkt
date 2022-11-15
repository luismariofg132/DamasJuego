#lang racket
(#%require (only racket/base random))
(require (lib "Graphics.ss" "graphics"))
(require racket/gui)
(open-graphics)
#|
---------------------------------------------------------------------------------
                      Inicio variables de configuracion del tablero
                                     no mover!!!!
---------------------------------------------------------------------------------
|#

; Dimensiones de la ventana del tablero
(define dimensionX 1200)
(define dimensionY 700)

; Cantidad de cuadros
(define cantidadCuadros 64)

; Dimensiones cuadros
(define dimensionCuadros 75)

; Sumatoria de pixeles
(define sumaPx 75)

; Define el titulo de la ventana
(define tituloVentana "Juego Damas - Programacion 1 - Juan D Malagon - Susana M Perez - Luis M Franco")

; Define el mensaje de bienvenida
(define mensajeBienvenida (list "Bienvenid@ al juego" "Cada jugador debera introducior" "la coordenada de inicio y la de fin para hacer un movimiento"
                                 "Ejemplo: A2 - B4"))

; Define dos listas para las guias del tablero
(define listaLetras (list "A" "B" "C" "D" "E" "F" "G" "H"))
(define listaNumeros (list "1" "2" "3" "4" "5" "6" "7" "8"))

; Define el incremento en (X,Y) de las guias
(define incXYGuia 75)

; Color que empieza a jugar
(define colorInicial "Verde")

; Define las posiciones iniciales y finales
(define posicion "")


#|
--------------------------------------------------------------------------------
Bloque de codigo encargado de crear las posiciones son exactamente 64 posiciones                              
--------------------------------------------------------------------------------
|#
(define a1(make-posn 50 50))
(define a2(make-posn 125 50))
(define a3(make-posn 200 50))
(define a4(make-posn 275 50))
(define a5(make-posn 350 50))
(define a6(make-posn 425 50))
(define a7(make-posn 500 50))
(define a8(make-posn 575 50))

(define b1(make-posn 50 125))
(define b2(make-posn 125 125))
(define b3(make-posn 200 125))
(define b4(make-posn 275 125))
(define b5(make-posn 350 125))
(define b6(make-posn 425 125))
(define b7(make-posn 500 125))
(define b8(make-posn 575 125))

(define c1(make-posn 50 200))
(define c2(make-posn 125 200))
(define c3(make-posn 200 200))
(define c4(make-posn 275 200))
(define c5(make-posn 350 200))
(define c6(make-posn 425 200))
(define c7(make-posn 500 200))
(define c8(make-posn 575 200))

(define d1(make-posn 50 275))
(define d2(make-posn 125 275))
(define d3(make-posn 200 275))
(define d4(make-posn 275 275))
(define d5(make-posn 350 275))
(define d6(make-posn 425 275))
(define d7(make-posn 500 275))
(define d8(make-posn 575 275))

(define e1(make-posn 50 350))
(define e2(make-posn 125 350))
(define e3(make-posn 200 350))
(define e4(make-posn 275 350))
(define e5(make-posn 350 350))
(define e6(make-posn 425 350))
(define e7(make-posn 500 350))
(define e8(make-posn 575 350))

(define f1(make-posn 50 425))
(define f2(make-posn 125 425))
(define f3(make-posn 200 425))
(define f4(make-posn 275 425))
(define f5(make-posn 350 425))
(define f6(make-posn 425 425))
(define f7(make-posn 500 425))
(define f8(make-posn 575 425))

(define g1(make-posn 50 500))
(define g2(make-posn 125 500))
(define g3(make-posn 200 500))
(define g4(make-posn 275 500))
(define g5(make-posn 350 500))
(define g6(make-posn 425 500))
(define g7(make-posn 500 500))
(define g8(make-posn 575 500))

(define h1(make-posn 50 575))
(define h2(make-posn 125 575))
(define h3(make-posn 200 575))
(define h4(make-posn 275 575))
(define h5(make-posn 350 575))
(define h6(make-posn 425 575))
(define h7(make-posn 500 575))
(define h8(make-posn 575 575))

(define posiciones(list a1 a2 a3 a4 a5 a6 a7 a8 b1 b2 b3 b4 b5 b6 b7 b8 c1 c2 c3 c4 c5 c6 c7 c8 d1 d2 d3 d4 d5 d6 d7 d8 e1 e2 e3 e4 e5 e6 e7 e8 f1 f2 f3
                        f4 f5 f6 f7 f8 g1 g2 g3 g4 g5 g6 g7 g8 h1 h2 h3 h4 h5 h6 h7 h8))

(define posicionesString (list "a1" "a2" "a3" "a4" "a5" "a6" "a7" "a8" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "c1" "c2" "c3" "c4" "c5" "c6" "c7" "c8" "d1" "d2"
                               "d3" "d4" "d5" "d6" "d7" "d8" "e1" "e2" "e3" "e4" "e5" "e6" "e7" "e8" "f1" "f2" "f3" "f4" "f5" "f6" "f7" "f8" "g1" "g2" "g3" "g4"
                               "g5" "g6" "g7" "g8" "h1" "h2" "h3" "h4" "h5" "h6" "h7" "h8"))

(define posicionesProhibidas(list a2 a4 a6 a8 b1 b3 b5 b7 c2 c4 c6 c8 d1 d3 d5 d7 e2 e4 e6 e8 f1 f3 f5 f7 g2 g4 g6 g8 h1 h3 h5 h7 ))

(define posicionesProhibidasString (list "a2" "a4" "a6" "a8" "b1" "b3" "b5" "b7" "c2" "c4" "c6" "c8" "d1" "d3" "d5" "d7" "e2" "e4"
                                         "e6" "e8" "f1" "f3" "f5" "f7" "g2" "g4" "g6" "g8" "h1" "h3" "h5" "h7" ))

(define fichasVerdes(list a1 a3 a5 a7 b2 b4 b6 b8 c1 c3 c5 c7))
(define fichasRojas (list f2 f4 f6 f8 g1 g3 g5 g7 h2 h4 h6 h8))

#|
---------------------------------------------------------------------------------
                    Tablero con las posiciones iniciales                                   
---------------------------------------------------------------------------------
|#

; Creacion de la ventana
(define ventana(open-viewport tituloVentana dimensionX dimensionY))

; Funcion recursiva encargada de dibujar el letrero de bienvenida
(define (dibujarBienvenida cantidadNeto cantidadTotal posY)
  ((draw-string ventana) (make-posn 700 posY) (list-ref mensajeBienvenida cantidadNeto) "black")
  (if (equal? cantidadNeto cantidadTotal)(display "Bienvenida dibujada ")
      (dibujarBienvenida (+ cantidadNeto 1) cantidadTotal (+ posY 20))
      )
  )

; Funcion recursiva encargada de dibujar las guias del tablero
(define (dibujarGuias cantidadNeto cantidadTotal posX posY)
  ((draw-string ventana) (make-posn posX 40) (list-ref listaNumeros cantidadNeto) "black")
  ((draw-string ventana) (make-posn 25  posY) (list-ref listaLetras cantidadNeto) "black")
  (cond
    [(equal? cantidadNeto cantidadTotal)(display "Guias dibujadas ")]
    [else (dibujarGuias (+ cantidadNeto 1) cantidadTotal  (+ posX incXYGuia) (+ posY incXYGuia))]
    )
  )


; Funcion recursiva encargada de pintar el tablero
(define (dibujarTablero cantidadNeto cantidadTotal color posX posY cantidadFila)
  (if (equal? color 1)
      ((draw-solid-rectangle ventana)(make-posn posX posY) dimensionCuadros dimensionCuadros "black")
      ((draw-rectangle ventana)(make-posn posX posY) dimensionCuadros dimensionCuadros "black"))
  (cond
    [(equal? cantidadNeto cantidadTotal)(display "Tablero dibujado ")]
    [(and (equal? cantidadFila 7) (equal? color 1))(dibujarTablero (+ cantidadNeto 1) cantidadTotal 1 50 (+ posY sumaPx) 0)]
    [(and (equal? cantidadFila 7) (equal? color 2))(dibujarTablero (+ cantidadNeto 1) cantidadTotal 2 50 (+ posY sumaPx) 0)]
    [(equal? color 1)(dibujarTablero (+ cantidadNeto 1) cantidadTotal 2 (+ posX sumaPx) posY (+ cantidadFila 1))]
    [(equal? color 2)(dibujarTablero (+ cantidadNeto 1) cantidadTotal 1 (+ posX sumaPx) posY (+ cantidadFila 1))]
    )
  )

; Funcion encargada de dibujar el color que lleva el turno
(define (colorTurno color anterior)
  ((draw-string ventana) (make-posn 700 150) (string-append "El turno lo tienen las fichas de color: " anterior) "white")
  ((draw-string ventana) (make-posn 700 150) (string-append "El turno lo tienen las fichas de color: " color) "black")
  )

(define (dibujarFichas)
  (map (lambda (x) ((draw-solid-ellipse ventana) x 75 75 "green") ) fichasVerdes)
  (map (lambda (x) ((draw-solid-ellipse ventana) x 75 75 "red") ) fichasRojas)
  )

#|
---------------------------------------------------------------------------------
Bloque de codigo encargado de recibir los comandos por teclado
---------------------------------------------------------------------------------
|#
; Funcion que se encarga de dibujar las instrucciones para el jugador
(define (dibujarInstruccion instruccion anterior)
  ((draw-string ventana) (make-posn 700 170) (string-append  anterior) "white")
  ((draw-string ventana) (make-posn 700 170) (string-append  instruccion) "black")
  )

; Funcion encargada de capturar el valor de las teclas
(define (capturarTecla)
  (define letraCap (key-value(get-key-press ventana)))
  (cond
    ((not (equal? letraCap 'release)) (string letraCap))
    (else " ")
    )
  )

; Funcion encargada de capturar la posicion inicial
(define (capPosicion)
  (define letra1 (capturarTecla))
  (define letra2 (capturarTecla))
  (define letra3 (capturarTecla))
  (string-append letra1 letra3)
  )

#|
---------------------------------------------------------------------------------
Bloque de codigo encargado de hacer las validaciones de los movimientos
---------------------------------------------------------------------------------
|#

; Funcion que valida si un elemento se encuentra dentro de una lista de forma recursiva
(define (encontrarValor lista valor contador)
  (if (equal? contador (length lista)) #f
      (if (equal? (list-ref lista contador) valor) #t
          (encontrarValor lista valor (+ contador 1))
          )
      )
  )

; Funcion encargada de validar si la ficha va a caer en un cuadro blanco
(define (validarCuadrosBlanco posFinal)
  (if (encontrarValor posicionesProhibidasString posFinal 0) #t #f)
)



#|
------------------------------------------------------------------------------
Funcion disparador encargada de levantar el tablero, fichas y llamar la
funcion encargada de escuchar las teclas
------------------------------------------------------------------------------
|#

(define (disparador)
  (dibujarTablero 1 cantidadCuadros 1 50 50 0)
  (dibujarGuias 0 (- (length listaLetras) 1) 75 100 )
  (dibujarBienvenida 0 (- (length mensajeBienvenida) 1) 60)
  (colorTurno colorInicial colorInicial)
  (dibujarInstruccion  "Ingrese la posicion inicial" "Ingrese la posicion inicial")
  (dibujarFichas)
  
  (validarCuadrosBlanco "h7")
  )
(disparador)

