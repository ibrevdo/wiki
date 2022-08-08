
# CSS tutorial

## CSS Syntax

```css
Selctor {
property:value; 
property:value;
}
```


## CSS Selctor
Select elements based on tagname, id, class

Example: select elements `<p>`

```css
p {
    text-align: center;
    color: red;

}
```

Example: select element with id "para1"

```css
#para1 {
    text-align: center;
    color: red;

}
```

elements with class="center"

```css
.center {
  text-align: center;
  color: red;
}
```

<p> elements with class="center" 

```css
p.center {
  text-align: center;
  color: red;
}
```

### Special selectors

* `*` selects every element on page
* `h1, h2, p { .. } ` selects all h1, h2, and p elements

## Colors

### Color types
* `background-color` background color of the element
* `color` text color
* `border` border color

### Color values
Colors can be defined by either RGB, HEX or HSL scheme
Examples:

```html
<h1 style="background-color:rgb(255, 99, 71);">...</h1>
<h1 style="background-color:#ff6347;">...</h1>
<h1 style="background-color:hsl(9, 100%, 64%);">...</h1>
```

## CSS Margins

Margins are used to create space around elements, outside of any defined borders

* `margin` full format, or
* `margin-top`, `margin-right`, `margin-bottom`, `margin-left` for individual margins
* Margin values are : 
    * `auto` browser calculates
    * `length` in px, pt, cm, etc.
    * `%` % of the width of the containing element
    * `inherit` inherited from the parent element
Example

```css
p {
  margin: 25px 50px 75px 100px;
}
```

## CSS Padding

Padding is used to generate space around an element's content, inside of any defined borders.

Example

```css
div {
  padding: 25px 50px 75px 100px;
}
```

## CSS Height and Width

The "height" and "width" properties are used to set the height and width of an element.

The "height" and "width" properties do not include padding, borders, or margins. 

It sets the height/width of the area inside the padding, border, and margin of the element.

Example 

```css
div {
  height: 200px;
  width: 50%;
  background-color: powderblue;
}
```
### CSS maximum width

The "max-width" property is used to set the maximum width of an element.

The "max-width" can be specified in length values, like px, cm, etc., or in percent (%) of the containing block, 

Note: The value of the max-width property overrides width.

## CSS Text

### Text color
The "color" property is used to set the color of the text. 

### Text elignment
The "text-align" property is used to set the horizontal alignment of a text.
A text can be left or right aligned, centered, or justified.


## CSS Fonts
* Fonts families are Serif, Sans-serif, Monospace
* The "font-style" property is mostly used to specify italic text.
    * normal - The text is shown normally
    * italic - The text is shown in italics
    * oblique - The text is "leaning" (oblique is very similar to italic, but less supported)
* The "font-weight" property specifies the weight of a font: normal or bold
* The "font-size" property sets the size of the text. Example: font-size: 40px;
* The "font" property is a shorthand property for:
    * font-style
    * font-variant
    * font-weight
    * font-size/line-height
    * font-family
* Example: `font: italic small-caps bold 12px/30px Georgia, serif;`

## CSS Links
* Links can be styled with any CSS property (e.g. color, font-family, background, etc.)
* The four links states are:
    * a:link - a normal, unvisited link
    * a:visited - a link the user has visited
    * a:hover - a link when the user mouses over it
    * a:active - a link the moment it is clicked
*Example:

```css
/* visited link */
a:visited {
  color: green;
}

a:link {
  text-decoration: none;
}

a:visited {
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

a:active {
  text-decoration: underline;
}
```


## CSS Lists

* unordered lists (<ul>) - the list items are marked with bullets
* ordered lists (<ol>) - the list items are marked with numbers or letters
* list item (<li>)

Example:

```css
ul.a {
  list-style-type: circle;
  list-style-position: outside;
}

ul.b {
  list-style-type: square;
  list-style-position: inside;
}

ol.c {
  list-style-type: upper-roman;
}

ol.d {
  list-style-type: lower-alpha;
}

ol li {
  background: #ffe5e5;
  padding: 5px;
  margin-left: 35px;
}
```

## CSS Tables

The example below specifies a black border for <table>, <th>, and <td> elements:
The border-collapse property sets whether the table borders should be collapsed into a single border.

```css
table {
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid black;
}

/* table padding */
th, td {
  padding: 15px;
  text-align: left;
}


td {
  height: 50px;
  vertical-align: bottom;
}

/* hoverable table */
tr:hover {background-color: #f5f5f5;}
```

## CSS Combinators

There are four different combinators in CSS:
* descendant selector (space)
* child selector (>)
* adjacent sibling selector (+)
* general sibling selector (~)

## CSS Pseudo-class

A pseudo-class is used to define a special state of an element.

Syntax: 

selector:pseudo-class {
  property: value;
}

Pseudo-classes can be combined with CSS classes

