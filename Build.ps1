param(
	[switch]$Release=$false
)

$CompilerFlags = "-nologo", "-Zi"

if ($Release -Eq $false) {
	Write-Output "Debug Build Configuration"
	$CompilerFlags += "-Od"
} else {
	Write-Output "Release Build Configuration"
	$CompilerFlags += "-O2"
}

$SourceFiles = "..\PixelToy.c"

$Arguments = $CompilerFlags
$Arguments += $SourceFiles

New-Item -Force -Type Directory -Path Build | Out-Null
Push-Location Build
cl $("$Arguments" -Split ' ')
Pop-Location
