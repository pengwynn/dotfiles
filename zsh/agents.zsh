codex() {
    if [[ "$1" == "update" ]]; then
        npm install -g @openai/codex@latest
    else
        command codex \
            --model 'gpt-5-codex' \
            --full-auto \
            -c model_reasoning_summary_format=experimental \
            --search "$@"
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
