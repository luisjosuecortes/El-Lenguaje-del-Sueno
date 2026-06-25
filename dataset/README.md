# Dataset unificado

Carpeta generada por `notebooks/1_construir_dataset.ipynb`.
Combina los tres datasets (CAP, Sleep-EDF, Scoring) en archivos únicos con esquema homogéneo.

## Archivos

### `epocas_unificado.csv`
Una fila por época (30 s).

| columna     | tipo    | descripción                                                     |
|-------------|---------|-----------------------------------------------------------------|
| dataset     | str     | `CAP`, `EDF` o `SCO`                                            |
| paciente    | str     | ID estilo CAP (`CAP_S01_N1`, `EDF_S01_N1`, `SCO_AA_N1`, …)      |
| epoca       | int     | 1..N consecutiva dentro del paciente                            |
| tiempo      | str     | `HH:MM:SS` reloj real desde el inicio del registro              |
| fase_texto  | str     | `Vigilia`, `S1`, `S2`, `SWS`, `REM`, `Sin_clasificar`           |
| fase_num    | int     | 0..5 (corresponde 1-a-1 con `fase_texto`)                       |

### `pacientes_unificado.csv`
Una fila por paciente.

| columna    | tipo  | descripción                                                |
|------------|-------|------------------------------------------------------------|
| dataset    | str   | `CAP`, `EDF` o `SCO`                                       |
| paciente   | str   | ID del paciente                                            |
| sexo       | str   | `M`/`F` (NaN en Scoring)                                   |
| edad       | int   | años (NaN en Scoring)                                      |
| n_epocas   | int   | número total de épocas                                     |
| duracion_h | float | n_epocas / 120                                             |

## Mapeo de fases (común a los 3 datasets)

| fase_num | fase_texto       | nota                              |
|----------|------------------|-----------------------------------|
| 0        | Vigilia          |                                   |
| 1        | S1               |                                   |
| 2        | S2               |                                   |
| 3        | SWS              | fusión de S3 y S4 (clásico R&K)   |
| 4        | REM              |                                   |
| 5        | Sin_clasificar   | incluye Movimiento y `?`          |

## Reproducir

```
jupyter nbconvert --to notebook --execute --inplace \
  notebooks/1_construir_dataset.ipynb
```

## Fuentes

- `Datos/datos_internet/cap/epocas_cap.csv` + `gender-age.xlsx`
- `Datos/datos_internet/sleep_edf/epocas_sleep_edf.csv` + `SC-subjects.xls`
- `Datos/datos_internet/scoring/epocas_scoring.csv` (sin demografía)
