#!/usr/bin/env python3

import os

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

def main():
    for f, p in files.items():
        dir = os.path.expanduser(p)
        path = os.path.join(dir, f)

        if os.path.isfile(path):
            res = input("Found file {} should I replace it? [y/n]? ".format(f))
            if res.lower() == "y":
                link(dir, f, path)
        else:
            link(dir, f, path)
    
if __name__ == "__main__":
    main()
