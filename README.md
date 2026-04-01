# Atmospheric Intelligence Hub

A production-style Streamlit dashboard for exploring EPA AQS station pollutant data alongside ERA5 meteorology. The app is designed as a research-grade analytics workspace with a polished SaaS-style interface, Plotly-based interactivity, and a beginner-friendly control panel.

## Features

- Station search plus multi-station comparison
- Pollutant-only, meteorology-only, and combined analysis modes
- KPI cards for selected stations, active variables, and peak events
- Overview, Time Series, Distribution, Relationships, and Data Quality tabs
- Rolling averages, peak markers, extreme-day summaries, and downloadable filtered CSVs
- Completeness matrices plus descriptive statistics for selected variables
- Cached data loading for fast repeat interactions in Streamlit

## Included Data Assumptions

The app is preconfigured for the files already in this repository:

- `Station_wise_dataset_for_EPA_AQS/*.csv`
- `ERA5_hourly_formatted_00_23.csv`

Expected columns include:

- Common: `datetime`, `site`, `state_code`, `county_code`
- Pollutants: `PM2.5`, `NO2`, `O3`, `SO2`, `CO`
- Meteorology: `temp_c`, `relative_humidity`, `wind_speed`, `dewpoint_c`, `surface_pressure_hpa`, `precip_mm`, `u10`, `v10`, `t2m`, `sp`, `blh`

You can adjust file paths and column priorities in the `APP_CONFIG` section near the top of [app.py](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/app.py).

## Quick Start

1. Create and activate a Python virtual environment.
2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Launch the dashboard:

```bash
streamlit run app.py
```

## Streamlit Community Cloud Deployment

1. Push this repository to GitHub.
2. In Streamlit Community Cloud, create a new app pointing to `app.py`.
3. Keep `requirements.txt` at the repository root.
4. Ensure the station CSV folder and ERA5 CSV remain in the repository so the relative paths resolve correctly.

## App Structure

- [app.py](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/app.py): dashboard UI, cached loaders, analytics helpers, and plotting functions
- [requirements.txt](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/requirements.txt): deployment dependencies
- [README.md](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/README.md): setup and deployment notes

## Notes

- Meteorology is treated as a regional ERA5 layer and is replicated across selected stations for meteorology-only comparisons.
- Relationship plots are enabled only when both a pollutant and a meteorology variable are selected.
- The default dashboard state is intentionally pre-populated so the app does not launch to a blank screen.
