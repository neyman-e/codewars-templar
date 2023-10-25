#! /bin/zsh

set -e

# Go to the kata level folder which we ask to the user
cd /home/neyman/code/neyman-e/katare-kid/codewars
read -p "What is the level of the kata?" level
folderlevel="${level}kyu"
cd $folderlevel

# Create the new kata folder
newfoldernumber=`find -maxdepth 1 -type d | wc -l`
read -p "What's the name of the kata?" kataname
declare -l kataname
kataname=$kataname
if [ $newfoldernumber -ge 10 ]
then
  foldername="${newfoldernumber}-${kataname// /-}"
else
  foldername="0${newfoldernumber}-${kataname// /-}"
fi
mkdir $foldername

# Copy the template folder into the created kata folder and open VS Code
cp -r /home/neyman/code/neyman-e/katare-kid/codewars/kata-template/* $foldername
code ..
