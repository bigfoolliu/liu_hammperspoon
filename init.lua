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


-- 可以提供一些帮助信息等
help_message = [[
1.Hello World, ctrl + cmd + alt + h;
2.重置配置, cmd + alt + ctrl + r;
3.破坏密码粘贴限制, cmd + alt + ctrl + v;
4.打开或者关闭caffie, ctrl + cmd + alt + I/O;
5.展示桌面小时钟, ctrl + cmd + alt + t;
6.定位当前活动窗口, ctrl + alt + e/a/c/l/r;
7.定位当前鼠标位置, ctrl + cmd + alt + d;
]]
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "h", function()
  hs.notify.new({title="Hammerspoon", informativeText=help_message}):send()
end)
hs.alert.show(help_message)

-- cmd + ctrl + alt + r, 全局配置重新加载
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "r", function()
  hs.reload()
end)
hs.alert.show("hammperspoon config reloaded!")


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
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 't', function() spoon.AClock:toggleShow() end)

