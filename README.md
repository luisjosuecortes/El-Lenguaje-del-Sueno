# El Lenguaje del Sueño: La Fase 2 como Hub Dinámico del Sueño Sano

Tesis de Licenciatura · **Luis Josué Cortés** · 2026
Director: Dr. Daniel Arzate Mena · Co-director: Dr. Jorge Hermosillo Valadez

📄 **Documento completo:** [`tesis.pdf`](tesis.pdf)

---

## Resumen

Esta tesis modela la dinámica de las transiciones del sueño combinando **Cadenas de
Markov** con técnicas de **Procesamiento de Lenguaje Natural** (Word2Vec y una red
recurrente **LSTM**). Sobre una cohorte unificada de **127 sujetos sanos** (112 809
épocas de tres bases polisomnográficas), el hipnograma se trata como una secuencia
simbólica en la que las fases del sueño son "palabras" y los ciclos "oraciones".

La idea central es que la **Fase 2 (S2)** —tradicionalmente vista como relleno entre
estados— funciona como un **hub dinámico**: su salida no es indiferente a su destino.
Tres hipótesis estructuran el trabajo:

- **H1 (estructura).** El sueño sano no es aleatorio: alta inercia de estado, ausencia
  del atajo SWS→REM y degradación ordenada de la estabilidad a lo largo de la noche.
- **H2 (lenguaje).** A una escala de tokenización de **N = 6 épocas (3 min)**, elegida
  por un criterio multi-objetivo (cercanía a la ley de Zipf, calidad del ajuste
  R² = 0.977, cobertura de los bloques de S2), la distribución de n-gramas es compatible
  con la de un lenguaje natural.
- **H3 (anticipación).** Una LSTM desplegada sobre la noche completa asigna probabilidad
  creciente al estado destino en los minutos previos a una transición real; una prueba
  de permutación respalda esta anticipación hacia **REM** (p = 0.02), marginal hacia SWS.
  El análisis geométrico del "deslizador" es **ilustrativo** del espacio de embeddings,
  pero su separación de trayectorias **no alcanza significancia** (p ≈ 0.31).

---

## Estructura del repositorio

```
.
├── tesis.pdf            ← documento final (lectura directa)
├── README.md
├── dataset/             ← cohorte unificada (punto de entrada reproducible)
│   ├── epocas_unificado.csv      (112 809 épocas, formato largo)
│   ├── pacientes_unificado.csv   (127 pacientes con demografía)
│   └── README.md                 (diccionario de columnas + preprocesamiento)
├── notebooks/           ← análisis (1 → 10) + figuras conceptuales
├── modelos/             ← Word2Vec y LSTM ya entrenados (.pt) — evitan reentrenar
├── estadisticas/        ← tablas de resultados (CSV)
├── imagenes/            ← figuras generadas (PNG + proyecciones UMAP interactivas .html)
└── latex/               ← fuente LaTeX del documento + recursos/img
```

## Notebooks

Todos leen rutas **relativas** a la raíz del repositorio.

| # | Notebook | Qué hace |
|---|----------|----------|
| 1 | `1_construir_dataset.ipynb` | Unifica CAP + Sleep-EDF + Scoring en `dataset/` (lee los CSV de `Datos/`, incluidos). |
| 2 | `2_estadisticas.ipynb` | Estadística descriptiva de la cohorte + matriz de transición global. |
| 3 | `3_hipnogramas.ipynb` | Un hipnograma por paciente con paleta unificada. |
| 4 | `4_matrices_transicion.ipynb` | Matrices de transición 5×5 (global y por renglón = P(destino\|origen)). |
| 5 | `5_diagnostico_ciclos.ipynb` | Diagnóstico de la detección de ciclos ultradianos (cobertura por dataset). |
| 6 | `6_matrices_por_ciclo.ipynb` | Matrices de transición por ciclo: cómo cambia la dinámica a lo largo de la noche. |
| 7 | `7_leyes_potencia_zipf.ipynb` | Elección de N = 6 (Zipf + duración de bloques S2 + cobertura). **R² = 0.977.** |
| 8 | `8_word2vec_embeddings.ipynb` | Word2Vec Skip-Gram sobre 6-gramas; similitud coseno, vecinos, UMAP 2D/3D. |
| 9 | `9_deslizador.ipynb` | Trayectorias anticipatorias S2→{REM,SWS}; control con 50 subrogadas (p ≈ 0.31). |
| 10 | `10_lstm_bifurcacion_s2.ipynb` | LSTM recurrente; anticipación de la transición; permutación de 50 redes barajadas (REM p = 0.02). |
| — | `figuras_ilustrativas.ipynb` | Figuras conceptuales del documento (intro, marco teórico, metodología). |

