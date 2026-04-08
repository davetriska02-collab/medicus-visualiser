"""
Medicus Visualiser - Launcher
Opens the self-contained dashboard HTML in the default browser.
Works without admin rights: unpacks to the user's temp directory.
"""

import sys
import os
import webbrowser
import tempfile
import shutil


def get_resource(relative_path):
    """Get path to a bundled resource (works both frozen and unfrozen)."""
    if getattr(sys, 'frozen', False):
        # Running as PyInstaller bundle - resources are in _MEIPASS
        base = sys._MEIPASS
    else:
        # Running as plain Python script
        base = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(base, relative_path)


def main():
    html_src = get_resource('medicus-dashboard-standalone.html')

    # Copy to a clean temp directory so the browser can load it
    tmp_dir = tempfile.mkdtemp(prefix='medicus-visualiser-')
    dst = os.path.join(tmp_dir, 'medicus-dashboard.html')
    shutil.copy2(html_src, dst)

    # Open in default browser
    url = 'file:///' + dst.replace('\\', '/')
    webbrowser.open(url)


if __name__ == '__main__':
    main()
