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
 
