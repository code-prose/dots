# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

# Catppuccin Mocha palette
catppuccin = {
    'rosewater': '#F5E0DC',
    'flamingo':  '#F2CDCD',
    'pink':      '#F5C2E7',
    'mauve':     '#CBA6F7',
    'red':       '#F38BA8',
    'maroon':    '#EBA0AC',
    'peach':     '#FAB387',
    'yellow':    '#F9E2AF',
    'green':     '#A6E3A1',
    'teal':      '#94E2D5',
    'sky':       '#89DCEB',
    'sapphire':  '#74C7EC',
    'blue':      '#89B4FA',
    'lavender':  '#B4BEFE',
    'text':      '#CDD6F4',
    'subtext1':  '#BAC2DE',
    'subtext0':  '#A6ADC8',
    'overlay2':  '#9399B2',
    'overlay1':  '#7F849C',
    'overlay0':  '#6C7086',
    'surface2':  '#585B70',
    'surface1':  '#45475A',
    'surface0':  '#313244',
    'base':      '#1E1E2E',
    'mantle':    '#181825',
    'crust':     '#11111B',
}

# Statusbar
c.colors.statusbar.normal.bg = "#00000000"
c.colors.statusbar.command.bg = "#00000000"
c.colors.statusbar.command.fg = catppuccin['text']
c.colors.statusbar.normal.fg = catppuccin['teal']
c.colors.statusbar.passthrough.bg = catppuccin['mauve']
c.colors.statusbar.passthrough.fg = catppuccin['base']
c.colors.statusbar.insert.bg = catppuccin['green']
c.colors.statusbar.insert.fg = catppuccin['base']
c.colors.statusbar.caret.bg = catppuccin['peach']
c.colors.statusbar.caret.fg = catppuccin['base']
c.colors.statusbar.url.fg = catppuccin['pink']
c.colors.statusbar.url.success.http.fg = catppuccin['teal']
c.colors.statusbar.url.success.https.fg = catppuccin['pink']
c.colors.statusbar.url.hover.fg = catppuccin['sky']
c.colors.statusbar.url.warn.fg = catppuccin['yellow']
c.colors.statusbar.url.error.fg = catppuccin['red']

# Tabs
c.colors.tabs.even.bg = "#00000000"
c.colors.tabs.odd.bg = "#00000000"
c.colors.tabs.bar.bg = "#00000000"
c.colors.tabs.even.fg = catppuccin['overlay1']
c.colors.tabs.odd.fg = catppuccin['overlay1']
c.colors.tabs.selected.even.bg = catppuccin['surface1']
c.colors.tabs.selected.odd.bg = catppuccin['surface1']
c.colors.tabs.selected.even.fg = catppuccin['text']
c.colors.tabs.selected.odd.fg = catppuccin['text']
c.colors.tabs.indicator.start = catppuccin['mauve']
c.colors.tabs.indicator.stop = catppuccin['green']
c.colors.tabs.indicator.error = catppuccin['red']

c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0 # no tab indicators
c.tabs.width = "15%"
c.tabs.position = "left"
c.fonts.web.size.default = 20
c.tabs.title.format = "[{index:02}] {audio}{current_title}"
c.tabs.show = "multiple"
config.bind("<Alt-w>", "config-cycle tabs.width 5% 20%")

# Hints
c.colors.hints.bg = catppuccin['mauve']
c.colors.hints.fg = catppuccin['base']
c.colors.hints.match.fg = catppuccin['surface0']
c.hints.border = '1px solid ' + catppuccin['mauve']

# Completion
c.colors.completion.odd.bg = catppuccin['mantle']
c.colors.completion.even.bg = catppuccin['mantle']
c.colors.completion.fg = catppuccin['text']
c.colors.completion.category.bg = catppuccin['base']
c.colors.completion.category.fg = catppuccin['mauve']
c.colors.completion.category.border.top = catppuccin['base']
c.colors.completion.category.border.bottom = catppuccin['base']
c.colors.completion.item.selected.bg = catppuccin['surface1']
c.colors.completion.item.selected.fg = catppuccin['text']
c.colors.completion.item.selected.border.top = catppuccin['surface1']
c.colors.completion.item.selected.border.bottom = catppuccin['surface1']
c.colors.completion.item.selected.match.fg = catppuccin['peach']
c.colors.completion.match.fg = catppuccin['peach']
c.colors.completion.scrollbar.bg = catppuccin['mantle']
c.colors.completion.scrollbar.fg = catppuccin['surface1']

