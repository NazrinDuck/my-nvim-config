local status, notify = pcall(require, "notify")
local plugin = "Welcome Plugin"

if not status then
	return
end

--[[
notify("Welcome to Mousetduck's neovim!", "info", {
  title = plugin
})
notify("This is an error message.\nSomething went wrong!", "error", {
  title = plugin,
  on_open = function()
    vim.notify("Attempting recovery.", vim.log.levels.WARN, {
      title = plugin,
    })
    local timer = vim.loop.new_timer()
    timer:start(2000, 0, function()
      notify({ "Fixing problem.", "Please wait..." }, "info", {
        title = plugin,
        timeout = 3000,
        on_close = function()
          notify("Problem solved", nil, { title = plugin })
          notify("Error code 0x0395AF", 1, { title = plugin })
        end,
      })
    end)
  end,
})
--]]
