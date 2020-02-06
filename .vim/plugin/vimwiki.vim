" vimwiki/vimwiki

let work = {}
let work.path = '~/notes'
let work.syntax = 'markdown'
let work.ext = '.md'
let work.diary_rel_path = 'log/'

let personal = {}
let personal.path = '~/brain'
let personal.syntax = 'markdown'
let personal.ext = '.md'
let personal.diary_rel_path = 'journal/'

let g:vimwiki_list = [personal, work]
