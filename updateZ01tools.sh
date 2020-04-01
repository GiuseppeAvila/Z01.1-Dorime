#!/bin/bash

echo "----------------------------------------"
echo "         ELEMENTOS DE SISTEMAS          "
echo "----------------------------------------"

echo "-------------------------------------------------------"
echo "- Módulos python"
echo "-------------------------------------------------------"
pip3 install -r requirements.txt --user

echo "-------------------------------------------------------"
echo "- Z01 tools"
echo "-------------------------------------------------------"
Z01_PATH=$HOME/Z01-Tools/
Z01_TOOLS_URL=https://github.com/insper/Z01-tools
if [ ! -d "$Z01_PATH" ]; then
    echo "Instalando Z01-1 tools"
    git clone $Z01_TOOLS_URL $Z01_PATH
else
    echo "Buscando por atualizações no Z01-1 tools"
    git -C $Z01_PATH stash
    git -C $Z01_PATH checkout master
    git -C $Z01_PATH pull origin master
fi

wait
