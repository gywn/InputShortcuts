## InputShortcuts: Make Mathematica A Better Editor

Mathematica is by design not a line-oriented language, hence its interface
lacks some important modern editor functionalities:

  - Lacking shortcut for increase/decrease indent.
  - Hard to select/copy/delete a whole line.
  - Hard to join lines.

This is a minimal Mathematica package that, along with a modified
`KeyEventTranslations.tr`, provides conventional keyboard shortcuts to these
functionalities.

## Package Explained

The symbols (rules) doing the jobs is pretty self-explanatory:

Symbols                        | What It Does |
------------------------------ | ---------------------------- |
``InputShortcuts`DecreaseIndent[]`` | Decrease indent by 4 spaces  |
``InputShortcuts`IncreaseIndent[]`` | Increase indent by 4 spaces  |
``InputShortcuts`MoveLineRealBeginning[]`` | Move cursor to the line's real beginning (instead of before the first non empty character) |
``InputShortcuts`DeleteWholeLine[]`` | Delete current line |
``InputShortcuts`SelectWholeLineDown[]`` | Downwardly select more lines |
``InputShortcuts`SelectWholeLineUp[]`` | Upwardly select more lines |
``InputShortcuts`JoinLines[]`` | Join selected lines, or the current line and the next line, with a space. |
``InputShortcuts`DeletePrevious[]`` | Like FrontEndToken `"DeletePrevious"`, but delete up to indent alignment when deleting spaces. |

They are defined in corresponding `*.m` files. All these rules can work with or
without lines selected.

### Key Bindings

A version of `KeyEventTranslations.tr` is shipped in `TextResources/`, which
connects keyboard shortcuts to these rules:

Keyboard Shortcuts |Symbols                        |
-------------------|------------------------------ |
⌘ + [ |``InputShortcuts`DecreaseIndent[]`` |
⌘ + ] |``InputShortcuts`IncreaseIndent[]`` |
⌘ + Left |``InputShortcuts`MoveLineRealBeginning[]`` |
⌘ + Backspace |``InputShortcuts`DeleteWholeLine[]`` |
⌘ + ⇧ + Down |``InputShortcuts`SelectWholeLineDown[]`` |
⌘ + ⇧ + Up |``InputShortcuts`SelectWholeLineUp[]`` |
⌘ + ⇧ + J |``InputShortcuts`JoinLines[]`` |
Backspace |``InputShortcuts`DeletePrevious[]`` |

The binding rules in `KeyEventTranslations.tr` can be changed freely, but only
take effect after restarting Mathematica.

## Installation

Copy files to Mathematica's `Applications` folder and `TextResources` folder,
and restart Mathematica. On Mac OS X, that would be:

    InputShortcuts/ $ cp ./InputShortcuts/ ~/Library/Mathematica/Applications/
    InputShortcuts/ $ cp ./TextResources/Macintosh/KeyEventTranslations.tr ~/Library/Mathematica/SystemFiles/FrontEnd/TextResources/Macintosh/
    
If you already have a custom version of `KeyEventTranslations.tr`, you have to
merge them by hand.