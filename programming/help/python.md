
Python
============================================================

## Basic language definitions

### Basics

* `#`                   comment
* `var = 5`             variable definition
* (x,y,z) = v		    3 new variables created and assigned with values

### Lists

* `nums = [1,2,3,4]`    definition
* `nums[0]`             indexing
* `nums[-1]`            negative indexing
* `nums[1:]`            slicing from 1 to end
* `nums[:1]`            slicing from end to 1
* `2 in nums => true`   in operator
* `nums[0] = 10`        put 10 instead of 1
* `nums[0:2] = -1`      remove 1,2 and put -1
* `nums + [5,6]`        concatenation
* `nums * 10`           multiplication
* `nums.pop()`          extract one element from end of list

**Mapping Lists**

operator for iterates a list and applies an expression
for each element

```
li = [1,9,8,4]
[elem*2 for elem in li]
=> [2,18,16,8]
```

Filtering list - mapping a list through filter:

`[mapping-expression for element in source-list if filter-expression]`


### Strings
String has same operations like list but it contains characters only and is not mutable

* `str = "abc"`               definition
* `str.upper()`               uppercase string
* `str.lower()`               lowercase strting 
* `'here is hoo'.find('hoo')` find substring

**Formatting Strings**

% is used to for string formatting with same syhntax as sprintf of C

```
userCount = 8
print "Users connected %d" % userCount
print "Today's stock price: %f" % 50.4625
print "Today's stock price: %.2f" % 50.4625
print "Today's stock price: %+.2f" % 1.2

k="uid"
v = "sa"
"%s=%s" % (k,v)

Joining list into string
li = [1,2,3]
";".join(li)
=> "1;2;3"

Splitting string into list
str = "1;2;3"
str.split(";",1)	- takes delimeter, and times to split
=> ["1","2;3"]
```


### Boolean operators
* `==`                          equals
* `!=`                          not equals
* `or`                          or operator
* `and`                         and operator
* `not`                         not opertator (inverts boolean expression it precedes)
* `not,and,or`                  order of operators
* `if <boolean expression> :`   if statement
* `elif`
* `else`


### Loops 
* `for i in list:code`      iterate over list and execute block of code
* `while condition:code`    execute code while condition is true
* `break`                   exit the loop
* `continue`                skip current iteration of the loop



### Tuples

tuples are identical to lists, except that tuples are immutable

* `consts = (1,2,3,4)`      definition

### Dictionaries

Dictionary is a set of key-values pairs

* `dict = {"John": 123, "Jane": 234, "Jerard": 345}`    definition
* `dict['Jane']`                                        get value of 'Jane'
* `dict['Igor'] = 456`                                  add new pair key-value
* `dict.keys()`                                         get all keys
* `dict.values()`                                       get all values


### Functions

defintion (with parameter x)

```python
def mult(x,y=1):
	res = x*y
	return res
```

### Classes

Class is a template for creation of object.
Object has variables and functions (methods)
A "self" parameter is passed to function by default and 
is used to refer to the current instance of the class.

```python
class MyClass:          # definition

    variable = 4        # a variable

    def __init__(self): # a constructor method
        #construction code  

    def foo(self):      # a method
        print("Hello form function foo")

my_object = MyClass()   # creation
```

### Modules

Module is a file with .py extentions that contains defintions
and statements. <BS>
Import module with "import module-name" keyword in order to use them. <BS>
Module name is a filename without an extention

* `import my_module`  import my_module. in order to call a function from it use : my_module.hello_world()
* `from my_module import MyClass` import MyClass class from my_module
* `from my_module import hello_world` import a function hello_world from my module

## print function
Option 1: print a couple of strings with `,` between them
```
print("foo=", foo)
```
Option 2: Use string formatting
```
print("{:d} {:03d} {:>20f}".format(1, 2, 1.1))
1 002             1.100000
  ^^^
  0's padded to 2
```

## Built-in operators
```
import          import a module
from            import specific part of module
as              create an alias
-----------------
global          declare a global variable
def             define a function
class           define a class
-----------------
in              check if a value present in list, tuple, etc
is              test is two variables are equal
-----------------
while           create while loop
for             create a for loop
continue        continue to next iteration of loop
break           break out of loop
return          exit a function and return a value
yield           end a function, returns generator
-----------------
if              conditional
else            conditional
elif            conditional
True, False     Boolean values, result of comparison operation
and             a logical operator
not             a logical operator
or              a logical operator
-----------------
try             make a try...except statement
except          what to do when an exception occurs 
finally         a block of code that will be executed no matter if there is an exception or not 
raise           raise an exception
with            simplify exception handling
-----------------
lambda          create an anonymous function
pass            Null statement
Null            represents null value
assert          debugging
del             delete an object
```


## Built-in functions
```
print("string")         print string to output
str(var)                convert valuer of var to string
len(var)                length of string, list, tuple
type(var)               get type fo variable var
int(var,base=10)        type cast value of var to int
float(var)              type cast value of var to float
hex(x)                  Convert an integer number to a lowercase hexadecimal 
                        string prefixed with “0x”. 
range(5)                return list [0,1,2,3,4]
----------------------------------------------------------------------
tuple([itereteble])     create an immutable sequence type
list([itereteble])     create a mutable sequence type
dict(**kwarg)           create a new dictionary
dict(mapping, **kwarg)  create a new dictionary
dict(iterable, **kwarg) create a new dictionary
----------------------------------------------------------------------
slice(stop)
slice(start, stop[, step])	    Return a slice object representing the set of indices 
                                specified by range(start, stop, step). 
filter(function, iterable)	    Construct an iterator from those elements of iterable 
                                for which function returns true 
sorted(iterable, *, key=None, reverse=False) 	Return a new sorted list 
                                                from the items in iterable. 
map(function, iterable, ...) 	Return an iterator that applies function 
                                to every item of iterable
dir() / dir(x)	                Without arguments, return the list of names 
                                in the current local scope.  
                                With an argument, attempt to return a list of 
                                valid attributes for that object. 
input([prompt]) 	            If the prompt argument is present, 
                                it is written to standard output without a trailing newline 
open(file, mode='r', buffering=-1, 
        encoding=None, errors=None, newline=None, closefd=True, opener=None) 	
                                Open file and return a corresponding file object. 
                                If the file cannot be opened, an OSError is raised.
```

## Regular expressions


