---
Required disk space: 28KB (maybe more for saved results)
Required RAM space: 50MB
---
Supported operating systems:
- Windows 2000 or newer (tested successfully on Windows 7)
- OS/2 (not tested)
- ArcaOS (not tested)
- ReactOS (not tested)

CMD contains built-in commands to troubleshoot networks. 
This tool arranges the networking commands into an easily accessible environment.
It allows you to save the results to a file that will be 
stored in the **SavedResults** folder, which is created on the first run.
**cmd.exe** does support saving results to files as well.         
# Updates (newest to oldest)
- Fixed Ipconfig not working via NetworkingTool.cmd
- Fixed result saving for Trace route
- Fixed result saving for Ping
# Bugs
Ipconfig now only works via NetworkingTool.cmd. Not when used directly.
# Help
## Notes
- If you see some weird messages after typing in a number for a feature, it is completely normal. Just type in the number for what you'd like to do.
- It is recommended to switch on show file extensions.
- DO NOT RENAME ANY OF THE FILES OR IT WILL NOT WORK.
- When you save results to a file, the program creates a random id for it.
  
## Errors

If it cannot find the **SavedResults** folder,
then double click on **Networking tool.cmd** and it should work.
