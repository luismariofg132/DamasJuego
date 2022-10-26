#lang racket
(#%require (only racket/base random))
(require (lib "Graphics.ss" "graphics"))
(open-graphics)
#|
---------------------------------------------------------------------------------
                      Inicio variables de configuracion del tablero
                                     no mover!!!!
---------------------------------------------------------------------------------
|#

; Dimensiones de la ventana del tablero
(define dimensionX 700)
(define dimensionY 700)

; Cantidad de cuadros
(define cantidadCuadros 64)

; Dimensiones cuadros
(define dimensionCuadros 75)

; Sumatoria de pixeles
(define sumaPx 75)

; Define el titulo de la ventana
(define tituloVentana "Juego Damas - Programacion 1 - Juan D Malagon - Susana M Perez - Luis M Franco")

; Define dos listas para las guias del tablero
(define listaLetras (list "A" "B" "C" "D" "E" "F" "G" "H"))
(define listaNumeros (list "1" "2" "3" "4" "5" "6" "7" "8"))

; Define el incremento en (X,Y) de las guias
(define incXYGuia 75)


#|
---------------------------------------------------------------------------------
                    Fin de las variables de configuracion del tablero                                    
---------------------------------------------------------------------------------
|#

; Creacion de la ventana
(define ventana(open-viewport tituloVentana dimensionX dimensionY))

; Funcion recursiva encargada de dibujar las guias del tablero
(define (dibujarGuias cantidadNeto cantidadTotal posX posY)
  ((draw-string ventana) (make-posn posX 40) (list-ref listaLetras cantidadNeto) "black")
  ((draw-string ventana) (make-posn 25  posY) (list-ref listaNumeros cantidadNeto) "black")
  (cond
    [(equal? cantidadNeto cantidadTotal)(display "Guias dibujadas")]
    [else (dibujarGuias (+ cantidadNeto 1) cantidadTotal  (+ posX incXYGuia) (+ posY incXYGuia))]
    )
  )


; Funcion recursiva encargada de pintar el tablero
(define (dibujarTablero cantidadNeto cantidadTotal color posX posY cantidadFila)
  (if (equal? color 1)
      ((draw-solid-rectangle ventana)(make-posn posX posY) dimensionCuadros dimensionCuadros "black")
      ((draw-rectangle ventana)(make-posn posX posY) dimensionCuadros dimensionCuadros "black"))
  (cond
    [(equal? cantidadNeto cantidadTotal)(display "Tablero dibujado")]
    [(and (equal? cantidadFila 7) (equal? color 1))(dibujarTablero (+ cantidadNeto 1) cantidadTotal 1 50 (+ posY sumaPx) 0)]
    [(and (equal? cantidadFila 7) (equal? color 2))(dibujarTablero (+ cantidadNeto 1) cantidadTotal 2 50 (+ posY sumaPx) 0)]
    [(equal? color 1)(dibujarTablero (+ cantidadNeto 1) cantidadTotal 2 (+ posX sumaPx) posY (+ cantidadFila 1))]
    [(equal? color 2)(dibujarTablero (+ cantidadNeto 1) cantidadTotal 1 (+ posX sumaPx) posY (+ cantidadFila 1))]
    )
  )

#|
------------------------------------------------------------------------------
                              Disparador de eventos
------------------------------------------------------------------------------
↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
|#

(define (disparador)
  (dibujarTablero 1 cantidadCuadros 1 50 50 0)
  (dibujarGuias 0 (- (length listaLetras) 1) 75 100 )
  )
(disparador)
