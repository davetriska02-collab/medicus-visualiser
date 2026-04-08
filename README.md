# Medicus Visualiser

A single-file, offline-capable analytics dashboard for Medicus EHR CSV exports. Runs directly in any modern browser with no installation, no internet connection, and no admin rights required.

## What it does

Drag and drop your Medicus CSV exports to visualise practice activity across three data sources:

- **Activity Report** - staff workload, prescribing volume, task and document handling
- **Consultations Report** - encounter trends by type, mode, clinician, and time of day
- **Appointments (WPAD)** - appointment volumes, DNA rates, booking methods, and HCP breakdown

Multiple files of the same type can be loaded together to stitch date ranges seamlessly. Duplicate records are automatically detected and removed.

## Features

- Fully offline - no CDN calls, no data leaves the browser
- Patient name redaction on by default (names replaced with anonymised tokens)
- Interactive charts (daily trends, donut breakdowns, stacked HCP bars, hourly heatmaps)
- Sortable, searchable, paginated tables
- CSV export from any table view
- Admin session types excluded by default (Setup time, Protected Learning Time, etc.)
- Filter by date range, clinician, encounter type, and appointment mode

## Usage

### Option A - Run the exe (recommended for NHS computers)

1. Download `MedicusVisualiser.exe` from the [latest release](../../releases/latest)
2. Double-click - no installation, no admin rights needed
3. Your browser opens with the dashboard ready to use
4. Drag your Medicus CSV exports into the drop zone and click Launch Dashboard

### Option B - Open the HTML directly

1. Download `medicus-dashboard-standalone.html`
2. Double-click or open in any modern browser (Chrome, Edge, Firefox)
3. No server, no internet, no install needed

## Supported CSV exports

| File type | How to export from Medicus |
|---|---|
| Activity Report | Reports > Activity > Export CSV |
| Consultations Report | Reports > Consultations > Export CSV |
| Appointments (WPAD) | Reports > Appointments > WPAD > Export CSV |

The dashboard auto-detects which file type you have dropped based on column headers.

## Building from source

Requires Python 3.x and PyInstaller:

```
pip install pyinstaller
cd medicus-visualiser
build.bat
```

Output: `dist/MedicusVisualiser.exe`

## Privacy and data governance

All data processing happens locally in the browser. No data is transmitted anywhere. Patient names are redacted by default. The tool is suitable for use on NHS workstations subject to local information governance policies.

## Requirements

- Windows 7 or later (for the exe)
- Any modern browser for the standalone HTML version
- No admin rights required
- No internet connection required

## Licence

MIT
