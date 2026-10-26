# Publicar no GitHub Pages
# Execute este script a partir de uma sessao do Claude Code com permissao para criar repositorio publico.
# O token do GitHub CLI ja esta autenticado (conta thayaneteixeiraugc).
$ErrorActionPreference = "Stop"

$gh  = "C:\Program Files\GitHub CLI\gh.exe"
$git = "C:\Users\Thayane Cardoso\AppData\Local\Programs\Git\cmd\git.exe"
$dir = "C:\Users\Thayane Cardoso\Desktop\Teste KPA"
$repo = "thayane.ugc"

Set-Location $dir

Write-Host "Criando o repositorio publico $repo..." -ForegroundColor Cyan
& $gh repo create $repo --public --source $dir --remote origin --push --description "Portfolio UGC Creator de Thayane Teixeira"

Write-Host "Ativando o GitHub Pages..." -ForegroundColor Cyan
& $gh api --method POST "/repos/thayaneteixeiraugc/$repo/pages" -f source[branch]=main -f source[path]=/

Write-Host ""
Write-Host "Pronto. O site fica no ar em:" -ForegroundColor Green
Write-Host "https://thayaneteixeiraugc.github.io/$repo/" -ForegroundColor Green
