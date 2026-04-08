# Release Notes

## v1.1.1 - April 2026

### Bug fix

**Intelligence tab - Day x Hour Heatmap**

Fixed blank heatmap caused by incorrect date parsing. Medicus exports dates in DD/MM/YYYY format; the heatmap was using JavaScript's native `Date` constructor which expects ISO format (YYYY-MM-DD), causing every row to be silently skipped. All cells rendered as grey with no counts. Date parsing now handles DD/MM/YYYY correctly.

Also added explicit "no data" messages when the required CSV type has not been loaded, so it is clear which file is needed rather than showing a blank chart.

---

## v1.1.0 - April 2026

### New features

**Intelligence tab**

New dedicated tab with two chart sections:

- Day × Hour Activity Heatmap - consultations plotted on a 7-day × 13-hour grid (07:00-19:00). Toggle between volume intensity (white to NHS blue gradient) and mode split (proportional colour bands showing online/F2F/phone per cell). Hover for exact counts.
- DNA Rate by Booking Lead Time - bar chart showing DNA % for appointments booked same-day, 1-3, 4-7, 8-14, and 15+ days ahead. Paired with appointment volume by lead time to show where DNA risk concentrates.

**Workload Intensity Score (Staff Activity tab)**

Composite score per clinician: Consultations + (Document Tasks + Results Tasks) × 1.5 + (Routine Rx + Non-Routine Rx) × 0.5 + Medication Reviews. Z-score normalised and colour coded green (below average), amber (above average), red (high outlier, z > 1). Respects the All Staff / GPs Only / Non-Clinical filter.

**High-Frequency Attenders (Consultations tab)**

Patients grouped into visit frequency bands (1-2, 3-5, 6-10, 11-20, 21+ visits). Two charts: patient count per band, and 100% stacked mode split (online/F2F/phone/other) per band. Three KPIs: total unique patients, count of patients with 6+ visits, and the share of all consultations accounted for by the top 5% of attenders.

---

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
