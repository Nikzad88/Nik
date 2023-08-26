@ECHO OFF
CLS

NET USE W: \\eewdfs01.eew-group.local\Data
NET USE Z: \\eewfs01.eew-group.local\Homefolder$

//@echo off SET NetDrive=W: if not exist %NetDrive% ( echo Nicht verbunden: Verbinde Netzwerklaufwerk net use %NetDrive% \\eewdfs01.eew-group.local\Data /savecred /persistent:no ) else ( echo Verbunden: Trenne Netzwerklaufwerk net use %NetDrive% /delete /yes ) pause



//@echo off SET NetDrive=Z: if not exist %NetDrive% ( echo Nicht verbunden: Verbinde Netzwerklaufwerk net use %NetDrive% \\eewdfs01.eew-group.local\Home$ /savecred /persistent:no ) else ( echo Verbunden: Trenne Netzwerklaufwerk net use %NetDrive% /delete /yes ) pause