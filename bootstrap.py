#!/usr/bin/env python3

import os
import getopt as go
import sys

files = {
        ".bashrc" : "~",
        ".gitconfig" : "~",
        ".hgrc" : "~",
        ".muttrc" : "~",
        ".vimrc" : "~",
        ".xmobarrc" : "~",
        "xmonad.hs" : "~/.xmonad",
        "getvolume.sh" : "~/.xmonad",
        ".Xresources" : "~",
}

class Answer:
    YES = 0
    NO = 1
    NONE = 2

def link(dir, file, path):
    print("Linking file {} to path {}".format(file, path))
    os.makedirs(dir, exist_ok=True)

    try:
        os.remove(path)
    except:
        pass #file doesn't exist

    current_dir, _ = os.path.split(os.path.realpath(__file__))
    file = os.path.join(current_dir, file)
    os.symlink(file, path)

def main(answer=Answer.NONE):
    for f, p in files.items():
        dir = os.path.expanduser(p)
        path = os.path.join(dir, f)

        if os.path.isfile(path):
            if answer == Answer.NO:
                print("Found file {} ignoring".format(f))
            elif answer == Answer.YES:
                link(dir, f, path)
            else:
                res = input("Found file {} should I replace it? [y/n]? ".format(f))
                if res.lower() == "y":
                    link(dir, f, path)
        else:
            link(dir, f, path)
    
if __name__ == "__main__":
    try:
        opts, args = go.getopt(sys.argv[1:], "yn", ["yes", "no"])
    except go.GetoptError:
        print("wrong arguments")
        sys.exit(2)

    for opt, arg in opts:
        if opt in ["-y", "--yes"]:
            main(Answer.YES)
        elif opt in ["-n", "--no"]:
            main(Answer.NO)

    if len(sys.argv) == 1:
        main()
