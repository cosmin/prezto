#
# Loads jenv (https://github.com/jenv/jenv) for per-directory Java versions.
#
# Authors:
#   Cosmin Stejerean
#

# Add a manually installed jenv to the path when present.
local _jenv_root="${JENV_ROOT:-$HOME/.jenv}"
[[ -x "$_jenv_root/bin/jenv" ]] && path=("$_jenv_root/bin" $path)

# Return if requirements are not found.
if (( ! $+commands[jenv] )); then
  unset _jenv_root
  return 1
fi

eval "$(jenv init - zsh)"

# Enable plugins (default: export, which keeps JAVA_HOME in sync with the
# active version). A newly enabled plugin only takes effect after jenv is
# initialized again, so do that once, on first use.
zstyle -a ':prezto:module:jenv' plugins _jenv_plugins || _jenv_plugins=(export)
local _jenv_plugin _jenv_enabled=0
for _jenv_plugin in $_jenv_plugins; do
  if [[ ! -e "$_jenv_root/plugins/$_jenv_plugin" ]]; then
    jenv enable-plugin "$_jenv_plugin" >/dev/null 2>&1 && _jenv_enabled=1
  fi
done
(( _jenv_enabled )) && eval "$(jenv init - zsh)"

unset _jenv_root _jenv_plugins _jenv_plugin _jenv_enabled
