" Automatically reload vimrc when it's saved
autocmd! BufWritePost vimrc.symlink so ~/.vimrc

" Strip whitespace on save
"autocmd BufWritePre * :%s/\s\+$//e

" Filetype overrides
" ==================

autocmd! BufRead,BufNewFile *.jbuilder,Gemfile,Rakefile,Procfile,Guardfile setf ruby
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile */nginx/*.conf set filetype=nginx
au BufRead,BufNewFile *.jbuilder setf ruby
au BufRead,BufNewFile *.jeco setf html
au BufRead,BufNewFile *.jss set filetype=css
au BufRead,BufNewFile *.hbs set filetype=mustache
au BufRead,BufNewFile *.md set filetype=markdown

" Resize splits on window resize
au VimResized * exe "normal! \<c-w>="

" Markdown
augroup markdown
    au!
    autocmd Syntax markdown setlocal textwidth=79
    if exists("&colorcolumn")
        autocmd Syntax markdown setlocal colorcolumn=80
    endif
augroup END

