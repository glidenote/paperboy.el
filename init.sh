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

VI="
vim
nvi
jelvis
elvis
vi
ex
ed
"

echo "powerup your emacs."

POWERFUL_EDITOR='cat >/dev/null'
for pe in $VI;
do
    if type $pe 2>/dev/null | grep 'is /' >/dev/null 2>&1;
    then
        POWERFUL_EDITOR=$pe
        break
    fi
done

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
                    echo "alias $e '$POWERFUL_EDITOR'"
                done
            else
                for e in $EMACSEN;
                do
                    echo "alias $e='$POWERFUL_EDITOR'"
                done
            fi
        } >> ~/${FILE}
    fi
done

if [ -f /etc/yum.conf ];then
    echo "exclude=emacs" | sudo tee -a /etc/yum.conf > /dev/null
fi

if [ -d /etc/apt/preferences.d ];then
    echo "Package: emacs\nPin: release v=*\nPin-Priority: -1\n" | sudo tee -a /etc/apt/preferences.d/powerful-editor.pref > /dev/null
fi

echo "enjoy your emacs life!"

# Local Variables:
# mode: sh
# sh-basic-offset: 4
# tab-width: 4
# coding: utf-8
# End:
