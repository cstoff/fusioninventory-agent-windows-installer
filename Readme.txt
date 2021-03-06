
                            FusionInventory Agent
                         Microsoft Windows Installer
                         ---------------------------


Description
-----------
  The FusionInventory Agent Microsoft Windows Installer is an open source
project than has as goal to build the installer program of the FusionInventory
Agent and its tasks for Microsoft Windows operative systems. It makes use of
some others open source projects, like the Nullsoft Scriptable Install System
(in forward NSIS), Strawberry Perl, Curl, etcetera, to obtain its objective.

  It is born to cover a basic goal; be able to install new FusionInventory Agent
versions based on the previous configuration in the system, whether it exists.
In summary, it is  born to be able to update the existing agent, and not only to
install a new version from scratch.

  It has more purposes, of course. The following are some of them.


Features
--------
   - Installs from scratch or from the current configuration.

   - Uninstalls the previous agent, whether it exists.

   - Prevents multiple installations simultaneously.

   - Supports visual installation in multiple languages.
        (English and Spanish. French in construction.)

   - Builds two different installers for x86 and x64 architectures.
        (Each platform uses its native distribution of Strawberry Perl)

   - Builds installers for stable or development versions.

   - Supports both installation methods; silent or unattended mode and
     graphical or visual mode.

   - Allows to select the agent tasks to install.

   - New visual appearance based on the NSIS Modern UI 2 plugin.

   - Migrates the depreciated options to the new options and removes completely
     the obsolete ones from the Microsoft Windows registry.

   - Now the Microsoft Windows registry used for agent configuration integrates
     all the options supported by the agent, and not only those that them
     values are different to the default.

   - Allows a complete customization of all the options supported for the
     agent, either from the the command line, or from the visual installation.

   - Each generated installer is identified uniquely by a BuildID.
        (Each architecture has its own BuildID sequence)

   - Allows to execute the agent as a Windows Service, to plan its execution
     through a Windows Task or, simply, not to execute the agent.

   - Allows to pull a SSL certificate from a URL at installation time. (ToDo)


What do you need
----------------
   This is than you need to build the installer

   - Whether you use Microsoft Windows OS
      * NSIS 2.46

      You can get NSIS 2.46 from http://nsis.sourceforge.net/Download

   - Whether you use a Unix OS
      * Curl
      * NSIS 2.46

      Check your distribution for more information about these packages

   - In all of cases
      * An Internet connection


Current state
-------------
   Nowadays, the contents of the project is:

      .- FusionInventory Agent v2.2.7
         .- FusionInventory Agent Task Deploy v2.0.3
         .- FusionInventory Agent Task ESX v2.2.0
         .- FusionInventory Agent Task Inventory v1.0
         .- FusionInventory Agent Task WakeOnLan v1.0
         .- FusionInventory Agent Distribution Network v1.0.2
            .- FusionInventory Agent Task NetInventory v2.2.0
            .- FusionInventory Agent Task NetDiscovery v2.2.0


   This is the current directory tree of the project.

.
|-- NSIS
|   |-- FusionInventory-Agent
|   |   |-- Contrib
|   |   |   |-- Graphics
|   |   |   |   `-- Icons
|   |   |   |-- ModernUI2
|   |   |   |   `-- Pages
|   |   |   |       `-- Templates
|   |   |   `-- Skins
|   |   |       `-- Default
|   |   |-- Include
|   |   `-- INI
|   `-- Plugins
|-- Perl
|   `-- Scripts
`-- Tools
    |-- 7zip
    |   |-- x64
    |   `-- x86
    |-- curl
    |   `-- x86
    |-- dmidecode
    |   `-- x86
    |-- hdparm
    |   `-- x86
    |-- sed
    |   `-- x86
    `-- setacl
        |-- x64
        `-- x86


   Inside of './NSIS/Perl/Scripts' directory there is a set of scripts for
download Strawberry Perl Portable Edition v5.16.2.1 (Nov 2012) for x64 and
x86 architectures, update and install all the Perl modules dependencies for
the previous FusionInventory Agent packages, and download them. Please, read
the file './Perl/Scripts/readme.txt' for more information about these scripts.


How to generate the installers
------------------------------

   Download fusioninventory-agent-windows-installer from GitHub using this URL
