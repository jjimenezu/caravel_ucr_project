import csv
import os
import glob
import sys


def sta_summary_extract (filepath, keyphrases):
    extracted_data = []
    line_count = 0
    print(glob.glob(filepath))
    print(filepath)
    with open(filepath, 'r') as file:
        for line in file:
            line_count -= 1
            for phrase in keyphrases:
                if phrase in line:
                    line_count = 2
            if line_count == 0:
                    extracted_data.append(line)
    return extracted_data

# def extract_data_from_csv(filepath, columns):
#     """Extrae datos específicos de columnas desde un archivo CSV."""
#     extracted_data = []
#     with open(filepath, 'r') as file:
#         reader = csv.DictReader(file)
#         for row in reader:
#             extracted_row = {col: row[col] for col in columns if col in row}
#             extracted_data.append(extracted_row)
#     return extracted_data

# def save_summary_to_csv(data, output_file):
#     """Guarda los datos extraídos en un archivo CSV."""
#     if not data:
#         return
#     headers = data[0].keys()
#     with open(output_file, 'w', newline='') as file:
#         writer = csv.DictWriter(file, fieldnames=headers)
#         writer.writeheader()
#         writer.writerows(data)

def main():

    # 
    run_path = sys.argv[1]
    print(run_path)

    # Configuración de los paths y archivos
    metrics_csv_path = run_path + "reports/metrics.csv"
    sta_summary_path = run_path + "reports/signoff/*rcx_sta_summary.rpt"

    output_summary = "data.csv"

    # Frases clave a buscar en los reportes
    metrics_csv_columns = ["design_name", "config", "flow_status", "total_runtime", "routed_runtime", "DIEAREA_mm^2"]
    sta_summary_keyphrases = ["report_worst_slack -max (Setup)", "report_worst_slack -min (Hold)"]


    summary_data = []



    ## Extraction
    sta_summary_data = sta_summary_extract(sta_summary_path, sta_summary_keyphrases)
    print(sta_summary_data)



    # for run_folder in os.listdir(report_directory):
    #     run_path = os.path.join(report_directory, run_folder)
    #     if os.path.isdir(run_path):
    #         # Extracción desde reportes de texto plano
    #         timing_data = extract_data_from_report(os.path.join(run_path, 'timing_report.rpt'), timing_key_phrases)
    #         area_data = extract_data_from_report(os.path.join(run_path, 'area_report.rpt'), area_key_phrases)
    #
    #         # Extracción desde archivos CSV
    #         power_data = extract_data_from_csv(os.path.join(run_path, 'power_report.csv'), power_columns)
    #
    #         # Resumen consolidado por ejecución
    #         run_summary = {
    #             "Run": run_folder,
    #             "Timing Report": timing_data,
    #             "Area Report": area_data,
    #             "Power Report": power_data
    #         }
    #         summary_data.append(run_summary)
    #
    # # Guardar el resumen en un archivo CSV
    # save_summary_to_csv(summary_data, output_summary)

if __name__ == "__main__":
    main()
