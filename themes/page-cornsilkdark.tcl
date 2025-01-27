#
# "cornsilk" dark theme.
# -------------------------------
# A semi-dark theme originally created for users of PAGE based on notsodark
# -------------------------------
# Inspired by the Clam, Alt and other themes.
# Written by G.D. Walters
# Copyright © 2023,2024 by G.D. Walters  <thedesignatedgeek@gmail.com>
#
#====================================================
# Version 0.2.6
# May 21, 2024
#====================================================
# Change log
#----------------------------------------------------
# 11/21/2023 - Initial creation
# 12/12/2023 - modified the TNotebook.tab style
# 02/28/2023 - Renamed to page-cornsilkdark
# 03/01/2024 - Added font styles to multiple widget classes
#                Tbutton - bold.TButton, italic.TButton, bolditalic.TButton
#                Toolbutton - bold.Toolbutton, italic.Toolbutton, bolditalic.Toolbutton
#                TCheckbutton - bold.TCheckbutton
#                TRadiobutton - bold.TRadiobutton
#                TNotebook - bold.TNotebook.Tab
#                TLabelframe - bold.TLabeframe.Label
#                TMenubutton - bold.TMenubutton, italic.TMenubutton, bolditalic.TMenubutton
#            - Modified TLabelframe labelmargins to {12 0 0 4} to provide a little
#                space before the text.
# 03/19/2024 - 0.2.4 - Support for TMenubutton.
# 05/21/2024 - 0.2.6 - Rolled version on all my theme files.
#----------------------------------------------------

package require Tk 8.6



namespace eval ttk::theme::page-cornsilkdark {
    variable version 0.2.6
    package provide ttk::theme::page-cornsilkdark $version
    variable colors
    array set colors {
        -disabledfg     gray54
        -frame          black
        -window         "#ffffff"
        -dark           black
        -darker         "#c3c3c3"
        -lighter        "#eeebe7"
        -lightcolor     snow
        -selectbackground   darkslategray1
        -selectforeground   "#000000"
        -alternate          "#aaaaaa"
        -disabledcolor  gray54
        -bgcolor        cornsilk4
        -fgcolor        black
        -activebgcolor  gray66
        -troughcolor    gray45
        -barcolor       royalblue3
        -fieldbgcolor   black
        -bordercolor    dimgray
        -tvwindow       #cdbd70
        -tvwindowdisabled  #cdaf95
        -texthighlight   darkslategray1
    }


