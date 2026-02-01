@echo off
setlocal

REM Paths relative to this script
set SCRIPT_DIR=%~dp0
set PROJECT_ROOT=%SCRIPT_DIR%\..
set PROTO_DIR=%PROJECT_ROOT%\protos
set OUT_DIR=%PROJECT_ROOT%\generated

echo Generating nanopb files...
echo Proto directory: %PROTO_DIR%
echo Output directory: %OUT_DIR%
echo.

if not exist "%OUT_DIR%" (
    mkdir "%OUT_DIR%"
)

for %%f in ("%PROTO_DIR%\*.proto") do (
    echo Processing %%~nxf
    python "%PROJECT_ROOT%\utils\generator\nanopb_generator.py" ^
        --proto-path "%PROTO_DIR%" ^
        --output-dir "%OUT_DIR%" ^
        "%%f"
)

echo.
echo Done.
pause
