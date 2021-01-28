#!/bin/bash
set -x
# 确保脚本抛出遇到的错误
set -e
home=`pwd`
nav=""
function demoFun(){
for file in `ls  ./docs`
  do
    filePath=$home"/docs/"$file
    if [ $file != "README.md" ]
    then 
      nav=$nav\,$file
    fi 
    if [ -d $filePath ]
    then 
      for subfile in `ls $filePath`
        do
          subfilePath=$home"/docs/"$file"/"$subfile
         if [ $subfile != "README.md" ]
         then
          nav=$nav\,$file"/"$subfile
         fi 
          if [ -d $subfilePath ]
            then 
              for subSubfile in `ls $subfilePath`
                do
                if [ $subSubfile != "README.md" ]
                then
                  nav=$nav\,$file"/"$subfile"/"$subSubfile
                fi 
                done
            fi
        done
    fi
  done
  nav=\"$nav\"
  echo module.exports=$nav > ./nav.js
}
demoFun