    # Settings
    ttk::style theme create page-cornsilkdark -parent clam -settings {

        ttk::style configure "." \
            -background $colors(-bgcolor) \
            -foreground $colors(-fgcolor) \
            -bordercolor $colors(-frame) \
            -darkcolor $colors(-dark) \
            -lightcolor $colors(-lightcolor) \
            -troughcolor $colors(-troughcolor) \
            -focuscolor $colors(-selectbackground) \
            -selectbackground $colors(-selectbackground) \
            -selectforeground $colors(-selectforeground) \
            -activebgcolor  gray66 \
            -fieldbgcolor   gray39 \
            -barcolor $colors(-barcolor) \
            -selectborderwidth 0 \
            -borderwidth 2 \
            -font TkDefaultFont \
            ;

        ttk::style map "." \
            -background [list active $colors(-activebgcolor)] \
            -foreground [list disabled $colors(-disabledfg)] \
            -selectbackground [list  !focus $colors(-selectbackground)] \
            -selectforeground [list  !focus white] \
            -embossed [list disabled 1]
        ;



        proc load_images {imgdir} {
            variable I
            foreach file [glob -directory $imgdir *.png] {
                set img [file tail [file rootname $file]]
                set I($img) [image create photo -file $file -format png]
            }
        }

        # Load the images for TCheckbutton and TRadiobutton
        load_images [file join [file dirname [info script]] page-cornsilk]


        option add *TkFDialog*foreground black
        option add *TkChooseDir*foreground black

        try {
            font create boldFont -family TkDefaultFont -size 11 -weight bold -slant roman
            font create italicFont -family TkDefaultFont -size 11 -weight normal -slant italic
            font create boldItalicFont -family TkDefaultFont -size 11 -weight bold -slant italic
        } on error {msg} {
            # skip
            #puts {msg}
            #puts "Skipping font create"
            }


        # -selectbackground [list  !focus "#847d73"]
        # --------------------------------------------------
        # TButton
        ttk::style configure TButton \
            -anchor center -width -8 -padding "1 1" -relief raised \
            -shiftrelief 2 -highlightthickness 1 -highlightcolor $colors(-frame)

        ttk::style map TButton -relief {
            {pressed !disabled} sunken
            {active !disabled}  raised
            } -highlightcolor {alternate black}

        ttk::style map TButton \
                -background [list pressed $colors(-darker) \
                active $colors(-activebgcolor)] \
                -lightcolor [list pressed $colors(-darker)] \
                -darkcolor [list pressed $colors(-darker)] \
                -bordercolor [list alternate "#000000"] \
                ;

        ttk::style configure bold.TButton -font boldFont -padding "1 5 1 5"
        ttk::style configure italic.TButton -font italicFont -padding "1 5 1 5"
        ttk::style configure bolditalic.TButton -font boldItalicFont -padding "1 5 1 5"

        # --------------------------------------------------
        # Toolbutton (special style for TButton)
        # --------------------------------------------------
        ttk::style configure Toolbutton \
            -anchor center -padding {1 1} -relief flat \
            -shiftrelief 2 -highlightthickness 1 \
            -highlightcolor $colors(-frame)
        ttk::style map Toolbutton \
            -relief [list \
                disabled flat \
                selected sunken \
                pressed sunken \
                active raised] \
            -background [list \
                pressed $colors(-darker) \
                active $colors(-activebgcolor)] \
                -lightcolor [list pressed $colors(-darker)] \
                -darkcolor [list pressed $colors(-darker)] \
            ;

        ttk::style configure bold.Toolbutton -font boldFont
        ttk::style configure italic.Toolbutton -font italicFont
        ttk::style configure bolditalic.Toolbutton -font boldItalicFont

        # --------------------------------------------------
        # TCheckbutton
        # --------------------------------------------------
        ttk::style configure TCheckbutton \
            -indicatorbackground "#ffffff" \
            -indicatormargin {1 1 4 1} \
            -padding 2 ;

        ttk::style map TCheckbutton -indicatorbackground \
            [list  pressed $colors(-bgcolor) \
            {!disabled alternate} $colors(-alternate) \
            {disabled alternate} $colors(-darker)] \
            -background [list disabled $colors(-bgcolor) \
                active $colors(-bgcolor)] \
            -foreground [list active white disabled $colors(-disabledcolor)]

        # TCheckbutton will use the following images:
        # chk24x16.png, unchk24x16.png
        ttk::style element create Checkbutton.indicator image \
            [list $I(unchk24x16) \
                {alternate disabled} $I(unchk24x16) \
                {selected disabled} $I(unchk24x16) \
                disabled $I(unchk24x16) \
                {pressed alternate} $I(chk24x16) \
                {active alternate} $I(chk24x16) \
                alternate $I(unchk24x16) \
                {pressed selected} $I(chk24x16) \
                {active selected} $I(chk24x16) \
                selected $I(chk24x16) \
                {pressed !selected} $I(chk24x16) \
                active $I(unchk24x16) \
            ] -width 26 -sticky w

        ttk::style configure bold.TCheckbutton -font boldFont

        # --------------------------------------------------
        # TRadiobutton
        # --------------------------------------------------
        ttk::style configure TRadiobutton \
            -indicatorbackground "#ffffff" \
            -indicatormargin {1 1 4 1} \
            -padding 2 ;

        ttk::style map TRadiobutton -indicatorbackground \
            [list  pressed $colors(-bgcolor) \
            {!disabled alternate} $colors(-alternate) \
            {disabled alternate} $colors(-darker)] \
            -background [list disabled $colors(-bgcolor) \
                active $colors(-bgcolor)] \
            -foreground [list active white disabled $colors(-disabledcolor)]

        # TRadiobutton will use the following images:
        # RadioSelected24x16.png, RadioUnSelected24x16.png
        ttk::style element create Radiobutton.indicator image \
            [list $I(RadioUnSelected24x16) \
                {alternate disabled} $I(RadioUnSelected24x16) \
                {selected disabled} $I(RadioUnSelected24x16) \
                disabled $I(RadioUnSelected24x16) \
                {pressed alternate} $I(RadioSelected24x16) \
                {active alternate} $I(RadioSelected24x16) \
                alternate $I(RadioUnSelected24x16) \
                {pressed selected} $I(RadioSelected24x16) \
                {active selected} $I(RadioSelected24x16) \
                selected $I(RadioSelected24x16) \
                {pressed !selected} $I(RadioSelected24x16) \
                active $I(RadioUnSelected24x16) \
            ] -width 26 -sticky w

        ttk::style configure bold.TRadiobutton -font boldFont

        # --------------------------------------------------
        # TMenubutton  (for future compatibility)
        # --------------------------------------------------
        ttk::style configure TMenubutton \
            -width -11 -padding 5 -relief raised
        ttk::style map TButton \
                -background [list pressed $colors(-darker) \
                active $colors(-activebgcolor)] \
                -lightcolor [list pressed $colors(-darker)] \
                -darkcolor [list pressed $colors(-darker)] \
                -bordercolor [list alternate "#000000"] \
                ;

        ttk::style configure bold.TMenubutton -font boldFont -padding "1 5 1 5"
        ttk::style configure italic.TMenubutton -font italicFont -padding "1 5 1 5"
        ttk::style configure bolditalic.TMenubutton -font boldItalicFont -padding "1 5 1 5"

        # --------------------------------------------------
        # TEntry
        # --------------------------------------------------
        ttk::style configure TEntry -foreground black -relief sunken \
            -fieldbackground $colors(-tvwindow) -padding 1 -insertwidth 1
        ttk::style map TEntry \
            -background [list  readonly $colors(-frame)] \
            -foreground [list  readonly $colors(-dark) \
            !disabled black \
            disabled $colors(-fgcolor)] \
            -fieldbackground [list !disabled $colors(-tvwindow) \
            disabled $colors(-tvwindowdisabled)] \
            -selectbackground [list !disabled $colors(-texthighlight) \
            disabled $colors(-tvwindow)] \
            -selectforeground [list !disabled $colors(-dark)] \
            -bordercolor [list  focus $colors(-selectbackground)] \
            -lightcolor [list  focus "#6f9dc6"] \
            -darkcolor [list  focus "#6f9dc6"] \
            ;

        # --------------------------------------------------
        # TCombobox
        # --------------------------------------------------
        ttk::style configure TCombobox -padding 1
        ttk::style map TCombobox -fieldbackground \
            [list !disabled lightgoldenrod3 \
                readonly $colors(-frame) disabled $colors(-tvwindowdisabled)] \
            -selectforeground [list !disabled black disabled black]

        ttk::style configure ComboboxPopdownFrame \
            -relief solid -borderwidth 1


        ttk::style configure ComboboxPopdownFrame \
            -relief solid -borderwidth 1


        option add *TCombobox*Listbox.background lightgoldenrod3
        option add *TCombobox*Listbox.foreground black
        option add *TCombobox*Listbox.selectBackground $colors(-selectbackground)
        option add *TCombobox*Listbox.selectForeground $colors(-selectforeground)
        # option add *TCombobox*Listbox.selectForeground $colors(-selectforeground)
        # option add *TCombobox*Listbox.font font

        # --------------------------------------------------
        # TScrollbar
        # --------------------------------------------------
        ttk::style configure TScrollbar -relief raised
        ttk::style map TScrollbar -relief {{pressed !disabled} sunken}

        # --------------------------------------------------
        # TSpinbox
        # --------------------------------------------------
        ttk::style configure TSpinbox \
            -arrowsize 9 \
            -padding {2 0 10 0} \
            -background $colors(-tvwindow) \
            -foreground $colors(-dark) \
            -fieldbackground $colors(-tvwindow) \
            -fielddforeground $colors(-dark) \
            -selectbackground [list !disabled $colors(-texthighlight)] \
            -selectforeground [list !disabled $colors(-selectforeground)]
        ttk::style map TSpinbox \
            -background [list  readonly $colors(-frame) \
                disabled $colors(-tvwindowdisabled)] \
            -arrowcolor [list disabled $colors(-disabledfg)]



        # --------------------------------------------------
        # TNotebook
        # --------------------------------------------------
        ttk::style configure TNotebook.Tab -padding {6 2 6 2} -expand {0 0 2}
        ttk::style map TNotebook.Tab \
            -padding [list selected {6 4 6 2}] \
            -background [list selected $colors(-bgcolor) active honeydew1 \
            !active wheat4] \
            -foreground [list selected black active black !active black] \
            -lightcolor [list selected $colors(-lighter) ] \
            ;
        ttk::style configure Tab_ne.TNotebook -tabposition "ne"
        ttk::style configure Tab_nw.TNotebook -tabposition "nw"
        ttk::style configure Tab_n.TNotebook -tabposition "n"
        ttk::style configure Tab_en.TNotebook -tabposition "en"
        ttk::style configure Tab_e.TNotebook -tabposition "e"
        ttk::style configure Tab_es.TNotebook -tabposition "es"
        ttk::style configure Tab_sw.TNotebook -tabposition "sw"
        ttk::style configure Tab_s.TNotebook -tabposition "s"
        ttk::style configure Tab_se.TNotebook -tabposition "se"
        ttk::style configure Tab_wn.TNotebook -tabposition "wn"
        ttk::style configure Tab_w.TNotebook -tabposition "w"
        ttk::style configure Tab_ws.TNotebook -tabposition "ws"

        ttk::style configure bold.TNotebook.Tab -font boldFont

        # --------------------------------------------------
        # Treeview:
        # --------------------------------------------------
        ttk::style configure Heading \
            -font TkHeadingFont -relief raised -padding {3}
        ttk::style configure Treeview \
            -background $colors(-tvwindow) \
            -fieldbackground $colors(-tvwindow)
        ttk::style map Treeview \
            -background [list disabled $colors(-frame)\
                selected $colors(-selectbackground)] \
            -foreground [list disabled $colors(-disabledfg) \
                !disabled $colors(-dark) \
                selected $colors(-selectbackground)]

        # --------------------------------------------------
        # TFrame
        # --------------------------------------------------
        ttk::style configure TFrame \
            -background $colors(-bgcolor) -borderwidth 2 -relief groove
        ttk::style configure Flat.TFrame -relief flat -borderwidth 5
        ttk::style configure Sunken.TFrame -relief sunken -borderwidth 5

        # --------------------------------------------------
        # TLabelframe
        # --------------------------------------------------
        ttk::style configure TLabelframe \
            -background $colors(-bgcolor) -bordercolor $colors(-frame) \
            -labeloutside false -labelmargins {12 0 0 4} -padding {5 0} \
            -borderwidth 3 -relief groove
        ttk::style configure TLabelframe.Label \
            -background $colors(-bgcolor)\
            -foreground $colors(-fgcolor) -padding {12 6}

        ttk::style configure bold.TLabelframe.Label -font boldFont

        # --------------------------------------------------
        # TProgressbar
        # --------------------------------------------------
        ttk::style configure TProgressbar -background skyblue2


        # --------------------------------------------------
        # TScale
        # --------------------------------------------------
        ttk::style configure TScale -sliderrelief raised
        ttk::style map TScale -sliderrelief {{pressed !disabled} sunken}

        # --------------------------------------------------
        # TPanedwindow
        # --------------------------------------------------
        ttk::style configure TPanedwindow -background $colors(-bgcolor)
        ttk::style configure Sash -background $colors(-bgcolor) \
            -bordercolor $colors(-bordercolor) -sashthickness 8 -gripcount 10
            }
    }
    ## END OF THEME FILE
