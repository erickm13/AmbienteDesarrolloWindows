# ✨ Guía de Personalización Completa de tu Terminal (Windows + Oh My Posh)

¡Bienvenido a esta guía para transformar y mejorar completamente tu entorno de desarrollo en Windows!
Aquí aprenderás a personalizar tu terminal con temas visuales, fuentes modernas y configuraciones eficientes usando **Oh My Posh** y un esquema de color atractivo.

![preview terminal](https://ohmyposh.dev/img/posh-preview.gif)

> ⚠️ **Requisito previo:** Asegúrate de tener instalado [Chocolatey](https://chocolatey.org/install) antes de comenzar si deseas usar el autocompletado para `choco` y otras utilidades.

---

## 🧩 Pasos para Instalar y Configurar Oh My Posh

1. **Instalar la Terminal de Windows**
   Descárgala desde la [Microsoft Store](https://aka.ms/terminal).

2. **Instalar PowerShell**
   También desde la [Microsoft Store](https://aka.ms/powershell).

3. **Instalar Oh My Posh**
   Abre tu navegador y sigue los pasos de instalación desde la siguiente URL:
   👉 [https://ohmyposh.dev/docs/installation/windows](https://ohmyposh.dev/docs/installation/windows)

4. **Instalar fuentes recomendadas**
   Ejecuta el siguiente comando en PowerShell:

   ```powershell
   oh-my-posh font install
   ```

   Selecciona e instala la fuente llamada **Hack**.

5. **Ver temas disponibles**
   Ejecuta:

   ```powershell
   Get-PoshThemes
   ```

   Esto descargará los temas y mostrará la ruta donde fueron guardados (anótala).

6. **Crear archivo de configuración del perfil**
   Ejecuta:

   ```powershell
   New-Item -Path $PROFILE -Type File -Force
   ```

7. **Editar el archivo de configuración**
   Abre el perfil con:

   ```powershell
   notepad $PROFILE
   ```

8. **Configurar tu perfil con herramientas adicionales y personalización avanzada**
   Pega las siguientes líneas en el archivo:

   ```powershell
   oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\nanotech.omp.json" | Invoke-Expression

   Import-Module Terminal-Icons
   Set-PSReadLineOption -PredictionViewStyle ListView

   # Importar el perfil de Chocolatey para habilitar autocompletado
   $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
   if (Test-Path($ChocolateyProfile)) {
     Import-Module "$ChocolateyProfile"
   }

   Import-Module PSFzf
   $env:FZF_DEFAULT_OPTS='--height 80% --layout=reverse --border'

   function ff {
       code $(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")
   }
   ```

   ✅ Guarda y cierra el archivo.

9. **Cerrar y volver a abrir la terminal** para aplicar todos los cambios.

> **Nota:** Este repositorio incluye un archivo llamado `Microsoft.PowerShell_profile.ps1` con todas estas configuraciones ya preparadas.

---

## 🎨 Cambiar el Esquema de Colores (Gruvbox)

1. Abre el archivo `gruvbox.json` que se encuentra en esta misma carpeta.
2. Copia todo su contenido.
3. Abre la Terminal de Windows → Menú desplegable (⌑) → **Configuración** → Abre el archivo JSON.
4. Dentro del archivo JSON, busca la etiqueta `"schemes"` y pega el contenido copiado dentro de ese arreglo.
5. Guarda y cierra el archivo JSON.

> Ejemplo de colores Gruvbox:
>
> ![Gruvbox Example](https://i.imgur.com/wa666xg.png)

---

## ✅ ¡Listo!

Tu terminal ahora tiene un estilo **minimalista**, **moderno** y **totalmente personalizado**, con herramientas potentes como `fzf`, `bat`, `Terminal-Icons` y autocompletado para `choco`.
Disfruta de una experiencia de desarrollo más agradable y productiva 🚀

---
