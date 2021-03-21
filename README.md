# nvim-note

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
## Reference
[usr_41.txt - 适用于 Vim 8.2 版本](https://yianwillis.github.io/vimcdoc/doc/usr_41.html)
