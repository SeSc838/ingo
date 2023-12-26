#!/bin/bash

sudo chmod +x $(pwd)/ingo.sh
sudo ln -s $(pwd)/ingo.sh /usr/bin/ingo
sudo chmod ugo+x /usr/bin/ingo