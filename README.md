# RobloxLsp-plugin-loader
Loads additions for Roblox LSP (lua-language-server).

⚠️ Experimental! Can break with Roblox LSP updates. Use at your own risk! ⚠️

Last tested with Roblox LSP 1.5.9

<br/>

## Installation:

1. Save `plugin-loader.lua` into any directory (Ex. `C:/Users/user/Desktop/rbx-lsp/plugin-loader.lua`).
2. Make a folder named `plugins` in the same directory.
3. Configure Roblox LSP's **Runtime Plugin** path (`robloxLsp.runtime.plugin`) to the `plugin-loader.lua`'s path.
  - Method 1: Search `plugin` in Roblox LSP's extension settings in editor (VSCode) and change the **Runtime Plugin** path.
  - Method 2: Add to editor's `settings.json`: `"robloxLsp.runtime.plugin": "C:/Users/user/Desktop/rbx-lsp/plugin-loader.lua",`

<br/>

## Operation:

Collects the plugins in the `plugins` folder, loading each plugin's `plugin.lua` script.