---

## Reproducción

```bash
# 1) Entorno (probado con Python 3.10)
conda create -n sueno python=3.10 && conda activate sueno
pip install -r requirements.txt

# 2) Ejecutar los notebooks en orden (el dataset ya viene incluido; el nb1 lo regenera desde Datos/)
cd notebooks
for nb in 1_construir_dataset 2_estadisticas 3_hipnogramas 4_matrices_transicion \
          5_diagnostico_ciclos 6_matrices_por_ciclo 7_leyes_potencia_zipf \
          8_word2vec_embeddings 9_deslizador 10_lstm_bifurcacion_s2; do
  jupyter nbconvert --to notebook --execute --inplace ${nb}.ipynb
done
```

> Los notebooks 8, 9 y 10 **reutilizan los modelos de `modelos/`** si existen (no reentrenan).
> Las pruebas de permutación guardan checkpoints en `estadisticas/`: si se interrumpen, al
> volver a ejecutar continúan donde quedaron. Borra esos archivos para forzar el cálculo completo.

### Compilar la tesis

```bash
cd latex
pdflatex tesis && bibtex tesis && pdflatex tesis && pdflatex tesis
```

---

## Datos

La cohorte combina **tres bases de sujetos sanos**:

| dataset | fuente | pacientes | épocas |
|---------|--------|-----------|--------|
| CAP | [CAP Sleep Database](https://physionet.org/content/capslpdb/) (PhysioNet) | 16 | 15 947 |
| EDF | [Sleep-EDF Expanded](https://physionet.org/content/sleep-edfx/) (PhysioNet, ≤ 65 años) | 82 | 70 410 |
| SCO | Scoring (laboratorio interno, no público) | 29 | 26 452 |
| **Total** | | **127** | **112 809** |

El dataset **ya unificado** se incluye en `dataset/`. Además, en `Datos/` se incluyen los
**hipnogramas ya extraídos** (3 CSV + 2 Excel de demografía, ~3.3 MB) que necesita el
**notebook 1**, de modo que **los 11 notebooks corren** tras clonar. La **señal cruda**
(archivos `.edf`, ~3.6 GB) **no** se incluye: solo la usó un paso de extracción anterior y
no hace falta para este pipeline (el `.gitignore` la bloquea para evitar subirla por error).
Ver el esquema de columnas y el preprocesamiento en [`dataset/README.md`](dataset/README.md).

**Mapeo de fases** (común a las tres bases):

| fase_num | fase_texto | nota |
|:---:|---|---|
| 0 | Vigilia | |
| 1 | S1 | |
| 2 | S2 | |
| 3 | SWS | fusión de S3 y S4 (criterio Rechtschaffen y Kales) |
| 4 | REM | |
| 5 | Sin clasificar | incluye Movimiento y épocas no puntuadas |

---

## Licencia

Licencia **dual** (ver [`LICENSE`](LICENSE)):

- **Código** (notebooks): [MIT](https://opensource.org/licenses/MIT).
- **Texto de la tesis y figuras**: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
- **Datos crudos de origen**: conservan la licencia de sus repositorios (no se redistribuyen).

## Citación

Si usas este trabajo, cítalo según [`CITATION.cff`](CITATION.cff):

> Cortés, L. J. (2026). *El Lenguaje del Sueño: La Fase 2 como Hub Dinámico del Sueño Sano*
> [Tesis de Licenciatura].
