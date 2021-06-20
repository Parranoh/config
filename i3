# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
#font pango:monospace 8

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
font pango:MesloLGS NF 9

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork &

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet &

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status &
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status &
bindsym Shift+XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +1% && $refresh_i3status &
bindsym Shift+XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -1% && $refresh_i3status &
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status &
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status &

# media player controls
bindsym XF86AudioPlay exec playerctl play-pause &
bindsym Shift+XF86AudioPlay exec playerctl -a pause &
bindsym XF86AudioNext exec playerctl next &
bindsym XF86AudioPrev exec playerctl previous &

# other extra keys
bindsym XF86Explorer exec nautilus &
bindsym XF86Mail exec evolution &
bindsym XF86HomePage exec firefox &

# function keys to adjust display brightness
bindsym XF86MonBrightnessUp exec brightness 5 && $refresh_i3status &
bindsym Control+XF86MonBrightnessUp exec brightness 50 && $refresh_i3status &
bindsym XF86MonBrightnessDown exec brightness -5 && $refresh_i3status &
bindsym Control+XF86MonBrightnessDown exec brightness -50 && $refresh_i3status &

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal &

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+Shift+d exec dmenu_run &
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
bindsym $mod+d exec j4-dmenu-desktop &

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# move focused workspace
bindsym $mod+Control+Shift+h move workspace to output left
bindsym $mod+Control+Shift+j move workspace to output down
bindsym $mod+Control+Shift+k move workspace to output up
bindsym $mod+Control+Shift+l move workspace to output right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right
bindsym $mod+Control+Shift+Left move workspace to output left
bindsym $mod+Control+Shift+Down move workspace to output down
bindsym $mod+Control+Shift+Up move workspace to output up
bindsym $mod+Control+Shift+Right move workspace to output right

# split in horizontal orientation
bindsym $mod+v split h

# split in vertical orientation
bindsym $mod+s split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+q layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+u focus parent

# focus the child container
bindsym $mod+n focus child

# select layouts
bindsym $mod+F1 exec --no-startup-id select-layout.sh even-vertical &
bindsym $mod+F2 exec --no-startup-id select-layout.sh even-horizontal &
bindsym $mod+F3 exec --no-startup-id select-layout.sh main-horizontal &
bindsym $mod+F4 exec --no-startup-id select-layout.sh main-vertical &
bindsym $mod+Shift+equal exec --no-startup-id select-layout.sh main-horizontal &
bindsym $mod+equal exec --no-startup-id select-layout.sh main-vertical &

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10
bindsym $mod+Mod2+KP_1 workspace number $ws1
bindsym $mod+Mod2+KP_2 workspace number $ws2
bindsym $mod+Mod2+KP_3 workspace number $ws3
bindsym $mod+Mod2+KP_4 workspace number $ws4
bindsym $mod+Mod2+KP_5 workspace number $ws5
bindsym $mod+Mod2+KP_6 workspace number $ws6
bindsym $mod+Mod2+KP_7 workspace number $ws7
bindsym $mod+Mod2+KP_8 workspace number $ws8
bindsym $mod+Mod2+KP_9 workspace number $ws9
bindsym $mod+Mod2+KP_0 workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10
bindsym $mod+Mod2+Shift+KP_End move container to workspace number $ws1
bindsym $mod+Mod2+Shift+KP_Down move container to workspace number $ws2
bindsym $mod+Mod2+Shift+KP_Next move container to workspace number $ws3
bindsym $mod+Mod2+Shift+KP_Left move container to workspace number $ws4
bindsym $mod+Mod2+Shift+KP_Begin move container to workspace number $ws5
bindsym $mod+Mod2+Shift+KP_Right move container to workspace number $ws6
bindsym $mod+Mod2+Shift+KP_Home move container to workspace number $ws7
bindsym $mod+Mod2+Shift+KP_Up move container to workspace number $ws8
bindsym $mod+Mod2+Shift+KP_Prior move container to workspace number $ws9
bindsym $mod+Mod2+Shift+KP_Insert move container to workspace number $ws10

# assign applications to workspaces
assign [class="^Evolution$"] → $ws2
assign [class="^Firefox$"] → $ws3
assign [class="^discord$"] → $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit' &"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym h resize shrink width 10 px or 1 ppt
        bindsym j resize grow height 10 px or 1 ppt
        bindsym k resize shrink height 10 px or 1 ppt
        bindsym l resize grow width 10 px or 1 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 1 ppt
        bindsym Down resize grow height 10 px or 1 ppt
        bindsym Up resize shrink height 10 px or 1 ppt
        bindsym Right resize grow width 10 px or 1 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

set $hardy /usr/share/backgrounds/hardy_wallpaper_uhd.png
set $system_mode System: (l)ock, (e)xit, (s)uspend, (h)ibernate, (r)eboot, (p)oweroff
mode "$system_mode" {
    bindsym l mode "default", exec --no-startup-id "{ xset +dpms ; i3lock -fenti $hardy ; xset -dpms ; } &"
    bindsym e mode "default", exit
    bindsym s mode "default", exec --no-startup-id "{ i3lock -feti $hardy && systemctl suspend ; } &"
    bindsym h mode "default", exec --no-startup-id "{ i3lock -feti $hardy && systemctl hibernate ; } &"
    bindsym r mode "default", exec --no-startup-id "systemctl reboot"
    bindsym p mode "default", exec --no-startup-id "systemctl poweroff"

    bindsym Return mode "default"
    bindsym Escape mode "default"
    bindsym $mod+x mode "default"
}
bindsym $mod+x mode "$system_mode"

# colors
#class                  border  backgr. text    indicator child_border
client.focused          #222222 #000000 #ffffff #aaaaaa   #202020
client.focused_inactive #333333 #444444 #ffffff #484e50   #5f676a
client.unfocused        #333333 #222222 #888888 #292d2e   #222222
client.urgent           #2f343a #900000 #ffffff #900000   #900000
client.placeholder      #000000 #0c0c0c #ffffff #000000   #0c0c0c
client.background       #000000

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command exec i3status
        tray_output primary
        colors {
                background #000000
                statusline #ffffff
                separator  #666666

                #class             border  background text
                focused_workspace  #222222 #000000    #ffffff
                active_workspace   #333333 #aaaaaa    #ffffff
                inactive_workspace #333333 #222222    #888888
                urgent_workspace   #2f343a #900000    #ffffff
                binding_mode       #2f343a #900000    #ffffff
        }
}

exec --no-startup-id i3-msg "workspace number $ws1 ; exec i3-sensible-terminal &" &
exec --no-startup-id i3-msg "workspace number $ws9 ; exec i3-sensible-terminal ncspot &" &
exec ~/.bash_scripts/discord-keep-alive.sh &

exec --no-startup-id "xrandr --output DP-5 --primary --mode 1920x1080 --output HDMI-0 --mode 1920x1080 --right-of DP-5 --output DVI-D-0 --mode 1920x1080 --left-of DP-5"
workspace $ws1 output DP-5
workspace $ws9 output DVI-D-0
workspace $ws10 output DVI-D-0
