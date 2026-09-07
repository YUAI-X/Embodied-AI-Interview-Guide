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

$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add("# 具身智能招聘信息")
$lines.Add("")
$lines.Add("> 数据源：飞书多维表格「每日招聘汇总」；导出日期：$(Get-Date -Format 'yyyy-MM-dd')。招聘信息具有时效性，请以原始链接为准。")
$lines.Add("> 本文件不包含飞书中的「社群」表信息。")
$lines.Add("")
$lines.Add("共 **$($rows.Count)** 条有效记录。")
$lines.Add("")
$lines.Add("| 招聘标题 | 类型 | 岗位方向 | 工作地点 | 发布日期 | 原文 |")
$lines.Add("| --- | --- | --- | --- | --- | --- |")
foreach ($row in $rows) { $lines.Add("| $($row.Title) | $($row.Type) | $($row.Direction) | $($row.Location) | $($row.Date) | $($row.Link) |") }

$destination = Join-Path $repoRoot $OutputPath
New-Item -ItemType Directory -Force -Path (Split-Path -Parent $destination) | Out-Null
[System.IO.File]::WriteAllLines($destination, $lines, [System.Text.UTF8Encoding]::new($false))
Write-Output "已导出 $($rows.Count) 条记录到 $destination"
