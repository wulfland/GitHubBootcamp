# 🔨 Hands-on: Collaborate on code

## Enable GitHub Pages

Enable GitHub Pages in [Settings | Pages](/../../settings/pages) for the `/docs` folder and the `main` branch. Open `index.html` in the pages URL and verify that the game is too slow.

## Create a issue to work on

1. Read the issue [🐞 Fix game](/../../issues/1) and see the instructions how to fix the game.

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

1. Copy the URL to the repository from [Code](/../../) to the clipboard:
<img width="1162" alt="image" src="https://user-images.githubusercontent.com/5276337/173845095-c4fdc522-135a-4de3-80fc-6fef95fa7aee.png">

2. Clone the  repository and change into the new folder:

  <details><summary>Solution</summary>

  ```console
  git clone <paste URL>
  cd GitHubBootcamp
  ```
  </details>
  
## Create a local branch

Create new local branch `users/<user-name>/<issue-id>_fix-game` and switch to it.

<details><summary>Solution</summary>

Create the branch and switch to it:
```console
git branch users/<user-name>/1_fix-game
git switch users/<user-name>/1_fix-game
```
Or switch to a new branch: 
  
```console
git switch -c users/<user-name>/<issue-id>_fix-game
``` 
</details>
  
## Do changes to the file
  
Modify line 78 in [docs/index.html](../docs/index.html#L78) and modify the values like indicated in [🐞 Fix game](/../../issues/1).
  

