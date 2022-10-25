#lang racket
(#%require (only racket/base random))
(require (lib "Graphics.ss" "graphics"))

(open-graphics)

; Dimensiones de la ventana del tablero
(define dimensiones)