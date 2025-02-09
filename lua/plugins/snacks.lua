return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type snacks.Config
    keys = {
        ---@diagnostic disable-next-line: undefined-global
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Current Buffer" },
        { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Get Notifications History"},
        -- { "<leader>ul", function() Snacks.toggle.line_number() end, desc = "Toggle Line Number"},
        -- { "<leader>ud", function() Snacks.toggle.diagnostics() end, desc = "Toggle Diagnostic"},
        -- { "<leader>ua", function() Snacks.toggle.animate() end, desc = "Toogle Animation"},

    },
    opts = {
        bigfile = { enabled = false },
        toggle = {enabled = true},
        dashboard = {
            preset = {

                header = [[
                ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
                ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
                ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
                ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
                ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
                ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
                ]],

                -- stylua: ignore
                ---@diagnostic disable-next-line: undefined-doc-name
                ---@type snacks.dashboard.Item[]
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
        indent = {
            enabled = true,
            indent = {
                -- char = "|"
            }
        },
        scope = {enabled = false},
        input = { enabled = false },
        picker = { enabled = false },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        words = { enabled = false },
        statuscolumn = { enabled = false },
    },
    config = function(_, opts)
        require("snacks").setup(opts)
        vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#403e41" })
        -- vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#727072" })

        ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
        local progress = vim.defaulttable()
        vim.api.nvim_create_autocmd("LspProgress", {
            ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
            callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
                if not client or type(value) ~= "table" then
                    return
                end
                local p = progress[client.id]

                for i = 1, #p + 1 do
                    if i == #p + 1 or p[i].token == ev.data.params.token then
                        p[i] = {
                            token = ev.data.params.token,
                            msg = ("[%3d%%] %s%s"):format(
                            value.kind == "end" and 100 or value.percentage or 100,
                            value.title or "",
                            value.message and (" **%s**"):format(value.message) or ""
                            ),
                            done = value.kind == "end",
                        }
                        break
                    end
                end

                local msg = {} ---@type string[]
                progress[client.id] = vim.tbl_filter(function(v)
                    return table.insert(msg, v.msg) or not v.done
                end, p)

                local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                vim.notify(table.concat(msg, "\n"), "info", {
                    id = "lsp_progress",
                    title = client.name,
                    opts = function(notif)
                        notif.icon = #progress[client.id] == 0 and " "
                        or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                    end,
                })
            end,
        })

    end,
}
