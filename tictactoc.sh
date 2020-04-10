#!/bin/bash
# -------------------- Variables ------------------------------
place=("-" "-" "-" "-" "-" "-" "-" "-" "-")
turn=0
toss=0
players=0
player1=""
player2=""
winner=""
loser=""
winSign=""
losSign=""
xs=0
ys=0
getNum=""

# --------------------- board functions ------------------------------------
function ground {
	clear
	echo -e "\t\t\tB O A R D"
	echo "|-------|---------------|---------------|---------------|"
	echo -e "|x/y\t|\t1\t|\t2\t|\t3\t|"
	echo "|-------|---------------|---------------|---------------|"
	echo -e "|1\t|\t${place[0]}\t|\t${place[1]}\t|\t${place[2]}\t|"
	echo "|-------|---------------|---------------|---------------|"
	echo -e "|2\t|\t${place[3]}\t|\t${place[4]}\t|\t${place[5]}\t|"
	echo "|-------|---------------|---------------|---------------|"
	echo -e "|3\t|\t${place[6]}\t|\t${place[7]}\t|\t${place[8]}\t|"
	echo "|-------|---------------|---------------|---------------|"
}

# -------------------- Input Function ---------------------------
function Input {
	read -p "$1" val 
	echo $val
}

# -------------------- Get Random Number Fuction -------------------
function getRand {
	# Seeding Random with system clock
	RANDOM=$(date | cut -d ' ' -f 4 | cut -d : -f 3)
	randNum=$(( (RANDOM % $1 ) + 1 ))
	echo $randNum
}
# ------------------- Players function ---------------------------
function numPlayers {
	clear
	until [[ $players -eq 1 || $players -eq 2 ]]; do
		players=$(Input "How many players : ")
		
		if [[ $players -eq 1 ]]; then
			player1=$(Input "Player 1 Name : ")
			player2="Computer"
			if [[ $player1 == "" ]]; then
				player1="Player1"
			fi
		fi
		
		if [[ $players -eq 2 ]]; then
			player1=$(Input "Player 1 Name : ")
			player2=$(Input "Player 2 Name : ")
			if [[ $player1 == "" ]]; then
				palyer1="Player1"
			fi
			if [[ $player2 == "" ]]; then
				player2="Player2"
			fi
		fi

		if [[ $players -gt 2 || $players -lt 1 ]]; then
			echo "You can select only upto 2 players"
		fi
		echo "---------------------------------------------------"
		echo
	done
}
# --------------- Toss fuction ------------------
function getToss {
	clear
	secret=$(getRand 2)
	until [[ $toss -eq 1 || $toss -eq 2 ]]; do
		echo "$player1 select an option"
		toss=$(Input "[1] Head / [2] Tails : ")
		if [[ $toss -lt 1 || $toss -gt 2 ]]; then
			echo "A coin can have only to faces, :)"
		fi
		echo "---------------------------------------------------"
		echo
	done
}
# ------------------ checkResult function -------------------
function checkResult {
	if [[ ${place[0]} == $sign && ${place[4]} == $sign && ${place[8]} == $sign ]]; then
		echo "Won"
	fi

	if [[ ${place[0]} == $sign && ${place[1]} == $sign && ${place[2]} == $sign ]]; then
		echo "Won"
	fi

	if [[ ${place[0]} == $sign && ${place[3]} == $sign && ${place[6]} == $sign ]]; then
		echo "Won"
	fi

	if [[ ${place[1]} == $sign && ${place[4]} == $sign && ${place[7]} == $sign ]]; then
		echo "Won"
	fi

	if [[ ${place[2]} == $sign && ${place[5]} == $sign && ${place[8]} == $sign ]]; then
		echo "Won"
	fi

	if [[ ${place[2]} == $sign && ${place[4]} == $sign && ${place[6]} == $sign ]]; then
		echo "Won"
	fi

	if [[ ${place[3]} == $sign && ${place[4]} == $sign && ${place[5]} == $sign ]]; then
		echo "Won"
	fi

	if [[ ${place[6]} == $sign && ${place[7]} == $sign && ${place[8]} == $sign ]]; then
		echo "Won"
	fi
}
# --------------- getSign Function ------------------------
function randSign {
	if [[ $1 == ${place[0]} && $1 == ${place[1]} ]]; then
		val="13"
	fi
	if [[ $1 == ${place[0]} && $1 == ${place[2]} ]]; then
		val="12"
	fi
	if [[ $1 == ${place[2]} && $1 == ${place[1]} ]]; then
		val="11"
	fi

	if [[ $1 == ${place[0]} && $1 == ${place[3]} ]]; then
		val="31"
	fi
	if [[ $1 == ${place[0]} && $1 == ${place[6]} ]]; then
		val="21"
	fi
	if [[ $1 == ${place[3]} && $1 == ${place[6]} ]]; then
		val="11"
	fi

	if [[ $1 == ${place[0]} && $1 == ${place[4]} ]]; then
		val="33"
	fi
	if [[ $1 == ${place[4]} && $1 == ${place[8]} ]]; then
		val="11"
	fi
	if [[ $1 == ${place[0]} && $1 == ${place[8]} ]]; then
		val="22"
	fi

	if [[ $1 == ${place[1]} && $1 == ${place[4]} ]]; then
		val="32"
	fi
	if [[ $1 == ${place[4]} && $1 == ${place[7]} ]]; then
		val="12"
	fi
	if [[ $1 == ${place[1]} && $1 == ${place[7]} ]]; then
		val="22"
	fi

	if [[ $1 == ${place[2]} && $1 == ${place[5]} ]]; then
		val="33"
	fi
	if [[ $1 == ${place[5]} && $1 == ${place[8]} ]]; then
		val="13"
	fi
	if [[ $1 == ${place[2]} && $1 == ${place[8]} ]]; then
		val="23"
	fi

	if [[ $1 == ${place[2]} && $1 == ${place[4]} ]]; then
		val="31"
	fi
	if [[ $1 == ${place[4]} && $1 == ${place[6]} ]]; then
		val="13"
	fi
	if [[ $1 == ${place[2]} && $1 == ${place[6]} ]]; then
		val="22"
	fi

	if [[ $1 == ${place[3]} && $1 == ${place[4]} ]]; then
		val="23"
	fi
	if [[ $1 == ${place[4]} && $1 == ${place[5]} ]]; then
		val="21"
	fi
	if [[ $1 == ${place[3]} && $1 == ${place[5]} ]]; then
		val="22"
	fi

	if [[ $1 == ${place[6]} && $1 == ${place[7]} ]]; then
		val="33"
	fi
	if [[ $1 == ${place[7]} && $1 == ${place[8]} ]]; then
		val="31"
	fi
	if [[ $1 == ${place[6]} && $1 == ${place[8]} ]]; then
		val="32"
	fi

	echo $val
}

