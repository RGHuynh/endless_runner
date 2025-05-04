Player = {

  position = {
    x = 0,
    y = 56
  },

  cm = true,
  sprite = 81,

  draw = function(self)
    spr(self.sprite, self.position.x, self.position.y)
  end,

  move = function(self)

    local current_x = self.position.x 
    local current_y = self.position.y

    if btn(0) then self.position.x -= 1 end
    if btn(1) then self.position.x += 1 end
    if btn(2) then self.position.y -= 1 end
    if btn(3) then self.position.y += 1 end
    
    local is_true = cmap(self)
    print(is_true)
    rect(self.position.x +6, self.position.y +7, self.position.x, self.position.y, 2)
  end,

 
}

function cmap(o)
  local ct=false
  local cb=false

  -- if colliding with map tiles
  if(o.cm) then
    local x1=o.position.x/8
    local y1=o.position.y/8
    local x2=(o.position.x+7)/8
    local y2=(o.position.y+7)/8
    local a=fget(mget(x1,y1),0)
    local b=fget(mget(x1,y2),0)
    local c=fget(mget(x2,y2),0)
    local d=fget(mget(x2,y1),0)
    ct=a or b or c or d
   end
   -- if colliding world bounds
   if(o.cw) then
     cb=(o.x<0 or o.x+8>w or
	       o.y<0 or o.y+8>h)
   end

  return ct or cb
  
end