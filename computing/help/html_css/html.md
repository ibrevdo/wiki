
# HTML tutortial

## Basic page
HTML document must start with type declaration: `<!DOCTYPE html>`
The HTML document itself begins with `<html>` and ends with `</html>`.
The visible part of the document is between `<body>` and `</body>`.

Example : 
```
<!DOCTYPE html>
<html>
<body>

<h1>My First Heading</h1>
<p>My first paragraph.</p>

</body>
</html>
```

## HTML elements
An HTML element is everything from the start tag to the end tag.
`<tagname>Content of element..</tagname>`
HTML elements can be nested. (The previous example contains four elements : 
`<html>, <body>, <h1>, <p>`
Note: HTML is not case sensitive

## HTML Tags

* HTML headings are defined with `<h1>` to `<h6>` tags.
* HTML paragraphs are defined with `<p>` tag.
* HTML links are defined with `<a>` tag.
	* attributes: href = the url
	* example: `<a href="https://www.w3schools.com">This is a link</a>`
* HTML images are defined with the `<img>` tag.
	* attributes: src = source file, alt = alternative text, width, height
	* example: `<img src="w3schools.jpg" alt="W3Schools.com" width="104" height="142">`

## HTML attributes
Attributes provide additional information about HTML elements.
* href	- specifies the URL for `<a>` tag that defines a hyperlink element.
* src	- specifies the path to the image for `<img>` tag that defines embeded image element.
	* these two can be either absoulte pathes or relative (to domain or to current html file)
	* absoulte src = "https://www.w3schools.com/images/img_girl.jpg"
	* relative src = "/images/img_girl.jpg" (relative to domain) or src="img_girl.jpg" (relative to current html)
* width and height
* alt
* style	- adds styles to an element, such as color, font, size and more.
	* exmaple: `<p style="color:red;">This is a red paragraph.</p>`
* title - specifies a text displayed as a tooltip
* suggestions:
	* Always use lowercase attributes
	* Always quote attributes values
