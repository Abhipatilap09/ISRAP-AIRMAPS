# Dashboard Usage Guide

## Overview

Atmospheric Intelligence Hub is an interactive Streamlit dashboard for exploring:

- EPA AQS station-level pollutant measurements
- ERA5-based meteorological context
- pollutant-only trends
- meteorology-only trends
- pollutant-meteorology relationships
- station-level data quality and completeness

The main application file is [app3.py](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/app3.py).

## Who This Dashboard Is For

This dashboard is intended for:

- air-quality researchers
- atmospheric scientists
- environmental analysts
- students and early-stage users who need a guided interface
- decision-makers who want quick visual summaries without writing code

## How To Start The App

Install dependencies:

```bash
pip install -r requirements.txt
```

Run the dashboard:

```bash
streamlit run app3.py
```

Windows virtual-environment command:

```powershell
.\.venv\Scripts\python.exe -m streamlit run app3.py
```

Once the server starts, open the local Streamlit URL, usually:

```text
http://localhost:8501
```

## Dashboard Layout

The dashboard is organized into:

- a left sidebar control panel
- a top summary section with KPI cards
- five analytics tabs in the main workspace

The five tabs are:

- `Overview`
- `Time Series`
- `Distribution`
- `Relationships`
- `Data Quality`

## Control Panel Guide

The sidebar is the main place where the dashboard behavior is controlled.

### 1. Search Station

Use the station search box to quickly narrow the station list before making a selection.

Best use:

- type part of a site name or site ID
- then choose one or more stations from the filtered list

### 2. Select Stations

The station multi-select controls which AQS monitoring sites appear in station-based plots.

Behavior:

- one station gives a focused single-station view
- multiple stations show side-by-side comparison on the same plot
- each station is assigned a different color

### 3. Pollutant Selector

Choose one pollutant variable such as:

- `PM2.5`
- `NO2`
- `O3`
- `SO2`
- `CO`

If no pollutant is selected, pollutant-specific views are hidden.

### 4. Meteorology Selector

Choose one meteorology variable such as:

- `temp_c`
- `relative_humidity`
- `wind_speed`
- `dewpoint_c`
- `surface_pressure_hpa`
- `u10`
- `v10`
- `t2m`
- `sp`
- `blh`

If no meteorology variable is selected, meteorology-specific views are hidden.

### 5. Aggregation

The aggregation selector controls how the `Time Series` and overlay plots are summarized.

Available options:

- `Hourly`
- `Daily`
- `Monthly`
- `Yearly`

Use this when you want smoother long-range comparisons or broader temporal summaries.

### 6. Rolling Average Window

This slider controls the rolling mean in time-series plots.

Range:

- `1` to `14`

Interpretation:

- `1` means raw aggregated values
- values greater than `1` smooth the time series

This is especially useful when:

- comparing noisy stations
- looking for persistent episodes rather than hourly spikes

### 7. Date Range

The date selector controls which data window is active in the dashboard.

The app supports:

- single-day analysis
- 3-day analysis
- 15-day analysis
- full-month analysis
- full-year analysis
- any other custom continuous window

### 8. Reset Filters

This button restores the app to its default state.

Use it when:

- too many filters have been changed
- you want to return to the dashboard’s default opening view

### 9. Download Filtered Dataset

This downloads the currently filtered data as CSV.

The export reflects:

- the selected stations
- the selected pollutant and/or meteorology variable
- the chosen date range
- the active dashboard mode

## Dashboard Modes

The dashboard automatically switches between three analysis modes based on the variable selections.

### Mode 1. Pollutant-Only

Active when:

- a pollutant is selected
- no meteorology variable is selected

What you will see:

- pollutant diurnal profile
- recent selected-window plot
- monthly trend context
- yearly trend context
- pollutant distribution plots
- pollutant data-quality summary

What is hidden:

- scatter plot
- correlation heatmap
- pollutant-meteorology overlay plots

### Mode 2. Meteorology-Only

Active when:

- a meteorology variable is selected
- no pollutant is selected

What you will see:

- meteorology diurnal profile
- recent selected-window plot
- monthly trend context
- yearly trend context
- meteorology distribution plots
- meteorology data-quality summary

What is hidden:

- pollutant plots
- relationship plots
- combined overlays

### Mode 3. Combined

Active when:

- one pollutant is selected
- one meteorology variable is selected

What you will see:

- pollutant diurnal chart
- meteorology diurnal chart
- dual-axis overlay
- pollutant and meteorology monthly context plots
- scatter plot
- regression line
- correlation heatmap
- data-quality views for both variables

## KPI Cards

The top KPI cards summarize the active session:

- `Selected Stations`
- `Selected Pollutant`
- `Peak Value`
- `Meteorology Variable`

### Peak Value Card

The peak card reports:

