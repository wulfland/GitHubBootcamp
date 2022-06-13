# Hands-on: 🔨 Collaboration using Issues, Discussions, and Pages

## Issues

1. Create and Issue and add [markdown](https://github.com/wulfland/AccelerateDevOps/issues/232) elements (get help [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/about-writing-and-formatting-on-github)):
    1. Mention a person or team (@)
    2. Add a syntax-highlighted code block
    3. Add a flow chart
    4. Add a pin to a location (geojson)
2. Nesting [issues](https://github.com/wulfland/AccelerateDevOps/issues/233):
    1. Apply a label `Epic` to the issue
    2. Add three tasks to the issue and convert them to issues
    3. Mark them with the label `Feature`
    4. Add two tasks to each feature and convert them to issues 
    5. Mark them with the label `Story` (use bulk edit!)
3. Issue templates
    1. Create a file `.github/ISSUE_TEMPLATE/config.yml`
    2. Disable blank issues
    3. Add an additional URL that points to a new discussion  

    <details><summary>Solution</summary>

    ```yaml
    blank_issues_enabled: false
    contact_links:
      - name: 👥 Discussions
        url:  https://github.com/wulfland/AccelerateDevOps/discussions/new
        about: Please use discussions for issues that are not a bug, enhancement or feature request
    ```

    </details>

    4. Add a template for a bug report (`.github/ISSUE_TEMPLATE/bug_report.md`)
    5. Assign bugs to yourself and add labels `bug` and `unplanned` to bugs
    6. Prefix the title with `[Bug]:` and add some sample markdown.

    <details><summary>Solution</summary>    

    ```yaml
    ---
    name: 🐞 Bug report
    about: Create a report to help us improve
    title: '[Bug]:'
    labels: [bug, unplanned]
    assignees: 
      - wulfland
    ---

    **Describe the bug**
    A clear and concise description of what the bug is.

    **To Reproduce**
    Steps to reproduce the behavior:
    1. Go to '...'
    2. Click on '....'
    3. Scroll down to '....'
    4. See error

    ```

    </details>
