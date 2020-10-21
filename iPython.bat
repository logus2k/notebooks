@ECHO OFF
REM Run IPython inside the virtual environment:
python -c "import IPython; IPython.terminal.ipapp.launch_new_instance()"

REM Check if successful:
REM import sys
REM hasattr(sys, "real_prefix") or sys.base_prefix != sys.prefix
