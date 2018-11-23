# intERPrise Transport Services Beta 1.0
A Server for receiving and responding to remote requests using JSON.

## Build Instructions
*Copy the source code to the IRPT Library.
*Compile the CRTOBJS command and CRTOBJS CLLE Program into a suitable library. (suggest IRPT)
*Run the command CRTOBJS with defaults to build the content into library IRPT_OBJ and IRPT_DTA.
*Resolve any compile issues.Note the CRTOBJS command is re-entrant using the start labels.
## Running the server
Menus and Panel Groups are provided to work with the server config. The default settings are defined in the IRPTCFG file.
*Add IRPT_OBJ and IRPT_DTA to your library list.
*Go to menu IRPTMAIN.
*If you need to alter the defaults use the configurtaion menu and then option 1 to change the defaults.
*Go to the operations menu and select option 1 to start the Servers.
## Testing the Server
We have provided a simple test program and command that will allow you to run tests against the server. To build the test commands and programs you will need to compile
the TESTSVR objects from the SRCC and SRCCMD files. The programs will use the same configuration file used for the Server start up so you do not need to pass in any configuration
information. Once the objects are compiled run the command from a command line, you need to press enter on the resulting screen to progress through the tests.

