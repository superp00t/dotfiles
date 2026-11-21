# don't load settings from autoconfig.yml (set via :set)
config.load_autoconfig(False)

# dark theme for web pages
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.preferred_color_scheme = 'dark'

# quit qutebrowser if this is the last tab
c.tabs.last_close = 'close'

# enable python-adblock library
c.content.blocking.enabled = True
c.content.blocking.method = "both"

leaderkey = '<Space>'

# <leader>q | close tab
config.bind(leaderkey + 'q', 'tab-close')


