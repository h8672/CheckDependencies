# CheckDependencies

The program should work on Ubuntu based installation.    
It doesn't require administrator permission.    
Program can be run on the dependency file folder and doesn't require script there.

The program doesn't actually 'check' the dependencies, but fetches the current package information with dpkg.    
If version doesn't show up in logs, it is not probably installed.    
So you still need to check the log manually.    

I made the format from Unity3D Linux Editor dependencies which was posted on their thread.    
https://forum.unity.com/threads/unity-on-linux-release-notes-and-known-issues.350256/

<details>
<summary>Want to try more?</summary>

###### If you want to add this to command list, move or copy it to your user binaries and it should work.
> sudo cp CheckDependencies.sh /usr/bin/CheckDependencies    
Note: You need permission to access /usr/bin folder.

###### Test and get help with command!
> CheckDependencies help    
And if it doesn't help, give project an issue!

###### Logging to file
You can create a log file to your current folder:
> CheckDependencies file MyDebs.txt check sleep 0 > mylogfile

</details>

<details open>
<summary>Preview log of my Pop OS (19.04) installation</summary>

```cs
#####################################################################
# - Default Unity3D linux editor requirements #
#####################################################################
#------ Fetching dependencies ------#
#------- Fetching dependency -------#
Checking: gconf-service
Version: 3.2.6-5ubuntu1
#------- Fetching dependency -------#
Checking: lib32gcc1
Version: 1:9.1.0-2ubuntu2~19.04
Supported: (>= 1:4.1.1)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: lib32stdc++6
   ! ! ! Missing dependency ! ! !   
Supported: (>= 4.6)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libasound2
Version: 1.1.8-1
Supported: (>= 1.0.23)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libc6
Version: 2.29-0ubuntu2
Supported: (>> 2.15)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libc6-i386
Version: 2.29-0ubuntu2
Supported: (>= 2.15)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libcairo2
Version: 1.16.0-4
Supported: (>= 1.6.0)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libcap2
Version: 1:2.25-2
Supported: (>= 2.10)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libcups2
Version: 2.2.10-4ubuntu2.1
Supported: (>= 1.4.0)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libdbus-1-3
Version: 1.12.12-1ubuntu1.1
Supported: (>= 1.2.14)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libexpat1
Version: 2.2.6-1ubuntu0.19.04
Supported: (>= 1.95.8)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libfontconfig1
Version: 2.13.1-2ubuntu2
Supported: (>= 2.8.0)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libfreetype6
Version: 2.9.1-3
Supported: (>= 2.3.9)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libgcc1
Version: 1:9.1.0-2ubuntu2~19.04
Supported: (>= 1:4.1.1)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libgconf-2-4
Version: 3.2.6-5ubuntu1
Supported: (>= 2.31.1)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libgdk-pixbuf2.0-0
Version: 2.38.1+dfsg-1
Supported: (>= 2.22.0)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libgl1-mesa-glx
Version: 19.0.8-0ubuntu0~19.04.1
Optional dependency...
Checking:  libgl1
Version: 1.1.1-0ubuntu1
#------- Fetching dependency -------#
Checking: libglib2.0-0
Version: 2.60.4-0ubuntu0.19.04.1
Supported: (>= 2.31.8)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libglu1-mesa
Version: 9.0.0-2.1build1
Optional dependency...
Checking:  libglu1
   ! ! ! Missing dependency ! ! !   
#------- Fetching dependency -------#
Checking: libgtk2.0-0
Version: 2.24.32-3ubuntu1
Supported: (>= 2.24.0)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libnspr4
Version: 2:4.20-1ubuntu1
Supported: (>= 1.8.0.10)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libnss3
Version: 2:3.42-1ubuntu2.1
Supported: (>= 3.14.3)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libpango1.0-0
   ! ! ! Missing dependency ! ! !   
Supported: (>= 1.22.0)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libstdc++6
Version: 9.1.0-2ubuntu2~19.04
Supported: (>= 4.6)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libx11-6
Version: 2:1.6.7-1
Supported: (>= 2:1.4.99.1)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libxcomposite1
Version: 1:0.4.4-2
Supported: (>= 1:0.3-1)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libxcursor1
Version: 1:1.2.0-1
Supported: (>> 1.1.2)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libxdamage1
Version: 1:1.1.4-3
Supported: (>= 1:1.1)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libxext6
Version: 2:1.3.3-1
#------- Fetching dependency -------#
Checking: libxfixes3
Version: 1:5.0.3-1
#------- Fetching dependency -------#
Checking: libxi6
Version: 2:1.7.9-1
Supported: (>= 2:1.2.99.4)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libxrandr2
Version: 2:1.5.1-1
Supported: (>= 2:1.2.99.2)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: libxrender1
Version: 1:0.9.10-1
#------- Fetching dependency -------#
Checking: libxtst6
Version: 2:1.2.3-1
#------- Fetching dependency -------#
Checking: zlib1g
Version: 1:1.2.11.dfsg-1ubuntu2
Supported: (>= 1:1.1.4)
   < < < Check version! > > >   
#------- Fetching dependency -------#
Checking: debconf
Version: 1.5.71ubuntu1
Supported: (>= 0.5)
   < < < Check version! > > >   
Optional dependency...
Checking:  debconf-2.0
   ! ! ! Missing dependency ! ! !   
#------- Fetching dependency -------#
Checking: npm
   ! ! ! Missing dependency ! ! !   
#####################################################################
# - 27.9.2017 might require additional dependency #
#####################################################################
#------- Fetching dependency -------#
Checking: libgconf-2-4
Version: 3.2.6-5ubuntu1
#####################################################################
# - WebGL projects #
#####################################################################
#------- Fetching dependency -------#
Checking: ffmpeg
Version: 7:4.1.3-0ubuntu1
Optional dependency...
Checking:  libav-tools
   ! ! ! Missing dependency ! ! !   
#------- Fetching dependency -------#
Checking: nodejs
   ! ! ! Missing dependency ! ! !   
#------- Fetching dependency -------#
Checking: java6-runtime
   ! ! ! Missing dependency ! ! !   
#------- Fetching dependency -------#
Checking: gzip
Version: 1.9-3
#####################################################################
# - Android or Tizen projects #
#####################################################################
#------- Fetching dependency -------#
Checking: java7-jdk
   ! ! ! Missing dependency ! ! !   
#------ Dependencies fetched! ------#
Fri 06 Sep 2019 02:03:58 PM EEST
```
</details>

