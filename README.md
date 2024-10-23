# Caravel User Project

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

| :exclamation: Important Note            |
|-----------------------------------------|

## Instrucciones:
- 1) Clonar un repositorio caravel_user_project (o este mismo)
- 2) "make setup"
- 3) Sustituir directorios verilog y openlane por los de este repositorio (si se clono el repo original caravel_user_project)

## Arquitectura de una sola macro
- "make fpu"
- "make user_project_wrapper"

## Arquitectura con macros fp_* y macro fpu_interconnect
- un make para cada fp_* (por el momento solo fp_add y fp_comp)
- "make fpu_interconnect"
- "make user_project_wrapper_intercon"


Refer to [README](docs/source/index.md) for this sample project documentation.
