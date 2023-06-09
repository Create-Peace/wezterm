local wezterm = require 'wezterm'
local config = {
  native_macos_fullscreen_mode = true,
  adjust_window_size_when_changing_font_size = true,
  window_background_opacity = 0.95, -- 如果设置为1.0会明显卡顿
  window_padding = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
  },
  window_background_image_hsb = {
      brightness = 0.8,
      hue = 1.0,
      saturation = 1.0
  },
}
local launch_menu = {}



config.colors = {
   -- The default text color
   foreground = 'silver',
   -- The default background color
   background = 'black',
 
   -- Overrides the cell background color when the current cell is occupied by the
   -- cursor and the cursor style is set to Block
   cursor_bg = '#52ad70',
   -- Overrides the text color when the current cell is occupied by the cursor
   cursor_fg = 'black',
   -- Specifies the border color of the cursor when the cursor style is set to Block,
   -- or the color of the vertical or horizontal bar when the cursor style is set to
   -- Bar or Underline.
   cursor_border = '#52ad70',
 
   -- the foreground color of selected text
   selection_fg = 'black',
   -- the background color of selected text
   selection_bg = '#fffacd',
 
   -- The color of the scrollbar "thumb"; the portion that represents the current viewport
   scrollbar_thumb = '#222222',
 
   -- The color of the split lines between panes
   split = '#444444',
 
   ansi = {
     'black',
     'maroon',
     'green',
     'olive',
     'navy',
     'purple',
     'teal',
     'silver',
   },
   brights = {
     'grey',
     'red',
     'lime',
     'yellow',
     'blue',
     'fuchsia',
     'aqua',
     'white',
   },
 
   -- Arbitrary colors of the palette in the range from 16 to 255
   indexed = { [136] = '#af8700' },
 
   -- Since: 20220319-142410-0fcdea07
   -- When the IME, a dead key or a leader key are being processed and are effectively
   -- holding input pending the result of input composition, change the cursor
   -- to this color to give a visual cue about the compose state.
   compose_cursor = 'orange',
 
   -- Colors for copy_mode and quick_select
   -- available since: 20220807-113146-c2fee766
   -- In copy_mode, the color of the active text is:
   -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
   -- 2. selection_* otherwise
   copy_mode_active_highlight_bg = { Color = '#000000' },
   -- use `AnsiColor` to specify one of the ansi color palette values
   -- (index 0-15) using one of the names "Black", "Maroon", "Green",
   --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
   -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
   copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
   copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
   copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },
 
   quick_select_label_bg = { Color = 'peru' },
   quick_select_label_fg = { Color = '#ffffff' },
   quick_select_match_bg = { AnsiColor = 'Navy' },
   quick_select_match_fg = { Color = '#ffffff' },
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#fff',

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#2b2042',
      -- The color of the text for the tab
      fg_color = '#c0c0c0',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.3,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}
config.keys = {
  { key = 'z', mods = 'ALT', action = wezterm.action.ShowLauncher },
}


if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  ssh_cmd = { "pwsh.exe" }

  table.insert(
    launch_menu,
    {
      label = "PowerShell",
      args = { "D:/Program Files/PowerShell/7/pwsh.exe", "-NoLogo" }
    }
  )

  table.insert(
    launch_menu,
    {
      label = "Bash",
      args = { "D:/Program Files/Git/bin/bash.exe" }
    }
  )

  table.insert(
    launch_menu,
    {
      label = "CMD",
      args = { "cmd.exe" }
    }
  )
  config.default_prog = {'pwsh'}

  elseif wezterm.target_triple == 'aarch64-apple-darwin' then
    table.insert(launch_menu, {
        label = 'bash',
        args = {'/bin/bash', '-l'}
    })
    default_prog = {'/bin/bash', '-l'}
end


config.launch_menu = launch_menu
config.window_background_image = wezterm.home_dir .. "/.config/wezterm/images/code-wallpaper-6.png"
-- config.window_background_opacity = 0.9
config.color_scheme = 'AdventureTime'


return config
