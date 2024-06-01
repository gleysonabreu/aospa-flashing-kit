@echo off
:: Debloat HyperOS
::
:: Author: Gleyson Abreu (@gleysonabreu)

set packages=com.android.email com.android.hotwordenrollment.okgoogle com.android.hotwordenrollment.xgoogle com.fingerprints.sensortesttool^
    com.google.android.apps.restore com.google.android.gms.location.history com.google.android.googlequicksearchbox com.google.android.onetimeinitializer^
    com.google.android.printservice.recommendation com.google.android.tts com.google.ar.lens com.mfashiongallery.emag com.mi.globalbrowser com.mi.health^
    com.miui.backup com.miui.bugreport com.miui.cloudbackup com.miui.cloudservice com.miui.cloudservice.sysbase com.miui.contentcatcher com.miui.daemon^
    com.miui.huanji com.miui.micloudsync com.miui.miservice com.miui.mishare.connectivity com.miui.newmidrive com.miui.nextpay com.miui.personalassistant^
    com.miui.touchassistant com.miui.vsimcore com.wapi.wapicertmanage com.xiaomi.joyose com.xiaomi.macro com.xiaomi.mi_connect_service com.xiaomi.micloud.sdk^
    com.xiaomi.miplay_client com.xiaomi.mirror com.xiaomi.payment com.xiaomi.simactivate.service org.mipay.android.manager com.bsp.catchlog com.miui.maintenancemode^
    com.xiaomi.devauth com.google.android.ims cn.wps.moffice_eng.xiaomi.lite com.miui.face com.miui.uireporter com.xiaomi.xmsfkeepr com.xiaomi.NetworkBoost^
    com.miui.phrase com.google.android.feedback com.qualcomm.atfwd com.android.traceur com.quicinc.voice.activation com.google.android.partnersetup^
    com.miui.face.overlay.miui com.miui.misightservice com.xiaomi.digitalkey com.xiaomi.otrpbroker com.google.android.setupwizard com.android.chrome^
    com.android.providers.partnerbookmarks com.facebook.appmanager com.facebook.services com.facebook.system com.google.android.apps.googleassistant^
    com.google.android.apps.maps com.google.android.apps.setupwizard.searchselector com.google.android.apps.subscriptions.red com.google.android.apps.wellbeing^
    com.google.android.marvin.talkback com.miui.analytics com.miui.hybrid com.miui.hybrid.accessory com.miui.msa.global com.miui.yellowpage com.xiaomi.midrop^
    com.android.calllogbackup com.android.dreams.phototable com.android.bips com.android.stk org.ifaa.aidl.manager com.tencent.soter.soterserver^
    com.miui.accessibility com.miui.carlink com.miui.greenguard com.miui.systemAdSolution com.miui.translation.kingsoft com.miui.translation.xmcloud^
    com.miui.translationservice com.miui.tsmclient com.miui.voiceassist com.miui.voiceassistoverlay com.miui.voicetrigger android.autoinstalls.config.Xiaomi.qssi^
    com.android.dreams.basic com.android.emergency com.google.android.apps.turbo com.mi.healthglobal com.mipay.wallet.in com.miui.cit com.miui.freeform^
    com.miui.guardprovider com.miui.mediafeature com.xiaomi.mipicks com.xiaomi.mtb com.xiaomi.powerchecker com.xiaomi.xmsfkeeper com.qualcomm.embms^
    com.qualcomm.qti.autoregistration com.xiaomi.account com.miui.cleaner com.xiaomi.miaudiovisual com.qti.xdivert com.qualcomm.qti.uim^
    com.android.bluetoothmidiservice com.miui.compass com.miui.player com.miui.videoplayer

set adb=%~dp0platform-tools-windows\adb.exe

:: Loop through each package and uninstall it
(for %%i in (%packages%) do (
    echo Uninstalling app: %%i...
    %adb% shell pm uninstall -k --user 0 "%%i"

))

echo:
echo All specified apps have been uninstalled.

:exit
pause