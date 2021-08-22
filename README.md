# nvim-note

### Cheat sheet
- navigate
```
:ls " view current opened files in buffer
:b xxx.xx  " fuzzy open current opened file

:find xxx " if set path+=** , it will recursive search and open file match xxx . 

```

- split / tab
```
:sp [filename]
:10 sp " split with 10 line width
:vsp   " vertical split

gt     " go to next tab
gT
#gt    " go to # tab (# is a number)

```


-------------
### Autoload
`:help 'runtimepath'`



```
~/.config/nvim
├── autoload
│   └── load.vim
├── ftplugin
│   └── ftypeAAA.vim
├── init.vim
├── plugin
│   └── autoload_test.vim
└── test

```
- plugin/
  - The scripts are loaded when nvim start.

- autoload/
  - The scripts are loaded only when its command is called.
  > For example, the `autoload/load.vim` will be loaded after `plugin/autoload_test.vim` is executed.
  > ```vim
  > " plugin/autoload_test.vim
  > call load#Hello()
  > ```
  > ```vim
  > " autoload/load.vim
  > function! load#Hello()
  > echo "hello!"
  > endfunction
  > ```
  > Note: It seems that we should use namespace to invoke the script under `autoload` .

- ftplugin/
  - When a file is opened, script corresponded to the file type will be load
  > For example, I edit a file called `foo.txt`.
  > With `:set ft?` we can find it's a `text` type file.
  > Then `:set ft=ftypeAAA`, it's `ftypeAAA` type now, and you can find nvim load `ftypeAAA.vim` immediately. 
 
- Reference
  - [Please explain Vim's configuration directories hierarchy](https://stackoverflow.com/questions/14248335/please-explain-vims-configuration-directories-hierarchy)
  - [Using Vim packages](https://github.com/vim/vim/blob/03c3bd9fd094c1aede2e8fe3ad8fd25b9f033053/runtime/doc/repeat.txt#L515)

-----
## Script
- Declare a function
```vim
" '!' is used to overwrite the func previously defined
function!  hello() 

echo "hello!"

endfunction
```


- Reference
  - [usr_41.txt - 适用于 Vim 8.2 版本](https://yianwillis.github.io/vimcdoc/doc/usr_41.html)

------
## Problems
- Why Ctrl-V not enter visual mode?
  - Check if you are in Window ternimal first. The default setting of wt will map C-V to C-shift-V.
  - [ref1](https://github.com/microsoft/terminal/issues/5790), [ref2](https://github.com/microsoft/terminal/issues/5641#issuecomment-621186852)  
