nnoremap <leader>q :call QuickfixToggle()<cr>


augroup quickfix_toggle
    autocmd BufReadPost quickfix let g:qfix_win = bufnr("$")
    autocmd BufReadPre  quickfix let g:quickfix_return_to_window = winnr()
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

function! QuickfixToggle()
    if exists("g:qfix_win")
        cclose
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
    endif
endfunction
