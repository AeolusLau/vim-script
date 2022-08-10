set title
set termguicolors "cursorline cursorcolumn
set number relativenumber
set nowrap scrolloff=5 sidescrolloff=5 "linebreak
set ignorecase smartcase
set expandtab tabstop=2 shiftwidth=2
set wildmenu wildmode=list:longest,full
set autoindent cindent
set hidden
set cmdheight=2
set updatetime=100
set shortmess+=c
set signcolumn=number
set viminfo='1000
set conceallevel=3 concealcursor=nc

let mapleader = " "

nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>
vnoremap <leader>y "+y
nnoremap <leader>yw "+yiw
nnoremap <leader>yp "+yip
nnoremap <leader>p "+p
nnoremap <leader>bd :bp\|bd #<CR>

call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme='dark'

" cSpell:disable

Plug '/usr/local/opt/fzf'
"Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
nnoremap <Leader>= :FormatCode<CR>

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'honza/vim-snippets'

"Plug 'jackguo380/vim-lsp-cxx-highlight'

let g:coc_global_extensions = [
\  'coc-clangd',
\  'coc-cmake',
\  'coc-cspell-dicts',
\  'coc-explorer',
\  'coc-floaterm',
\  'coc-format-json',
\  'coc-fzf-preview',
\  'coc-git',
\  'coc-java',
\  'coc-json',
\  'coc-markdownlint',
\  'coc-marketplace',
\  'coc-protobuf',
\  'coc-python',
\  'coc-sh',
\  'coc-snippets',
\  'coc-spell-checker',
\  'coc-sql',
\  'coc-vimlsp'
\]

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <C-n> coc#refresh()

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" cSpell:words funcobj clangd
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   }
\ }
nmap <Leader>o :CocCommand explorer --preset floating<CR>

nmap <Leader>sw :CocCommand clangd.switchSourceHeader<CR>

let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=never'
let g:fzf_preview_command = 'bat --color=always --plain {-1}'
let g:fzf_preview_lines_command = 'bat --color=always --plain --number'

nmap <Leader>ff :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nmap <Leader>st :<C-u>CocCommand fzf-preview.GitStatus<CR>
nmap <Leader>jl :<C-u>CocCommand fzf-preview.Jumps<CR>  "Jump List
nmap <Leader>rg :<C-u>CocCommand fzf-preview.ProjectGrep<Space>

Plug 'dense-analysis/ale'
let g:ale_disable_lsp = 1
let g:ale_cpp_cc_options = '-std=c++17 -Wall'

Plug 'dart-lang/dart-vim-plugin'

Plug 'voldikss/vim-floaterm'
let g:floaterm_keymap_new = '<Leader>sh'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'chrisbra/Colorizer'

call plug#end()

inoremap jk <Esc>
tnoremap jk <C-\><C-n>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

augroup default
  autocmd!
  autocmd FocusGained,BufEnter * :silent! checktime
  autocmd FileType c,cpp setlocal colorcolumn=81 "foldmethod=syntax
  "autocmd FileType c,cpp :highlight Folded guibg=gray guifg=purple
  "autocmd BufEnter *.c,*.cc,*.cpp setlocal foldlevel=2 foldnestmax=3 foldcolumn=4
  "autocmd BufEnter *.h,*.hh,*.hpp setlocal foldlevel=3 foldnestmax=4 foldcolumn=5
  autocmd FileType java setlocal colorcolumn=101
augroup END
