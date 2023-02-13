--[[
Copyright By bbs.binx6.cc ©™
(This Commit Author)
Licensed under the Apache License, Version 2.0 (the "License") with MIT;
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--]]

-- gfind is implemented by rewriting functions.
function string.gfind(str, pattern, init)
  local i = init or 1
  local n = 0
  return function ()
    if i <= str:len() then
      n = n + 1
      local s, e = str:find(pattern, i)
      if s == nil then
        return nil
      end
      i = e + 1
      return n, str:sub(s, e)
    else
      return nil
    end
  end
end

-- The idea of gsub implementation, rewrite function optimization.
function string.gsub(str, pattern, repl) 
    local pos = 0  
    local len = #str
    local s = "" 
 
    if (len == 0) then return s end
    while true do
        local np, ep = string.find(str, pattern, pos+1)
        if (not np) then break end
        s = s .. string.sub(str, pos+1, np-1) .. repl
        pos = ep
    end
 
    s = s .. string.sub(str, pos+1)
    return s
end