@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "E:\Google Drive\Bachelor\Snaky\labels.tmp" -fI -W+ie -C V2E -o "E:\Google Drive\Bachelor\Snaky\Snaky.hex" -d "E:\Google Drive\Bachelor\Snaky\Snaky.obj" -e "E:\Google Drive\Bachelor\Snaky\Snaky.eep" -m "E:\Google Drive\Bachelor\Snaky\Snaky.map" "E:\Google Drive\Bachelor\Snaky\Snaky.asm"
