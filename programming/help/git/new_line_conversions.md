
# Newline conversions
The scheme when getting files from windows:

1. convert all new files to unix format
    * try this :
        - `find . -type f -exec dos2unix {} \; (with dos2unix version 6 or higher)`
        - or
        - `find . -type f -exec grep -qIP '\r\n' {} ';' -exec perl -pi -e 's/\r\n/\n/g' {} '+'`
        - (or maybe `grep -qIP '\r$'`)
    
    * (from here : <https://stackoverflow.com/questions/7068179/convert-line-endings-for-whole-directory-tree-git>)

2. use `core.autocrlf = false` if all git repositories are on linux

3. If some repositories are on linux and some on windows, then
    * on linux use: `use core.autocrlf = input`
    * on windows use: `use core.autocrlf = true`<br>
(from here:<https://stackoverflow.com/questions/3206843/how-line-ending-conversions-work-with-git-core-autocrlf-between-different-operat>)
