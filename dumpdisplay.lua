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

disp:drawFrame(30,30, 50,50)


for i=0,2 do
	disp:setDrawColor(i)
	disp:drawBox(i * 8, 0, ((i*8) + 8), 64)
	disp:sendBuffer()
end
disp:setDrawColor(0)
disp:drawBox(20, 20,30,30)

-- disp:clearBuffer(disp)
-- disp:drawLine(disp, 10, 10,20,20)

