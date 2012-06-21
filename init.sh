#!/bin/sh

RCFILES="
.bashrc
.zshrc
.cshrc
.tcshrc
"

EMACSEN="
emacs
xemacs
mule
nemacs
mg
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
                for e in $EMACSEN;
                do
                    echo "alias $e 'vim'"
                done
            else
                for e in $EMACSEN;
                do
                    echo "alias $e='vim'"
                done
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