# Messages
c.colors.messages.info.bg = catppuccin['base']
c.colors.messages.info.fg = catppuccin['text']
c.colors.messages.info.border = catppuccin['base']
c.colors.messages.warning.bg = catppuccin['peach']
c.colors.messages.warning.fg = catppuccin['base']
c.colors.messages.warning.border = catppuccin['peach']
c.colors.messages.error.bg = catppuccin['red']
c.colors.messages.error.fg = catppuccin['base']
c.colors.messages.error.border = catppuccin['red']

# Downloads
c.colors.downloads.bar.bg = catppuccin['base']
c.colors.downloads.start.bg = catppuccin['blue']
c.colors.downloads.start.fg = catppuccin['base']
c.colors.downloads.stop.bg = catppuccin['green']
c.colors.downloads.stop.fg = catppuccin['base']
c.colors.downloads.error.bg = catppuccin['red']
c.colors.downloads.error.fg = catppuccin['base']

# Prompts
c.colors.prompts.bg = catppuccin['mantle']
c.colors.prompts.fg = catppuccin['text']
c.colors.prompts.border = '1px solid ' + catppuccin['surface0']
c.colors.prompts.selected.bg = catppuccin['surface1']
c.colors.prompts.selected.fg = catppuccin['text']

# Keyhint
c.colors.keyhint.bg = catppuccin['mantle']
c.colors.keyhint.fg = catppuccin['text']
c.colors.keyhint.suffix.fg = catppuccin['peach']

# Context menu
c.colors.contextmenu.menu.bg = catppuccin['base']
c.colors.contextmenu.menu.fg = catppuccin['text']
c.colors.contextmenu.selected.bg = catppuccin['surface1']
c.colors.contextmenu.selected.fg = catppuccin['text']
c.colors.contextmenu.disabled.bg = catppuccin['mantle']
c.colors.contextmenu.disabled.fg = catppuccin['overlay0']

# Webpage
c.colors.tooltip.bg = catppuccin['base']
c.colors.tooltip.fg = catppuccin['text']
c.colors.webpage.bg = catppuccin['base']

c.url.start_pages = ["https://github.com/code-prose"]
c.url.default_page = "https://github.com/code-prose"

c.tabs.title.format = "{audio}{current_title}"
c.fonts.web.size.default = 20

c.url.searchengines = {
# note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        '!aw': 'https://wiki.archlinux.org/?search={}',
        '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
        '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
        '!yt': 'https://www.youtube.com/results?search_query={}',
}

c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

config.load_autoconfig() # load settings done via the gui

c.auto_save.session = True # save tabs on quit/restart

# keybinding changes
config.bind('=', 'cmd-set-text -s :open')
config.bind('h', 'history')
config.bind('cc', 'hint images spawn sh -c "cliphist link {hint-url}"')
config.bind('cs', 'cmd-set-text -s :config-source')
config.bind('tH', 'config-cycle tabs.show multiple never')
config.bind('sH', 'config-cycle statusbar.show always never')
config.bind('T', 'hint links tab')
config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('pt', 'open -t -- {clipboard}')
config.bind('qm', 'macro-record')
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
config.bind('tT', 'config-cycle tabs.position top left')
config.bind('gJ', 'tab-move +')
config.bind('gK', 'tab-move -')
config.bind('gm', 'tab-move')

# Proton Pass integration
config.bind('zl', 'spawn --userscript qute-proton-pass')
config.bind('zu', 'spawn --userscript qute-proton-pass --username-only')
config.bind('zp', 'spawn --userscript qute-proton-pass --password-only')

# dark mode
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')


# window
c.window.transparent = True
c.window.hide_decoration = True

# editor
c.editor.command = ['/opt/homebrew/bin/alacritty', '-e', 'nvim', '{file}', '-c', 'normal {line}G{column0}l']

# fonts
c.fonts.default_family = []
c.fonts.default_size = '16pt'
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'

# privacy - adjust these settings based on your preference
# config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False) # tsh keybind to toggle

c.content.blocking.enabled = True
c.content.blocking.method = 'adblock' # uncomment this if you install python-adblock
c.content.blocking.adblock.lists = [
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
]
