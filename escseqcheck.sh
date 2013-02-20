#!/bin/bash
for i in {0..64};do
  num=`printf " %3d" $i`
  printf "\e[${i}m$num\e[m"
  if [ $(($i%10)) -eq 9 ];then
    echo
  fi
done
echo

### escape sequences
# \e == \033 :ASCII ESC
# \a == \007 :ASCII BEL
# \e\\ (ESC+backslash): string terminator (can be used instead of \a in below)
#
#
## xterm
# \e]0;{hoge}\a : Set icon name and window title
# \e]1;{hoge}\a : Set icon name
# \e]2;{hoge}\a : Set window title
#
## screen
# \ek{hoge}\a : Set screen's window title
# \eP\e]0;{hoge}\a\e\\ : send to external directly
#
## color/style changes
# \e[{color/style}m]
# place  | 16 colors | 256 colors
# fore   | \e[3[0-7]m  | \e[38;5;[0-255]m
# back   | \e[4[0-7]m  | \e[48;5;[0-255]m
#
## color change examples
# 16 colors ) bright red: \e[1;31mhoge\e[m
# 256 colors ) red: \e[38;5;001mhoge\e[m

### colors
## 256 numbers
#   0- 16-> system color:
#           {0- 7} = Dark   {black red green yellow blue magenta cyan white}
#           {8-15} = Bright {black red green yellow blue magenta cyan white}
#  16-231-> color cube (rgb): 16 + (red[0-5])*36+(green[0-5])*6+(brue[0-5]*1)
# 232-255-> gray scale      : 232 + [0-23]
#
## 256 numbers to hex:
# for 16-321: each color's [0-5]->[0x00,0x5F,0x87,0xAF,0xD7,0xFF]
#             -> #(red<<8)+(green<<8)+blue
# for gray scale: rgb have same number of below (232-255)
#   0x08 0x12 0x1C 0x26 0x30 0x3A 0x44 0x4E
#   0x58 0x62 0x6C 0x76 0x80 0x8A 0x94 0x9E
#   0xA8 0xB2 0xBC 0xC6 0xD0 0xDA 0xE4 0xEE

# #attribute
# 0 default rendition (implementation-defined), cancels the effect of any preceding occurrence of SGR in the data stream regardless of the setting of the GRAPHIC RENDITION COMBINATION MODE (GRCM)
# 1 bold or increased intensity
# 2 faint, decreased intensity or second colour
# 3 italicized
# 4 singly underlined
# 5 slowly blinking (less then 150 per minute)
# 6 rapidly blinking (150 per minute or more)
# 7 negative image
# 8 concealed characters
# 9 crossed-out (characters still legible but marked as to be deleted)
# 10 primary (default) font
# 11 first alternative font
# 12 second alternative font
# 13 third alternative font
# 14 fourth alternative font
# 15 fifth alternative font
# 16 sixth alternative font
# 17 seventh alternative font
# 18 eighth alternative font
# 19 ninth alternative font
# 20 Fraktur (Gothic)
# 21 doubly underlined
# 22 normal colour or normal intensity (neither bold nor faint)
# 23 not italicized, not fraktur
# 24 not underlined (neither singly nor doubly)
# 25 steady (not blinking)
# 26 (reserved for proportional spacing as specified in CCITT Recommendation T.61)
# 27 positive image
# 28 revealed characters
# 29 not crossed out
# 30 black display
# 31 red display
# 32 green display
# 33 yellow display
# 34 blue display
# 35 magenta display
# 36 cyan display
# 37 white display
# 38 (reserved for future standardization; intended for setting character foreground colour as specified in ISO 8613-6 [CCITT Recommendation T.416])
# 39 default display colour (implementation-defined)
# 40 black background
# 41 red background
# 42 green background
# 43 yellow background
# 44 blue background
# 45 magenta background
# 46 cyan background
# 47 white background
# 48 (reserved for future standardization; intended for setting character background colour as specified in ISO 8613-6 [CCITT Recommendation T.416])
# 49 default background colour (implementation-defined)
# 50 (reserved for cancelling the effect of the rendering aspect established by parameter value 26)
# 51 framed
# 52 encircled
# 53 overlined
# 54 not framed, not encircled
# 55 not overlined
# 56 (reserved for future standardization)
# 57 (reserved for future standardization)
# 58 (reserved for future standardization)
# 59 (reserved for future standardization)
# 60 ideogram underline or right side line
# 61 ideogram double underline or double line on the right side
# 62 ideogram overline or left side line
# 63 ideogram double overline or double line on the left side
# 64 ideogram stress marking
# 65 cancels the effect of the rendition aspects established by parameter values 60 to 64