function _init()
  map_x=-14
  map_spd=1
end

function _update()
  -- map_x -= map_spd
  -- if map_x < -127 then map_x=0 end
end

function _draw()

  cls(12)

  print(map_x)
  map(0,0,map_x,16,16)
  -- map(0,0,128+map_x,16,16,16)


  Player:draw()
  Player:move()

end
