# nodemcu-lua-sh1106-example

ESP8266 NodeMCU and Lua SH1106 display
Display OLED using I2C.

## build settings

https://nodemcu-build.com/

### enabled modules

デフォルトのモジュールに加えて以下をチェック  
(default modules are not written below)

* I2C
* U8G2

### U8G options

* fonts - default ( font_6x10_tf,font_unifont_t_symbols )
* u8g2 display, I²C => sh1106_128x64_noname
