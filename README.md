# Run Jekyll


# Fix install failed on ubuntu
sudo apt-get install ruby-dev libsqlite3-dev gcc man -> install commonmarker failed
sudo apt-get install build-essential -> gem install eventmachine failed
sudo apt-get install libxslt-dev -> gem install nokogiri failed

How to write README file on ubuntu

# Jekyll command line
`jekyll serve`

https://jekyllrb.com/docs/usage/

Fix bugs ssh:
Error message:
system is booting up. see pam_nologin(8)
Solution:
`rm /run/nologin`

```
bundle update jekyll

bundle exec jekyll serve --livereload
```
