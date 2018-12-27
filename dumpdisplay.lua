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

disp:drawFrame(90, 40, 10, 20)
disp:drawBox(110, 40, 10, 20)

disp:drawFrame(0, 0, 128, 64)
disp:sendBuffer()

-- https://github.com/olikraus/u8g2/wiki/fntlistall#6-pixel-height

-- font
-- disp:clearBuffer()

-- OK
disp:setFontMode(0)
disp:setDrawColor(1)
-- disp:setDrawColor(0)  BAD ! Black background
disp:setFont(u8g2.font_6x10_tf)
disp:drawStr(2, 12, "ABCDEFGabcdefg0123456789")
disp:sendBuffer()

-- OK
disp:setFontMode(0)
disp:setDrawColor(1)
disp:setFont(u8g2.font_unifont_t_symbols)
disp:drawStr(2, 28, "ABCDEFGabcdefg0123456789")
disp:sendBuffer()

-- circle
disp:drawCircle(20, 40, 10, u8g2.DRAW_ALL)
disp:drawCircle(30, 50, 10, u8g2.DRAW_ALL)
disp:drawCircle(40, 40, 10, u8g2.DRAW_ALL)
disp:drawCircle(50, 50, 10, u8g2.DRAW_ALL)
disp:drawCircle(60, 40, 10, u8g2.DRAW_ALL)
disp:sendBuffer()
