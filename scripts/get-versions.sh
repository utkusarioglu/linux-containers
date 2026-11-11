for repo in mikefarah/yq neovim/neovim; do
    printf '%-15s %s\n' "$repo" "$(curl -fsSL "https://api.github.com/repos/$repo/releases/latest" | jq -r '.tag_name')"
done
