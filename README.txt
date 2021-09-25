INSTALL:

What's not working: Nvidia graphics, stock wifi

Prerequisites:

BCM94352Z NGFF WiFi card for wifi. (Clover config includes a patch)

Most recent BIOS 1.2.9 is compatible. BIOS Settings need to be as follows:
- Restore BIOS defaults
- AHCI mode should be selected under SATA
- Disable VT for direct I/O
- Advanced Battery Charging should be disabled
- Secure boot should be disabled
- turn off SupportAssist System Resolution (this will disable the occasional hardware check that prevents booting)
- Firmware TPM should be disabled.
- Load Legacy Option Rom (Enables Clover to show on external display)
- Save the settings and reboot
- Press F12 on boot screen and under other options disable Pheriperial Device Setting (OPROM Setting)

Note: If it’s disabled you shouldn’t see any Legacy options under “F12 screen”
________________________________________________________________________________________________________________________________

Create the USB Installer (16gb or larger required):

1. Download Mojave via the Mac App Store

2. Use the createinstallmedia method to create a usb installer:

- Format your usb drive
Code:
diskutil partitionDisk /dev/*YOUR DISK* GPT JHFS+ MojaveInstallUSB 0b

- Install the installer to it
Code:
sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/MojaveInstallUSB --nointeraction

3. Install Clover using option "Install for UEFI booting only" and choose Use AptioMemoryFix-64.efi for UEFI drivers.

4. While the usb drive's EFI partition is mounted (or use EFI Mounter), replace the config.plist in the EFI>CLOVER file with the one in the mojavefiles/usb folder and put HFSPLUS.efi and apfs.efi driver into the drivers64UEFI folder. place the kexts from "mojavefiles>usb>cloverkexts" to EFI>CLOVER>kexts>Other. Open the EFI>CLOVER>kexts folder and delete all the folders but NOT the the "Other" one.

5. Place the mojavefiles folder onto the usb drive.

6. Boot from the usb drive by pressing f12 at boot. When clover comes up choose the mojave installer. UHD display variants add the bootflag "-cdfon" to the config.plist! Otherwise you won't be able to boot.

7. Use Disk Utility to erase/format (apfs) your disk or partition for OS X then install to it. It will take about 20 minutes.
____________________________________________________________________________________________________________________________________

Post Install(Will not boot without USB at this point)

1. f12 at boot and choose the usb drive again to load clover and choose the partition you just installed to. It will continue installing then reboot. UHD display variants add the bootflag "-cdfon" to the config.plist.

2. f12 at boot again and choose the usb drive again to load clover then choose the OSX install on the hard drive when clover comes on.

3. Install Clover using option "Install for UEFI booting only" and choose Use AptioMemoryFix-64.efi for UEFI drivers.

4. While the hd's EFI folder (or use EFI Mounter) is mounted open it up in finder and go to EFI>CLOVER and replace the config.plist with the one from the mojavefiles/desktop folder. Open the EFI>CLOVER>kexts folder and delete all the folders but NOT the the "Other" one. place the kexts from the "mojavefiles>desktop>cloverkexts" folder in there. Copy HFSPLUS.efi and apfs.efi driver from the mojavefiles into the CLOVER>drivers64UEFI folder.

5a. Use Kextbeast to install the kexts in the mojavefiles>desktop>systemkexts folder to /Library/Extensions.

6. Rebuild kernel cache.

Code:
sudo kextcache -i /
___________________________________________________________________________________________________________________________________

7a) Patching DSDT

- Turn on your laptop and press f12 boot the Clover bootloader.

- Highlight the OS X disk and press “F4” to generate the native ACPI files. (Note: You won’t see anything while pressing F4 - the files are generated silently)

- Boot OS X and mount EFI partition with Clover Configurator

- Go to “EFI/Clover/ACPI/” and copy the “origin” folder you just created to your desktop

- Delete all files from the folder on your desktop that doesn’t start with DSDT or SSDT

- Copy “mojavefiles/refs.txt” into this folder

- Open terminal and run this command to instal iasl (password will be prompted)

Code:
cd ~/Desktop/mojavefiles
sudo cp iasl /usr/bin

- Copy the code below into the terminal to disassemble those files into the form we can edit

Code:
cd ~/Desktop/origin
iasl -da -dl -fe refs.txt *.aml

--> This command will create “**DT.dsl” files in the origin folder
_________________________________________________________________________________________________________________________________

7b) DSDT Patching

- Place mojavefiles/MaciASL.app into your Applications folder

- Open DSDT.dsl (from your origin folder) in MaciASL

Note: Now we are going to edit this file and compile it back again to use it to load with your system later. It is really important that you don’t make mistake here. You can click on “Compile” to check if you extracted the DSL files correctly. Warnings don't matter but errors do. If you got an error here it means you disassembled the files wrong. Now there are many patches which we are going to apply. After each one you can click on “Compile” to check for errors.

- Search (cmd+f) for ‘HECI’ and replace all with ‘IMEI’

- Search for ‘HDAS’ and replace all with ‘HDEF’

- Click on Patch and apply the following patches. Apply then close one at a time in this order:

[syn] Rename _DSM methods to XDSM
[Audio] Audio Layout 3
[bat] Dell Inspiron 15-7xxx
[sys] Fix _WAK Arg0 v2 (may not be necessary after 10.12.2)
[sys] Fix Mutex with non-zero SyncLevel
[sys] HPET Fix
[sys] IRQ fix
[sys] RTC Fix
[sys] Skylake LPC
[sys] SMBUS Fix
[usb] USB3_PRW 0x6D Skylake

To make the headphone combo jack work properly we need to use the audio layout-id 13 instead of the Layout 3 from the patch we used earlier. Search for "layout" and change the 3 to 13.
__________________________________________________________________________________________________________________________________

8. Disable nvidia for better battery 
(NEEDED WITH CURRENT CONGIF.PLIST SETUP - IF YOU WANT TO SKIP THIS YOU NEED TO ENABLE INJECT INTEL IN IN CLOVER CONFIGURATOR TO GET THE PC TO BOOT WITHOUT THE USB)

Add these lines above the other External lines at the beginning:

Code:
External (_SB_.PCI0.PEG0.PEGP._PS3, MethodObj)
External (_SB_.PCI0.PEG0.PEGP._PS0, MethodObj)
External (_SB_.PCI0.PEG0.PEGP._OFF, MethodObj)
External (_SB_.PCI0.PEG0.PEGP._ON, MethodObj)
External (_SB_.PCI0.PEG0.PEGP.SGOF, MethodObj)
External (_SB_.PCI0.PEG0.PEGP.SGON, MethodObj)

Search for ‘_WAK’ and add these methods above Method (_WAK):

Code:
Method (M_ON, 0, NotSerialized)

    {
       If (CondRefOf (\_SB_.PCI0.PEG0.PEGP._ON))
       {
           \_SB_.PCI0.PEG0.PEGP._ON()
       }
       If (CondRefOf (\_SB_.PCI0.PEG0.PEGP._PS0))
       {
           \_SB_.PCI0.PEG0.PEGP._PS0()
       }
       If (CondRefOf (\_SB_.PCI0.PEG0.PEGP.SGON))
       {
           \_SB_.PCI0.PEG0.PEGP.SGON()
       }
    }
Code:
Method (M_OF, 0, NotSerialized)
    {
       If (CondRefOf (\_SB_.PCI0.PEG0.PEGP._OFF))
       {
           \_SB_.PCI0.PEG0.PEGP._OFF()
       }
       If (CondRefOf (\_SB_.PCI0.PEG0.PEGP._PS3))
       {
           \_SB_.PCI0.PEG0.PEGP._PS3()
       }
       If (CondRefOf (\_SB_.PCI0.PEG0.PEGP.SGOF))
       {
           \_SB_.PCI0.PEG0.PEGP.SGOF()
       }
    }

Add this line right after the opening bracket of Method (_WAK):
Code:
M_OF ()

Search for ‘_PTS’ and add this line right after the opening bracket of Method (_PTS):

Code:
M_ON ()

Search for the ’_INI’ where you find references of Linux and Windows. Add this line between Store (….) and If (…..(..)):

Code:
M_OF ()

//end of disabling nvidia

Click Compile and if you have any errors (warnings don’t matter) try again. If you get syntax error on external lines with "Warning: Unknown object", delete the lines. Save the file by choosing "save as": DSDT.aml in a new folder on desktop called “SSDTs” and file format: ACPI Machine Language Binary.

YOUR PATCHED FOLDER WILL LOOK LIKE THIS
DSDT.aml (patched)
SSDT-UIAC.aml (mojavefiles)
SSDT-PNLF.aml (mojavefiles)
SSDT_ALC256.aml (mojavefiles)

- Open Clover Configurator (or efimounter) and mount internal EFI. Open EFI/Clover/ACPI/patched/ and place all your *.aml files here

- Open the EFI/Clover/config.plist with Clover Configurator. Go to the section SMBIOS and click the arrows on right side. Choose the MacBook icon and select MacBook 11,1 in the dropdown menu. Shake a few times with the Week and Unit until you find a Serial that’s not valid (means it isn’t used yet by an official Mac).

Be sure that the names of the files in your EFI>CLOVER>ACPI>patched folder are correct in the Sorted Order part of Clover's config.plist.
_______________________________________________________________________________________________________________________________________

9. Reboot.

10. Choose Clover To Be Your Default Boot Option

- Turn of your laptop and enter BIOS settings (Press F2 on boot)

- Go to Boot section and choose “Add Boot Option” —> Choose your system disk —> Navigate to “EFI/Clover” —> Choose “CLOVERX64.efi” and name it “CLOVER”

Extra

To correct the Alt and Cmd keys just swap the option and cmd modifier keys in the keyboard section in System Preferences.


Sources: 
https://www.tonymacx86.com/threads/guide-dell-inspiron-15-7559-skylake.260876/

https://github.com/xukinser/dell-inspiron-7559-i5-mojave
(Used to get correct clover version which is CRUCIAL / v4920)
