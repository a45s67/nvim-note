# nvim-note

-------------
### Autoload
`:help 'runtimepath'`


```
~/.config/nvim
├── ftplugin
│   └── ftypeAAA.vim
├── init.lua
└── test
```

- ftplugin/
  - When a file is opened, script corresponded to the file type will be load
  > For example, I edit a file called `foo.txt`.
  > With `:set ft?` we can find it's a `text` type file.
  > Then `:set ft=ftypeAAA`, it's `ftypeAAA` type now, and you can find nvim load `ftypeAAA.vim` immediately. 
 

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
  - [usr_41.txt  适用于 Vim 8.2 版本](https://yianwillis.github.io/vimcdoc/doc/usr_41.html)

------
## Reference
[usr_41.txt  适用于 Vim 8.2 版本](https://yianwillis.github.io/vimcdoc/doc/usr_41.html)
