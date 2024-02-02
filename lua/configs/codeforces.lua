local status, codeforce = pcall(require, "codeforces-nvim")

if not status then
  return
end

codeforce.setup({
  notify_nvim = true, -- If you have rcarriga/nvim-notify
  term_toggle = true, -- If you have
  -- The other configuration options will be set to their defaults.
  -- For more, check lua/codeforces-nvim/setup.lua
  -- @ means ~/codeforces/contests/solutions/{contest_num}/{problem_name}
  -- So for cpp, for example, if you want to produce .out, you should put @.out instead of @. See examples:
  compile = {
    your_lang = { "compile", "@.lang", "@.exe" },
    cpp = { "g++", "@.cpp", "-o", "@.out" },
    py = {},
  },
  -- @ means the same while # means the test case. In bash, you can give file as an input using '<'. So you should write your run command and add '<', '#'. See examples:
  run = {
    your_lang = { "run", "@.exe", "<", "#" },
    cpp = { "@.out", "<", "#" },
    py = { "python3", "@.py", "<", "#" },
  },
})

