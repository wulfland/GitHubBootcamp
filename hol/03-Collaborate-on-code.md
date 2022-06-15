# 🔨 Hands-on: Collaborate on code

## Create a issue to work on

1. Create a [new issue](/issues/new) with the title `Fix Game` and remember the id of the issue (most likely #1).

## Local git config

1. Check your local git config with `git config --global user.name` and `git config --global user.email`. 
2. If you don't want to expose your email on GitHub get the email from [Email settings](https://github.com/settings/emails) and configure name and email accordingly:

```console
git config --global user.name "<your name>"
git config --global user.email "<github-user-id>+<github-user-name>@users.noreply.github.com"
```

3. On windows you should also configure autocrlf: `git config --global core.autocrlf true`. This is normally done when you execute the git setup.

> Memory Tip: autocrlf stands for auto carriage return line feed.

## Clone the repository

1. Copy the URL to the repository from [Code](/) to the clipboard:
<img width="1162" alt="image" src="https://user-images.githubusercontent.com/5276337/173845095-c4fdc522-135a-4de3-80fc-6fef95fa7aee.png">

2. Clone the  repository:

```console
git clone <paste URL>
```
