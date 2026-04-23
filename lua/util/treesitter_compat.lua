-- Neovim 0.11+ changed query matches from TSNode to TSNode[]. The archived
-- nvim-treesitter master branch never migrated `set-lang-from-info-string!`
-- and `downcase!`, so `vim.treesitter.get_node_text` receives a plain table
-- and crashes in `get_range`. Re-register both with array-aware unwrapping.

local query = require("vim.treesitter.query")
local opts = { force = true, all = false }

local non_filetype_aliases = {
  ex = "elixir",
  pl = "perl",
  sh = "bash",
  uxn = "uxntal",
  ts = "typescript",
}

local function parser_from_info_string(alias)
  local match = vim.filetype.match({ filename = "a." .. alias })
  return match or non_filetype_aliases[alias] or alias
end

local function first_node(value)
  if type(value) == "table" then
    return value[1]
  end
  return value
end

query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
  local node = first_node(match[pred[2]])
  if not node then
    return
  end
  local alias = vim.treesitter.get_node_text(node, bufnr):lower()
  metadata["injection.language"] = parser_from_info_string(alias)
end, opts)

query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
  local id = pred[2]
  local node = first_node(match[id])
  if not node then
    return
  end
  local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ""
  if not metadata[id] then
    metadata[id] = {}
  end
  metadata[id].text = string.lower(text)
end, opts)
