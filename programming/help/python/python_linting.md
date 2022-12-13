# Python linters and fixers

## Linting

### pep8
* a tool to verify code style
* install: pip3 install pep8
* run: `pep8 [filename or directory]`
* flags: `pep8 --statistics -qq ex.py`, `pep8 --show-source ex.py`, `pep8 --show-pep8 ex.py`
* config file: `~/.config/pep8`
```
[pep8]
ignore = E226,E302,E41
max-line-length = 160
```
* project level config file: `setup.cfg`

### pyflakes
* a tool to verify logic errors
* installation `pip3 install pyflakes`
* run: `pyflakes [filename or directory]`

### flake8
* a wrapper which verifies pep8, pyflakes and circular complexity
* install: `pip3 install flake8`
* usage: same as pep8. `flake8 [file or directory]`

### Using ale for python linting
* [let's have a pint of ale](https://dmerej.info/blog/post/lets-have-a-pint-of-vim-ale/)

ale python linters:
* bandit, cspell, flake8, flakehell, jeditls, mypy, prospector, pycodestyle, pydocstyle, pyflakes, pylama, pylint, pylsp, pyre, pyright, unimport, vulture

ale python fixers:
* autoflake, autoimport, autopep8, black, isort, pyflyby, remove_trailing_lines, reorder-python-imports, trim_whitespace, yapf

## Advices for python development with Vim (from reddit)
```
You don't need CoC or YCM for autocompletion.

For dynamic languages like Python,
the built-in word completion (<C-n> or <C-x><C-n>) that comes out of the box works very well.

Add jump to tag using ctags and maybe vim-gutentag and
you're pretty much set for a very good minimal Python IDE with very minimal overhead.

You only need plugins for autocompletion if you want omnicompletion,
which means your code must be viable for static analysis.
But dynamic languages like Python don't tend to fare well with static analysis anyway,
so in many cases the out of the box word completion works just as well
or better than completions that are based on static analysis.

To be able to really take advantage of static analysis based completion,
you have to restrict your code to cases where you wrote Python like you wrote Java
and avoid many of the features that make Python great.

Instead, dynamic languages like Python works much better with dynamic analysis-based completions
(i.e. you run the code and introspect objects in the running program to find completable words),
and it's also another great reason why editing directly in the RPi is even much more powerful than you even realise right now.

Run your code in :terminal, insert an IPython or pudb breakpoints, and realise that
:terminal is just another buffer where the out of the box word completion can tap into for
completable words, and you're pretty much way beyond IDE in terms of the speed of your
development cycle, your ability to explore a running Python code,
and experiment with running code.

Optionally, add vim-slime (or similar) to smooth that setup out.
```
