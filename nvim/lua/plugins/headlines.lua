-- ============================================================================
-- HEADLINES.NVIM CONFIGURATION FOR LOGSEQ MARKDOWN WORKSPACE
-- ============================================================================
-- Add this file to your lazy.nvim plugins directory
-- e.g., ~/.config/nvim/lua/plugins/headlines.lua

return {
  "lukas-reineke/headlines.nvim",
  dependencies = "nvim-treesitter/nvim-treesitter",
  ft = "markdown",
  opts = function()
    return {
      -- ========================================================================
      -- MARKDOWN CONFIGURATION
      -- ========================================================================
      markdown = {
        -- Headline highlighting
        headline_highlights = {
          "Headline1",
          "Headline2",
          "Headline3",
          "Headline4",
          "Headline5",
          "Headline6",
        },
        
        -- Code block highlighting
        codeblock_highlight = "CodeBlock",
        
        -- Dash used for headlines
        dash_highlight = "Dash",
        dash_string = "-",
        
        -- Quote highlighting
        quote_highlight = "Quote",
        quote_string = "┃",
        
        -- Fat headlines with decorative borders
        fat_headlines = true,
        fat_headline_upper_string = "▃",
        fat_headline_lower_string = "🬂",
        
        -- Bullets for list items (Logseq-friendly)
        bullets = { "◉", "○", "✸", "✿" },
        bullet_highlights = {
          "@text.title.1.marker.markdown",
          "@text.title.2.marker.markdown",
          "@text.title.3.marker.markdown",
          "@text.title.4.marker.markdown",
        },
      },
    }
  end,

  -- ========================================================================
  -- POST-SETUP CONFIGURATION
  -- ========================================================================
  config = function(_, opts)
    -- Setup headlines with options
    require("headlines").setup(opts)

    -- ========================================================================
    -- TOKYONIGHT THEME COLORS
    -- ========================================================================
    local function setup_highlights()
      -- Headline colors (TokyoNight Storm palette)
      vim.api.nvim_set_hl(0, "Headline1", {
        bg = "#1f2335",
        fg = "#9ece6a",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "Headline2", {
        bg = "#1f2335",
        fg = "#7aa2f7",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "Headline3", {
        bg = "#1f2335",
        fg = "#bb9af7",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "Headline4", {
        bg = "#1f2335",
        fg = "#f7768e",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "Headline5", {
        bg = "#1f2335",
        fg = "#2ac3de",
        bold = true,
      })
      vim.api.nvim_set_hl(0, "Headline6", {
        bg = "#1f2335",
        fg = "#ff9e64",
        bold = true,
      })

      -- Code block highlighting
      vim.api.nvim_set_hl(0, "CodeBlock", {
        bg = "#1a1b26",
      })

      -- Quote highlighting
      vim.api.nvim_set_hl(0, "Quote", {
        fg = "#565f89",
        italic = true,
      })

      -- Dash/separator highlighting
      vim.api.nvim_set_hl(0, "Dash", {
        fg = "#414868",
        bold = true,
      })
    end

    -- Apply highlights immediately
    setup_highlights()

    -- Reapply highlights on colorscheme change
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("HeadlinesHighlights", { clear = true }),
      callback = setup_highlights,
    })

    -- ========================================================================
    -- KEYMAPS
    -- ========================================================================
    local function setup_keymaps()
      -- Toggle headlines highlighting
      vim.keymap.set("n", "<leader>th", function()
        if vim.g.headlines_enabled == nil then
          vim.g.headlines_enabled = true
        end
        
        vim.g.headlines_enabled = not vim.g.headlines_enabled
        
        if vim.g.headlines_enabled then
          require("headlines").refresh()
          vim.notify("Headlines enabled", vim.log.levels.INFO)
        else
          require("headlines").disable()
          vim.notify("Headlines disabled", vim.log.levels.INFO)
        end
      end, { desc = "Toggle Headlines highlighting" })

      -- Refresh headlines
      vim.keymap.set("n", "<leader>hr", function()
        require("headlines").refresh()
        vim.notify("Headlines refreshed", vim.log.levels.INFO)
      end, { desc = "Refresh Headlines" })
    end

    setup_keymaps()

    -- ========================================================================
    -- AUTO-COMMANDS FOR LOGSEQ WORKFLOW
    -- ========================================================================
    local group = vim.api.nvim_create_augroup("HeadlinesLogseq", { clear = true })

    -- Auto-refresh headlines when entering markdown buffers
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = "markdown",
      callback = function()
        vim.defer_fn(function()
          local ok, headlines = pcall(require, "headlines")
          if ok then
            headlines.refresh()
          end
        end, 100)
      end,
    })

    -- Refresh headlines after saves
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = group,
      pattern = "*.md",
      callback = function()
        local ok, headlines = pcall(require, "headlines")
        if ok then
          headlines.refresh()
        end
      end,
    })

    -- Special handling for Logseq journal and pages directories
    vim.api.nvim_create_autocmd("BufEnter", {
      group = group,
      pattern = { "*/journals/*.md", "*/pages/*.md" },
      callback = function()
        -- Enable headlines by default for Logseq files
        vim.g.headlines_enabled = true
        vim.defer_fn(function()
          local ok, headlines = pcall(require, "headlines")
          if ok then
            headlines.refresh()
          end
        end, 150)
      end,
    })
  end,
}

