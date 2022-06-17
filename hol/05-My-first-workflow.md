# 🔨 Hands-on: My first workflow

In this hands-on lab your will create your first GitHub Action Workflow and learn how you can use Actions to automate tasks in your software development lifecycle. If you like more background information, please refer to the [GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions) pages on GitHub Docs. Good luck! 👍

> **Note**:  
> Before you start with this lab, please remove the branch rule, so you can commit to the main branch without a pull request to speed up the process 😏

This hands on lab consists of the following steps:
- [Creating the workflow](#creating-the-workflow)
- [Viewing your workflow results](#viewing-your-workflow-results)
- [Staged deployments](#staged-deployments)


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
jobs:
  Build:
    runs-on: ubuntu-latest
    steps:
      - run: |
          echo "🎉 The job was triggered by event: ${{ github.event_name }}"
          echo "🔎 The name of your branch is ${{ github.ref }} and your repository is ."
        
      - uses: actions/checkout@v3.0.2

      - name: List files in the repository
        run: |
          echo "The repository ${{ github.repository }} contains the following files:"
          tree
```
  
</details>

7. Commit the workflow file - and trigger the workflow manually. It should not run automatically if your path filter works. Got to [Action](/../../Actions),  select [GitHub Actions Demo](/../../actions/workflows/github-actions-demo.yml) and `Run workflow`: 

<img width="600" alt="image" src="https://user-images.githubusercontent.com/5276337/174105162-19f33fd1-8533-4860-9279-88fabec84451.png">


## Viewing your workflow results

1. Click on your workflow run:

<img width="600" alt="image" src="https://user-images.githubusercontent.com/5276337/174105747-0e205e0d-37cc-464c-905b-5b29be74fc75.png">

2. Click on the job 'Build':

<img width="400" alt="image" src="https://user-images.githubusercontent.com/5276337/174105990-a1c204c6-fb7d-44a4-9343-6982899edb25.png">

3. Expand `Set up job` and note the log woth line number (line numbers are links). Check the information about the virtual environment and included software:

<img width="600" alt="image" src="https://user-images.githubusercontent.com/5276337/174106759-c2a8f933-74cf-42a4-899b-b29dc67eccd7.png">

4. Expand your jobs and check that the output was correct.

<img width="400" alt="image" src="https://user-images.githubusercontent.com/5276337/174107136-af9187c1-dbee-4109-9ddc-f2abd4830282.png">

5. Verify you other triggers by modifying the [README.md](README.md) file:
  - Modify and commit: triggers build (`push`)
  - Modify and add `[skip ci]` (not triggering the workflow):  
  <img width="350" alt="image" src="https://user-images.githubusercontent.com/5276337/174110845-93d4a38a-9c8a-4336-9b6a-9089ea9a1cfd.png"> 
  
  - Modify and create pull request (trigger: `pull_request`)

## Staged deployments

Create an environment `Production`:

1. Got to [Settings](/../../settings) | [Environments](/../../settings/environments) and click [New environment](/../../settings/environments/new)
2. Enter the name `Production` and click `Configure environment`
3. Add yourself as the `Required reviewer` for this environment: 

<img width="349" alt="image" src="https://user-images.githubusercontent.com/5276337/174113475-967127de-45a7-4dc9-8477-4de4df62c7e6.png">

4. Only allow the `main`branch to be deployed to this environment:

<img width="350" alt="image" src="https://user-images.githubusercontent.com/5276337/174113782-70a1b18a-0ab9-49fd-a53e-cb2ea78916e1.png">

5. Create two more environments. `Test` and `Load-Test` without any restrictions.

6. Now add 3 jobs to the workflow file:
  - Test: runs on `ubuntu-latest` after `Build`. Only runs when the workflow was triggered manually. Runs on the environment `Test`. The job writes `Testing...` to the workflow log.
  - Load-Test: runs on `ubuntu-latest` after `Build`. Only runs when the workflow was triggered manually. Runs on the environment `Load-Test`. The job writes `Testing...` to the workflow log and sleeps for 15 seconds.
  - Production: runs on `ubuntu-latest` after `Test` and `Load-Test`. Deploys to the environment `Production` onyl if this was selected as the input parameter. The environment has the URL `https://writeabout.net`. To simulate deployment, the job will execute 5 steps. Each step with writes `Step x deploying...` to the workflow log and sleeps for 10 seconds.

<details>
  <summary>Solution</summary>
  
```YAML
  Test:
    runs-on: ubuntu-latest
    if: github.event_name == 'workflow_dispatch' 
    needs: Build
    environment: Test
    steps:
      - run: echo "🧪 Testing..."
      
  Load-Test:
    runs-on: ubuntu-latest
    if: github.event_name == 'workflow_dispatch' 
    needs: Build
    environment: Load-Test
    steps:
      - run: |
          echo "🧪 Testing..."
          sleep 15
          
  Production:
    runs-on: ubuntu-latest
    needs: [Test, Load-Test]
    environment: 
      name: Production
      url: https://writeabout.net
    if: github.event.inputs.environment == 'Production'
    steps:
      - run: |
          echo "🚀 Step 1..."
          sleep 10
      - run: |
          echo "🚀 Step 2..."
          sleep 10
      - run: |
          echo "🚀 Step 3..."
          sleep 10
      - run: |
          echo "🚀 Step 4..."
          sleep 10
      - run: |
          echo "🚀 Step 5..."
          sleep 10
```
  
</details>

7. Trigger the workflow and select `Production` as the environment: 

<img width="212" alt="image" src="https://user-images.githubusercontent.com/5276337/174119722-9b76d479-e355-414b-a534-03d8634536ef.png">

8. Review the deployment...
 
<img width="600" alt="image" src="https://user-images.githubusercontent.com/5276337/174120029-f395e8ec-5e6e-4350-94c5-130caefaafc2.png">

9. And approve it with a comment:

<img width="350" alt="image" src="https://user-images.githubusercontent.com/5276337/174120086-fed98feb-2d7f-476b-a997-1aa099de7d0e.png">

10. Note the progress bar while deploying...

<img width="200" alt="image" src="https://user-images.githubusercontent.com/5276337/174120314-c900585c-6b94-4fc2-8fe9-92452b0cf187.png">

11. The result looks like this and contaisn the approval and the URL for the production environment:

<img width="800" alt="image" src="https://user-images.githubusercontent.com/5276337/174120381-cef48594-6663-481a-aadd-1ef0dbd50b0a.png">








