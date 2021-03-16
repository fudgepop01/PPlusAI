sudo mount -o defaults,umask=000 ./sd.raw /media/sdcard

FT_PATH_HEAD="/media/sdcard/Project+/pf/fighter/"
CHARS_PATH_HEAD="/media/sf_Chars/"
Fighters[0]="Captain"
Fighters[1]="Dedede"
Fighters[2]="Diddy"
Fighters[3]="Donkey"
Fighters[4]="Falco"
Fighters[5]="Fox"
Fighters[6]="GameWatch"
Fighters[7]="Ganon"
Fighters[8]="GKoopa"
Fighters[9]="Ike"
Fighters[10]="Kirby"
Fighters[11]="Knuckles"
Fighters[12]="Koopa"
Fighters[13]="Link"
Fighters[14]="Lucario"
Fighters[15]="Lucas"
Fighters[16]="Luigi"
Fighters[17]="Mario"
Fighters[18]="Marth"
Fighters[19]="Metaknight"
Fighters[20]="Mewtwo"
Fighters[21]="Ness"
Fighters[22]="Peach"
Fighters[23]="Pikachu"
Fighters[24]="Pikmin"
Fighters[25]="Pit"
Fighters[26]="PokeFushigisou"
Fighters[27]="PokeLizardon"
Fighters[28]="PokeZenigame"
Fighters[29]="Popo"
Fighters[30]="Purin"
Fighters[31]="Robot"
Fighters[32]="Roy"
Fighters[33]="Samus"
Fighters[34]="Sheik"
Fighters[35]="Snake"
Fighters[36]="Sonic"
Fighters[37]="SZerosuit"
Fighters[38]="ToonLink"
Fighters[39]="Wario"
Fighters[40]="Wolf"
Fighters[41]="Yoshi"
Fighters[42]="Zelda"

CopyFtData() {
	FtName=$1
	LCName=${FtName,,}
	FullFtPath="${FT_PATH_HEAD}${LCName}/Fit${FtName}MotionEtc.pac"
	BackupFtPath="${FT_PATH_HEAD}${LCName}/Fit${FtName}Etc00.pac"
	BackupFtPath2="${FT_PATH_HEAD}${LCName}/Fit${FtName}Etc.pac"
	FROM="${CHARS_PATH_HEAD}${LCName}/out/"
	if test -f "${FullFtPath}"; then
		FROM_FULL="${FROM}/Fit${FtName}MotionEtc.pac"
		if test -f "${FROM_FULL}"; then
			cp "${FROM_FULL}" "${FullFtPath}"
			echo "[main] ${FtName} moved successfully"
		else
			echo "[main] ${FtName} SRC NOT FOUND"
		fi
	elif test -f "${BackupFtPath}"; then
		FROM_FULL="${FROM}/Fit${FtName}Etc00.pac"
		if test -f "${FROM_FULL}"; then
			cp "${FROM_FULL}" "${FullFtPath}"
			echo "[Backup] ${FtName} moved successfully"
		else
			echo "[Backup] ${FtName} SRC NOT FOUND"
		fi
	elif test -f "${BackupFtPath2}"; then
		FROM_FULL="${FROM}/Fit${FtName}Etc.pac"
		if test -f "${FROM_FULL}"; then
			cp "${FROM_FULL}" "${FullFtPath}"
			echo "[Backup 2] ${FtName} moved successfully"
		else
			echo "[Backup 2] ${FtName} SRC NOT FOUND"
		fi
	else
		echo "${FtName} DEST NOT FOUND"
	fi
}

for i in "${Fighters[@]}"; do
	CopyFtData $i
done

sudo umount -l /media/sdcard
