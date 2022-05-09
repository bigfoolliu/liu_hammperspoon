--
-- api参考: http://www.hammerspoon.org/docs/
--
-- 按住cmd + alt + ctrl + w键,就会展示 Hello World
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--   hs.alert.show("Hello World!")
-- end)

require("config")
require("window")
require("applicationEvents")
require("clipboard")

hyper = {'cmd', 'alt'}
hyperShift = {'alt', 'cmd', 'shift'}

-- 按住cmd + alt + ctrl + w键,就会展示 Hello World, ,此时以通知的方式告知
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)


-- cmd + ctrl + alt + r, 全局配置重新加载
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "r", function()
  hs.reload()
end)
hs.alert.show("Config loaded")


-- cmd + alt + ctrl + v,破坏密码粘贴限制
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)


-- Caffeine设置,使用内置的模块
-- cmd + alt + ctrl + shift + I,启动防止休眠
-- cmd + alt + ctrl + shift + O(大写o)来允许休眠
-- hs.loadSpoon('Caffeine')
-- To prevent sleeping I press cmd+alt+ctrl+shift+I and to enable it I press cmd+alt+ctrl+shift+O. I chose I and O as they're the standard power management symbols.
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "I", function()
  hs.caffeinate.set("displayIdle", true, true)
  hs.caffeinate.set("systemIdle", true, true)
  hs.caffeinate.set("system", true, true)
  hs.alert.show("设置禁止休眠成功")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "O", function()
  hs.caffeinate.set("displayIdle", false, true)
  hs.caffeinate.set("systemIdle", false, true)
  hs.caffeinate.set("system", false, true)
  hs.alert.show("允许休眠成功")
end)

-- 屏幕小时钟展示, 使用 cmd + alt + t展示当前时间
hs.loadSpoon("AClock")
hs.hotkey.bind(hyper, 't', function() spoon.AClock:toggleShow() end)

