if exists('g:loaded_unite_dwm') && g:loaded_unite_dwm
  finish
endif

let g:loaded_unite_dwm = 1

let s:save_cpo = &cpo
set cpo&vim

let s:action = {
  \   'description':   'open file(s) by DWM',
  \   'is_selectable': 1,
  \ }

function! s:action.func(candidates)
  for l:candidate in a:candidates
    if bufexists(l:candidate.action__path)
      let l:winnr = bufwinnr(l:candidate.action__path)

      if l:winnr == -1
        call DWM_Stack(1)
        split
        call unite#take_action('open', l:candidate)
        call DWM_AutoEnter()
      else
        exec l:winnr . "wincmd w"
        call DWM_AutoEnter()
      endif
    else
      call DWM_New()
      call unite#take_action('open', l:candidate)
    endif
  endfor
endfunction

call unite#custom_action('openable', 'dwm_open', s:action)

unlet s:action

if exists("g:unite_dwm_source_names_as_default_action")
  call unite#custom#default_action(g:unite_dwm_source_names_as_default_action, "dwm_open")
endif

let &cpo = s:save_cpo
unlet s:save_cpo
