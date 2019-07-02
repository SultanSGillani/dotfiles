
#Fill screen with colours | Usage: colours
colours()
{
  _I=1
  _J=0
  _K=0
  _WIDTH=$COLUMNS
  _MARGIN=0
  while true; do
  _A=$(($RANDOM % 3))
  _B=$(($RANDOM % 2))
  _C=$(($RANDOM % 3))
  case $_A in
  0)
    case $_B in
    0)
      [ $_I -gt 1 ] && _I=$(($_I - 1))
    ;;
    1)
      [ $_I -lt 6 ] && _I=$(($_I + 1))
    ;;
    esac
  ;;
  1)
    case $_B in
    0)
      [ $_J -gt 0 ] && _J=$(($_J - 1))
    ;;
    1)
      [ $_J -lt 5 ] && _J=$(($_J + 1))
    ;;
    esac
  ;;
  2)
    case $_B in
    0)
      [ $_K -gt 0 ] && _K=$(($_K - 1))
    ;;
    1)
      [ $_K -lt 5 ] && _K=$(($_K + 1))
    ;;
    esac
  ;;
  esac
  case $1 in
    1)
      _DELTA=$2
      case $_C in
        0)
          [ $_WIDTH -lt $(($COLUMNS - 2*$_DELTA)) ] && _WIDTH=$(($_WIDTH + 2*$_DELTA))
        ;;
        1)
          [ $_WIDTH -gt $((1 + 2*$_DELTA)) ] && _WIDTH=$(($_WIDTH - 2*$_DELTA))
        ;;
      esac
      _MARGIN=$((($COLUMNS-$_WIDTH)/2))
    ;;
    2)
      _WIDTH=$2
      _DELTA=$3
      case $_C in
        0)
          [ $_MARGIN -le $(($COLUMNS - $_WIDTH - $_DELTA)) ] && _MARGIN=$(($_MARGIN + $_DELTA))
        ;;
        1)
          [ $_MARGIN -ge $_DELTA ] && _MARGIN=$(($_MARGIN - $_DELTA))
        ;;
      esac
    ;;
    *)
      _WIDTH=$COLUMNS
      _MARGIN=0
    ;;
  esac
  _NUMBER=$((15 + $_I + 6*$_J + 36*$_K))

  echo -en "\e[0;49m"
  if [ $_MARGIN -gt 0 ]; then
    for _FOO in $(seq $_MARGIN); do
      echo -en " "
    done
  fi

  printf "\e[0;48;5;${_NUMBER}m"
  for _FOO in $(seq $_WIDTH); do
    echo -en " "
  done

  echo -e "\e[0;49m"
  done
}