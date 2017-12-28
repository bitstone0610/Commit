for Y in {2014..2017}
do
  mkdir $Y
  cd $Y
  for M in {01..12}
  do
    mkdir $M
    cd $M
    for D in {01..28}
    do
      if [  "0" == "$(($RANDOM%3))"  ]; then  continue; fi
      mkdir $D
      cd $D
      for i in $(seq 1 $(($RANDOM%7)))
       do
	echo "0$i on $M/$D/$Y" > commit.md
        export GIT_COMMITTER_DATE="$Y-$M-$D 12:0$i:00"
        export GIT_AUTHOR_DATE="$Y-$M-$D 12:0$i:00"
        git add commit.md -f
        git commit --date="$Y-$M-$D 12:0$i:00" -m "0$i on $M $D $Y"
       done
      cd ../
    done
    cd ../
  done
  cd ../
done
git push origin master
git rm -rf 20**
git commit -am "cleanup"
git push origin master