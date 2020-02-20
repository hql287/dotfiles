hs.loadSpoon("MiroWindowsManager")
hs.window.animationDuration = 0.2
spoon.MiroWindowsManager:bindHotkeys({
  up         = {hyper, "k"},
  right      = {hyper, "l"},
  down       = {hyper, "j"},
  left       = {hyper, "h"},
  fullscreen = {hyper, "f"}
})
