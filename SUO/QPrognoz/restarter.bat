@ echo off
taskkill /IM Qprognoz.exe /F
timeout -t 5
cd C:\ProgramData\Q-Matic\QWIN S\QPrognoz
start QPrognoz.exe