- the maximum value in the currently active primary variable
- the timestamp of the peak
- the station where that peak occurred

If you are in:

- pollutant-only mode: the peak is based on the selected pollutant
- meteorology-only mode: the peak is based on the selected meteorology variable
- combined mode: the peak is based on the selected pollutant

## Tab-By-Tab Usage

## Overview Tab

This tab is designed for first-look interpretation.

It includes:

- diurnal behavior
- selected-window view
- monthly context
- yearly context

### Diurnal Plot

Purpose:

- shows the mean value by hour of day from `00:00` to `23:00`
- compares one or more stations on a common hourly profile

Use it to answer:

- when does a pollutant typically peak during the day?
- do stations share the same daily pattern?
- is the morning or afternoon consistently elevated?

### Selected-Window Plot

This plot adapts to the chosen date range.

#### Single Day

Behavior:

- shows a full `00:00` to `23:00` hourly structure
- even if some hours are missing in the source file, the full 24-hour timeline is preserved

Best for:

- detailed daily cycle inspection
- identifying peak hour and missing hours

#### 3-Day Window

Behavior:

- shows three sequential panels
- each panel covers one full day from `00:00` to `23:00`
- stations are overlaid in each daily panel

Best for:

- comparing day-to-day shifts in hourly behavior
- studying short pollution events or changing weather conditions

#### 15-Day Window

Behavior:

- shows a daily-average trend across the selected 15-day period

Best for:

- medium-range tracking without hourly clutter

#### Full Month

Behavior:

- shows full-month hourly variation
- preserves the hourly timestamps across the entire month

Best for:

- viewing high-resolution month-scale variation
- detecting repeated spikes and day-to-day persistence

#### Full Year

Behavior:

- shows monthly averages across the selected year
- one summary point per month

Best for:

- seasonal interpretation
- identifying monthly maxima and minima

#### Other Custom Ranges

Behavior:

- displays a continuous timestamp plot across the selected window

### Monthly Context Plot

This chart is the monthly daily-average view.

Important behavior:

- the app uses the calendar month anchored to the selected start date
- even when the active date filter is shorter than a month, this panel still shows the full month context around that starting day

Example:

- if the selected start date is `2021-10-05`, the monthly context plot shows the full month of October 2021

### Yearly Context Plot

This chart is the yearly monthly-average view.

Important behavior:

- the app uses the calendar year anchored to the selected start date
- even when the active date filter is shorter than a year, this panel still shows the year-level context around that starting day

Example:

- if the selected start date is in 2021, the yearly panel summarizes all months in 2021

### Top Extreme Days Table

The overview tab also includes a `Top Extreme Days` summary table for the active primary variable.

How it works:

- daily mean, max, min, and valid observation count are computed
- days above the 90th percentile of daily maximum values are highlighted
- the table displays the most extreme days first

Use it for:

- screening episode days
- finding candidates for deeper event analysis

## Time Series Tab

This tab is meant for more flexible comparison and smoothing.

It includes:

- station comparison time series
- rolling-average smoothing
- peak-sensitive overlays
- optional pollutant-meteorology overlay in combined mode

### What Changes Here

Unlike the adaptive recent-window plot in `Overview`, the `Time Series` tab responds strongly to:

- aggregation
- rolling-average window

### Outlier Indicators

Time-series plots also flag values above the station-specific 90th percentile.

Use this tab when:

- the overview plot is too specialized for the date window
- you want more direct control over smoothing and aggregation
- you want to compare stations at daily or monthly scale

## Distribution Tab

This tab summarizes the statistical distribution of the active variable.

It includes:

- station-wise boxplot
- histogram
- quantile table

### Boxplot

Use it to compare:

- median differences
- spread
- possible outliers
- between-station consistency

### Histogram

Use it to understand:

- the most common value ranges
- whether the data are skewed
- whether distributions differ by station

### Quantile Table

The table includes:

- observation count
- mean
- standard deviation
- minimum
- Q1
- median
- Q3
- maximum

This is useful when you need exact values rather than visual estimates.

## Relationships Tab

This tab is only available in combined mode.

It includes:

- scatter plot
- regression line
- correlation heatmap

### Scatter Plot

Use it to assess:

- whether the selected pollutant rises or falls with the selected meteorology variable
- whether the relationship is linear, clustered, or weak
- whether stations occupy different parts of the same relationship space

### Regression Line

The fitted line gives a quick directional summary:

- upward slope suggests a positive association
- downward slope suggests a negative association

### Correlation Heatmap

The heatmap shows correlations among:

- the selected pollutant
- the selected meteorology variable
- additional available pollutant and meteorology variables when enough data are present

Important note:

- correlation does not imply causation

## Data Quality Tab

This tab documents data coverage and summary quality.

It includes:

- availability KPI
- missing KPI
- valid observation count KPI
- completeness heatmap
- descriptive statistics table

