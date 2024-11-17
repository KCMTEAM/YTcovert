function run_command(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end
local BLACK = "\27[0;30m"
local RED = "\27[0;31m"
local GREEN = "\27[0;32m"
local YELLOW = "\27[0;33m"
local BLUE = "\27[0;34m"
local MAGENTA = "\27[0;35m"
local CYAN = "\27[0;36m"
local WHITE = "\27[0;37m"
local RESET = "\27[0m"
local BANNER = table.concat {(BLUE ..
    "██╗░░░██╗████████╗███╗░░░███╗██████╗░██████╗░\n" ..
    "╚██╗░██╔╝╚══██╔══╝████╗░████║██╔══██╗╚════██╗\n" ..
    "░╚████╔╝░░░░██║░░░██╔████╔██║██████╔╝░█████╔╝\n" ..
    "░░╚██╔╝░░░░░██║░░░██║╚██╔╝██║██╔═══╝░░╚═══██╗\n" ..
    "░░░██║░░░░░░██║░░░██║░╚═╝░██║██║░░░░░██████╔╝\n" ..
    "░░░╚═╝░░░░░░╚═╝░░░╚═╝░░░░░╚═╝╚═╝░░░░░╚═════╝░\n" ..
    "                           [ HAIFIL ]\n" )}
function startCovert()
  os.execute("clear")
  print(BANNER)
  io.write(YELLOW .. "INPUT LINK HERE TO COVERT" .. WHITE .. ":" .. GREEN)
  local youtube_links = io.read()
  print("")
  print(GREEN .. "COVERTING......" .. RESET)
  local url = youtube_links
  local command = 'yt-dlp -x --audio-format mp3 ' .. url
  local result = run_command(command)
  print(result)
  print("")
  print(YELLOW .. "Download successfully" .. GREEN .. "✓")
  os.execute("termux-setup-storage")
  os.execute("cd")
  os.execute("mkdir -p ~/storage/external-1/YTcovert")
  os.execute("find ~/YTcovert -type f ! -name 'covert.lua' -exec mv {} ~/storage/external-1/YTcovert \;")
end 
startCovert()