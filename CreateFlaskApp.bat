@echo off
set project=%1
echo [92mCreating Project '%project%' at directory '%cd%'.[0m
mkdir "%project%"
cd "%project%"
REM "Used to place the necessary code inside the 'run.py' file"
touch run.py
(
	echo from %project% import app
	echo(  
	echo if __name__ == '__main__' :
	echo.	app.run^(debug=True^) 
) > run.py

REM "Used to place the necessary code inside the 'start.bat' file"
touch start.bat
(
	echo C:\PythonVirtualEnvironments\WebDevelopment\Scripts\python.exe run.py

) > start.bat

REM "Creating The Main Package Folder"
mkdir "%project%"
cd "%project%"
REM "Creating The __init__.py file for the Package"
touch __init__.py
(
	echo from flask import Flask
	echo app = Flask^(__name__^)
	echo from %project% import routes
) > __init__.py

touch routes.py
(
	echo from flask import render_template, url_for, flash, redirect
	echo from %project% import app
	echo(   
	echo @app.route^("/"^)
	echo def homepage^(^):
    echo.	return render_template^('main.html'^)
) > routes.py

touch forms.py
touch models.py

REM "Making the Static Folder"
mkdir static
cd static
mkdir CSS
REM "Making Sass Files"
mkdir Sass
cd Sass
touch main.scss
cd ..
REM "Making JavaScript Files"'
mkdir JavaScript
cd JavaScript
touch main.js 
cd ..
mkdir Icons
mkdir Images
cd ..

mkdir templates
cd templates
touch layout.html
touch main.html
cd ..
cd ..
cd ..
