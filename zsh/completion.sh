# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

compdef dc=docker-compose

compdef g=git

zstyle ':completion:*:*:g*:*' user-commands \
                   amend:"Use the last commit message and amend your stuffs" \
                   churn:"Show most actively changed parts of a repo" \
                   ci:"View CI status for a ref" \
                   conflicts:"Show list of files in a conflict state" \
                   contributors:"Show list of contributors sorted by line count" \
                   credit:"Quick way to credit an author on the latest commit" \
                   edit-conflicts:"Open files with conflicts in $EDITOR" \
                   exclude:"Exclude files in repo without modifying .gitignore" \
                   go:"CLI helper for GitHub.com, inspired by the CommandBar" \
                   grab:"Clone GitHub repo to $CODE/repo@owner" \
                   nwo:"Display GitHub owner and repository name" \
                   outgoing:"Show commits on current branch that do not exist on branch upstream" \
                   pr:"Start or open a pull request for the current branch" \
                   prune-merged-branches:"Delete all branches that are fully merged into specified branch" \
                   rank-contributors:"Rank contributors by total size of diffs" \
                   rel:"Show relative ahead/behind info between branch and a ref" \
                   sweep:"Remove fully merged branches" \
                   thanks:"Display commit count by author for a given Git ref" \
                   undo:"Undo your last commit, but don't throw away your changes" \
                   wtf:"Display the state of your repository in a readable, easy-to-scan format." \

