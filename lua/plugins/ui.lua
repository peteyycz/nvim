return {
        {
                "morhetz/gruvbox",
                lazy = false,
                priority = 1000,
                config = function()
                        vim.cmd([[colorscheme gruvbox]])
                end,
        },
        {
                "nvim-telescope/telescope.nvim",
                keys = {
                        {
                                "<C-p>",
                                require("telescope.builtin").find_files,
                                desc = "Find files",
                        },
                        {
                                "<leader>fs",
                                require("telescope.builtin").live_grep,
                                desc = "Search in project",
                        },
                        {
                                "<leader>fu",
                                require("telescope.builtin").lsp_references,
                                desc = "Find LSP References",
                        },
                },
                -- change some options
                opts = {
                        defaults = {
                                path_display = { "smart" },
                                layout_strategy = "horizontal",
                                layout_config = { prompt_position = "top" },
                                sorting_strategy = "ascending",
                                winblend = 0,
                                mappings = {
                                        i = {
                                                ["<C-u>"] = false,
                                        },
                                },
                        },
                },
        },


}
