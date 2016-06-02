#!/bin/bash

folder=$1 #recives the folder direction
programFileName=$2
outputFileName=$3

if [[ -n "$folder" ]]; then
 echo ""
else
  echo "argument error"
fi

latexCmd="\\\includepdf[pages={-},pagecommand={\\\thispagestyle{VerticalNumbering}}]{%FILE%}"
latexRestartNumbering="\\pagenumbering{arabic}"
latexEndDocument="\\end{document}"

programCmdList=$(ls $folder | sort -g | grep ".pdf" | awk  -v cmd="$latexCmd" {' temp = cmd ; gsub("%FILE%" , $0 , temp) ; print temp'})
#echo "$programCmdList"

#rm outputFileName.text
cp fileTemplate.tex outputFileName.tex

#Should add the pensum to the file

#Add page numbering restart
echo "$latexRestartNumbering" >> outputFileName.tex

#Add commands for all the programs in the folder
echo "$programCmdList" >> outputFileName.tex
echo "$latexEndDocument" >> outputFileName.tex

mv outputFileName.tex $folder
#sed 's/\t/\\t/g' outputFileName.tex > realOutputFileName.tex

#awk -v file="$fileReplaced" {'gsub(%PROGRAMS%, "hola!!!!!!!!" , file); print file'}
#cat toCompile.tex
