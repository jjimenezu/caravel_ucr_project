# Bitácora de ejecuciones del flujo



## fpu
Modulo fpu con arquitectura de prueba para hacer test

[run: 24_10_19_01_51]
- (Flow Complete)
- Disminución de área
- Disminucion parametro FANOUT_CONSTRAINT a 8
- Agregar R a la cordenada norte para probar orden de pines

[run: 24_10_19_05_35]
-
- Se disminuye mas el área
- Se eliminan configuraciones resizer_slack (se dejan por defecto). Para mejorar tiempo de ejecución


## fp_comp
Modulo comparador de valores en punto flotante

[run: 24_10_19_06_36]
- (Flow Complete)
- Se sintetiza con estrategia AREA2 para minimizar número de compuertas (con el fin de disminuir el tiempo de ejecución)




## user_project_wrapper
Plantilla para incrustar diseño en el espacio del usuario del Caravel.

[run: 24_10_19_04_47]
- (Flow Complete)
- Se usa la macro FPU run: 24_10_19_01_51
- Se cambia la posicion de la macro en macro.cfg para centrarla




## TODO
- probar parametro STD_CELL_LIBRARY_OPT: Specifies the standard cell library to be used during resizer optimizations.


Refer to [README](docs/source/index.md) for this sample project documentation.
