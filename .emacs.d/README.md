# My emacs tricks
C-x C-i: shows the functions defined in buffer

C-x +: Set windows to be of equal size

C-x C-+: increase buffer font size
C-x C--: decrease buffer font size

C-x f: shows recently open files
--> doesn't work right now
C-x C-f M-f: wide find file (search filename in subdirs)

### Help
C-h k: shows functions called by key binding
C-h f: shows function help
C-h v: shows value of an emacs config variable
C-h m: shows all the key bindgins active in the buffer

### Dired

C-x d: shows dired mode

In dired mode:
i: inserts a subdirectory in the current buffer
$: hides the current subdirectory
M-$: hides all sudirectories
M-r: updates the entire dired buffer
1: updates the current file at point
^: goes up to the parent directory
R: renames a files
d: flag this files for deletion
x: execute file deletion
u: removes deletion flag
s: toggles between alphabetical order and date/time order
o: opens file in other window

### Mark
C-<space>: set region start (end is the point)
C-g: cancel region
#### Mark ring
C-u C-<space>: Invoke mark ring

#### Handy navigation trick to vuew other area of buffer and come back
- Set mark
- navigate to wherever you want
- use mark ring to come back at last the set mark

C-x j: kills entire line
C-k: kills end of line from point

C-x C-i: Jump to a symbol and set a mark, depending on major mode.

### Rectangle mode
Select text in normal fashion.  The rectangle formed by the point at the begining of selection and the one at the end of the selection indicates the rectangle that is going to be used.
C-x r t -> rectangle replace
C-x r y -> rectangle paste
C-x r k -> rectangle kill

### Auto indent
M-C-\
--> doesn't work for now

C-x m: starts eshell
-> doesn't work right now

### Manually open up mode
M-x <the function mode name>

### Eval code in buffer
M-x eval-buffer

Good way to tryout new config is to use the \*scratch\* buffer and M-x eval-buffer

## Ruby mode
### Within a ruby buffer these are the specific key bindings
C-c C-s: starts a irb like buffer (with all the emacs nuggets - completion, copy/paste...)
  - M-p: go up in history
  - M-n: go down in history
  - C-c C-r: sends selected region in the irb ruby buffer
### to start this irb outside of ruby-mode use
M-x inf-ruby


## Version control mode
### Shows up in version controlled files
C-x v = does diff against head
c-u C-x v = does diff against any revision
C-x v u Discard any changes since last check-in
C-x v ~ Checkout any revision of the current file

## SLIME
M-.: Jump to the definition of a var
M-TAB or C-c TAB: Autocomplete symbol at point
C-x C-e: Eval the form under the point
C-c C-k: Compile the current buffer
C-c C-l: Load current buffer and force required namespaces to reload
C-M-x: Compile the whole top-level form under the point.
C-c S-i: Inspect a value
C-c C-m: Macroexpand the call under the point
C-c C-d C-d: Look up documentation for a var
C-c C-z: Switch from a Clojure buffer to the repl buffer
C-c M-p: Switch the repl namespace to match the current buffer
C-c C-w c: List all callers of a given function


## Magit
### Git mode
C-x g pulls up git status command interface
  P push
  F pull
  s stage file at point
  u unstage file at point
  S stage all changes
  U unstage all changes
  <tab> shows diff of uncommited changes for the file at point
  c opens commit buffer 
    C-c C-c will commit all commited changes
    C-c C-a allows to ammend commit
  C-h b shows relevant bindings

## elpa (Emacs Lisp Packages Archive)
M-x package-list-packages loads the package list available for emacs
  i mark for installation
  x performs installation of marked packages
