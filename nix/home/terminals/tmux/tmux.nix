{ config, pkgs, ... }:

let
  tmuxConfig = pkgs.writeTextFile {
    name = "tmux.conf";
    text = ''
      set -sg escape-time 50
      # vim-like pane switching
      bind -r k select-pane -U 
      bind -r j select-pane -D 
      bind -r h select-pane -L 
      bind -r l select-pane -R 

      # Make copy mode keystrokes vi-like.
      set-window-option -g mode-keys vi

      # Allow mouse wheel to scroll instead of history
      set -g mouse on
      set -g terminal-overrides 'xterm*:smcup@:rmcup@'

      # When copying, also transfer to Windows clipboard (yum install -y xsel)
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xsel -bi"

      # Change Prefix (Ctrl-b) to Ctrl-j
      unbind-key C-b
      set-option -g prefix C-j
      bind-key C-S-j send-prefix

      # Moving window
      bind-key -n C-S-Left swap-window -t -1 \; previous-window
      bind-key -n C-S-Right swap-window -t +1 \; next-window

      # Resizing pane
      bind -r C-k resize-pane -U 5
      bind -r C-j resize-pane -D 5
      bind -r C-h resize-pane -L 5
      bind -r C-l resize-pane -R 5

      # List of plugins
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin "arcticicestudio/nord-tmux"

      # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
in {
  home.packages = with pkgs; [
    tmux
  ];

  # Tmuxの設定ファイルをユーザーのホームディレクトリに配置
  home.file.".tmux.conf".source = tmuxConfig;
}