-- ============================================================================
-- TOKYONIGHT COLOR REFERENCE
-- ============================================================================

--[[

## TOKYONIGHT STORM COLORS USED

Headline1: Green (#9ece6a)    - For top-level headings
Headline2: Blue (#7aa2f7)     - For second-level headings
Headline3: Purple (#bb9af7)   - For third-level headings
Headline4: Red (#f7768e)      - For fourth-level headings
Headline5: Cyan (#2ac3de)     - For fifth-level headings
Headline6: Orange (#ff9e64)   - For sixth-level headings

Background: Dark (#1f2335)    - For headline backgrounds
CodeBlock: Darker (#1a1b26)   - For code block backgrounds
Quote: Muted (#565f89)        - For quote text
Dash: Subtle (#414868)        - For separators

## ALTERNATIVE: TOKYONIGHT NIGHT (DARKER)

If you prefer the darker Night variant, replace setup_highlights() with:

vim.api.nvim_set_hl(0, "Headline1", { bg = "#16161e", fg = "#9ece6a", bold = true })
vim.api.nvim_set_hl(0, "Headline2", { bg = "#16161e", fg = "#7aa2f7", bold = true })
vim.api.nvim_set_hl(0, "Headline3", { bg = "#16161e", fg = "#bb9af7", bold = true })
vim.api.nvim_set_hl(0, "Headline4", { bg = "#16161e", fg = "#f7768e", bold = true })
vim.api.nvim_set_hl(0, "Headline5", { bg = "#16161e", fg = "#2ac3de", bold = true })
vim.api.nvim_set_hl(0, "Headline6", { bg = "#16161e", fg = "#ff9e64", bold = true })
vim.api.nvim_set_hl(0, "CodeBlock", { bg = "#1a1b26" })
vim.api.nvim_set_hl(0, "Quote", { fg = "#565f89", italic = true })
vim.api.nvim_set_hl(0, "Dash", { fg = "#414868", bold = true })

## ALTERNATIVE: TOKYONIGHT DAY (LIGHT)

For a light theme variant:

vim.api.nvim_set_hl(0, "Headline1", { bg = "#e1e2e7", fg = "#33635c", bold = true })
vim.api.nvim_set_hl(0, "Headline2", { bg = "#e1e2e7", fg = "#34548a", bold = true })
vim.api.nvim_set_hl(0, "Headline3", { bg = "#e1e2e7", fg = "#5a4a78", bold = true })
vim.api.nvim_set_hl(0, "Headline4", { bg = "#e1e2e7", fg = "#8c4351", bold = true })
vim.api.nvim_set_hl(0, "Headline5", { bg = "#e1e2e7", fg = "#0f4b6e", bold = true })
vim.api.nvim_set_hl(0, "Headline6", { bg = "#e1e2e7", fg = "#965027", bold = true })
vim.api.nvim_set_hl(0, "CodeBlock", { bg = "#d5d6db" })
vim.api.nvim_set_hl(0, "Quote", { fg = "#9699a3", italic = true })
vim.api.nvim_set_hl(0, "Dash", { fg = "#a8aecb", bold = true })

]]

-- ============================================================================
-- USAGE AND FEATURES
-- ============================================================================

--[[

## FEATURES

1. **Beautiful headline highlighting** with TokyoNight Storm colors
2. **Code block background** for better visual separation
3. **Quote styling** with custom vertical bar
4. **Fat headlines** with decorative borders
5. **Custom bullets** for list items (perfect for Logseq)
6. **Auto-refresh** on file save and buffer enter
7. **Toggle capability** to enable/disable on demand

## KEY MAPPINGS

- <leader>th : Toggle headlines highlighting on/off
- <leader>hr : Refresh headlines manually

## LOGSEQ-SPECIFIC FEATURES

- Auto-enables for files in journals/ and pages/ directories
- Works seamlessly with Logseq's block structure
- Compatible with Logseq's markdown syntax
- Refreshes automatically after saves
- Custom bullets match Logseq's visual style

## INSTALLATION REQUIREMENTS

Requires nvim-treesitter with markdown parser:
:TSInstall markdown markdown_inline

## TROUBLESHOOTING

If headlines don't show:
1. Check treesitter parser: :TSInstallInfo
2. Manually refresh: <leader>hr or :lua require("headlines").refresh()
3. Check if enabled: :lua print(vim.g.headlines_enabled)
4. Check highlights: :highlight Headline1

## CUSTOMIZATION

To change bullet styles, modify the bullets table in opts:
bullets = { "●", "○", "◆", "◇" }  -- Your custom bullets

To disable fat headlines:
fat_headlines = false

To change the separator character:
dash_string = "─"  -- or "═" or "━"

To adjust colors, modify the setup_highlights() function.
See alternative TokyoNight variants above!

]]
