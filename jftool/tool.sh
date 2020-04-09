#!/bin/bash
echo "   __       _ _        __ _                       "
echo "   \ \  ___| | |_   _ / _(_)_ __                  "
echo "    \ \/ _ \ | | | | | |_| | '_ \                 "
echo " /\_/ /  __/ | | |_| |  _| | | | |                "
echo " \___/ \___|_|_|\__, |_| |_|_| |_|                "
echo "                |___/                             "
echo "   ___          _                  _              "
echo "  / __\   _ ___| |_ ___  _ __ ___ (_)_______ ____ "
echo " / / | | | / __| __/ _ \|  _   _ \| |_  / _ \  __|"
echo "/ /__| |_| \__ \ || (_) | | | | | | |/ /  __/ |   "
echo "\____/\__,_|___/\__\___/|_| |_| |_|_/___\___|_|   "
echo ""
echo "Jellyfin Customizer v0.2"
echo ""
echo "Note: THIS IS FOR 1.4.X and 1.5.x"
echo "Tested and working on debian installs (i.e. Raspbian)"
echo ""
echo "Written By: u/HeroinPigeon"
echo ""
echo "Thanks to the Jellyfin Devs and community at r/Jellyfin"
echo ""
echo "This tool is not to take away devs work but simply to"
echo "Make the user have more control over the look of their setup"
echo "I cannot stress how much the devs do for us all."
echo ""
echo "============================================================"
echo ""
PS3='Please enter your choice: '
options=("Add Custom Link" "Change Page Title" "Change Icons" "Add icon to sidebar" "Remove icon from sidebar" "Read Me" "Remove Sidebar Link" "Add logo above login" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Add Custom Link")
	  echo ""
	  echo "All links should be added in reverse order (bottom to top)"
	  echo "if you wish them to be ordered," 
	  echo "you can change this manually if needed"
	  echo ""
	  echo "URL: (e.g. https://mydomain.com)"
	  read customlink
	  echo "custom link icon url:e.g (http://yourjellyfin.address/web/iconfilename.png)"
	  read customlinkicon
	  echo "Link name? (e.g. Request TV Shows and Movies)"
	  read customlinkname
	  customlinkpt1="html += "
	  customlinkpt2="'<a is="
	  customlinkpt3='"emby-linkbutton" class="navMenuOption lnkMediaFolder" href="'
	  customlinkpt4="${customlink}"
	  customlinkpt5='"><i class="md-icon navMenuOptionIcon"><img src="'
	  customlinkpt6="${customlinkicon}"
	  customlinkpt7='"></i><span class="navMenuOptionText">'
	  customlinkpt8="' + globalize.translate("
	  customlinkpt8b='"'
	  customlinkpt9=${customlinkname}
	  customlinkpt10='") + "</span></a>";'
	  customlink2=${customlinkpt1}${customlinkpt2}${customlinkpt3}${customlinkpt4}${customlinkpt5}${customlinkpt6}${customlinkpt7}${customlinkpt8}${customlinkpt8b}${customlinkpt9}${customlinkpt10}
	  customlink4="\ \ \ \ \ \ \ \ ${customlink2}"
	  sudo sed -i "/libraries are added here/i \
	  ${customlink4}" /usr/lib/jellyfin/bin/jellyfin-web/scripts/librarymenu.js
	  ;;
	"Change Page Title")
	  echo "what is the current name of your server"
	  echo "(this appears in the top of your browser window as a page title)"
	  echo "this is case-sensitive (Default 'Jellyfin')"
	  read currenttitle
	  echo "What do you want to call your server?"
	  read newtitle
	  echo "One Moment Please"
	  sudo sed -i -e "s/$currenttitle/$newtitle/g" /usr/lib/jellyfin/bin/jellyfin-web/scripts/librarymenu.js
	  sudo sed -i -e "s/$currenttitle/$newtitle/g" /usr/lib/jellyfin/bin/jellyfin-web/manifest.json
	  sudo sed -i -e "s/$currenttitle/$newtitle/g" /usr/lib/jellyfin/bin/jellyfin-web/index.html
	  ;;
	"Change Icons")
	  echo "favicon.png"
	  sudo cp ./images/favicon.png /usr/lib/jellyfin/bin/jellyfin-web/
	  sudo cp ./images/favicon.png /usr/lib/jellyfin/bin/jellyfin-web/components/themes/
	  sudo cp ./images/favicon.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/icon-transparent.png
	  echo "favicon180.png"
	  sudo cp ./images/favicon180.png /usr/lib/jellyfin/bin/jellyfin-web/
	  sudo cp ./images/favicon180.png /usr/lib/jellyfin/bin/jellyfin-web/components/themes/
	  sudo cp ./images/favicon180.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/
	  echo "logodark.png"
	  sudo cp ./images/logodark.png /usr/lib/jellyfin/bin/jellyfin-web/
	  sudo cp ./images/logodark.png /usr/lib/jellyfin/bin/jellyfin-web/components/themes/
	  sudo cp ./images/logodark.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/banner-dark.png
	  sudo cp ./images/logodark.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/icon-transparent.png
	  sudo cp ./images/logodark.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/touchicon.png
	  sudo cp ./images/logodark.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/touchicon.png
	  sudo cp ./images/logodark.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/touchicon72.png
	  sudo cp ./images/logodark.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/touchicon114.png
	  sudo cp ./images/logodark.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/touchicon144.png
	  sudo cp ./images/logodark.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/touchicon512.png
	  echo "logowhite.png"
	  sudo cp ./images/logowhite.png /usr/lib/jellyfin/bin/jellyfin-web/components/themes/
	  sudo cp ./images/logowhite.png /usr/lib/jellyfin/bin/jellyfin-web/
	  sudo cp ./images/logowhite.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/banner-light.png
	  echo "touchicon.png"
	  sudo cp ./images/touchicon.png /usr/lib/jellyfin/bin/jellyfin-web/components/themes/
	  sudo cp ./images/touchicon.png /usr/lib/jellyfin/bin/jellyfin-web/
	  sudo cp ./images/touchicon.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/
	  echo "touchicon72.png"
	  sudo cp ./images/touchicon72.png /usr/lib/jellyfin/bin/jellyfin-web/components/themes/
	  sudo cp ./images/touchicon72.png /usr/lib/jellyfin/bin/jellyfin-web/
	  sudo cp ./images/touchicon72.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/
	  echo "touchicon114.png"
	  sudo cp ./images/touchicon114.png /usr/lib/jellyfin/bin/jellyfin-web/components/themes/
	  sudo cp ./images/touchicon114.png /usr/lib/jellyfin/bin/jellyfin-web/
	  sudo cp ./images/touchicon114.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/
	  echo "touchicon144.png"
	  sudo cp ./images/touchicon144.png /usr/lib/jellyfin/bin/jellyfin-web/components/themes/
	  sudo cp ./images/touchicon144.png /usr/lib/jellyfin/bin/jellyfin-web/
	  sudo cp ./images/touchicon144.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/
	  echo "touchicons512"
	  sudo cp ./images/touchicon512.png /usr/lib/jellyfin/bin/jellyfin-web/components/themes/
	  sudo cp ./images/touchicon512.png /usr/lib/jellyfin/bin/jellyfin-web/
	  sudo cp ./images/touchicon512.png /usr/lib/jellyfin/bin/jellyfin-web/assets/img/
	  echo "favicon.ico"
	  sudo cp ./images/favicon.ico /usr/lib/jellyfin/bin/jellyfin-web/components/themes/
	  sudo cp ./images/favicon.ico /usr/lib/jellyfin/bin/jellyfin-web/
  	  sudo cp ./images/favicon.ico /usr/lib/jellyfin/bin/jellyfin-web/assets/img/
	  ;;
	"Add icon to sidebar")
	  sidebarlogo="\ \ \ \ \ \ \ \ html += '<img src="
	  sidebarlogo2='"/web/logowhite.png" width=250px style="padding: 5px;display:block; margin-left: auto; margin-right: auto;"'
          sidebarlogo3=">';"
	  sidebarlogo4=${sidebarlogo}${sidebarlogo2}${sidebarlogo3}
	  echo "Now adding the code to make your logowhite.png a logo at the top of your sidebar"
          sudo sed -i "/ButtonHome/i \
          ${sidebarlogo4}" /usr/lib/jellyfin/bin/jellyfin-web/scripts/librarymenu.js
	  ;;
	"Remove icon from sidebar")
          sudo sed -i "/logowhite.png/d" /usr/lib/jellyfin/bin/jellyfin-web/scripts/librarymenu.js
	  ;;
	"Read Me")
	  echo "Welcome, Glad you decided to read this, not many will"
	  echo ""
	  echo "Image Replacement:"
          echo "Please open the folder 'images' and replace them with images of the same size that you want to replace the current with."
	  echo "The errors that pop up on this is normal basically it has them because it works on both 10.5.x and 10.4.x"
	  echo ""
	  echo "Custom Links:"
	  echo "This is quite simple but you can add a custom link for custom items like ombi etc in the side bar"
	  echo "You can upload an icon 20x20 px to /usr/lib/jellyfin/bin/jellyfin-web/iconname.png"
	  echo "and call it by simply putting /web/iconname.png instead of full url"
	  echo ""
	  echo "Adding icon to sidebar:"
	  echo "This gives you a custom icon in the left side bar this puts the icon from logowhite.png there after the custom image install has completed"
	  echo ""
	  echo "Changing the title:"
	  echo "The title can be changed to anything you want aslong as it does not contain special chars or punctuation"
	  echo "The default is 'Jellyfin' however you can also use this tool to change it from what ever you changed it to, to something else again by adding you current title to the string instead of Jellyfin"
	  echo ""
	  echo "Removing Sidebar Link"
	  echo "To remove the link you can put in the domain that is linked to like myspace.com, note this has a drawback and does not let you put any slashes in the sidebar removal tool"
	  echo "Note: you can always remove them manually by finding the link in the /usr/lib/jellyfin/bin/jellyfin-web/scripts/librarymenu.js"
	  echo ""
	  ;;
	"Remove Sidebar Link")
	  echo "Please Input the exact link address to remove without https:// or slashes (e.g. myspace.com)"
	  read removelink
          sudo sed -i "/${removelink}/d" /usr/lib/jellyfin/bin/jellyfin-web/scripts/librarymenu.js 
	  ;;
	"Add logo above login")
	  echo "adding the logo"
	  logowhite='<img src="/web/logowhite.png" width=400px style="padding: 5px;display:block; margin-left: auto; margin-right: auto;">'
          sudo sed -i "/manualLoginForm hide/i \
          <div class="Login-Logo">" /usr/lib/jellyfin/bin/jellyfin-web/login.html
          sudo sed -i "/Login-Logo/a \
          ${logowhite}" /usr/lib/jellyfin/bin/jellyfin-web/login.html
	  sudo sed -i "/logowhite.png/a \
	  </div>" /usr/lib/jellyfin/bin/jellyfin-web/login.html
	  echo "done"
	  ;;
 	"Quit")
	  break
	  ;;
	*) echo "invalid option $REPLY";;
    esac
done