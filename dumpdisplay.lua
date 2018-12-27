id=0  -- 固定値
sda=1
scl=2
addr=0x3C

i2c.setup(id,sda,scl,i2c.SLOW)

for i=0,127 do
  i2c.start(id)
  resCode = i2c.address(id, i, i2c.TRANSMITTER)
  i2c.stop(id)
  if resCode == true then
	print("We have a device on address 0x" .. string.format("%02x", i) .. " (" .. i ..")")
  end
end

--disp = u8g2.sh1106_i2c_128x64_noname(id, 50)

disp = u8g2.sh1106_i2c_128x64_noname(id, addr)

disp:setFlipMode(1)
-- disp = u8g2.sdd1306_i2c_128x64_noname(id, addr)

disp:clearBuffer()
disp:setContrast(255)
disp:setFontMode(0)
disp:setDrawColor(1)
disp:setBitmapMode(0)

disp:drawBox(0, 0, 10, 10)
disp:sendBuffer()

-- https://github.com/olikraus/u8g2/wiki/fntlistall#6-pixel-height

disp:setFont(u8x8_font_artossans8_r)

disp:setFont(u8g2_font_ncenB14_tf);
disp:setFontDirection(0);

disp:setFont(u8g2_font_m2icon_5_tf)
disp:setFont(u8g2_font_6x10_tf)

disp:setFont(font_6x10_tf)

disp:clearBuffer()
disp:setFontMode(1)
disp:setDrawColor(1)
-- disp:setFont("u8g2_font_6x10_tf")


-- font
disp:clearBuffer()

-- OK
disp:setFontMode(0)
disp:setDrawColor(1)
-- disp:setDrawColor(0)  BAD ! Black background
disp:setFont(u8g2.font_6x10_tf)
disp:drawStr(0, 40, "ABCDEFGabcdefg0123456789")
disp:sendBuffer()

-- OK
disp:setFontMode(0)
disp:setDrawColor(1)
disp:setFont(u8g2.font_unifont_t_symbols)
disp:drawStr(0, 10, "AbcDefGhi0123456789")
disp:sendBuffer()

