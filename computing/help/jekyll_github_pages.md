# Jekyll github pages

Jekyll is a framework that is used by github pages. When you enable a github pages option for a repo, the Jekyll engine processes the site under 'starting point' (can be either `/(root)` or `/docs`.)

A good example for such a site is : <https://libsigcplusplus.github.io/libsigcplusplus/>

Simple guide that explains how to create github pages site for an online repo: <https://github.com/tomcam/least-github-pages>

## Steps to achive simple github-pages site for a repo
* Lets take example of my 'wiki' repo:
	1. go to repo settings, choose Pages on left side.
	2. Under 'Build and deployment / Branch' you can choose a starting point for jekyll:
	3. This will enable github pages for a repo. the link to repo will be: https://ibrevdo.github.io/wiki/
	`/(root)` or `/docs`. I chose `/(root)`
	4. Now you create 'README.md' as starting page at the start point. (Jekyll will use index.md as well, if present)
	5. In my case, I created 'README.md' and a directory `w/` where I put helper .md documents.
	6. The 'README.md' has links to documents under `w/` dir.
	7. In order to disable the github pages, go to 'Pages' in repo settings, and in 'Build and deployment / Source' choose 'None' as source.
	8. Currenly, I am not using the github pages so I moved the README.md into `w/` folder.
	9. Also I moved `w/` to `.w/` so it is hidden. (see note 2 about it)
* Notes:
	1. the 'README.md' can reside in `/doc` also. Jekyll will use it from there, if not found under `/(root)`
	2. Jekyll is not processing a hidden directories (starting with dot)
	3. It is possibe not to use Jekyll at all, if for example, you using plain .html pages. 
	<br>Put `.nojekyll` file at staring point of the github pages.
	<br>In that case `index.html` will be used as starting point of github pages site.
	
## Using jekyll locally

Jekyll can also be installed locally with gem (javascript?), so the site can be checked
before it is uploaded to github.

### Install 

1. `sudo gem install jekyll`
2. `jekyll new example`  - create new site in dir example
3. `cd example; bundle install --path vendor/bundle`
4. `bundle exec jekyll serve --watch --baseurl ""`


### site structure
* `_config.yml`
* `style.css`
* `_site`
* `_layouts/default.html`
    * example: <https://github.com/libsigcplusplus/libsigcplusplus/blob/master/docs/_layouts/default.html>


### how to list all files: 
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

### Links
* <https://pages.github.com/versions/>
* <https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll>
* Kramdown syntax <https://kramdown.gettalong.org/syntax.html>
* Kramdown html converter <https://kramdown.gettalong.org/converter/html.html>
* Great Jekyll tutorial <https://learn-the-web.algonquindesign.ca/topics/jekyll/>
* TOC with jekyll only <https://github.com/allejo/jekyll-toc>
* Simple Jekyll search <https://github.com/christian-fei/Simple-Jekyll-Search>
* <https://stackoverflow.com/questions/8340170/jekyll-automatically-highlight-current-tab-in-menu-bar>
