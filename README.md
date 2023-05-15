# Arch Keyboard Originated Setup 
## User Creation
you firstly need to create a user.  
if u already made a user u can skip to [Setup](#setup).  
u can follow the arch wiki.  
https://wiki.archlinux.org/title/users_and_groups  
or do this
```bash
name="main";
useradd -m $name;
passwd $name
```
### Permissions
to allow the sudo command to work for a user add this to /etc/sudoers
```bash
/etc/sudoers
note:this isn\'t $name like in bash
{your name } ALL=(ALL) ALL
``` 
## Setup
after u set up the user and logged into that user 
clone the repo anywhere u want then run 
```bash
sudo chmod +x ./setup;
./setup
```


