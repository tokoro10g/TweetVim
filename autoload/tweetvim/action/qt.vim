"
"
"
function! tweetvim#action#qt#execute(tweet)
  let text  = ' QT @' . a:tweet.user.screen_name . ':' . a:tweet.text
  let param = {'in_reply_to_status_id' : a:tweet.id_str}
  call tweetvim#say#open(text, param)
  execute "normal 0"
endfunction
