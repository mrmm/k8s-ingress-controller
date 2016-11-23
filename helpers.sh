BASEDIR=$(dirname "$0")
source $BASEDIR/color-lib.sh

# Helper functions
function error(){
	echo -e "${BRed}[error]	$1 ${RCol}"
}
function info(){
	echo -e "${Yel}[info]	$1 ${RCol}"
}
function debug(){
	echo -e "${Whi}[debug]	$1 ${RCol}"
}
function warning(){
	echo -e "${BPur}[warn]	$1 ${RCol}"
}