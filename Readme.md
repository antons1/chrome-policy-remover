# Chrome Policy Remover
I get a chrome policy that stops me from working efficiently. This fixes it.

The repo consists of two parts:

- A task definition for Windows 10 that runs a script on every event recorded in the GroupPolicy log, passing the taskID along as a parameter
- A Powershell script that will remove a registry key on a given path, and output the result to a CSV.

Thus, every time something happens that could potentially re-add the Chrome Group Policy, it will immediately be removed by the script.
After this has run for a time, I will analyse the log, and change the script to only be run on events that could actually change the policy, not on every GroupPolicy event.