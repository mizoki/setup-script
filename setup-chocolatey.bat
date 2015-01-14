REM Chocolatey
REM
REM Chocolatey NuGet is a Machine Package Manager, somewhat like apt-get, but built with Windows in mind.
REM https://chocolatey.org/

REM To install chocolatey now, open an administrative cmd.exe
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
