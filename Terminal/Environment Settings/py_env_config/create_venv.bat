REM Based on documentation found in:
REM https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/#creating-a-virtual-environment

REM Install Python support to virtual environments.
REM NOTE: No need to install it for Python 3.3 or newer. The preferred is to use "venv".
py -m pip install --user virtualenv

REM Create a folder named "env" in the current directory to contain the virtual environment:
py -m venv env

REM Activate the virtual environment:
.\env\Scripts\activate

REM Leave the virtual environment:
deactivate

REM Install a specific package in the virtual environment (only):
pip install [library_name]

REM Upgrade a specific package:
pip install --upgrade [library_name]