pattern.

   https://github.com/tabad/fusioninventory-agent-windows-installer/tarball/<object>

where <object> may be a tag (or release) name, a branch name or a commit name.
To know the available tags, branches and commits available, please, visit
these URL's in that order.

   https://github.com/tabad/fusioninventory-agent-windows-installer/tags
   https://github.com/tabad/fusioninventory-agent-windows-installer/branches
   https://github.com/tabad/fusioninventory-agent-windows-installer/commits

            Note that, in the last case, you should select after the wished
            branch name or end up the URL with the name of that branch, like
            this '...-windows-installer/commits/<branch_name>'.

   This is an example using cURL to download the last commit of 'master'
branch.

   $ curl --location \
     --output fusioninventory-agent-windows-installer-master.tar.gz \
     https://github.com/tabad/fusioninventory-agent-windows-installer/\
     tarball/master

            Note than you can put it in a single line.

   Once you have the '*.tar.gz' file, uncompress and unpack it. This is an
example, continuing the previous one, using tar.

   $ mkdir fusioninventory-agent-windows-installer-master
   $ tar -C fusioninventory-agent-windows-installer-master \
     --strip-components 1 \
     -xf fusioninventory-agent-windows-installer-master.tar.gz

            Note than, like above, you can put it in a single line.

   You can also clone the repository whether do you prefer it using Git.

   $ git clone --branch <branch_name> \
     https://github.com/tabad/fusioninventory-agent-windows-installer.git

            Note that you should change <branch_name> for the name of branch\
            you wish download.

            I'm sure you don't need much more explications about Git whether
            you have chosen this last option.

   The following steps depends of your operative system.


   Microsoft Windows
   -----------------

   From your Microsoft Windows command interpreter executes

   > cd fusioninventory-agent-windows-installer
   > cd Perl\Scripts
   > .\install-gnu-utilities-collection.bat
   > .\install-strawberry-perl-package-for-fusioninventory-agent.bat
   > .\install-fusioninventory-agent-and-tasks.bat
   > .\patch-fusioninventory-agent-and-tasks.bat
   > cd ..\..\NSIS
   > .\FusionInventory-Agent.bat

   You should be able to see the new installers in that directory.


   Unix OS
   -------

   $ cd fusioninventory-agent-windows-installer
   $ chmod 0744 NSIS/*.sh Perl/Scripts/*.sh
   $ cd Perl/Scripts
   $ ./install-strawberry-perl-package-for-fusioninventory-agent.sh
   $ ./install-fusioninventory-agent-and-tasks.sh
   $ ./patch-fusioninventory-agent-and-tasks.sh
   $ cd ../../NSIS
   $ ./FusionInventory-Agent.sh

   You should be able to see the new installers in that directory.


How to build the Strawberry Perl Package for FusionInventory-Agent
------------------------------------------------------------------
   This task can be done only from Microsoft Windows OS.


   Microsoft Windows
   -----------------

   From your Microsoft Windows command interpreter executes

   > cd fusioninventory-agent-windows-installer
   > cd Perl\Scripts
   > .\install-gnu-utilities-collection.bat
   > .\install-strawberry-perl.bat
   > .\install-perl-modules-and-dependencies.bat
   > .\delete-perl-modules-and-dependencies-temporary-files.bat
   > .\build-strawberry-perl-package-for-fusioninventory-agent.bat
   > .\uninstall-strawberry-perl.bat

   The script 'build-strawberry-perl-package-for-fusioninventory-agent.bat'
will show to you where is the built package.


How to upgrade the Strawberry Perl distribution
-----------------------------------------------
   Let's look at an exemple.

   Suppose has been released the new Strawberry Perl Nov 2012 Portable Edition
(5.16.2.1-32/64bits). Nowadays (Nov 09, 2012), the installers are run on
Strawberry Perl Aug 2012 Portable Edition (5.16.1.1-32/64bits) and you want to
upgrade it. These are the steps you should carry out.

    Update variables 'strawberry_version' and 'strawberry_release' of file
'./Perl/Scripts/load-perl-environment' to reflect the new values.

      -declare -r strawberry_version='5.16.1.1'
      -declare -r strawberry_release='Aug 2012'
      +declare -r strawberry_version='5.16.2.1'
      +declare -r strawberry_release='Nov 2012'

   Update constant 'STRAWBERRY_RELEASE' of file './NSIS/
/FusionInventory.nsi' to adapt it to its new value:

      -!define STRAWBERRY_RELEASE "5.16.1.1"
      +!define STRAWBERRY_RELEASE "5.16.2.1"

   And finally, rebuild the installers.


How to upgrade the agent and its tasks
--------------------------------------
   Let's look at an example.

   Suppose you know there are new stable releases for FusionInventory-Agent
and FusionInventory-Agent-Task-Deploy. You have the builder ready to build the
installers with FusionInventory-Agent v2.2.5, FusionInventory-Agent-Task-Deploy
v2.0.2, FusionInventory-Agent-Task-ESX v2.2.0 and FusionInventory-Agent-Task-
-Network v1.0.1 so you want to change it to get the installers with the last
releases.

   In GitHub you can find all releases of FusionInventory-Agent and its tasks.
In https://github.com/fusinv are registered most of the projects of
FusionInventory but here we are only interested in four of them. They are,
with their URLs, the following

      FusionInventory-Agent
         https://github.com/fusinv/fusioninventory-agent

      FusionInventory-Agent-Task-Deploy
         https://github.com/fusinv/fusioninventory-agent-task-deploy

      FusionInventory-Agent-Task-ESX
         https://github.com/fusinv/fusioninventory-agent-task-esx

      and FusionInventory-Agent-Task-Network
         https://github.com/fusinv/fusioninventory-agent-task-network

   You can see the tag (or release) names, the branch names or the commit names
of these project the same way you see them of this one. For more information,
see section 'How to generate the installers' above.

   By taking a look at https://github.com/fusinv/fusioninventory-agent/tags and
https://github.com/fusinv/fusioninventory-agent-task-deploy/tags you see those
new releases are v2.2.6 and v2.0.3 respectively (it is true in the time I am
writing this; Oct 23, 2012). These are the changes you should to carry out.

   Edit the './Perl/Scripts/load-perl-environment' file and change the value of
variables 'fusinv_agent_commit' and 'fusinv_task_deploy_commit' to '2.2.6' and
'2.0.3' respectively. The other variables (fusinv_agent_mod_name, fusinv_agent-
_repository, fusinv_task_deploy_name and fusinv_task_deploy_repository) should
maintain its values, unless there are changes in GitHub.

      -declare +r fusinv_agent_commit='2.2.5'
      +declare +r fusinv_agent_commit='2.2.6'
         ...
      -declare +r fusinv_task_deploy_commit='2.0.2'
      +declare +r fusinv_task_deploy_commit='2.0.3'

            Note that, in these cases, '2.2.6' and '2.0.3' are 'tags' in Git
            terminology; that is, in our case, stable releases. A tag makes
            reference, in last term, to a commit, therefore the name of the
            variable.

   An important thing to take into account is that, probably, these new releases
require new, or simply different, Perl modules. Whether it is so, you should
build a new Strawberry Perl Package for FusionInventory-Agent. But before to do
that, you should carry out two actions; a) to increase the package build identi-
fier and b) to update the list of required and recommended Perl modules.

   To do the first one is easy, you only need to edit the '.\Perl\Script\load-
-perl-environment' and to increment it in a unit.

      -declare -r strawberry_pepfia_build_id='1'
      +declare -r strawberry_pepfia_build_id='2'

            Note that the variable 'strawberry_pepfia_branch' is not necessary
            to change it in this case since the branch 2.2.x match with the
            branch of FusionInventory-Agent release 2.2.6.

   The second one is, most of the times, more tedious. You should check whether
there is new requirements or recommendations comparing the files 'Makefile.PL'
of each FusionInventory-Agent package you want to update. Then, whether there
are changes, you must update the respective variable 'fusinv_agent_mod_depen-
dences', 'fusinv_task_deploy_mod_dependences', 'fusinv_task_esx_mod_dependences'
or 'fusinv_task_network_mod_dependences' of './Perl/Scripts/load-perl-environ-
ment' file to reflect these changes.

   Let's look at an example for FusionInventory-Agent.

   In https://github.com/fusinv/fusioninventory-agent/tags you can see all
stable releases of FusionInventory-Agent. In that, below '2.2.6.zip - 2.2.6 re-
lease' appears the sequence '6f67b7d73c'; the short form for its SHA1 commit.
Do click on it, and after, do click on 'Browse code' (up and right). In the list
of files that appears, do click on file 'Makefile.Pl' and write down the list
of required and recommended Perl modules (those lines started by 'requires ...'
and 'recommends ...', but not those lines started by 'text_requires ...')
commons to all operative systems and those specific for Microsoft Windows (those
lines under the condition '($OSNAME eq 'MSWin32')'). This list of Perl modules
should be the new value of the variable 'fusinv_agent_mod_dependences'. Like
this list is different of that for 2.2.5 release (repeat the previous process
for '2.2.5.zip - 2.2.5 release') you need change the value of the variable
'fusinv_agent_mod_dependences'.

      -declare -r fusion_agent_mod_dependences='Compress::Zlib Digest::MD5
       File::Which HTTP::Daemon IO::Socket::SSL LWP LWP::Protocol::https
       Net::IP Text::Template UNIVERSAL::require Win32::Daemon Win32::Job
       Win32::OLE Win32::TieRegistry XML::TreePP'
      +declare -r fusinv_agent_mod_dependences='Compress::Zlib File::Which
       HTTP::Daemon IO::Socket::SSL LWP LWP::Protocol::https Net::IP
       Text::Template UNIVERSAL::require Win32::Daemon Win32::Job Win32::OLE
       Win32::TieRegistry XML::TreePP'

            Note that they are only two lines.

   In the case of FusionInventory-Agent-Task-Deploy v2.0.3 the list of the
required and recommended Perl modules are the same that for v2.0.2, so there
is not needed any additional change.

   As the list of modules for FusionInventory-Agent has changed, it is necessary
to generate a new package Strawberry Perl Package.

            Note that this is an strange case and that is not totally necessary.

   You should start with a clean Strawberry Perl distribution too, so the
recommended steps are:

            Remember, this task can be done only from Microsoft Windows OS.

   > cd fusioninventory-agent-windows-installer
   > cd Perl\Scripts
   > .\install-gnu-utilities-collection.bat
   > .\uninstall-strawberry-perl.bat
   > .\install-strawberry-perl.bat
   > .\install-perl-modules-and-dependencies.bat
   > .\delete-perl-modules-and-dependencies-temporary-files.bat
   > .\build-strawberry-perl-package-for-fusioninventory-agent.bat
   > .\uninstall-strawberry-perl.bat

   Now you can load the new package and its associated files into your public
repository of Strawberry Perl Packages for FusionInventory-Agent. This
can be a local repository; you only have to change the 'strawberry_pepfia_url'
variable of the file './Perl/Scripts/load-perl-environment'. For example, to
leave the default directory as the default repository, you only have to do the
following:

   -declare -r strawberry_pepfia_url='https://github.com/downloads/tabad/fusioni
    nventory-agent-windows-installer'
   +declare -r strawberry_pepfia_url='file://c/.../fusioninventory-agent-windows
    -installer/Perl/Strawberry'

            Note that they are only two lines.

            Remember, 'file://' is dependent of the OS and must be written as
            a absolute path. Make sure, in any case, that the value of the
            'strawberry_pepfia_url' variable is correct.

   Finally, you should change the following constants of the file './NSIS/
/FusionInventory.nsi' to adapt them to their new values:

      FIA_RELEASE
      FIA_TASK_DEPLOY_RELEASE
      FIA_TASK_ESX_RELEASE
      FIA_TASK_NETWORK_RELEASE

      FIA_TASK_INVENTORY_RELEASE
      FIA_TASK_NETDISCOVERY_RELEASE
      FIA_TASK_NETINVENTORY_RELEASE
      FIA_TASK_WAKEONLAN_RELEASE

      PRODUCT_VERSION_MAJOR
      PRODUCT_VERSION_MINOR
      PRODUCT_VERSION_RELEASE
      PRODUCT_VERSION_BUILD

   They are at the beginning of the file. Following the example,

   -!define FIA_RELEASE "2.2.5"
   -!define FIA_TASK_DEPLOY_RELEASE "2.0.2"
   +!define FIA_RELEASE "2.2.6"
   +!define FIA_TASK_DEPLOY_RELEASE "2.0.3"

   -!define PRODUCT_VERSION_RELEASE "5"
   +!define PRODUCT_VERSION_RELEASE "6"

   With the new Strawberry Perl Package for FusionInventory-Agent ready, and
these last changes, you can continue as it were a normal build process.
See 'How to generate the installers' above.


How to know whether is needed to build a new Strawberry Perl Package for
FusionInventory-Agent
------------------------------------------------------------------------
   Basically you should check whether there is new requirements or recommen-
dations comparing the files 'Makefile.PL' of each FusionInventory-Agent
package you want to update. Then, whether there are changes, you must update
the respective variable 'fusinv_agent_mod_dependences', 'fusinv_task_deploy_-
mod_dependences', 'fusinv_task_esx_mod_dependences' or 'fusinv_task_network_-
mod_dependences' of './Perl/Scripts/load-perl-environment' file to reflect
these changes.

   See 'How to upgrade the agent and its tasks' above for more information.


How to build the installers for a development version of FusionInventory-Agent
------------------------------------------------------------------------------
   The process is very similar to that described in 'How to upgrade the agent
and its tasks'. Then you chose a new stable release, in this case you choose
a branch name or a commit name.

   Let's look at an example about how to build the installers for the,
nowadays, development branch '2.3.x' supposing you have the builder ready to
build the installers with FusionInventory-Agent v2.2.6, FusionInventory-Agent-
-Task-Deploy v2.0.3, FusionInventory-Agent-Task-ESX v2.2.0 and FusionInventory-
-Agent-Task-Network v1.0.1.

   Edit the './Perl/Scripts/load-perl-environment' file and carry out these
changes.

      -declare -r strawberry_pepfia_branch='2.2.x'
      +declare -r strawberry_pepfia_branch='2.3.x'
      -declare -r strawberry_pepfia_build_id='2'
      +declare -r strawberry_pepfia_build_id='1'
         ...
      -declare +r fusinv_agent_commit='2.2.6'
      +declare +r fusinv_agent_commit='2.3.x'
         ...

      -declare -r fusinv_agent_mod_dependences='Compress::Zlib File::Which
       HTTP::Daemon IO::Socket::SSL LWP LWP::Protocol::https Net::IP
       Text::Template UNIVERSAL::require Win32::Daemon Win32::Job Win32::OLE
       Win32::TieRegistry XML::TreePP'
      +declare -r fusinv_agent_mod_dependences='Compress::Zlib File::Which
       HTTP::Daemon IO::Socket::SSL LWP LWP::Protocol::https Net::IP
       Parse::EDID Socket::GetAddrInfo Text::Template UNIVERSAL::require
       Win32::Daemon Win32::Job Win32::OLE Win32::TieRegistry XML::TreePP'

   As the list of modules for FusionInventory-Agent has changed, it is necessary
to generate a new package Strawberry Perl Package.

   You should start with a clean Strawberry Perl distribution too, so the
recommended steps are:

            Remember, this task can be done only from Microsoft Windows OS.

   > cd fusioninventory-agent-windows-installer
   > cd Perl\Scripts
   > .\install-gnu-utilities-collection.bat
   > .\uninstall-strawberry-perl.bat
   > .\install-strawberry-perl.bat
   > .\install-perl-modules-and-dependencies.bat
   > .\delete-perl-modules-and-dependencies-temporary-files.bat
   > .\build-strawberry-perl-package-for-fusioninventory-agent.bat
   > .\uninstall-strawberry-perl.bat

   Now you can load the new package and its associated files into your public
repository of Strawberry Perl Packages for FusionInventory-Agent. This
can be a local repository; you only have to change the 'strawberry_pepfia_url'
variable of the file './Perl/Scripts/load-perl-environment'.

   Finally, you should change the following constants of the file './NSIS/
/FusionInventory.nsi' to adapt them to their new values:

      FIA_RELEASE
      FIA_TASK_DEPLOY_RELEASE
      FIA_TASK_ESX_RELEASE
      FIA_TASK_NETWORK_RELEASE

      FIA_TASK_INVENTORY_RELEASE
      FIA_TASK_NETDISCOVERY_RELEASE
      FIA_TASK_NETINVENTORY_RELEASE
      FIA_TASK_WAKEONLAN_RELEASE

      PRODUCT_VERSION_MAJOR
      PRODUCT_VERSION_MINOR
      PRODUCT_VERSION_RELEASE
      PRODUCT_VERSION_BUILD

   They are at the beginning of the file. Following the example,

   -!define FIA_RELEASE "2.2.6"
   +!define FIA_RELEASE "2.3.x"

   -!define PRODUCT_VERSION_MINOR "2"
   -!define PRODUCT_VERSION_RELEASE "6"
   +!define PRODUCT_VERSION_MINOR "3"
   +!define PRODUCT_VERSION_RELEASE "33835"

            Note that all PRODUCT_VERSION_* constants must have a numeric
            value. The value '33835' is a agreement to design a development
            releases. It is the name you get whether you try to write the
            word 'devel' in a telephone keyboard.

   With the new Strawberry Perl Package for FusionInventory-Agent ready, and
these last changes, you can continue as it were a normal build process.
See 'How to generate the installers' above.

   Nowadays branch '2.3.x' and commit 'f3f9382a18659d1ddd602ae04e816a1a4221c369'
reflect the same state. The following example build the same installers but
choosing the commit 'f3f9382a18659d1ddd602ae04e816a1a4221c369' instead of branch
'2.3.x'.

   Edit the './Perl/Scripts/load-perl-environment' file and carry out these
changes.

      -declare -r strawberry_pepfia_branch='2.2.x'
      +declare -r strawberry_pepfia_branch='2.3.x'
      -declare -r strawberry_pepfia_build_id='2'
      +declare -r strawberry_pepfia_build_id='1'
         ...
      -declare +r fusinv_agent_commit='2.2.6'
      +declare +r fusinv_agent_commit='f3f9382a18659d1ddd602ae04e816a1a4221c369'
         ...

      -declare -r fusinv_agent_mod_dependences='Compress::Zlib File::Which
       HTTP::Daemon IO::Socket::SSL LWP LWP::Protocol::https Net::IP
       Text::Template UNIVERSAL::require Win32::Daemon Win32::Job Win32::OLE
       Win32::TieRegistry XML::TreePP'
      +declare -r fusinv_agent_mod_dependences='Compress::Zlib File::Which
       HTTP::Daemon IO::Socket::SSL LWP LWP::Protocol::https Net::IP
       Parse::EDID Socket::GetAddrInfo Text::Template UNIVERSAL::require
       Win32::Daemon Win32::Job Win32::OLE Win32::TieRegistry XML::TreePP'

            Note that the installer always works with short commit names. See
            variable 'maximum commit length' to know what this length is (by
            default it is 10). All commit names will be truncated to this
            length.

   Like before, it is necessary to generate a new package Strawberry Perl
Package. And like before, you should change the following constants of the
file './NSIS/FusionInventory.nsi' to adapt them to their new values:

   -!define FIA_RELEASE "2.2.6"
   +!define FIA_RELEASE "f3f9382a18"

   -!define PRODUCT_VERSION_MINOR "2"
   -!define PRODUCT_VERSION_RELEASE "6"
   +!define PRODUCT_VERSION_MINOR "3"
   +!define PRODUCT_VERSION_RELEASE "33835"

   With the new Strawberry Perl Package for FusionInventory-Agent ready, and
these last changes, you can continue as it were a normal build process.
See 'How to generate the installers' above.


Contacts
--------
Project websites:
* main site: http://www.fusioninventory.org
* forge: http://forge.fusioninventory.org/projects/fusioninventory-agent-windows-installer

Project mailing lists:
* http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-user
* http://lists.alioth.debian.org/mailman/listinfo/fusioninventory-devel

Project IRC channel:
* #FusionInventory on FreeNode IRC Network

Please report any issues on project forge bugtracker (see forge URL above).


Author
-------
* Tom�s Abad <tabadgp@gmail.com>

Copyright 2012 FusionInventory Team


License
-------
This software is licensed under the terms of GPLv2+, see License.txt file for
details.
