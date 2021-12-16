" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"
" SETUP
" Python providers
" python3 and 2 (add to path) - for snippets
" $ pip3 install pynvim
"
" Nodejs providers
" $ npm install -g neovim 
"
" EXTRA
" download ripgrep and put in path
" for dyng/ctrlsf plugin
"
" COC extensions
" coc-snippets
" coc-prettier
" coc-pairs
" coc-eslint
" coc-vetur
" coc-json
" coc-css
call plug#begin('C:/Users/hp/AppData/Local/nvim/plugged')

" Make sure you use single quotes
"
" On-demand loading "Nerdtree has config
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
Plug 'mattn/emmet-vim' " has configuration
Plug 'terryma/vim-multiple-cursors' " <C-n>
Plug 'airblade/vim-gitgutter'

Plug 'vim-scripts/ctrlp.vim' " has config

" tagalong auto changes the pairs of html
Plug 'AndrewRadev/tagalong.vim' " has configuration

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'} " has configuration and coc plugin config after it

" Nvim Theme
Plug 'vim-airline/vim-airline' " has config
Plug 'vim-airline/vim-airline-themes' " has config
Plug 'morhetz/gruvbox'

""""" Experiments 
Plug 'tpope/vim-surround'

" highlight similar words
Plug 'RRethy/vim-illuminate'

Plug 'antoinemadec/FixCursorHold.nvim' "has config

" Dim inactive window
Plug 'TaDaa/vimade' " has configs

" uses ripgrep (put in path for windows)
" Ctrl+Shift+F like search
Plug 'dyng/ctrlsf.vim'

""""""" SNIPPETS
" Install python3 (add to path)
" run 
"    $ pip3 install pynvim
" :checkhealth
"
" handled by coc-snippets
" snippets
" add directory to the coc-settings, check if loaded successfully
" $ :CocCommand workspace.showOutput snippets
Plug 'honza/vim-snippets' "has config for coc-snippets
" Plug 'voronkovich/ultisnips-vue'

" replaced these both by Ctrlp
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim' " has config

"" Comment Plugin (Context aware)
Plug 'tyru/caw.vim'
Plug 'Shougo/context_filetype.vim'

call plug#end()

" ============================================================================
" ===                                 Setup
" ============================================================================
" greeting :D
let mapleader = ','
echo ">^.^< \n leader is ,"

" ============================================================================
" ===                                 Nvim Configuration.
" ============================================================================
"speed up from normal to insert mode
set ttimeoutlen=0
runtime macros/matchit.vim

set showmatch " show matching braces
" after hilight of search esc to unhilight
" map <esc> :noh<CR>

syntax on
set smartindent
set linebreak

" no line wrap
set nowrap
nnoremap ; : 
" remap ; to :

" in visual selection tab
vmap < <gv
vmap > >gv

" Change number of spaces that a <Tab> counts for during editing ops
" set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" Yank and paste with the system clipboard
set clipboard=unnamedplus

" highlight current cursor line
set cursorline
set colorcolumn=120 " highlight column

" Keep search results at the center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Open terminal with leader CR in new tab
nnoremap <silent> <leader><Enter> :tabnew<CR>:terminal<CR>

" ignore case when searching
set ignorecase
set smartcase " if has uppercase then case sensitive

" change all to spaces
set expandtab
" spell checking
set spelllang=en

"""""""""""""""""""""""""""""""""""""""""
" ==> Splits
""""""""""""""""""""""""""""""""""""""""""
" set splitbelow splitright "new splits, put below or right

" split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" move between windows with Ctrl + hjkl 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"friendly split resize with arrow buttons
if bufwinnr(1)
        noremap <silent> <Left> :vertical resize -3<CR>
        noremap <silent> <Right> :vertical resize +3<CR>
        noremap <silent> <Up> :resize -3<CR>
        noremap <silent> <Down> :resize +3<CR>
endif
" resize

" turn hybrid line numbers on
" :set number relativenumber
:set nu rnu

"jk to scape from insert mode
imap jk <Esc>

" change buffers easily
map bn :bn<cr>
map bp :bp<cr>
map bd :bd<cr>  

" Enable folding with the spacebar
set foldmethod=indent
set foldlevel=10

" fold with space according to shift width
map <space> za

set title

" ============================================================================
" ===                                 Plugin Configuration.
" ============================================================================

" Airline
let g:airline#extensions#tabline#enabled = 1 " enable buffer title when one tab
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " one tab buffer title

" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='jellybeans'

" FixCursorHold config
let g:cursorhold_updatetime = 100

" Nerdtree config
" toggle with f2
map <F2> :NERDTreeToggle<CR> 
let NERDTreeMapOpenInTab='<ENTER>'
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeWinSize=20

" close vim if only tab is Nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'

" Nerdtree git plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
               \ 'Modified'  :'☼',
               \ 'Staged'    :'+',
               \ 'Untracked' :'U',
               \ 'Renamed'   :'➡',
               \ 'Unmerged'  :'‗',
               \ 'Deleted'   :'X',
               \ 'Dirty'     :'╳',
               \ 'Ignored'   :'☒',
               \ 'Clean'     :'✓',
               \ 'Unknown'   :'?',
               \ }
" auto open nerdtree
autocmd VimEnter * NERDTree

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" tagalong
let g:tagalong_additional_filetypes = ['vue', ]

" " Emmet
" let g:user_emmet_install_global = 0

" emmet with ,,
let g:user_emmet_leader_key=','

" COC configuration
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

" coc action on ,n (useful for golang empty slice intialization)
nmap <leader>n :CocAction<Return>

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" For go to definition and back?
if exists('+tagfunc')
  set tagfunc=CocTagFunc
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code. {{{
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" }}}

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server. {{{
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" }}}

" Remap <C-f> and <C-b> for scroll float windows/popups. {{{
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" }}}

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'tsserver.executeAutofix')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" end COC configuration

" COC plugin configurations
let g:coc_global_extensions = [ 'coc-vetur']
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" COC prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" COC go golang coc-go
" autoimport on save
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" command! -nargs=0 OR :silent call CocAction('runCommand', 'editor.action.organizeImport')


command! -nargs=0 FF   :call     CocAction('runCommand', 'editor.action.organizeImport')
" end COC plugin configurations

" Ignore node_modules folder, etc from vim grep
set wildignore=*/node_modules/*

"Gruvbox vim theme settings
colorscheme gruvbox " this is freaking awesome
set bg=dark

" ctrlP
" nnoremap <silent> <C-p> :FZF<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" below might not work if ctrlp_user_command is given
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" # FZF
" put below in the .bashrc
" export FZF_DEFAULT_COMMAND='rg --files --follow --glob "!{node_modules/*,.git/*}"'
" export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

" Vimade
let g:vimade = {}
let g:vimade.fadelevel = 0.7
let g:vimade.enablesigns = 1

" vim-snippets, coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" ============================================================================
" ===                                 Autocommands
" ============================================================================

" Vue file settings ----------------------------- {{{
        augroup filetype_vue
                autocmd!
                autocmd FileType vue setlocal shiftwidth=2 " set shiftwidth for vue filetype

                " syntax not properly highlited for vue
                autocmd BufEnter *.vue :syntax sync fromstart

                " or below one, if vim doesn't recognize filetype
                " autocmd BufRead,BufNewFile *.vue syntax on
        augroup END
" }}}


" Vimscript file settings ----------------------------- {{{
        augroup filetype_vim
                autocmd!
                autocmd FileType vim setlocal foldmethod=marker
        augroup END
" }}}
