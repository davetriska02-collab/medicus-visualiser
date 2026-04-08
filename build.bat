@echo off
REM Medicus Visualiser - Build Script
REM Requires: Python 3.x, PyInstaller (pip install pyinstaller)
REM No admin rights required to build or run the output.

echo Building Medicus Visualiser...

REM Copy the standalone HTML into the build folder so PyInstaller can find it
copy /Y "..\medicus-dashboard-standalone.html" "medicus-dashboard-standalone.html"

REM Build single-file exe
REM  --onefile        : everything packed into one .exe
REM  --noconsole      : no terminal window on launch (Windows GUI app)
REM  --add-data       : bundle the HTML file inside the exe
REM  --name           : output filename

pyinstaller ^
    --onefile ^
    --noconsole ^
    --add-data "medicus-dashboard-standalone.html;." ^
    --name "MedicusVisualiser" ^
    --distpath dist ^
    --workpath build_tmp ^
    --specpath . ^
    launcher.py

REM Clean up intermediate files
del /Q medicus-dashboard-standalone.html 2>nul

echo.
if exist dist\MedicusVisualiser.exe (
    echo BUILD SUCCESSFUL
    echo Output: dist\MedicusVisualiser.exe
    for %%A in (dist\MedicusVisualiser.exe) do echo Size: %%~zA bytes
) else (
    echo BUILD FAILED - check output above
)
