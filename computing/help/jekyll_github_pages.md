---
order: 7
---

# Jekyll github pages

## Install 

1. `sudo gem install jekyll`
2. `jekyll new example`  - create new site in dir example
3. `cd example; bundle install --path vendor/bundle`
4. `bundle exec jekyll serve --watch --baseurl ""`



## site structure
* `_config.yml`
* `style.css`
* `_site`
* `_layouts/default.html`
    * example: <https://github.com/libsigcplusplus/libsigcplusplus/blob/master/docs/_layouts/default.html>



## how to list all files: 
In `default.html` add the following before "{ { content } }"
```html
Note: use "{" instead of "|"

<ul>                                                                                        
    |% for file in site.static_files %|
        |% if file.extname == '.html' %|
        <li> <a href="|| site.baseurl |||| file.path ||">||file.dir|| ||file.path||</a></li>                
        |% endif %|
    |% endfor %|
</ul>
```

## Links
* <https://pages.github.com/versions/>
* <https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll>
* Kramdown syntax <https://kramdown.gettalong.org/syntax.html>
* Kramdown html converter <https://kramdown.gettalong.org/converter/html.html>
* Great Jekyll tutorial <https://learn-the-web.algonquindesign.ca/topics/jekyll/>
* TOC with jekyll only <https://github.com/allejo/jekyll-toc>
* Simple Jekyll search <https://github.com/christian-fei/Simple-Jekyll-Search>
* <https://stackoverflow.com/questions/8340170/jekyll-automatically-highlight-current-tab-in-menu-bar>
