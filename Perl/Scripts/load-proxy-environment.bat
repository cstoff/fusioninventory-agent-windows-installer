:: ------------------------------------------------------------------------
:: FusionInventory
:: Copyright (C) 2010-2012 by the FusionInventory Development Team.
::
:: http://www.fusioninventory.org/   http://forge.fusioninventory.org/
:: ------------------------------------------------------------------------
::
:: LICENSE
::
:: This file is part of FusionInventory project.
::
:: FusionInventory Agent Installer for Microsoft Windows is free software;
:: you can redistribute it and/or modify it under the terms of the GNU
:: General Public License as published by the Free Software Foundation;
:: either version 2 of the License, or (at your option) any later version.
::
::
:: FusionInventory Agent Installer for Microsoft Windows is distributed in
:: the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
:: the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
:: PURPOSE. See the GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program; if not, write to the Free Software Foundation,
:: Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
:: or see <http://www.gnu.org/licenses/>.
::
:: ------------------------------------------------------------------------
::
:: @package   FusionInventory Agent Installer for Microsoft Windows
:: @file      .\Perl\Scripts\load-proxy-environment.bat
:: @author    Tomas Abad
:: @copyright Copyright (c) 2010-2012 FusionInventory Team
:: @license   GNU GPL version 2 or (at your option) any later version
::            http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
:: @link      http://www.fusioninventory.org/
:: @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
:: @since     2012
::
:: ------------------------------------------------------------------------


@echo off

::    Remove comments and defines the lines below to use the proxy server
:: set HTTP_PROXY=http://[username:password@]your.http.server.proxy:port/
:: set HTTPS_PROXY=https://[username:password@]your.https.server.proxy:port/
:: set FTP_PROXY=ftp://[username:password@]your.ftp.server.proxy:port/
:: set NO_PROXY=localhost,...
::
:: *** Attention ***
::    Whether you connect trough a proxy system, and since mingw-get uses the
::    Internet Explorer (IE) Proxy settings, you should define, in addition
::    to *_PROXY variables, the IE proxy.
