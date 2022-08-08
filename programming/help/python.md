---
order: 2
---

# Python

------------------------------------------

## Basic language definitions

| Basics  |                     |
|---------|---------------------|
| #       | comment             |
| var = 5 | variable definition |

| Lists             |                                      |
|-------------------|--------------------------------------|
| nums = [1,2,3,4]  | definition                           |
| nums[0]           | indexing                             |
| nums[-1]          | negative indexing                    |
| nums[1:]          | slicing from 1 to end                |
| nums[:1]          | slicing from end to 1                |
| 2 in nums => true | in operator                          |
| nums[0] = 10      | put 10 instead of 1                  |
| nums[0:2] = -1    | remove 1,2 and put -1                |
| nums + [5,6]      | concatenation                        |
| nums * 10         | multiplication                       |
| nums.pop()        | extract one element from end of list |

| Strings                   |                                                                                             |
|---------------------------|---------------------------------------------------------------------------------------------|
|                           | String has same operations like list <BR>but it contains characters only and is not mutable |
| str = "abc"               | definition                                                                                  |
| str.upper()               | uppercase str                                                                               |
| str.lower()               | lowercase str                                                                               |
| 'here is hoo'.find('hoo') | find substring                                                                              |


## Tuples

tuples are identical to lists, except that tuples are immutable

defintion <BR> consts = (1,2,3,4)		


## Dictionaries

Dictionary is a set of key-values pairs

|                                                  |                        |
|--------------------------------------------------|------------------------|
| dict = {"John": 123, "Jane": 234, "Jerard": 345} | definition             |
| dict['Jane']                                     | get value of 'Jane'    |
| dict['Igor'] = 456                               | add new pair key-value |
| dict.keys()                                      | get all keys           |
| dict.values()                                    | get all values         |


| Boolean operators         |                                                        |
|---------------------------|--------------------------------------------------------|
| ==                        | equals                                                 |
| !=                        | not equals                                             |
| or                        | or operator                                            |
| and                       | and operator                                           |
| not                       | not opertator (inverts boolean expression it precedes) |
| not,and,or                | order of operators                                     |
| if <boolean expression> : | if statement                                           |
| elif                      |                                                        |
| else                      |                                                        |


| Loops                |                                             |
|----------------------|---------------------------------------------|
| for i in list:code   | iterate over list and execute block of code |
| while condition:code | execute code while condition is true        |
| break                | exit the loop                               |
| continue             | skip current iteration of the loop          |


## Functions

defintion (with parameter x)

```python
def mult(x,y=1):
	res = x*y
	return res
```

---------------------------------------------
## Classes

Class is a template for creation of object.
Object has variables and functions (methods)
A "self" parameter is passed to function by default and 
is used to refer to the current instance of the class.

```python
class MyClass:			- definition
	variable = 4		- a variable
	def __init__(self):	- a constructor method
		construct	
	def foo(self):		- a method
		print("Hello form function foo")
my_object = MyClass()		- creation
```

## Modules

Module is a file with .py extentions that contains defintions
and statements.
Import module with "import module-name" keyword in order to use them.
Module name is a filename without an extention

|                                   |                                                                                          |
|-----------------------------------|------------------------------------------------------------------------------------------|
| import my_module                  | import my_module.<<BR>>in order to call a function from it use : my_module.hello_world() |
| from my_module import MyClass     | import MyClass class from my_module                                                      |
| from my_module import hello_world | import a function hello_world from my module                                             |

## Python 3 keywords
Python 3 has these keywords:
```
False   class       finally     is          return
None    continue    for         lambda      try
True    def         from        nonlocal    while
and     del         global      not         with
as      elif        if          or          yield
assert  else        import      pass
break   except      in          raise
```


## Built-in functions
|                 |                                 |
|-----------------|---------------------------------|
| print("string") | print string to output          |
| str(var)        | convert valuer of var to string |
| len(var)        | length of string, list, tuple   |
| type(var)       | get type fo variable var        |
| int(var)        | type cast value of var to int   |
| float(var)      | type cast value of var to float |
| range(5)        | return list [0,1,2,3,4]         |


## Regular expressions


