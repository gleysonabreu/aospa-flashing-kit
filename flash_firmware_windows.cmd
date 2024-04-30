@echo off
:: Flash firmware zip generated by xiaomi-flashable-firmware-creator
:: (https://xiaomifirmwareupdater.com/) on alioth
::
:: Author: Adithya R (@ghostrider_reborn)

if exist "%~dp0firmware.zip" (
    set fw_zip=%~dp0firmware.zip
) else (
    if exist "%~dp0firmware.zip.zip" (
        set fw_zip=%~dp0firmware.zip.zip
    ) else (
        echo Error: firmware.zip not found!
        goto :exit
    )
)

set fw_path=%~dp0firmware

echo Extracting firmware.zip ...
powershell Expand-Archive -Path '%fw_zip%' -DestinationPath '%fw_path%' -Force

set fastboot=%~dp0platform-tools-windows\fastboot.exe

set partitions=abl aop bluetooth cmnlib cmnlib64 devcfg dsp featenabler hyp imagefv^
    keymaster modem qupfw tz uefisecapp xbl xbl_config

(for %%p in (%partitions%) do ( 
    echo:
    echo Flashing %%p ...
    "%fastboot%" flash %%p_ab "%fw_path%\firmware-update\%%p.img"
    if ERRORLEVEL 1 (
        echo Error: Flashing %%p failed!
        goto :exit
    )
))

echo:
echo Completed succesfully!

:exit
pause