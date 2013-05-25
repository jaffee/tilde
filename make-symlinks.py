#!/usr/bin/python
import os

def make_symlinks():
    homedir = os.getenv('HOME')
    files = os.listdir(homedir + "/tilde/")
    files = filter(lambda x: x.startswith(".") and not x==".git" and not x.endswith("~"), files)
    os.chdir(homedir)
    for file in files:
        os.symlink(homedir + "/tilde/" + file, homedir + "/" + file)



if __name__ == "__main__":
    make_symlinks()
    print "Don't forget to "
