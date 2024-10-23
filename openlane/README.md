# Summary

## Arquitectura con 1 macro grande (Implementación realizada)

### fpu
Modulo fpu plano, sin macros

### user_project_wrapper
Plantilla para instanciar macro fpu en el espacio del usuario del Caravel.
De modo que solo queda una macro grande en el diseño.


## Arquitectura de macros fp.* dentro de macro fpu_wrapper (Problemas por querer hacer una macro con macros)

### fpu_wrapper
Modulo fpu con las macros fp_* instanciadas y compuertas lógicas para interconexion.

Solo funciona con DESIGN_IS_CORE = FP_PDN_MULTILAYER = 1, pero se necesita que sea 0.

Si DESIGN_IS_CORE = FP_PDN_MULTILAYER = 1 el flujo completa correctamente, pero queda con straps de metal 5 y da erorr de IR drop al ejecutar con user_project_wrapper (quedan vias de la macro sin conectar a metal 6)

Si DESIGN_IS_CORE = FP_PDN_MULTILAYER = 0 el flujo no completa

(Posible solución: PDN personalizada donde no se utilice metal 5 para los straps horizontales)



## Arquitectura de macros fp_* y compuertas para la interconexion (Falla en detailed routing)

Al modificar user_project_wrapper para instanciar la lógica de interconexion/mux y las macros fp_*.

Al intentar tener macros + celdas en user_project_wrapper, no se realiza el routing.

(Posible solución: mejorar el floorplan)


## Arquitectura de macros fp_* y macro fpu_interconnect (violaciones de hold al final del flujo)

### fpu_interconect
Modulo para la interconexion entre los módulos fp_* (sin instancias en su interior).


## #user_project_wrapper_intercon
Plantilla para instanciar macros fpu_intercon y fp_* en el espacio del usuario del Caravel.
De modo que no quedan compuertas, solamente macros.







Refer to [README](docs/source/index.md) for this sample project documentation.
