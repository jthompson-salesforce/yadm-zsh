# YADM Plugin

A zsh plugin for [Yet Another Dotfiles Manager](https://thelocehiliosan.github.io/yadm/) (yadm) that provides some helpful [aliases](#aliases) and notifies you if you have uncommitted changes.

If there are local yadm configuration changes, the message

```
There are local configuration changes. Yadm commit (yc) required
```

is displayed.

## Aliases

| Alias | Command                                               |
|-------|-------------------------------------------------------|
|    ya | yadm add                                              |
|   yaa | yadm add --update                                     |
|    yc | yadm commit --verbose                                 |
|   yca | yadm commit --verbose --all                           |
|  ycam | yadm commit --all --message                           |
|    yd | yadm diff                                             |
|   ydc | yadm decrypt                                          |
|   yec | yadm encrypt                                          |
|    yl | yadm pull                                             |
|    yp | yadm push                                             |
| ypoff | YADM_PROMPT=off                                       |
|  ypon | YADM_PROMPT=on                                        |
| ypsup | yadm push --set-upstream origin $(git_current_branch) |
|   ypv | yadm push --verbose                                   |
|   yst | yadm status                                           |
|   ysu | yadm submodule update                                 |
|   yss | yadm submodule status                                 |
|  ywch | yadm whatchanged -p --abbrev-commit --pretty=medium   |

For more information about yadm, see https://thelocehiliosan.github.io/yadm/
