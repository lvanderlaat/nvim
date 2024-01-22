-----------------------------------------------------------------------------------
-- Add and remove paths from the `find_files`
-----------------------------------------------------------------------------------

extra_search_paths = {}

function AddSearchPath(path)
    table.insert(extra_search_paths, path)
end

function RemoveSearchPath(path)
    for i, existingPath in ipairs(extra_search_paths) do
        if existingPath == path then
            table.remove(extra_search_paths, i)
            return
        end
    end
end

function CustomFindFiles()
    local cwd = vim.fn.getcwd()
    local search_dirs = {cwd}

    for _, path in ipairs(extra_search_paths) do
        table.insert(search_dirs, path)
    end

    require('telescope.builtin').find_files({search_dirs=search_dirs})
end

function CustomLiveGrep()
    local search_dirs = {}

    for _, path in ipairs(extra_search_paths) do
        table.insert(search_dirs, path)
    end

    require('telescope.builtin').live_grep({search_dirs = search_dirs})
end


local create_user_command = vim.api.nvim_create_user_command

create_user_command(
    'AddSearchPath',
    function(opts)
        AddSearchPath(opts.args)
    end,
    {nargs=1}
)

create_user_command(
    'RemoveSearchPath',
    function(opts)
        RemoveSearchPath(opts.args)
    end,
    {nargs=1}
)

create_user_command(
    'CustomFindFiles',
    CustomFindFiles,
    {}
)

create_user_command(
    'CustomLiveGrep',
    CustomLiveGrep,
    {}
)

-----------------------------------------------------------------------------------
