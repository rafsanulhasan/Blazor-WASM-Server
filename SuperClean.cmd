@echo on
c:
cd \Solutions
cd ohi
cd "Blazor-WASM-Server"
for /d /r . %%d in (bin,obj,ClientBin,Generated_Code) do @if exist "%%d" rd /s /q "%%d"
pause
