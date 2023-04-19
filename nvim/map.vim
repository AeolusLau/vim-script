" spell-checker: disable

let mapleader = " "

" Switch ` & '
nnoremap ' `
nnoremap ` '

" Switch 0 & ^
nnoremap 0 ^
nnoremap ^ 0

nnoremap ( [(
nnoremap ) ])
nnoremap { b{w
nnoremap } }w

" sort i /.*map \(.silent.\)\? *\(.expr.\)\? \?/
inoremap <silent><expr> <C-b>       coc#pum#visible() ? coc#pum#scroll(0) : "\<C-b>"
inoremap <silent><expr> <C-f>       coc#pum#visible() ? coc#pum#scroll(1) : "\<C-f>"
inoremap <silent><expr> <C-j>       coc#pum#visible() ? coc#pum#next(1) : coc#refresh()
inoremap <silent><expr> <C-k>       coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <C-n>       coc#pum#visible() ? coc#pum#next(1) : coc#refresh()
inoremap <silent><expr> <C-p>       coc#pum#visible() ? coc#pum#prev(0) : "\<C-p>"
    nmap <silent>       <C-s>       <Plug>(coc-range-select)
    xmap <silent>       <C-s>       <Plug>(coc-range-select)
inoremap <silent><expr> <CR>        coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    vmap                <leader>a   <Plug>(coc-codeaction-selected)
    nmap                <leader>a   <Plug>(coc-codeaction-selected)
    nmap                <leader>ac  <Plug>(coc-codeaction-cursor)
    nmap                <leader>as  <Plug>(coc-codeaction-source)
    nmap                <leader>cc  :<C-u>CocCommand<CR>
    nmap                <leader>cl  <Plug>(coc-codelens-action)
    xmap                <leader>f   <Plug>(coc-format-selected)
    nmap                <leader>f   <Plug>(coc-format-selected)
    nmap                <leader>ff  :<C-u>CocList files<CR>
    nmap                <leader>fix <Plug>(coc-fix-current)
    nmap                <leader>jl  :<C-u>CocCommand fzf-preview.Jumps<CR>  "Jump List
    nmap                <leader>ll  :<C-u>CocList<CR>
    nmap                <leader>o   :CocCommand explorer --preset floating<CR>
nnoremap                <leader>p   "+p
nnoremap                <leader>Q   :q!<CR>
nnoremap                <leader>q   :q<CR>
    xmap <silent>       <leader>r   <Plug>(coc-codeaction-refactor-selected)
    nmap <silent>       <leader>r   <Plug>(coc-codeaction-refactor-selected)
    nmap <silent>       <leader>re  <Plug>(coc-codeaction-refactor)
    nmap                <leader>rf  <Plug>(coc-refactor)
    nmap                <leader>rg  :<C-u>CocCommand fzf-preview.ProjectGrep <C-r><C-w><CR>
    nmap                <leader>rn  <Plug>(coc-rename)
nnoremap <silent>       <leader>sb  :<C-u>CocList -I symbols<CR>
nnoremap <silent>       <leader>sh  :FloatermToggle<CR>
    nmap                <leader>st  :<C-u>CocCommand fzf-preview.GitStatus<CR>
    nmap                <leader>sw  :CocCommand clangd.switchSourceHeader<CR>
nnoremap                <leader>ve  :e $MYVIMRC<CR>
nnoremap                <leader>vs  :source $MYVIMRC<CR>
nnoremap                <leader>w   :w<CR>
nnoremap                <leader>W   :wa<CR>
nnoremap                <leader>X   :%bd\|e#\|bd#<CR>`"
nnoremap                <leader>x   :bp\|bd#<CR>
vnoremap                <leader>y   "+y
nnoremap                <leader>yp  "+yip
nnoremap                <leader>yw  "+yiw
nnoremap                <S-Tab>     :bprevious<CR>
inoremap         <expr> <S-Tab>     coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
nnoremap                <Tab>       :bnext<CR>
inoremap <silent><expr> <Tab>       coc#pum#visible() ? coc#pum#next(1) : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : CheckBackspace() ? "\<TAB>" : coc#refresh()
    nmap <silent>       [[          <Plug>(coc-diagnostic-prev)
    nmap <silent>       ]]          <Plug>(coc-diagnostic-next)
    xmap                ac          <Plug>(coc-classobj-a)
    omap                ac          <Plug>(coc-classobj-a)
    xmap                af          <Plug>(coc-funcobj-a)
    omap                af          <Plug>(coc-funcobj-a)
    xmap                ga          <Plug>(EasyAlign)
    nmap                ga          <Plug>(EasyAlign)
    nmap <silent>       gd          <Plug>(coc-definition)
    nmap <silent>       gi          <Plug>(coc-implementation)
nnoremap                gq          :FormatCode<CR>
    nmap <silent>       gr          <Plug>(coc-references)
    nmap <silent>       gy          <Plug>(coc-type-definition)
    xmap                ic          <Plug>(coc-classobj-i)
    omap                ic          <Plug>(coc-classobj-i)
    xmap                if          <Plug>(coc-funcobj-i)
    omap                if          <Plug>(coc-funcobj-i)
tnoremap                jk          <C-\><C-n>
inoremap                jk          <Esc>
nnoremap <silent>       K           :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

