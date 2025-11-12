{ config, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()
      local act = wezterm.action
      
      -- Appearance
      -- config.color_scheme = 'Catppuccin Mocha'
      -- config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Medium' })
      config.font = wezterm.font('0xProto Nerd Font Mono', { weight = 'Regular' })
      config.font_size = 10.0
      
      -- Window
      config.window_background_opacity = 1.0
      config.window_decorations = "NONE"
      config.window_close_confirmation = "NeverPrompt"
      
      -- Tabs
      config.enable_tab_bar = false
      -- config.hide_tab_bar_if_only_one_tab = true
      -- config.use_fancy_tab_bar = false
      
      -- Scrollback
      config.scrollback_lines = 10000
      
      -- Pane selection mode (for visual feedback)
      config.inactive_pane_hsb = {
        saturation = 0.7,
        brightness = 0.6,
      }
      
      -- Keybindings
      config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
      
      config.keys = {
        -- Tab management
        { key = 't', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
        { key = 'w', mods = 'LEADER', action = act.CloseCurrentTab{ confirm = false } },
        { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },
        { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
        
        -- Tab selection by number (LEADER + number)
        { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },
        { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },
        { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },
        { key = '4', mods = 'LEADER', action = act.ActivateTab(3) },
        { key = '5', mods = 'LEADER', action = act.ActivateTab(4) },
        { key = '6', mods = 'LEADER', action = act.ActivateTab(5) },
        { key = '7', mods = 'LEADER', action = act.ActivateTab(6) },
        { key = '8', mods = 'LEADER', action = act.ActivateTab(7) },
        { key = '9', mods = 'LEADER', action = act.ActivateTab(8) },
        
        -- Pane splitting (like tmux/vim)
        { key = 'v', mods = 'LEADER', action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' } },
        { key = 's', mods = 'LEADER', action = act.SplitVertical{ domain = 'CurrentPaneDomain' } },
        { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane{ confirm = false } },
        { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },
        
        -- Vim-style pane navigation
        { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
        { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
        { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
        { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
        
        -- Alternative: CTRL+Vim keys (without leader)
        { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
        { key = 'j', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down' },
        { key = 'k', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
        { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },
        
        -- Pane resizing (Vim-style with LEADER + Arrow or H/J/K/L)
        { key = 'H', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize{ 'Left', 5 } },
        { key = 'J', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize{ 'Down', 5 } },
        { key = 'K', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize{ 'Up', 5 } },
        { key = 'L', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize{ 'Right', 5 } },
        
        -- Alternative resize with arrows
        { key = 'LeftArrow', mods = 'LEADER', action = act.AdjustPaneSize{ 'Left', 5 } },
        { key = 'DownArrow', mods = 'LEADER', action = act.AdjustPaneSize{ 'Down', 5 } },
        { key = 'UpArrow', mods = 'LEADER', action = act.AdjustPaneSize{ 'Up', 5 } },
        { key = 'RightArrow', mods = 'LEADER', action = act.AdjustPaneSize{ 'Right', 5 } },
        
        -- Rotate panes
        { key = 'r', mods = 'LEADER', action = act.RotatePanes 'Clockwise' },
        { key = 'R', mods = 'LEADER|SHIFT', action = act.RotatePanes 'CounterClockwise' },
        
        -- Swap panes
        { key = '{', mods = 'LEADER|SHIFT', action = act.PaneSelect{ mode = 'SwapWithActive' } },
        
        -- Pane selection mode (interactive)
        { key = 'o', mods = 'LEADER', action = act.PaneSelect },
        { key = 'O', mods = 'LEADER|SHIFT', action = act.PaneSelect{ mode = 'SwapWithActive' } },
        
        -- Quick select mode (like tmux copy mode)
        { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },
        { key = ']', mods = 'LEADER', action = act.PasteFrom 'Clipboard' },
        
        -- Search mode
        { key = '/', mods = 'LEADER', action = act.Search{ CaseSensitiveString = "" } },
        
        -- Command palette
        { key = 'p', mods = 'LEADER|SHIFT', action = act.ActivateCommandPalette },
        
        -- Reload configuration
        { key = 'r', mods = 'CTRL|SHIFT', action = act.ReloadConfiguration },
        
        -- Show launcher (tabs, windows, workspaces)
        { key = 'l', mods = 'LEADER|SHIFT', action = act.ShowLauncherArgs{ flags = 'FUZZY|TABS|LAUNCH_MENU_ITEMS' } },
      }
      
      -- Copy mode keybindings (Vim-style)
      config.key_tables = {
        copy_mode = {
          { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
          { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
          
          -- Vim motion
          { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
          { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
          { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
          { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
          
          { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
          { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
          { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
          
          { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
          { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
          { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
          
          { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
          { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
          
          { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode = 'Cell' } },
          { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode = 'Line' } },
          { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode = 'Block' } },
          
          { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo = 'ClipboardAndPrimarySelection' }, { CopyMode = 'Close' } } },
          
          -- Page navigation
          { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
          { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
          { key = 'u', mods = 'CTRL', action = act.CopyMode 'PageUp' },
          { key = 'd', mods = 'CTRL', action = act.CopyMode 'PageDown' },
        },
        
        search_mode = {
          { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
          { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
          { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
          { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
          { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
          { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
        },
      }
      
      return config
    '';
  };
  
}
