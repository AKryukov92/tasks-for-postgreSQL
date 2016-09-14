echo off
cd ../results

for %%f in (lab01*.html) do del %%~nf.html

cd ../completed

for %%f in (lab01*.sql) do (
echo ^<html^>^<head^>^<meta charset='utf-8'/^>^</head^>^<body^> > ../results/%%~nf.html
psql -d human_resources -U postgres -f %%~nf.sql -H -F "," >> ../results/%%~nf.html
echo ^</body^>^</html^> >> ../results/%%~nf.html
)