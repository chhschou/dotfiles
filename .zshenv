# zplugin
local -A ZPLGM
ZPLGM[HOME_DIR]="$HOME/.zplugin"
ZPLGM[BIN_DIR]="$ZPLGM[HOME_DIR]/bin"
ZPLGM[ZSCRIPT_DIR]="$HOME/.zsh"
ZPLGM[PLUGIN_SCRIPT_DIR]="$ZPLGM[ZSCRIPT_DIR]/zplugin"
echo "home $HOME"
echo "script dir $ZPLGM[PLUGIN_SCRIPT_DIR]"
ls -la "$ZPLGM[ZSCRIPT_DIR]"
ls -la "$ZPLGM[PLUGIN_SCRIPT_DIR]"
if [[ ! -d "$ZPLGM[HOME_DIR]" ]]; then
  mkdir -p "$ZPLGM[HOME_DIR]"
  git clone https://github.com/zdharma/zplugin.git "$ZPLGM[BIN_DIR]"
  . "$ZPLGM[BIN_DIR]/zplugin.zsh"
  # zplugin module build
else
  . "$ZPLGM[BIN_DIR]/zplugin.zsh"
fi
ZPLGM[MUTE_WARNINGS]=1
# module_path+="$ZPLGM[BIN_DIR]/zmodules/Src"
# zmodload zdharma/zplugin


# Order of execution of related Ice-mods: atinit -> atpull! -> make'!!' -> mv -> cp -> make! -> atclone/atpull -> make -> (plugin script loading) -> src -> multisrc -> atload.

# shim tool https://github.com/zplugin/z-a-bin-gem-node
zplugin light zplugin/z-a-bin-gem-node

# theme
[ -f  "$ZPLGM[PLUGIN_SCRIPT_DIR]/theme.zsh" ] && . "$ZPLGM[PLUGIN_SCRIPT_DIR]/theme.zsh"

# lang/runtimes
[ -f  "$ZPLGM[PLUGIN_SCRIPT_DIR]/lang_runtime.zsh" ] && . "$ZPLGM[PLUGIN_SCRIPT_DIR]/lang_runtime.zsh"

# command line programs
[ -f  "$ZPLGM[PLUGIN_SCRIPT_DIR]/cmdline_prog.zsh" ] && . "$ZPLGM[PLUGIN_SCRIPT_DIR]/cmdline_prog.zsh
"
# font
zplugin ice from'gh-r' bpick'FiraCode.zip' \
  atclone'mkdir -p $HOME/.local/share/fonts; ln -sf $PWD $HOME/.local/share/fonts/FiraCode;' \
  atpull'%atclone'
zplugin light ryanoasis/nerd-fonts

#  completions
[ -f  "$ZPLGM[PLUGIN_SCRIPT_DIR]/comp.zsh" ] && . "$ZPLGM[PLUGIN_SCRIPT_DIR]/comp.zsh
"
# gui programs
[ -f  "$ZPLGM[PLUGIN_SCRIPT_DIR]/gui_prog.zsh" ] && . "$ZPLGM[PLUGIN_SCRIPT_DIR]/gui_prog.zsh"

# needs to be the last plugin
zplugin ice wait lucid
zplugin light zdharma/fast-syntax-highlighting

autoload -Uz compinit
compinit

zplugin cdreplay -q

# other paths
[ -f "$ZPLGM[ZSCRIPT_DIR]/paths.sh" ] && . "$ZPLGM[ZSCRIPT_DIR]/paths.sh"
