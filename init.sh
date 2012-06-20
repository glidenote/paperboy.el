#!/bin/sh

RCFILES="
.bashrc
.zshrc
.tcshrc
.cshrc
"

echo "powerup your emacs."

for FILE in ${RCFILES};
do
    if [ -e ~/${FILE} ]; then
        echo "" >> ~/${FILE}
        echo "#====================" >> ~/${FILE}
        echo "# powerup your emacs " >> ~/${FILE}
        echo "#====================" >> ~/${FILE}
        echo "alias emacs='vim'" >> ~/${FILE}
    fi
done

echo "enjoy your emacs life!"
exec $SHELL
