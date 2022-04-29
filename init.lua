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

