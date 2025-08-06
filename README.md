# BashRC
This file has a bunch of handy git aliases and scripts that I use all the time. 
### Setup
- Download .bashrc and place it in your Home directory (called %USERPROFILE% on Windows)
- Source the file by typing `source ~/.bashrc` in a GitBash terminal
- You're free to use any of the commands!

### Notes
- When you make a change, you need to re-source the file, which there are aliases for. You can type `editrc` in a terminal and it will let you edit the script in vim. Once you have made your change, just type `setrc` and it will re-source the file.

---

# VimStyleMotions
I made an AutoHotKey script that remaps your arrow keys to use Vim-style motions so you don't have to constantly move your hand to/from your arrow keys. Make sure you have AutoHotKey installed on your computer. In case you don't want to read through the code to figure out how to use it, here are the shortcuts:
- ALT + h/j/k/l will move Left, Down, Up, and Right (respectively)
- CTRL + ALT + h/l will move Left and Right by word
- SHIFT + ALT + h/j/k/l will move while highlighting
- SHIFT + CTRL + ALT + h/l will highlight by word
- ALT + h/; will move to Home and End of line (respectively)
- SHIFT + ALT + h/; will hightlight to Home and End of line
- While holding ALT, type a number (above keys, NOT on numpad) and press j or k, this will move you up/down by that many lines
