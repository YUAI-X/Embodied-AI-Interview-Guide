param(
    [string]$BaseToken = "MEsBbEZgTa2Prts0NNrcQep5n6b",
    [string]$TableId = "tbl9B0ArOyBMbFwH",
    [string]$OutputPath = "data/jobs.md"
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$cli = (Get-Command "lark-cli.cmd" -ErrorAction Stop).Source
$fields = @("招聘标题", "招聘类型", "岗位方向", "工作地点", "发布日期", "招聘链接")
$arguments = @("base", "+record-list", "--base-token", $BaseToken, "--table-id", $TableId, "--limit", "200", "--format", "json", "--as", "user")
foreach ($field in $fields) { $arguments += @("--field-id", $field) }

$response = (& $cli @arguments | Out-String) | ConvertFrom-Json
if (-not $response.ok) { throw "读取飞书招聘表失败：$($response.error.message)" }
if ($response.data.has_more) { throw "招聘记录超过 200 条，请先为脚本增加分页逻辑，避免不完整导出。" }

function Escape-MarkdownCell([object]$Value) {
    if ($null -eq $Value) { return "" }
    if ($Value -is [array]) { $Value = $Value -join "、" }
    return ([string]$Value).Replace("`r", " ").Replace("`n", "<br>").Replace("|", "\|")
}

$rows = foreach ($row in $response.data.data) {
    if ($null -eq $row[0] -or [string]::IsNullOrWhiteSpace([string]$row[0])) { continue }
    [pscustomobject]@{
        Title = Escape-MarkdownCell $row[0]
        Type = Escape-MarkdownCell $row[1]
        Direction = Escape-MarkdownCell $row[2]
        Location = Escape-MarkdownCell $row[3]
        Date = Escape-MarkdownCell $row[4]
        Link = Escape-MarkdownCell $row[5]
    }
}
$rows = @($rows | Sort-Object -Property @{ Expression = { $_.Date }; Descending = $true }, @{ Expression = { $_.Title }; Descending = $false })

$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add("# 具身智能招聘信息")
$lines.Add("")
$lines.Add("> 数据源：飞书多维表格「每日招聘汇总」；导出日期：$(Get-Date -Format 'yyyy-MM-dd')。招聘信息具有时效性，请以原始链接为准。")
$lines.Add("> 本文件不包含飞书中的「社群」表信息。")
$lines.Add("")
$lines.Add("共 **$($rows.Count)** 条有效记录。")
$lines.Add("")
$tableLines = [System.Collections.Generic.List[string]]::new()
$tableLines.Add("| 招聘标题 | 类型 | 岗位方向 | 工作地点 | 发布日期 |")
$tableLines.Add("| --- | --- | --- | --- | --- |")
foreach ($row in $rows) {
    $linkTarget = $row.Link
    $linkMatch = [regex]::Match($linkTarget, "^\[[^\]]*\]\((.+)\)$")
    if ($linkMatch.Success) { $linkTarget = $linkMatch.Groups[1].Value }
    $linkedTitle = if ([string]::IsNullOrWhiteSpace($linkTarget)) { $row.Title } else { "[$($row.Title)]($linkTarget)" }
    $tableLines.Add("| $linkedTitle | $($row.Type) | $($row.Direction) | $($row.Location) | $($row.Date) |")
}
$lines.AddRange($tableLines)

$destination = Join-Path $repoRoot $OutputPath
New-Item -ItemType Directory -Force -Path (Split-Path -Parent $destination) | Out-Null
[System.IO.File]::WriteAllLines($destination, $lines, [System.Text.UTF8Encoding]::new($false))

$readmePath = Join-Path $repoRoot "README.md"
$readmeText = [System.IO.File]::ReadAllText($readmePath, [System.Text.Encoding]::UTF8)
$startMarker = "<!-- JOBS_TABLE_START -->"
$endMarker = "<!-- JOBS_TABLE_END -->"
$readmeTable = @(
    $startMarker,
    "",
    "> 共 **$($rows.Count)** 条有效记录，按发布日期从新到旧排列。招聘信息具有时效性，请以原始链接为准。",
    "",
    "[**在独立页面查看求职信息 →**](https://github.com/YUAI-X/Embodied-AI-Interview-Guide/blob/master/data/jobs.md)",
    ""
) + $tableLines + @("", $endMarker)
$markerPattern = "(?s)" + [regex]::Escape($startMarker) + ".*?" + [regex]::Escape($endMarker)
if (-not [regex]::IsMatch($readmeText, $markerPattern)) { throw "README.md 中缺少求职信息同步标记。" }
$updatedReadme = [regex]::Replace($readmeText, $markerPattern, ($readmeTable -join "`r`n"), 1)
[System.IO.File]::WriteAllText($readmePath, $updatedReadme, [System.Text.UTF8Encoding]::new($false))

Write-Output "已导出 $($rows.Count) 条记录到 $destination，并同步更新 README.md"
) { $Matches[1] } else { $row.Link }
    $linkedTitle = if ([string]::IsNullOrWhiteSpace($linkTarget)) { $row.Title } else { "[$($row.Title)]($linkTarget)" }
    $tableLines.Add("| $linkedTitle | $($row.Type) | $($row.Direction) | $($row.Location) | $($row.Date) |")
}
$lines.AddRange($tableLines)

$destination = Join-Path $repoRoot $OutputPath
New-Item -ItemType Directory -Force -Path (Split-Path -Parent $destination) | Out-Null
[System.IO.File]::WriteAllLines($destination, $lines, [System.Text.UTF8Encoding]::new($false))

$readmePath = Join-Path $repoRoot "README.md"
$readmeText = [System.IO.File]::ReadAllText($readmePath, [System.Text.Encoding]::UTF8)
$startMarker = "<!-- JOBS_TABLE_START -->"
$endMarker = "<!-- JOBS_TABLE_END -->"
$readmeTable = @(
    $startMarker,
    "",
    "> 共 **$($rows.Count)** 条有效记录，按发布日期从新到旧排列。招聘信息具有时效性，请以原始链接为准。",
    "",
    "[**在独立页面查看求职信息 →**](https://github.com/YUAI-X/Embodied-AI-Interview-Guide/blob/master/data/jobs.md)",
    ""
) + $tableLines + @("", $endMarker)
$markerPattern = "(?s)" + [regex]::Escape($startMarker) + ".*?" + [regex]::Escape($endMarker)
if (-not [regex]::IsMatch($readmeText, $markerPattern)) { throw "README.md 中缺少求职信息同步标记。" }
$updatedReadme = [regex]::Replace($readmeText, $markerPattern, ($readmeTable -join "`r`n"), 1)
[System.IO.File]::WriteAllText($readmePath, $updatedReadme, [System.Text.UTF8Encoding]::new($false))

Write-Output "已导出 $($rows.Count) 条记录到 $destination，并同步更新 README.md"
