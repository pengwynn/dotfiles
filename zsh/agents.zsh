codex() {
    if [[ "$1" == "update" ]]; then
        npm install -g @openai/codex@latest
    else
        command codex "$@"
    fi
}

copilot() {
    if [[ "$1" == "update" ]]; then
        npm i -g @github/copilot
    else
        command copilot --banner "$@"
    fi
}

claude() {
    if [[ "$1" == "update" ]]; then
        npm install -g @anthropic-ai/claude-code
    else
        command claude "$@"
    fi
}
