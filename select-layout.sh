#!/bin/sh

# Note: This only works reliably on workspaces with more than one window,
# but if you only have one window, why would you want to change the layout

i3-msg 'mark --add _layout_focused'

while
    [ $? = 0 ]
do
    i3-msg 'focus parent'
done

i3-msg 'mark --add _layout_root'

i3-msg '[workspace="__focused__"] move window to mark _layout_root'

case "$1" in
    "main-horizontal")
        i3-msg 'layout splith ; splitv'

        i3-msg '[con_mark="_layout_focused"]
        move up ,
        resize set height 60 ppt ,
        focus ,
        unmark _layout_focused'
        ;;

    "main-vertical")
        i3-msg 'layout splitv ; splith'

        i3-msg '[con_mark="_layout_focused"]
        move left ,
        resize set width 60 ppt ,
        focus ,
        unmark _layout_focused'
        ;;

    "even-horizontal")
        i3-msg 'layout splitv'

        i3-msg '[con_mark="_layout_focused"]
        focus ,
        unmark _layout_focused'
        ;;

    "even-vertical")
        i3-msg 'layout splith'

        i3-msg '[con_mark="_layout_focused"]
        focus ,
        unmark _layout_focused'
        ;;
esac

i3-msg '[con_mark="_layout_root"] unmark _layout_root'
