# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/mberkowitz/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/mberkowitz/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
set -g fish_user_paths "/usr/local/opt/qt/bin" $fish_user_paths
