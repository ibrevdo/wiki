SUDOERS file
--------------------------------

Format : 
`username hosts = (runas) commands`

There are four kinds of aliases: User_Alias, Runas_Alias, Host_Alias and Cmnd_Alias. 

Each alias definition is of the form : `Alias_Type NAME = item1, item2, ...`
where Alias_Type is one of User_Alias, Runas_Alias, Host_Alias, or Cmnd_Alias.

Example : 

```sh
root    ALL = (ALL) ALL
```
Let root run any command on any host as any user. 

From here : https://www.sudo.ws/man/sudoers.man.html

