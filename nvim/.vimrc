set clipboard+=unnamedplus
set shiftwidth=2

"esc removes highlighed text
nnoremap <esc> :noh<return><esc>
noremap <F3> :Autoformat<CR>
noremap <F9> :Make!<CR>

let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "passive_filetypes": ["tex"] }
