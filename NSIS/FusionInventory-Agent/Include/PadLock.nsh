/*
   ------------------------------------------------------------------------
   FusionInventory Agent Installer for Microsoft Windows
   Copyright (C) 2010-2012 by the FusionInventory Development Team.

   http://www.fusioninventory.org/ http://forge.fusioninventory.org/
   ------------------------------------------------------------------------

   LICENSE

   This file is part of FusionInventory project.

   FusionInventory Agent Installer for Microsoft Windows is free software;
   you can redistribute it and/or modify it under the terms of the GNU
   General Public License as published by the Free Software Foundation;
   either version 2 of the License, or (at your option) any later version.


   FusionInventory Agent Installer for Microsoft Windows is distributed in
   the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
   PURPOSE. See the GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software Foundation,
   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
   or see <http://www.gnu.org/licenses/>.

   ------------------------------------------------------------------------

   @package   FusionInventory Agent Installer for Microsoft Windows
   @file      .\FusionInventory Agent\Include\PadLock.nsh
   @author    Tomas Abad
   @copyright Copyright (c) 2010-2012 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_PADLOCK_INCLUDE__
!define __FIAI_PADLOCK_INCLUDE__


!include LogicLib.nsh
!include "${FIAI_DIR}\Include\PadLockLangStrings.nsh"


; ClosePadLock
!macro ClosePadLock Un
Function "${Un}ClosePadLock"
   ; Pushes $R0 onto the stack
   Push $R0

   ; Installer PadLock
   System::Call 'kernel32::CreateMutex(i 0, i 0, t "${PRODUCT_INTERNAL_NAME} ${PRODUCT_VERSION} (Switch ${Un})") i .r1 ?e'
   Pop $R0

   ${If} $R0 != 0
      ${IfNot} ${Silent}
         MessageBox MB_OK|MB_ICONEXCLAMATION "$(ClosePadLock_Text)" /SD IDOK
      ${EndIf}
      Abort
   ${EndIF}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd
!macroend

!insertmacro ClosePadLock ""
!insertmacro ClosePadLock "un."

!define ClosePadLock "Call ClosePadLock"
!define un.ClosePadLock "Call un.ClosePadLock"

!endif

