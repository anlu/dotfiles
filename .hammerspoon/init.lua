hs.hotkey.bind({"alt"}, "`", function()
  local app = hs.application.get("kitty")

  if app then
      if not app:mainWindow() then
          app:selectMenuItem({"kitty", "New OS window"})
      elseif app:isFrontmost() then
          app:hide()
      else
          app:activate()
      end
  else
      hs.application.launchOrFocus("kitty")
      app = hs.application.get("kitty")
  end

  app:mainWindow():moveToUnit({0,0,1,1})
  app:mainWindow().setShadows(false)
end)
