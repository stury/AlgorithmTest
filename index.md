# GitHub Pages
An oft overlooked feature

## What is GitHub Pages?

> GitHub Pages is a static site hosting service that takes HTML, CSS, and JavaScript files straight from a repository on GitHub, optionally runs the files through a build process, and publishes a website.

	Your own web page, with free hosting by GitHub! :)

Available for an organization/user, or per repository.

- Simple to setup
- Static web site
- Great for Blogs, Documentation, or any other simple web site.
- Works with any *Public* repo.

Simple to get started:
- Create a `gh-pages` branch

```
git checkout --orphan gh-pages; git rm --cached -r .
```

- Check in html or markdown files
- You’ll have a web page hosted by GitHub.


How can you use it?
.md file check ins, jekyll, or already processed html

## Markdown files

You can check in raw .md files.

Super simple, and you get the default GitHub look to your web pages.  


	https://git.vzbuilders.com/pages/stury/BuildInspector/
	

## Jekyll

```
~ $ gem install bundler jekyll
~ $ jekyll new my-awesome-site
~ $ cd my-awesome-site
~/my-awesome-site $ bundle exec jekyll serve
# => Now browse to http://localhost:4000
```



## Raw html, css and javascript

Write your own converter.
	
	Swift + Ink is your friend for converting markdown to html.
	Allows you to convert your markdown files to html files.

Why would you need to do this?  GitHub Pages automatic jekyll translation of your gh-pages branch depends on how large your repo is.  If it's too large, the automatic jekyll conversion will not work.  You'll need to do the processing either via jekyll or some other means.  

## Custom Domain

If you want your GitHub Pages site to be hosted with a domain name you own, you can set the CNAME for the site on GitHub.  You just need to pay for the domain.

Works with Subdomains and Apex domains.

My son had a blog he put up with his own domain name, but he took it down recently.  But he has another domain that he bought, and setup which is still live:

Example:  [classlasso.com](https://classlasso.com)

## References

| Links |
| ---- | 
| [GitHub Pages](https://pages.github.com/) |
| [GitHub Pages Documentation](https://docs.github.com/en/pages) |
| [Creating GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site) |
| [Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll) |
| [Custom Domain](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site) |
| [Ink](https://github.com/JohnSundell/Ink) |

