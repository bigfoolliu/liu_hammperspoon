-- 窗口位置调整
-- {frame.x, frame.y, window.w, window.h}
-- First two elements: we decide the position of frame
-- Last two elements: we decide the size of frame
--
-- hs.hotkey.bind({'alt', 'cmd'}, 'l', function() hs.window.focusedWindow():moveToUnit({0, 0, 0.5, 1}) end)


-- 自定义窗口大小管理器
-- local windowResizer = {}

-- cmd + alt + ctrl + h, 将当前窗口向左移动10个像素
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()  -- 当前活动的窗口
  local f = win:frame()  -- 窗口的frame

  f.x = f.x - 10  -- frame的横坐标左移10个像素
  win:setFrame(f)
end)


-- ctrl + alt + l,将当前平铺为左边窗口的一半
hs.hotkey.bind({"ctrl", "alt"}, "l", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()  -- 整个屏幕
  local max = screen:frame()  -- 整个屏幕的frame

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
--  hs.alert.show(f.x, f.y, f.w, f.h)
end)

-- ctrl + alt + r,将当前平铺为左边窗口的一半
hs.hotkey.bind({"ctrl", "alt"}, "r", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)


-- ctrl + alt + e,将当前平铺为左边窗口的12/16
hs.hotkey.bind({"ctrl", "alt"}, "e", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 16 * 12
  f.h = max.h
  win:setFrame(f)
--  hs.alert.show(f)
end)

-- ctrl + alt + u,将当前平铺为右边窗口的14/16
hs.hotkey.bind({"ctrl", "alt"}, "u", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 16 * 2)
  f.y = max.y
  f.w = max.w / 16 * 14
  f.h = max.h
  win:setFrame(f)
end)

-- ctrl + alt + a,将当前平铺为全屏
hs.hotkey.bind({"ctrl", "alt"}, "a", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)


-- ctrl + alt + c,将当前活动窗口移动到中间位置
hs.hotkey.bind({'ctrl', 'alt'}, 'c', function() 
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 16 * 0.5)
    f.y = max.y + (max.h / 16 * 0.5)
    f.w = max.w / 16 * 15
    f.h = max.h / 16 * 15
    win:setFrame(f)

end)

-- 全屏方式二
-- ctrl + alt + f
-- hs.hotkey.bind({'ctrl', 'alt'}, 'f', function() hs.window.focusedWindow():moveToUnit({0, 0, 1, 1}) end)

-- ctrl + alt + up,将当前活动窗口移动到上半窗口
hs.hotkey.bind({'ctrl', 'alt'}, 'up', function() hs.window.focusedWindow():moveToUnit({0, 0, 1, 0.5}) end)

-- ctrl + alt + down,将当前活动窗口移动到上半窗口
hs.hotkey.bind({'ctrl', 'alt'}, 'down', function() hs.window.focusedWindow():moveToUnit({0, 0.5, 1, 0.5}) end)

