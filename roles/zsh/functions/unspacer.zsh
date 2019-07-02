
unspacer() #remove spaces from files in current dir
{          #replaces spaces with underscores
 for i in *
  do
   [ ! "$i" == "$(echo $i | tr '\ ' '_')" && mv ./"$i" ./$(echo $i | tr '\ ' '_')
  done
}