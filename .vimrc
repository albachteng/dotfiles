" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" prevent security exploits
set modelines=0

" handle long lines correctly
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" tab settings
set softtabstop=4
set smartindent

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" apply substitutions globally on lines
set gdefault

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" syntax syncs from start
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file
" in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Set automatic indent on line-wrap and max text width
set autoindent

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Enables fast drawing of characters to the screen for smooth loading
set ttyfast

" sets ruler information for line position
set ruler

" ???
" set backspace=indent,eol,start

" set line numbers to be relative to the current line
set relativenumber

" create undo files to allow undos after saving or closing
" set undofile

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Do not save backup files.
 set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=4

" avoids unloading files not in active use ?
" set hidden

" instead of 'beeping'
set visualbell
"
" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" PLUGINS ---------------------------------------------------------------- {{{

" use plug to manage plugins with :PlugInstall
call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'gertjanreynaert/cobalt2-vim-theme'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'jparise/vim-graphql'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 
call plug#end()

" }}}

" Set the color scheme.
	
" needs to be after plugins
colorscheme cobalt2

" set fzf for vim
set rtp+=/usr/local/opt/fzf

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" MAPPINGS --------------------------------------------------------------- {{{

" Set the space as the leader key.
let mapleader = " "

" double spacebar clears search highlights 
nnoremap <leader><space> :noh<cr>

" _w opens a new vertical split and switches over to it, ctrl-j/k/l/h switches
" panes
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map fuzzy finder to ctrl-p
nnoremap <C-p> :GFiles<CR>
" alt for when you're not in a git repo (which could be massive, be careful)
nnoremap <leader>pf :Files<CR>
nnoremap <silent> <C-f> :silent !tmux neww ~/tmux-sessionizer<CR>

" strip all trailing whitespace in the file
" nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ; => : for commands and saves
" nnoremap ; :

" tab is easier to hit than % for brackets pairing
nnoremap <tab> %
vnoremap <tab> %

" amend  default regex to use "very magic" mode. 
" for now, commenting-out because I'm not sure I entirely understand it
" nnoremap / /\v
" vnoremap / /\v

" normalize . command (also commenting out b/c I don't quite get it)
" vnoremap . :norm.<CR>

" set jk as escape key alias (the holiest of holies)
inoremap jk <ESC>

" Press _' to jump back to the last cursor position.
nnoremap <leader>' ``

" Toggle spelling visuals with _s
" nnoremap <leader>s :set spell!<CR>

" Yank from cursor to the end of line.
" very intuitive, but I kind of prefer Vy or Vd
nnoremap Y y$

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
" I love this idea, but it is overridden by system commands
" noremap <c-up> <c-w>+
" noremap <c-down> <c-w>-
" noremap <c-left> <c-w>>
" noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" save on losing focus (when tabbing away, etc)
au FocusLost * :wa

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

" Always show the signcolumn, otherwise it would shift the text each time                     
" diagnostics appear/become resolved.                                                         
if has("nvim-0.5.0") || has("patch-8.1.1564")                                                 
  " Recently vim can merge signcolumn and number column into one                                
  set signcolumn=number
  else                                                                                          
  set signcolumn=yes                                                                            
endif                                                                                    
"use tab trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
  else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"make <CR> auto-select first completion item and notify coc.nvim to format on
"enter, <cr> could be remapped by other vim plugins
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding
" the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
  
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language
" server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?
"    coc#float#scroll(1) : "\<C-f>"
"    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?
"    coc#float#scroll(0) : "\<C-b>"
"    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?
"    "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?
"    "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ?
"    coc#float#scroll(1) : "\<C-f>"
"    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ?
"    coc#float#scroll(0) : "\<C-b>"
" endif

" use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}  
