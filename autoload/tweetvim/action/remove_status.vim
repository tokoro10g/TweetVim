"
"
"
function! tweetvim#action#remove_status#define()
  return {
        \ 'description' : 'remove status',
        \ }
endfunction
"
"
"
function! tweetvim#action#remove_status#execute(tweet)
  let tweet = a:tweet
  echo tweet.user.screen_name . ' ' . tweetvim#util#unescape(tweet.text)
  if input('remove this status ? [y/n] : ') != 'y'
    return
  endif
  let ret = tweetvim#request('remove_status', tweet.id_str)
  redraw
  if has_key(ret, 'errors')
    echohl ErrorMsg | echo ret.errors | echohl None
  else
    let  tweet.text = "this status was removed"
    call tweetvim#buffer#replace(line("."), tweet)
    redraw
    echo 'removed tatus'
  endif
endfunction
