-- 应用的事件响应等
--
-- cmd + alt + shift + d,高亮鼠标,在鼠标的位置画圆
mouseCircle = nil
mouseCircleTimer = nil

-- 高亮鼠标位置
function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.absolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 3 seconds
    mouseCircleTimer = hs.timer.doAfter(3, function()
      mouseCircle:delete()
      mouseCircle = nil
    end)
end


-- usb事件反应
-- usbWatcher = nil
--
-- function usbDeviceCallback(data)
--     if (data["productName"] == "ScanSnap S1300i") then
--         if (data["eventType"] == "added") then
--             hs.application.launchOrFocus("ScanSnap Manager")
--         elseif (data["eventType"] == "removed") then
--             app = hs.appfinder.appFromName("ScanSnap Manager")
--             app:kill()
--         end
--     end
-- end
--
-- usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
-- usbWatcher:start()

