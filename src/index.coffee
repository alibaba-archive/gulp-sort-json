through2 = require 'through2'

handler = (data) ->
  keys = Object.keys(data).sort()

  fileJSON = "{\n"
  for key, index in keys
    escape = data[key].replace(/"/g, "\\\"")
    val = "  \"#{key}\": \"#{escape}\""
    if index isnt keys.length - 1
      val += ","

    fileJSON += "#{val}\n"

  fileJSON += "}"
  fileJSON


module.exports = ->
  through2.obj (file, enc, cb) ->
    return cb(null, file) if file.isNull()

    try
      ctx = file.contents.toString('utf8')
      file.contents = new Buffer(handler(JSON.parse(ctx)))
      cb(null, file)
    catch e
      cb(e, file)