# ============== Main Program Body ====================
numPlayers
getToss

if [[ $toss -eq $secret ]]; then
	echo "$player1 you won the toss."
	echo 
	echo "$player1 your sign = X"
	echo
	echo "$player2 your sign = O"
	winSign="X"
	losSign="O"
	winner=$player1
	loser=$player2
else
	echo "$player2 you won the toss."
	echo
	echo "$player2 your sign = X"
	echo
	echo "$player1 your sign = O"
	winSign="X"
	losSign="O"
	winner=$player2
	loser=$player1
fi
echo
Input "Press Enter..."
turn=1
while true; do
	ground
	
	echo
	if [[ $turn -eq 1 || $turn -eq 3 || $turn -eq 5 || $turn -eq 7 || $turn -eq 9 ]]; then
		echo "$winner chose your co-ordinates"
		sign=$winSign
		playerTurn=$winner
	else
		echo "$loser chose your co-ordinates"
		sign=$losSign
		playerTurn=$loser
	fi
	echo "------------------------------------------"

	if [[ $playerTurn == "Computer" ]]; then
		if [[ $turn -lt 5 ]]; then
			xs=$(getRand 3)
			ys=$(getRand 3)
			getNum=$xs$ys

		fi
		if [[ $turn -gt 2 ]]; then
			
			mySign=$sign

			if [[ $mySign = "X" ]]; then
				opSign="O"
			fi
			if [[ $mySign = "O" ]]; then
				opSign="X"
			fi

			getNum=$(randSign "$opSign")

			if [[ ${place[getNum]} != "-" ]]; then
				xs=$(getRand 3)
				ys=$(getRand 3)
				getNum=$xs$ys
			fi
			
		fi

	else

		until [[ $xs -gt 0 && $xs -lt 4 && $ys -gt 0 && $ys -lt 4 ]]; do
			xs=$(Input "X Co-ordinates : ")
			ys=$(Input "Y Co-ordinates : ")
			if [[ $xs -lt 1 || $xs -gt 4 || $ys -lt 1 || $ys -gt 4 ]]; then
				echo "----------------------------------------------------------"
				echo "You selected wrong co-ordinates"
				echo "Must be [1 - 3 ], try again"
				echo "----------------------------------------------------------"
			fi
		done
		getNum=$xs$ys
	fi
	
	num=$getNum

	case $num in 
		"11") 
				if [[ ${place[0]} == "-" ]]; then
					place[0]=$sign
					((turn++))
				fi
				;;
				
		"12") 
				if [[ ${place[1]} == "-" ]]; then
					place[1]=$sign
					((turn++))
				fi
				;;
		"13") 
				if [[ ${place[2]} == "-" ]]; then
					place[2]=$sign
					((turn++))
				fi
				;;
		"21") 
				if [[ ${place[3]} == "-" ]]; then
					place[3]=$sign
					((turn++))
				fi
				;;
		"22") 
				if [[ ${place[4]} == "-" ]]; then
					place[4]=$sign
					((turn++))
				fi
				;;
		"23") 
				if [[ ${place[5]} == "-" ]]; then
					place[5]=$sign
					((turn++))
				fi
				;;
		"31") 
				if [[ ${place[6]} == "-" ]]; then
					place[6]=$sign
					((turn++))
				fi
				;;
		"32") 
				if [[ ${place[7]} == "-" ]]; then
					place[7]=$sign
					((turn++))
				fi
				;;
		"33") 
				if [[ ${place[8]} == "-" ]]; then
					place[8]=$sign
					((turn++))
				fi
				;;
	esac
	
	result=$(checkResult)
	if [[ $result == "Won" ]]; then
		ground
		break
	fi
	xs=0
	ys=0
done
echo "--------------------------------------------------------|"
echo "[ $playerTurn ] you won                                 |"
echo "--------------------------------------------------------|"