
#Ejecuta OhMyPosh cuando se habre la terminal
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\nanotech.omp.json" | Invoke-Expression 
#Importa iconos para la terminal
Import-Module Terminal-Icons
#Agrega la lista con el historial de comandos usados
Set-PSReadLineOption -PredictionViewStyle ListView


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

#importa fzf para buscar archivos en todo el disco
Import-Module PSFzf
#ajusta el tamano de la interfaz de fzf
$env:FZF_DEFAULT_OPTS='--height 80% --layout=reverse --border'
#funcion para ver el contenido del archivo y al precionarenter puede ser editado con nvim
function ff {
	nvim $(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")
}
