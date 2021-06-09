local editor = {}
local conf = require('modules.editor.config')

editor['rhysd/accelerated-jk'] = {
  opt = true
}

editor['Raimondi/delimitMate'] = {
  event = 'InsertEnter',
  config = conf.delimitmate,
}

return editor
