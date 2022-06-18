echo off

echo Initialising test environment..

if not exist "c:\FIM_Test" (mkdir c:\FIM_Test)

if exist "c:\FIM_Test\" (rmdir /s /q c:\FIM_Test\)

mkdir c:\FIM_Test\

@echo Test : LightWeight InclusionFilter
echo off

call :GenerateSystemDriveEvents C:\FIM_Test\

:Remove Directories
rd /S/Q c:\FIM_Test

cd c:\
exit /B

:File
echo File created >%~1
attrib +R %~1
attrib -R %~1
rename %~1 new%~1
rename new%~1 %~1
cacls %~1 /p everyone:n
cacls %~1 /p everyone:f
del %~1
goto :eof

:FileSystemDriveEvents
call :File Rasengan
call :File BASHLITE
call :File CryptoLocker
call :File EternalRocks
call :File MEMZ
call :File docu2.docx_rwuxrek
call :File pict32.jpg_rwuxrek
Call :Remove
goto :eof

:GenerateSystemDriveEvents
cd %~1
echo Generating file events for system drive..
call :FileSystemDriveEvents %~1
goto :eof

cd %~1
goto :eof