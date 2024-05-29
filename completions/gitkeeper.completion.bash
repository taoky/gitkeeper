#!/bin/bash

_comp_cmd_gitkeeper()
{
    local cur prev words cword
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    case "${prev}" in
        gitkeeper)
            COMPREPLY=( $(compgen -W "status commit update vcs ls diff help" -- ${cur}) )
            return 0
            ;;
        "status"|"commit"|"update"|"vcs"|"diff")
            local options
            if options=$(gitkeeper ls < /dev/null 2> /dev/null); then
                COMPREPLY=( $(compgen -W "${options}" -- ${cur}) )
            else
                COMPREPLY=()
            fi
            return 0
            ;;
    esac
} && complete -F _comp_cmd_gitkeeper gitkeeper
