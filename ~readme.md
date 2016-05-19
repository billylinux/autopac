Installation
- Place this script `autopac.sh` to: `$HOME/Dropbox/Apps/dev/pac`
- Place `user_rule.txt` to the same location
- Then use `crontab -e` to add a scheduling work like this:
  ```
  10 14 * * * nohup $HOME/Dropbox/Apps/dev/pac/autopac.sh
  ```

  which will schedule this script to run every day at 2:10pm
- You must install @clowwindy's gfwlist2pac first, using this command
  ```
  pip install gfwlist2pac
  ```

  or
  ```
  sudo easy_install gfwlist2pac
  ```

You now could configure your GoAgentX to use this custom PAC instead.
Now we could stop complaining that @ohdarling88 drops the gfwlist supports in his GoAgentX version2

Enjoy it.

Thanks to @ohdarling88, @clowwindy

More works need to do
- add user rule supports for multiple proxies
  (such as u2b should go through GAE instead of shadowsocks)
