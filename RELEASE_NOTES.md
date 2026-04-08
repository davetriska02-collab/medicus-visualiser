# Release Notes

## v1.0.0 - April 2026

Initial public release.

### What's included

Single-file HTML dashboard and Windows exe launcher for visualising Medicus EHR CSV exports offline.

### Supported data sources

- Medicus Activity Report CSV
- Medicus Consultations Report CSV
- Medicus WPAD Appointments CSV

### Dashboard tabs

**Overview**
Five summary KPIs (total appointments, consultations, unique patients, DNA rate, GP utilisation) and four charts: daily volume trend, encounter mode split, top 10 clinicians by volume, and appointment status breakdown.

**Staff Activity**
Stacked workload bar chart by clinician, prescribing volume, and document/result handling. Toggle between all staff, GPs only, and non-clinical. Sortable summary table with CSV export.

**Consultations**
Date range, clinician, encounter type, and consultation mode filters. Daily stacked area chart, hourly distribution heatmap, per-clinician breakdown, and encounter type donut. Paginated patient table with redaction.

**Appointments**
Seven filters (date, clinician, type, mode, status, slot, booking method). Five KPIs including DNA rate and utilisation. Six charts: daily volume, mode split, HCP stacked bar, DNA by appointment type, type breakdown, and booking method distribution. Paginated appointment table.

### Key behaviours

- Multi-file loading with automatic type detection from column headers
- Date-range stitching and deduplication across files of the same type
- Patient name redaction on by default; toggle off with a warning banner
- 11 admin session types excluded from activity counts by default
- All charts interactive (zoom, pan, hover tooltips, series toggle)
- CSV export from all table views

### Notes

- Requires Medicus CSV exports in their standard column format
- Some charts require data from multiple export types to populate fully
- No data is sent anywhere; all processing is client-side
