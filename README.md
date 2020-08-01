# [oddmagnet.github.io](https://oddmagnet.github.io/)
**This is my personal blog and portfolio website. It's a static website written in Swift and it's 100% free of JavaScript.**

## Structure
This project contains two branches:
- `master` contains the generated files and serves as the basis for github pages
- `author` contains the actual swift package, code and Markdown files that are used to generate the site

This approach is used because a github pages user site requires a specific repo name and that all the content of the site is on the `master` branch.
By having the code used to generate this site on the `author` branch it's possible to generate and test new content locally, then run the `publish deploy` command to deploy new content to the master branch

### On the master branch
- `OddTheme` contains the necessary styles for my theme
- `about` contains the generated about site
- `blog` contains the generated blog posts
- `projects` contains the generated project sites
- `tags` contains the generated sites to browse tags

### On the author branch
- `Content` contains the Markdown files that provide the content
- `Output` contains the generated static website which is deployed to [oddmagnet.github.io](https://oddmagnet.github.io/).
- `Resources` contains images and stylesheets
- `Sources/oddmagnet.github.io` contains the Swift source files


## Technologies used:
- Swift
- [Publish](https://github.com/johnsundell/publish)
- [Splash plugin](https://github.com/JohnSundell/SplashPublishPlugin)
