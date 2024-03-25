local shell_handler = require('runner.handlers.helpers').shell_handler
require('runner').set_handler('cpp', shell_handler('sh build.sh', true))
require('runner').set_handler('odin', shell_handler('odin run .', true))
require('runner').set_handler('cs', shell_handler('dotnet run .', true))
