--
-- api参考: http://www.hammerspoon.org/docs/
--
-- 按住cmd + alt + ctrl + w键,就会展示 Hello World
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--   hs.alert.show("Hello World!")
-- end)

-- 按住cmd + alt + ctrl + w键,就会展示 Hello World, ,此时以通知的方式告知
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)


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

-- cmd + ctrl + alt + r, 全局配置重新加载
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "r", function()
  hs.reload()
end)
hs.alert.show("Config loaded")


-- cmd + alt + ctrl + v,破坏密码粘贴限制
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

