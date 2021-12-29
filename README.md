# SymcDLP Agent Upgrade Agent Script

Script to upgrade the DLP agent to the latest version.

What does the script do?
- Check the operating system support.
- Check if any DLP agent is installed.
- Uninstall the current DLP agent. You must manually add the GUID of the installed DLP version.
- Check if the DLP agent was removed correctly.
- Install the latest version of the DLP agent.

How to improve the script?
- By obtaining the installed DLP agent GUID for the uninstallation procedure.

Requirements:
- Generate the DLP agent package installer for the latest version.
- Include the AgentCleanup binary in the installer folder. You must request it from the manufacturer by opening a support case.
