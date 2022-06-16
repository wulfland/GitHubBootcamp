# 🔨 Hands-on: My first workflow

In this hands-on lab your will create your first GitHub Action Workflow and learn how you can use Actions to automate tasks in your software development lifecycle. If you like more background information, please refer to the [GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions) pages on GitHub Docs. Good luck! 👍

> Before you start with this lab, please remove the branch rule, so you can commit to the main branch without a pull request to speed up the process :smirk:

This hands on lab consists of the following steps:
- [Creating the workflow](#creating-the-workflow)
- [Viewing your workflow results](#viewing-your-workflow-results)
- [If time permits: Only trigger workflow when a change is made to the website](#if-time-permits-only-trigger-workflow-when-a-change-is-made-to-the-website)
- [If time permits: Only trigger workflow on new issue created](#if-time-permits-only-trigger-workflow-on-new-issue-created)
- [If time permits: Create a Matrix build for release and debug](#if-time-permits-create-a-matrix-build-for-release-and-debug)


## Creating the workflow

Go to **Actions** | [New Workflow](/../../actions/new) and click on [set up a workflow yourself](/../../new/main?filename=.github%2Fworkflows%2Fmain.yml&workflow_template=blank).

1. Rename the file `main.yml` in the `.github/workflows` directory to `github-actions-demo.yml`.
<img width="400" alt="image" src="https://user-images.githubusercontent.com/5276337/174096754-4e2d7219-9caf-42e8-bfd9-c190762886d3.png">

2. Remove the template content - we want to create the workflow from scratch.
3. Click <kbd>Ctrl</kbd>+<kbd>Space</kbd> and select name as the first element:

<img width="400" alt="image" src="https://user-images.githubusercontent.com/5276337/174097468-8be92e37-7948-4895-b5ed-20a22c5773bc.png">

4. Set the workflow name to `GitHub Actions Demo`:

```YAML
name: GitHub Actions Demo
```

5. Add the triggers to the worklow with the help of <kbd>Ctrl</kbd>+<kbd>Space</kbd> and the documentation. We want the workflow to trigger:
  - on every push to the `main` branch, but not when there are changes to files in the `.github` folder.
  - on every pull request with `main` as the base branch
  - Every sunday at 6:15 UTC
  - Manually by selecting an environment

<details>
  <summary>Solution</summary>
  
```YAML
on:
  push:
    branches: [ main ]
    paths-ignore: [.github/**]
  pull_request:
    branches: [ main ]
  schedule:
    - cron: '15 6 * * 0'
  workflow_dispatch:
    inputs:
      environment:
        description: 'Environment to deploy to'
        type: environment
        required: true 
```
  
</details>

6. Create a job `Build` that runs on the latest ubuntu image on GitHub hosted runners. Check the documentation of the [virtual environments](https://github.com/actions/virtual-environments/) what label to use and what version it is.  The job should do the following things:
  - Output the name of the event that triggered the workflow
  - Output the name of the branch that the repository is currently referencing
  - List all files in the repository 

<details>
  <summary>Solution</summary>
  
```YAML

```
  
</details>

7. Commit the workflow file - and trigger the workflow manually (it should not run if your path filter works).


## Viewing your workflow results
1. On GitHub, navigate to the main page of the repository.
2. Under your repository name, click `Actions`.
![](https://docs.github.com/assets/images/help/repository/actions-tab.png)

3. In the left sidebar, click the workflow you want to see.
![](https://docs.github.com/assets/images/help/repository/actions-quickstart-workflow-sidebar.png)

4. From the list of workflow runs, click the name of the run you want to see.
![](https://docs.github.com/assets/images/help/repository/actions-quickstart-run-name.png)

5. Under `Jobs` , click the `Explore-GitHub-Actions` job.
![](https://docs.github.com/assets/images/help/repository/actions-quickstart-job.png)

6. The log shows you how each of the steps was processed. Expand any of the steps to view its details.
![](https://docs.github.com/assets/images/help/repository/actions-quickstart-logs.png)

For example, you can see the list of files in your repository:
![](https://docs.github.com/assets/images/help/repository/actions-quickstart-log-detail.png)


## If time permits: Only trigger workflow when a change is made to the website

See: [Workflow syntax for github actions - on push/pull - request paths.](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#onpushpull_requestpaths)
```
name: GitHub Actions Demo
on:
  push:
    paths:
    - 'TailwindTraders.Website/**/*'
jobs:

...
...
```

## If time permits: Only trigger workflow on new issue created

See: [Webhook events and payloads - Issues](https://docs.github.com/en/developers/webhooks-and-events/webhooks/webhook-events-and-payloads#issues)
```
...
...

on:
  issues:
    types: [opened]

...
...
```

## If time permits: Create a Matrix build for release and debug
See: [Workflow Syntax - Jobs - Matrix Strategy](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idstrategymatrix)

```
...
...

Explore-GitHub-Actions:
    runs-on: ubuntu-latest  
    strategy:
      matrix:
        configuration: [debug, release]
    steps:
    - run: echo "🔧 Building the cofiguration ${{ matrix.configuration }}."

...
...
```

