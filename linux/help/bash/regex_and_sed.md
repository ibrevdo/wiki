# Regular expressions and Sed

## Regex 

### General 

|        |                                                        |
| ------ | ------------------------------------------------------ |
| `.`    | match any single character                             |
| `*`    | zero or more occurrences of the previous expression    |
| `.*`   | single or more occurrences of the previous character   |
|`\`  | Any meta-character with special meaning may be quoted by preceding it with a backslash (\\)a|
| `^` | begining of a line |
| `$` | end of a line      |

**Example 1:**  `^$`              matches blank lines

**Example 2:**  `^ *$`            matches line that starts with a zero or more spaces

**Example 3:**  `[0-9][0-9]*`     matches one or more numbers


###  Bracket expression

**bracket expression**  Matches all the characters inside the [ ]

* `[0123456789]` or `[0-9]` matches any single digit
* `[a-z]`                   any letter 'a' to 'z'

#### predefined bracket expressions
* [:alnum:]                       means [0-9A-Za-z]

more examples: 

```sh
[:alpha:], [:cntrl:], [:digit:], [:graph:], 
[:lower:], [:upper:], [:xdigit:], [:space:]
```

### Exception

`[^<expression>]` doesn't contain < expression >

### Notes

* to include `]`, place it first in the list
* to include `^`, place it anywhere but first
* to include `-`, place it last

### Backreferences - remembering patterns
Each `\(<expression>\)` starts a new pattern, which can be recalled by `\1`

**Examples**
```bash
\([a-z]])\1                             match 2 identical letters
\([a-z]\)\([a-z]\)[a-z]\2\1             match 5 letter palindrome ('radar')
```


--------------------

## Sed

### sed command format 

`sed flags 'range command' <file>`

or

`echo "string" | sed flags 'range command'`

**range**:

1. can be regular expression. put it between `//`. 
  * `sed '/^#/ s/[0-9][0-9]*//'` finds lines that start with # and delete first number on these lines
2. range can be in form of "from" to "to"
  * `sed '/start/,/stop/ s/#.*//'`
3. can be line numbers
  * `sed '1,100 s/A/a/'`
  * `sed '101,$ s/A/a/'`  operate on line 101 to end of file

**commands**:
* `d` - delete the matched lines
* `p` - print matched lines

**flags**:
* `-n` - do not print automatically

**print command**:
* `sed -n '/regex/p' <file>`        print only matches

**substitution command**:

`sed -e 's/foo/bar/g' <file>`

or

`echo "string" | sed 's/foo/bar/g/'`

* `s/old/new/`    substitute old with new
  * normally old is regular expression

substitution works only on pattern which was found by the regular expression.
rest of the line stays.

**example**: 

```sh
file contains
one two three
```

* `sed 's/two/2/' file` will result in :`one 2 three`
* `sed 's/.*two/2/' file'` will result in : 2 three


**example**: reuse of a matched pattern with `[[/1]]`

* `echo "mailto: igor.brevdo@gmail.com" | sed 's/.* \(.*\)@.*/\1/'`
* will result in: `igor.brevdo`

