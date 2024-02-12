_G.copy_buffer_to_clipboard = function()
  local current_filename = vim.fn.expand('%:t') -- Get the current file name
  local prepend_string = string.format("Here is my entire %s: file", current_filename)

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false) -- Get all lines from the current buffer
  local text = table.concat(lines, "\n") -- Combine lines into a single string

  local clipboard_text = prepend_string .. "\n" .. text -- Combine the prepend_string and the buffer text

  vim.fn.setreg('+', clipboard_text) -- Copy the combined text to the system clipboard
  local message = string.format("File %s copied for ChatGPT", current_filename)
  vim.api.nvim_echo({{'', 'Normal'}, {message, 'Title'}}, true, {})
end

-- Create a command to call the function
vim.cmd([[command! CopyBufferToClipboard lua copy_buffer_to_clipboard()]])