### Completeness Matrix

The matrix shows whether data are available for each station and time bucket.

Granularity adapts automatically:

- `Daily` when the selected span is up to about 120 days
- `Monthly` for larger windows

### Descriptive Statistics Table

The quality table includes:

- valid observations
- availability percent
- missing percent
- mean
- standard deviation
- minimum
- Q1
- median
- Q3
- maximum

Use this tab when:

- a plot looks sparse
- you suspect a station has large gaps
- you want a quick completeness audit before interpretation

## How Multi-Station Comparison Works

When multiple stations are selected:

- all selected stations are plotted on the same axes
- each station gets a distinct color
- the legend uses compact station labels
- pollutant and meteorology comparisons remain on the same common scale within each chart

This is especially useful for:

- urban vs regional comparisons
- high site vs low site comparisons
- identifying synchronized episodes across locations

## Understanding The Date and Timestamp Labels On Charts

Most charts include a subtitle under the main title.

That subtitle communicates:

- the active time window
- the resolution being shown

Examples:

- `2019-10-01 | 00:00-23:00 | Hourly resolution`
- `October 2021 | Daily average`
- `Year 2021 | Monthly average`
- `2021-01-01 00:00 to 2021-01-15 23:00 | Continuous timestamps`

These subtitles are helpful when screenshots are shared outside the app.

## Downloaded CSV Behavior

The exported CSV depends on the active mode.

### Pollutant-Only Export

Includes:

- `datetime`
- `station_label`
- geographic metadata when available
- the selected pollutant

### Meteorology-Only Export

Includes:

- `datetime`
- `station_label`
- the selected meteorology variable

### Combined Export

Includes:

- pollutant records
- matching meteorology values merged on timestamp

## Data Assumptions

The dashboard expects:

- one or more station CSV files in `Station_wise_dataset_for_EPA_AQS`
- one ERA5 meteorology CSV file at repository root

Typical pollutant columns:

- `PM2.5`
- `NO2`
- `O3`
- `SO2`
- `CO`

Typical meteorology columns:

- `temp_c`
- `relative_humidity`
- `wind_speed`
- `dewpoint_c`
- `surface_pressure_hpa`
- `precip_mm`
- `u10`
- `v10`
- `t2m`
- `sp`
- `blh`
- `d2m`

Typical identifier columns:

- `datetime`
- `site`
- `state_code`
- `county_code`

## Important Implementation Notes

### ERA5 Replication Across Stations

Meteorology is treated as a regional ERA5 layer and is replicated across the selected stations for meteorology-only comparisons.

This means:

- the meteorology signal is common
- station-wise meteorology plots are a comparison aid, not an independent station observation network

### Relationship Tab Availability

The `Relationships` tab is meaningful only when both a pollutant and a meteorology variable are selected.

### Default Startup State

The dashboard intentionally opens with sensible defaults so users do not see a blank application on launch.

## Troubleshooting

## The app does not start

Check:

- dependencies were installed with `pip install -r requirements.txt`
- you are running `streamlit run app3.py`
- the required CSV files are present in the expected locations

## The app opens but charts are empty

Check:

- at least one station is selected
- a pollutant or meteorology variable is selected
- the selected date range overlaps available data

## The Relationships tab is blank

Check:

- both one pollutant and one meteorology variable are selected
- the chosen variables have overlapping valid timestamps

## The exported CSV is empty

Check:

- the selected filter combination actually contains data
- the date range is not outside the data period

## Streamlit Cloud deployment fails

Check:

- `app3.py` exists in the GitHub repository root
- `requirements.txt` exists in the repository root
- the dataset folder and ERA5 CSV were pushed to the repository

## Recommended Workflow For New Users

1. Start with one station and one pollutant.
2. Use the `Overview` tab to understand daily, monthly, and yearly behavior.
3. Add more stations for comparison.
4. Turn on a meteorology variable to explore combined mode.
5. Use the `Relationships` tab to check directional associations.
6. Use the `Data Quality` tab before drawing conclusions from sparse windows.
7. Export the filtered CSV for downstream modeling or reporting.

## Recommended Workflow For Research Analysis

1. Select a pollutant and screen the `Top Extreme Days` table.
2. Narrow the date window to episode days.
3. Compare stations in `Overview` and `Time Series`.
4. Add one meteorology variable and inspect the dual-axis overlay.
5. Use `Relationships` for scatter and correlation support.
6. Review completeness and missingness before final interpretation.

## Where To Customize The App

If you want to adapt this dashboard for another study, start with the `APP_CONFIG` block in [app3.py](/c:/Users/abhip/Abhishek_Masters/NEW_RESEARCH_NASA(ISRAP)/app3.py).

That section controls:

- file paths
- candidate pollutant variables
- candidate meteorology variables
- labels
- axis units
- color palette
- default selection priorities
