$file = Read-Host -Prompt "Input file name"
$md = ConvertFrom-Markdown -Path .\$file
$md.Html | Out-File -Encoding utf8 .\$file.html