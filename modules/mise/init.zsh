#
# Activates mise (https://mise.jdx.dev) for per-project tool versions.
#
# Authors:
#   Cosmin Stejerean
#

# Return if requirements are not found.
if (( ! $+commands[mise] )); then
  return 1
fi

eval "$(mise activate zsh)"