<details>
<summary>Dependencies file format</summary>

```cs
dependency (umm... 1?) | optional_dependency (> 1.0.0)    
dependency (version) | optional_dependency (>=2:3.4.32)    
dependency (version is plain text) | optional_dependency (write_what_you_need)    
dependency (compare versions) | optional_dependency    
```
</details>

<details>
<summary>Dependencies file preview</summary>

```cs
- Default Unity3D linux editor requirements
gconf-service
lib32gcc1 (>= 1:4.1.1)
lib32stdc++6 (>= 4.6)
libasound2 (>= 1.0.23)
libc6 (>> 2.15)
libc6-i386 (>= 2.15)
libcairo2 (>= 1.6.0)
libcap2 (>= 2.10)
libcups2 (>= 1.4.0)
libdbus-1-3 (>= 1.2.14)
libexpat1 (>= 1.95.8)
libfontconfig1 (>= 2.8.0)
libfreetype6 (>= 2.3.9)
libgcc1 (>= 1:4.1.1)
libgconf-2-4 (>= 2.31.1)
libgdk-pixbuf2.0-0 (>= 2.22.0)
libgl1-mesa-glx | libgl1
libglib2.0-0 (>= 2.31.8)
libglu1-mesa | libglu1
libgtk2.0-0 (>= 2.24.0)
libnspr4 (>= 1.8.0.10)
libnss3 (>= 3.14.3)
libpango1.0-0 (>= 1.22.0)
libstdc++6 (>= 4.6)
libx11-6 (>= 2:1.4.99.1)
libxcomposite1 (>= 1:0.3-1)
libxcursor1 (>> 1.1.2)
libxdamage1 (>= 1:1.1)
libxext6
libxfixes3
libxi6 (>= 2:1.2.99.4)
libxrandr2 (>= 2:1.2.99.2)
libxrender1
libxtst6
zlib1g (>= 1:1.1.4)
debconf (>= 0.5) | debconf-2.0
npm

- 27.9.2017 might require additional dependency
libgconf-2-4

- WebGL projects
ffmpeg | libav-tools
nodejs
java6-runtime
gzip

- Android or Tizen projects
java7-jdk
```
</details>
<br>
**NOTE:** Using cs syntax to highlight the text.
