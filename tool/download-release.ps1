# ---------------------------------------------------------------
# File          : download-release.ps1
# Authors       : Aoran Zeng <ccmywish@qq.com>
# Created on    : <2023-09-21>
# Last modified : <2024-06-11>
#
# download:
#
#   Download from GitHub Releases
# ---------------------------------------------------------------

$destination = "~\Desktop\chsrc-GitHub-release"

Write-Output "=> Mkdir $destination"
mkdir -Force $destination | Out-Null
Set-Location $destination

$names = @(
  'chsrc-x64-windows.exe'
  'chsrc-x86-windows.exe'
  'chsrc-aarch64-macos'
  'chsrc-x64-macos'
  'chsrc-x64-linux'
  'chsrc-aarch64-linux'
  'chsrc-riscv64-linux'
  'chsrc-armv7-linux'
)

# Like https://github.com/RubyMetric/chsrc/releases/download/latest/chsrc-x64-windows.exe
$url_prefix = "https://github.com/RubyMetric/chsrc/releases/download/pre/"

foreach ($name in $names) {
  curl -LO "${url_prefix}${name}"
}

Set-Location -
Write-Output "=> Downloaded to $destination"
