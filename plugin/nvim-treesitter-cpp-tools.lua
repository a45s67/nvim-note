require('nvim-treesitter.configs').setup({
    -- ...
    nt_cpp_tools = {
        enable = true,
        preview = {
            quit = 'q', -- optional keymapping for quit preview
            accept = '<tab>' -- optional keymapping for accept preview
        },
        header_extension = 'h', -- optional
        source_extension = 'cxx', -- optional
        custom_define_class_function_commands = { -- optional
            --[[
            <your impl function custom command name> = {
                output_handle = function (str, context) 
                    -- string contains the class implementation
                    -- do whatever you want to do with it
                end
            }
            ]]
        }
    }
})
