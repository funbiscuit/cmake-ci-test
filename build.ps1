$ErrorActionPreference = 'Stop';

mkdir build_msvc15_x64
cd build_msvc15_x64
cmake -DQT_WIN_PATH="$env:QT_DIR_WIN_64" -G "Visual Studio 15 2017 Win64" ..
cmake --build . --config Release
cd ..
mkdir build_msvc15_x86
cd build_msvc15_x86
cmake -DQT_WIN_PATH="$env:QT_DIR_WIN_32" -G "Visual Studio 15 2017" ..
cmake --build . --config Release
cd ..
# create folders for binaries
mkdir bin_msvc15_x64
mkdir bin_msvc15_x64\platforms
mkdir bin_msvc15_x64\styles
mkdir bin_msvc15_x86
mkdir bin_msvc15_x86\platforms
mkdir bin_msvc15_x86\styles
# copy executable and dll's for msvc15-x64
copy build_msvc15_x64\Release\cmake_test.exe bin_msvc15_x64\cmake_test.exe
copy "$env:QT_DIR_WIN_64\bin\Qt5Core.dll" bin_msvc15_x64\Qt5Core.dll
copy "$env:QT_DIR_WIN_64\bin\Qt5Gui.dll" bin_msvc15_x64\Qt5Gui.dll
copy "$env:QT_DIR_WIN_64\bin\Qt5Widgets.dll" bin_msvc15_x64\Qt5Widgets.dll
copy "$env:QT_DIR_WIN_64\plugins\platforms\qwindows.dll" bin_msvc15_x64\platforms\qwindows.dll
copy "$env:QT_DIR_WIN_64\plugins\styles\qwindowsvistastyle.dll" bin_msvc15_x64\styles\qwindowsvistastyle.dll
# copy executable and dll's for msvc15-x86
copy build_msvc15_x86\Release\cmake_test.exe bin_msvc15_x86\cmake_test.exe
copy "$env:QT_DIR_WIN_32\bin\Qt5Core.dll" bin_msvc15_x86\Qt5Core.dll
copy "$env:QT_DIR_WIN_32\bin\Qt5Gui.dll" bin_msvc15_x86\Qt5Gui.dll
copy "$env:QT_DIR_WIN_32\bin\Qt5Widgets.dll" bin_msvc15_x86\Qt5Widgets.dll
copy "$env:QT_DIR_WIN_32\plugins\platforms\qwindows.dll" bin_msvc15_x86\platforms\qwindows.dll
copy "$env:QT_DIR_WIN_32\plugins\styles\qwindowsvistastyle.dll" bin_msvc15_x86\styles\qwindowsvistastyle.dll

