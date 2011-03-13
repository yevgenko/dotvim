if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " local filetype changes go here
  au! BufRead,BufNewFile *.json setfiletype json
augroup END
