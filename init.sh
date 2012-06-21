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
        {
            echo ""
            echo "#===================="
            echo "# powerup your emacs "
            echo "#===================="
            if [ ${FILE} = ".cshrc" -o ${FILE} = ".tcshrc" ]; then
                echo "alias emacs 'vim'"
            else
                echo "alias emacs='vim'"
            fi
        } >> ~/${FILE}
    fi
done

echo "enjoy your emacs life!"

# Local Variables:
# mode: sh
# sh-basic-offset: 4
# tab-width: 4
# coding: utf-8
# End:
