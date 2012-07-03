#!/usr/bin/env python

import os, sys

if os.path.dirname(__file__) != '.':
    print "This script must be run from the dotfiles directory."
    sys.exit(1)
script = os.path.basename(__file__)

for f in os.listdir('.'):
    if f in [script, '.git']:
        continue

    name = '../.' + f
    target = 'dotfiles/' + f
    try:
        os.symlink(target, name)
        print "\033[36;1m" + name + "\033[0m ->", target
    except OSError as e:
        if e.errno == 17:
            try:
                if os.readlink(name) == target:
                    print name, "is already linked"
                else:
                    print name, "\033[31;1mexists\033[0m (symlink)"
            except OSError as e:
                if e.errno == 22:
                    print name, "\033[31;1mexists\033[0m"
                else:
                    print e
        else:
            print e

vim_swap = '../.vim_swap'
if os.path.exists(vim_swap):
    print "No need to create", vim_swap
else:
    os.mkdir(vim_swap, 0700)
    print "Created \033[32;1m" + vim_swap + "\033[0m"
