$ErrorActionPreference = 'Stop';

$vc_arch = @(" Win64", "") #empty for Win32
$sufx = @("msvc15_x64", "msvc15_x86")

$qt_dlls = @("Qt5Core.dll","Qt5Gui.dll","Qt5Widgets.dll")
$qt_plug = @("platforms\qwindows.dll","styles\qwindowsvistastyle.dll")

for($i = 0; $i -lt $vc_arch.length; $i++){
    if($i -eq 0){
       $qt_path = "$env:QT_DIR_WIN_64"
    } else {
       $qt_path = "$env:QT_DIR_WIN_32"
    }

    mkdir "build_$sufx[$i]"
    cd "build_$sufx[$i]"
    cmake -DQT_WIN_PATH="$env:QT_DIR_WIN_64" -G "Visual Studio 15 2017$vc_arch" ..
    cmake --build . --config Release
    cd ..

    # create folders for binaries
    mkdir "bin_$sufx[$i]"
    mkdir "bin_$sufx[$i]\platforms"
    mkdir "bin_$sufx[$i]\styles"

    # copy executable and dll's for msvc15-x64
    copy "build_$sufx[$i]\Release\cmake_test.exe" "bin_$sufx[$i]\cmake_test.exe"
    for($j = 0; $j -lt $qt_dlls.length; $j++){
        copy "$qt_path\bin\$qt_dlls[$j]" "bin_$sufx[$i]\$qt_dlls[$j]"
    }
    for($j = 0; $j -lt $qt_plug.length; $j++){
        copy "$qt_path\plugins\$qt_plug[$j]" "bin_$sufx[$i]\$qt_plug[$j]"
    }
}
