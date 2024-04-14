set encoding=utf-8
set nocompatible

const s:dpp_base = '~/.cache/dpp/'

const s:dpp_src = '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
const s:denops_src = '~/.cache/dpp/repos/github.com/vim-denops/denops.vim'

execute 'set runtimepath^=' .. s:dpp_src

execute 'set runtimepath^=' .. '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
execute 'set runtimepath^=' .. '~/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git'
execute 'set runtimepath^=' .. '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer'
execute 'set runtimepath^=' .. '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml'
execute 'set runtimepath^=' .. '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy'


if s:dpp_base->dpp#min#load_state() 
  execute 'set runtimepath^=' .. s:denops_src

  autocmd User DenopsReady
  \ echo "denops ready"

  autocmd User DenopsReady
  \ call dpp#make_state(s:dpp_base, '~/.vim/dpp.ts')
endif

execute 'set runtimepath^=' .. s:denops_src

if has('syntax')
  syntax on
endif

filetype indent plugin on

command! DppInstall :call s:dpp_install('install')
command! DppUpdate :call s:dpp_install('update')
command! DppMakeState :call dpp#make_state(s:dpp_base, '~/.vim/dpp.ts')


function! s:dpp_install(cmd) abort
	if denops#server#status() == "running"
		call dpp#async_ext_action('installer', a:cmd)
	else
		echo "denops is not started"
	endif

endfunction

command! -nargs=1 Ddu call s:ddu_command(<f-args>)
function! s:ddu_command(args) abort
  echo a:args
  call ddu#start(#{ sources: [#{ name: a:args }] })
endfunction






const mapleader = " "

nnoremap <silent> <C-[> <cmd>nohlsearch<CR>

nnoremap <C-f> <cmd>close<CR>

inoremap jj <ESC>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <silent> <leader>a ggVG





set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set laststatus=3
set noshowmode
set formatoptions-=r
set formatoptions-=o
set tabstop=2
set shiftwidth=2
set softtabstop=2

set completeopt=menuone,noinsert




set clipboard=unnamedplus
set autoindent
set statusline=─
set fillchars+=stl:─,stlnc:─,vert:│,eob:\\x20

set undofile
set termguicolors
set number

set cursorline
:highlight CursorLine guibg=#eff1f5




let g:lsp_log_file = expand('~/.vim/log/vim-lsp.log')
let g:lsp_settings_filetype_typescript = [
\	      'typescript-language-server',
\       'eslint-language-server',
\       'deno'
\ ]
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = "after"
let g:lsp_diagnostics_enabled = 1





if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(
        \     lsp#utils#find_nearest_parent_file_directory(
        \         lsp#utils#get_buffer_path(),
        \         ['Cargo.toml', '.git'],
        \     ))},
        \ 'allowlist': ['rust'],
        \ })
endif



if executable('zls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'zls',
        \ 'cmd': {server_info->['zls']},
        \ 'whitelist': ['zig'],
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(
        \     lsp#utils#find_nearest_parent_file_directory(
        \         lsp#utils#get_buffer_path(),
        \         ['zig.mod', 'build.zig', '.git'],
        \     ))},
        \ })
endif



if executable('haskell-language-server-wrapper')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'haskell-ls',
        \ 'cmd': {server_info->['haskell-language-server-wrapper', '--lsp']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(
        \     lsp#utils#find_nearest_parent_file_directory(
        \         lsp#utils#get_buffer_path(),
        \         ['.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml', '.git'],
        \     ))},
        \ 'allowlist': ['haskell', 'lhaskell'],
        \ })
endif



if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(
        \     lsp#utils#find_nearest_parent_file_directory(
        \         lsp#utils#get_buffer_path(),
        \         ['CMakeLists.txt', '.git', 'compile_commands.json'],
        \     ))},
        \ 'whitelist': ['c', 'cc', 'cpp', 'objc', 'objcpp'],
        \ 'initialization_options': {},
        \ 'settings': {}
        \ })
endif




function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 0
    " autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

augroup vimspector
    autocmd!
    autocmd User VimspectorJumpedToFrame * call s:vimspector_my_settings()
augroup END

function! s:vimspector_my_settings() abort
	echom "Vimspector!"
	nnoremap <Leader>r <Plug>VimspectorContinue
	nnoremap <Leader>s <plug>VimspectorStop
	nnoremap <C-b> <cmd>call vimspector#ToggleBreakpoint()<CR>
        nnoremap <S-q> <cmd>vimspector#Reset()<CR>
endfunction

call lsp#activate()






let g:ale_disable_lsp = 1

let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_sign_info = ' '

let g:ale_fix_on_save = 1
let g:rustfmt_on_save = 0
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']


let g:ale_fixers = {
      \ 'javascript': ['deno'],
      \ 'typescript': ['deno'], 
      \ 'nix': ['nixfmt', 'nixpkgs-fmt'],
      \ 'rust': ['rustfmt'],
      \ 'haskell': ['ormolu'],
      \ 'lua': ['stylua'],
      \ }

