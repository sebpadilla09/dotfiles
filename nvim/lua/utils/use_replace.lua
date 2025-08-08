local M = {}

function M.replace_use_blocks()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local new_lines = {}
  local inside_use = false
  local use_block = {}

  for _, line in ipairs(lines) do
    if not inside_use then
      if line:match("^%s*use%s*%(%s*$") or line:match("^%s*use%s*%(") then
        inside_use = true
        use_block = {}  -- reinicia el bloque
        local after_use = line:match("use%s*%((.*)")
        if after_use and after_use ~= "" then
          table.insert(use_block, after_use)
        end
      else
        table.insert(new_lines, line)
      end
    else
      table.insert(use_block, line)
      if line:find("%)%s*$") then
        inside_use = false
        -- Limpiar el cierre ")"
        local last_line = use_block[#use_block]
        use_block[#use_block] = last_line:gsub("%)%s*$", "")
        -- Limpiar apertura "(" si quedó
        local first_line = use_block[1]
        use_block[1] = first_line:gsub("^%s*%(", "")
        -- Añadir el bloque limpio al resultado
        for _, l in ipairs(use_block) do
          table.insert(new_lines, l)
        end
        use_block = {}
      end
    end
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
end

return M

