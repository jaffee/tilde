#!/usr/bin/python2
import os

def make_symlinks():
    homedir = os.getenv('HOME')
    files = os.listdir(homedir + "/tilde/")
    files = filter(lambda x: x.startswith(".") and not x==".git" and not x.endswith("~"), files)
    os.chdir(homedir)
    for file in files:
        if os.path.islink(homedir + '/' + file):
            if os.readlink(homedir + '/' + file) == homedir + '/tilde/' + file:
                continue
        try:
            print("Creating symlink for: " + file)
            os.symlink(homedir + "/tilde/" + file, homedir + "/" + file)
        except OSError as e:
            print(str(e) + " " + file)



if __name__ == "__main__":
    make_symlinks()
    print("Don't forget to ")
