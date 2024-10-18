import json

def json_to_tcl(json_file, tcl_file):
    try:
        # Cargar el archivo JSON
        with open(json_file, 'r') as f:
            data = json.load(f)

        # Crear el archivo TCL
        with open(tcl_file, 'w') as f:
            f.write("# Archivo TCL generado desde JSON\n\n")

            # Iterar sobre el contenido JSON y escribir en formato Tcl
            for key, value in data.items():
                # Si es un valor simple (cadena, número, etc.)
                if isinstance(value, (str, int, float)):
                    f.write(f"set {key} {value}\n")
                # Si es una lista
                elif isinstance(value, list):
                    value_str = " ".join(map(str, value))
                    f.write(f"set {key} {{{value_str}}}\n")
                # Si es un diccionario anidado, escribirlo también
                elif isinstance(value, dict):
                    for sub_key, sub_value in value.items():
                        if isinstance(sub_value, (str, int, float)):
                            f.write(f"set {key}_{sub_key} {sub_value}\n")
                        elif isinstance(sub_value, list):
                            sub_value_str = " ".join(map(str, sub_value))
                            f.write(f"set {key}_{sub_key} {{{sub_value_str}}}\n")
            print(f"Archivo {tcl_file} generado con éxito.")

    except Exception as e:
        print(f"Error: {e}")

# Uso del programa
json_file = "user_project_wrapper/congif.json"  # Reemplazar con el nombre de tu archivo JSON
tcl_file = "archivo.tcl"    # Nombre del archivo de salida en formato TCL

json_to_tcl(json_file, tcl_file)
