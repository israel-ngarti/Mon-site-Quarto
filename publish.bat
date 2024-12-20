@echo off
echo Rendering site with Quarto...
quarto render
if errorlevel 1 (
    echo Quarto render failed.
    exit /b 1
)

echo Adding changes to Git...
git add .
if errorlevel 1 (
    echo Git add failed.
    exit /b 1
)

echo Committing changes...
git commit -m "Mise à jour"
if errorlevel 1 (
    echo Git commit failed.
    exit /b 1
)

echo Pushing changes to GitHub...
git push origin main
if errorlevel 1 (
    echo Git push failed.
    exit /b 1
)

echo Site published successfully!
