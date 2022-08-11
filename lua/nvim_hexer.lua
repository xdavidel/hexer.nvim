local M = {}

-- [first] begin dump at 16 byte-aligned offset containing 'first' byte
-- [last] end dump at 16 byte-aligned offset containing 'last' byte
local hex_dump = function (buf,first,last)
    local str = "         "
    local function align(n) return math.ceil(n/16) * 16 end

    -- header
    for i= 1, 16 do
        -- str = str .. string.format('%02X ', i -1)
        str = str .. (i > #buf and '   ' or string.format(' %02X', i -1))
        if i %  8 == 0 then
            str = str .. ' '
        end
    end
    str = str .. '\n'

    for i=(align((first or 1)-16)+1),align(math.min(last or #buf,#buf)) do
        if (i-1) % 16 == 0 then
            str = str .. string.format('%08X  ', i-1)
        end
        str = str .. (i > #buf and '   ' or string.format('%02X ', buf:byte(i)))
        if i %  8 == 0 then
            str = str .. ' '
        end

        if i % 16 == 0 then
            str = str .. buf:sub(i-16+1, i):gsub('%c','.') .. '\n'
        end
    end

    return str
end

-- function string:split(sep)
--    local seperator, fields = sep or ":", {}
--    local pattern = string.format("([^%s]+)", seperator)
--    self:gsub(pattern, function(c) fields[#fields+1] = c end)
--    return fields
-- end

local split = function(str)
   local t = {}
   local helper = function(line)
      table.insert(t, line)
      return ""
   end
   helper((str:gsub("(.-)\r?\n", helper)))
   return t
end

M.hexdump = function()
    local source_buf = vim.api.nvim_get_current_buf()
    local data = vim.api.nvim_buf_get_lines(source_buf, 0, -1, false)
    local hex_data = hex_dump(table.concat(data, '\n'))
    local target_buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_option(target_buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_lines(target_buf, 0 , -1, false, split(hex_data))

    vim.api.nvim_win_set_buf(0, target_buf)
end

return M
