$md = ConvertFrom-Markdown -Path main.md
$md.Html | Out-File -Encoding utf8 .\$file.html
