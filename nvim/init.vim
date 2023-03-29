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
set updatetime=200
set shortmess+=c
"set signcolumn=number    " TODO: What's this?
"set viminfo='1000        " TODO: What's this?
set conceallevel=3 concealcursor=nc
set pumblend=10
set foldmethod=syntax foldlevel=100

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
nnoremap <leader>x :bp\|bd #<CR>

" cSpell:disable

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-sensible'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme='dark'

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
nnoremap <Leader>= :FormatCode<CR>

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rcarriga/nvim-notify'

Plug 'honza/vim-snippets'

"Plug 'jackguo380/vim-lsp-cxx-highlight'

let g:coc_global_extensions = [
\  'coc-clangd',
\  'coc-cmake',
\  'coc-explorer',
\  'coc-floaterm',
\  'coc-fzf-preview',
\  'coc-git',
\  'coc-java',
\  'coc-json',
\  'coc-lists',
\  'coc-markdownlint',
\  'coc-marketplace',
\  'coc-pyright',
\  'coc-sh',
\  'coc-snippets',
\  'coc-spell-checker',
\  'coc-vimlsp',
\]

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : coc#refresh()
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : coc#refresh()
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(0) : "\<C-p>"
inoremap <silent><expr> <C-f> coc#pum#visible() ? coc#pum#scroll(1) : "\<C-f>"
inoremap <silent><expr> <C-b> coc#pum#visible() ? coc#pum#scroll(0) : "\<C-b>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

let g:coc_snippet_next = '<tab>'

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>fix <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction
set statusline^=%{StatusDiagnostic()}%{get(b:,'coc_current_function','')}

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

nmap <Leader>ff :<C-u>CocList files<CR>
nmap <Leader>st :<C-u>CocCommand fzf-preview.GitStatus<CR>
nmap <Leader>jl :<C-u>CocCommand fzf-preview.Jumps<CR>  "Jump List
nmap <Leader>rg :<C-u>CocCommand fzf-preview.ProjectGrep<Space>

nmap <Leader>cc :<C-u>CocCommand<CR>
nmap <Leader>ll :<C-u>CocList<CR>

Plug 'dense-analysis/ale'
let g:ale_disable_lsp = 1
let g:ale_cpp_cc_options = '-std=c++17 -Wall'
let g:ale_use_global_executables = 1

Plug 'dart-lang/dart-vim-plugin'

Plug 'voldikss/vim-floaterm'
let g:floaterm_keymap_new = '<Leader>sh'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'chrisbra/Colorizer'
"let g:colorizer_auto_filetype='log,css,html'

call plug#end()

inoremap jk <Esc>
tnoremap jk <C-\><C-n>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

augroup default
  autocmd!
  autocmd FocusGained,BufEnter * :silent! checktime
  autocmd FileType c,cpp setlocal colorcolumn=81 "foldmethod=syntax
  autocmd FileType objc,objcpp setlocal colorcolumn=101 "foldmethod=syntax
  "autocmd FileType c,cpp :highlight Folded guibg=gray guifg=purple
  "autocmd BufEnter *.c,*.cc,*.cpp setlocal foldlevel=2 foldnestmax=3 foldcolumn=4
  "autocmd BufEnter *.h,*.hh,*.hpp setlocal foldlevel=3 foldnestmax=4 foldcolumn=5
  autocmd BufEnter *.log,*.txt ColorHighlight
  autocmd FileType java setlocal colorcolumn=101
augroup END

runtime! coc-notify-integration.vim
