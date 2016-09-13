REM echo off
cd ../results

for %%f in (part1lab2*.html) do del %%~nf.html

cd ../completed

for %%f in (part1lab2*.sql) do (
psql -d human_resources -U postgres -f %%~nf.sql -H -F "," > %%~nf.html
copy "%%~nf.html" "../results/%%~nf.html"
del %%~nf.html
)