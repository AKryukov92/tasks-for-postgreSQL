echo off
cd tasks/%1
for %%f in (*.html) do del %%~nf.html

for %%f in (*.sql) do (
echo ^<html^>^<head^>^<meta charset='utf-8'/^>^</head^>^<body^> > %%~nf.html
psql -d human_resources -U postgres -f %%~nf.sql -H -F "," >> %%~nf.html
echo ^</body^>^</html^> >> %%~nf.html
)