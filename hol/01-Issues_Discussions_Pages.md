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

    7. Add a custom template file `.github/ISSUE_TEMPLATE/custom.yml`
    8. Add a required input with a placeholder text and a label, a textarea, a single select dropdown, a multi select dropdown, and a checkbox

    <details><summary>Solution</summary>  
    ```yaml
    name: 💡 Custom Issue Form
    description: A custom form with different fields
    body:
      - type: input
        id: contact
        attributes:
          label: Contact Details
          description: How can we get in touch with you if we need more info?
          placeholder: ex. email@example.com
        validations:
          required: false
      - type: textarea
        id: what-happened
        attributes:
          label: What happened?
          description: Also tell us, what did you expect to happen?
          placeholder: Tell us what you see!
          value: "Tell us what you think"
        validations:
          required: true
      - type: dropdown
        id: version
        attributes:
          label: Version
          description: What version of our software are you running?
          options:
            - 1.0.2 (Default)
            - 1.0.3 (Edge)
            - 1.0.4 (Something)
        validations:
          required: true
      - type: dropdown
        id: browsers
        attributes:
          label: What browsers are you seeing the problem on?
          multiple: true
          options:
            - Firefox
            - Chrome
            - Safari
            - Microsoft Edge
      - type: checkboxes
        id: terms
        attributes:
          label: Code of Conduct
          description: By submitting this issue, you agree to follow our [Code of Conduct](https://example.com)
          options:
            - label: I agree to follow this project's Code of Conduct
              required: true
    ```
    </details>
    
    9. Verify your issue template and create a bug and an issue from the custom template

## Discussions

1. Ask a question in discussions and answer it (mark it as answered)
2. Create a poll 
3. Create an announcement
4. Pin the question and the announcement to discussion
5. See [here](https://github.com/wulfland/AccelerateDevOps/discussions) for ideas
