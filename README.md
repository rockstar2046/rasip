# rasip
Speak ip address  on Raspberry PI 


# Requirements
`awk,sed` extra utils

`mplayer` sound palyer

# Install
`curl -L https://raw.githubusercontent.com/rockagen/rasip/master/rasip.sh -o rasip.sh`

`chmod u+x rasip.sh`

# Run
`./rasip.sh`

or enable auto after system boot

`sudo mv rasip.sh /etc/init.d/rasip`

`sudo update-rc.d rasip defaults 99`

# custom
vim `_rasip.sh`, then execute `./make.sh` will build `build/rasip.sh` file

happy enjoy!
