# YADM_STATUS values
# 0 - nothing to do
# 1 - yadm has unsaved changes
# 2 - yadm changes need to be pushed to the remote
export YADM_STATUS=0

_update_yadm_status () {
    local branch_name ahead
    if [[ $(pwd) != $HOME ]]; then
        # do nothing
    elif [[ $(yadm status -s) ]]; then
        YADM_STATUS=1
    else
        branch_name=$(yadm symbolic-ref --short HEAD 2>/dev/null)
        ahead=$(yadm rev-list "${branch_name}"@{upstream}..HEAD 2>/dev/null | wc -l)
        if (( ahead )); then
            YADM_STATUS=2
        else
            YADM_STATUS=0
        fi
    fi
}

_prompt_yadm_status () {
    if [[ $(pwd) != $HOME ]]; then
        # do nothing
    elif [[ $YADM_STATUS -eq 1 && $YADM_PROMPT != "off" ]]; then
        print -P '%B%F{magenta}There are local configuration changes: "yadm commit --all" (or "yca") required.%f%b'
    elif [[ $YADM_STATUS -eq 2 && $YADM_PROMPT != "off" ]]; then
        print -P '%B%F{magenta}Run "yadm push" (or "yp").%f%b'
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_yadm_status
add-zsh-hook precmd _prompt_yadm_status

# Aliases
alias ya='yadm add'
alias yaa='yadm add --update'
alias yc='yadm commit --verbose'
alias yca='yadm commit --verbose --all'
alias ycam='yadm commit --all --message'
alias yd='yadm diff'
alias ydc='yadm decrypt'
alias yec='yadm encrypt'
alias yl='yadm pull'
alias yp='yadm push'
alias ypoff='YADM_PROMPT=off'
alias ypon='YADM_PROMPT=on'
alias ypsup='yadm push --set-upstream origin $(git_current_branch)'
alias ypv='yadm push --verbose'
alias yst='yadm status'
alias ysu='yadm submodule update'
alias yss='yadm submodule status'
alias ywch='yadm whatchanged -p --abbrev-commit --pretty=medium'
