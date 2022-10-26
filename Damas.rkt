#lang racket
(#%require (only racket/base random))
(require (lib "Graphics.ss" "graphics"))

(open-graphics)

; Dimensiones de la ventana del tablero
(define dimensionX 700)
(define dimensionY 700)

; Cantidad de cuadros
(define cantidadCuadros 64)

; Dimensiones cuadros
(define dimensionCuadros 75)

; Sumatoria de pixeles
(define sumaPx 75)

; Creacion de la ventana
(define ventana(open-viewport "Damas - Programacion 1" dimensionX dimensionY))
;((draw-rectangle ventana (make-posn 50 50) dimensionCuadros dimensionCuadros "black"))


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

(dibujarTablero 1 cantidadCuadros 1 50 50 0)
