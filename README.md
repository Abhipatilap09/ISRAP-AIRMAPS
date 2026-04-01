# Atmospheric Intelligence Hub

A production-style Streamlit dashboard for exploring EPA AQS station pollutant data alongside ERA5 meteorology. The current primary app entrypoint is [app3.py](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/app3.py).

## What This Repository Contains

- [app3.py](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/app3.py): current dashboard app with the latest date-window logic, Plotly analytics, and UI refinements
- [app.py](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/app.py): earlier dashboard version
- [app2.py](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/app2.py): intermediate dashboard version
- [requirements.txt](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/requirements.txt): Python dependencies
- [DASHBOARD_USAGE.md](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/DASHBOARD_USAGE.md): full user documentation for operating the dashboard

## Quick Start

Install dependencies:

```bash
pip install -r requirements.txt
```

Run the current dashboard locally:

```bash
streamlit run app3.py
```

On Windows with the local virtual environment:

```powershell
.\.venv\Scripts\python.exe -m streamlit run app3.py
```

## Data Files Expected By The App

The current configuration expects:

- `Station_wise_dataset_for_EPA_AQS/*.csv`
- `ERA5_hourly_formatted_00_23.csv`

Typical columns include:

- Common: `datetime`, `site`, `state_code`, `county_code`
- Pollutants: `PM2.5`, `NO2`, `O3`, `SO2`, `CO`
- Meteorology: `temp_c`, `relative_humidity`, `wind_speed`, `dewpoint_c`, `surface_pressure_hpa`, `precip_mm`, `u10`, `v10`, `t2m`, `sp`, `blh`, `d2m`

Paths, labels, and variable priorities can be adjusted in the `APP_CONFIG` section near the top of [app3.py](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/app3.py).

## Deployment

For Streamlit Community Cloud:

1. Push the repository to GitHub.
2. Create a new Streamlit app.
3. Select repository `Abhipatilap09/ISRAP-AIRMAPS`.
4. Set branch to `main`.
5. Set the main file path to `app3.py`.

## Full Dashboard Guide

See [DASHBOARD_USAGE.md](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/DASHBOARD_USAGE.md) for:

- complete control-panel usage
- pollutant-only, meteorology-only, and combined mode behavior
- explanation of each analytics tab
- date-range logic
- chart interpretation notes
- export workflow
- troubleshooting
