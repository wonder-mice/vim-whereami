whereami.vim
============

Print context for current cursor position based on source code indent.

![Screenshot B](https://raw.github.com/wonder-mice/vim-whereami/master/doc/_screenshots/screenshot_b-x1_2.png)

For example, open ActivityManagerNative.java from Android 4.3 source code on line 1797:
```bash
$ vim frameworks/base/core/java/android/app/ActivityManagerNative.java +1797
```
In vim, type `:Whereami`. You will see indention based context in the bottom:
```
  50 public abstract class ActivityManagerNative extends Binder implements IActivityManager
 111     public boolean onTransact(int code, Parcel data, Parcel reply, int flags)
1793         case GET_LAUNCHED_FROM_UID_TRANSACTION: {
```
As usual, you can bind that command to some key combination, like `\w`:
```vim
nnoremap <silent> <leader>w :Whereami<CR>
```

## Installation

Just throw file `plugin/whereami.vim` into `~/.vim/plugin` folder:
```bash
$ git clone https://github.com/wonder-mice/vim-whereami.git vim-whereami.git
$ mkdir -p ~/.vim/plugin
$ cp vim-whereami.git/plugin/whereami.vim ~/.vim/plugin/
```
