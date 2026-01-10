local M = {}

M.on_save = function()
  local data = {}
  local tabs = vim.api.nvim_list_tabpages()
  for i, tabpage in ipairs(tabs) do
    local title = vim.fn.gettabvar(i, 'tab_title', '')
    if title ~= '' then
      data[i] = title
    end
  end
  return data
end

M.on_post_load = function(data)
  for i, name in pairs(data) do
    if i <= vim.fn.tabpagenr('$') then
      vim.fn.settabvar(i, 'tab_title', name)
    end
  end
  vim.cmd('redrawtabline')
end

return M
