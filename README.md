whereami.vim
============

Print context for current cursor position based on source code indent.

![Screenshot B](https://raw.github.com/wonder-mice/vim-whereami/master/doc/_screenshots/screenshot_b.png)

For example, open ActivityManagerNative.java from Android 4.3 source code on line 1797:
```
$ vim frameworks/base/core/java/android/app/ActivityManagerNative.java +1797
```
In vim, type `:Whereami`. You will see indention based context in the bottom:
```
  50 public abstract class ActivityManagerNative extends Binder implements IActivityManager
 111     public boolean onTransact(int code, Parcel data, Parcel reply, int flags)
1793         case GET_LAUNCHED_FROM_UID_TRANSACTION: {
```
