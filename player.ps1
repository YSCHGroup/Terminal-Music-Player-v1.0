# Music Player v1.0 by Dotch

    # Setup
if (-NOT(Test-Path $PWD\library.lib)) {
    New-Item $PWD\library.lib -type file
}

    # Variables
$MusicArray = @('1','2')

    # Functions
function showLib {
    $i = 0;
    $l = 0;
    $SongsInLib = 0;
    $libPath = "$pwd\library.lib"
    $homePath = "$pwd"

    Write-Host "------ Music Library ------------------------------------------------------------" -f Yellow;
    Write-Host "| ID: |   Name:" -f darkGray

    Get-Content $libPath | Foreach-Object {
        $filePath = $_.Trim('"')
        $Files = Get-ChildItem "$filePath\*.MP3"
        $l += 1

        ForEach ($file in $Files) {
            $i += 1
            $SongsInLib += 1
            $file = $file.ToString()
            $file = $file.Trim($filePath)
            $fileName = $file.Trim(".mp3")
            write-host "| $l.$i |   $fileName"
        }
    }

    Write-Host " Songs: $SongsInLib Librarys: $l `n---------------------------------------------------------------------------------" -f Yellow;
}
function menu {
    # Display
    Write-Host " Music Player v1.0 ~Dotch`n" -f darkYellow
    Write-Host "        1. Play all songs in order" -f White;
    Write-Host "        2. Play spesific song"  -f White -NoNewline; Write-Host "  (Enter song ID after: '2. [ID]')" -f darkGray;
    Write-Host "        3. Play random song" -f White;
    Write-Host "        4. Search for song" -f White;
    Write-Host "        5. Search for ID" -f White;
    Write-Host "        6. List libraries" -f White;
    Write-Host "        7. Add library" -f White;
    Write-Host "        8. Remove library" -f White;
    Write-Host "        9. exit`n" -f White;


    # Choice

    $choice = Read-Host "What do you want to do? "
    if ($choice -eq "1") {  }
    if ($choice.StartsWith("2")) { playSpes }
    if ($choice -eq "3") {  }
    if ($choice -eq "4") {  }
    if ($choice -eq "5") {  }
    if ($choice -eq "6") {  }
}
function playSpes {
    $playSong = $choice.TrimStart("2");
    $playSong = $choice.Trim();
    $SongArr = $playSong -split '.';

    $SongPath = get-content library.lib | select -first 1 -skip $SongArr[0]
    "$SongPath"
}


    # Call Functions
while ($true) {
    cls;
    showLib;
    menu;
    Read-Host
}