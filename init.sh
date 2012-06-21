#!/bin/sh

RCFILES="
.bashrc
.zshrc
.cshrc
.tcshrc
"

echo "powerup your emacs."

for FILE in ${RCFILES};
do
    if [ -e ~/${FILE} ]; then
        echo "" >> ~/${FILE}
        echo "#====================" >> ~/${FILE}
        echo "# powerup your emacs " >> ~/${FILE}
        echo "#====================" >> ~/${FILE}
        if [ ${FILE} = ".cshrc" -o ${FILE} = ".tcshrc" ]; then
            echo "alias emacs 'vim'" >> ~/${FILE}
        else
            echo "alias emacs='vim'" >> ~/${FILE}
        fi
    fi
done

echo "enjoy your emacs life!"
