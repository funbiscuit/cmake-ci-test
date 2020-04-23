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
    
    $vc = $sufx[$i]
    $vc_gen_sfx = $vc_arch[$i]

    mkdir "build_$vc"
    cd "build_$vc"
    cmake -DQT_WIN_PATH="$qt_path" -G "Visual Studio 15 2017$vc_gen_sfx" ..
    cmake --build . --config Release
    cd ..

    # create folders for binaries
    mkdir "bin_$vc"
    mkdir "bin_$vc\platforms"
    mkdir "bin_$vc\styles"

    # copy executable and dll's for msvc15-x64
    copy "build_$vc\Release\cmake_test.exe" "bin_$vc\cmake_test.exe"
    for($j = 0; $j -lt $qt_dlls.length; $j++){
        $dll = $qt_dlls[$j]
        copy "$qt_path\bin\$dll" "bin_$vc\$dll"
    }
    for($j = 0; $j -lt $qt_plug.length; $j++){
        $dll = $qt_plug[$j]
        copy "$qt_path\plugins\$dll" "bin_$vc\$dll"
    }
}
