:: Delete all the files needs to be
del <fileName>
del *.<fileExtension>

:: Add your local path below
copy <filePath>\<RELAP5version>.exe .
copy <filePath>\tpfh2onew .
copy <filePath>\tpfh2o .

:: Reads the file name and stores it in "nucerl.txt" file.
DIR /b *.i  > nucerl.txt     
DIR /b *.in > nucerl2.txt
DIR /b *.inp > nucerl3.txt
:: Reads the 1st line in nucerl.txt file sets it to "indta" variable
for /f "tokens=1" %%a in (nucerl.txt) do set "indta=%%a"
for /f "tokens=1" %%b in (nucerl2.txt) do set "indta=%%b"
for /f "tokens=1" %%c in (nucerl3.txt) do set "indta=%%c"

ren *.i indta
ren *.in indta
ren *.inp indta

<RELAP5version>.exe -i indta -o <outputFileName>.dat -p <plotFileName>.dat -r rstplt -j TRIP.job

for /f "tokens=1" %%d in (nucerl.txt) do (ren indta %%d)
for /f "tokens=1" %%e in (nucerl2.txt) do (ren indta %%e)
for /f "tokens=1" %%f in (nucerl3.txt) do (ren indta %%f)

del nucerl.txt
del nucerl2.txt
del nucerl3.txt

pause
