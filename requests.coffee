requestify = require 'requestify'


class Requests
  @DEFAULT_SERVER_URL: 'http://localhost:5516'
  @DEFAULT_AUTHENTICATION: {username: 'admin', password: 'admin'}

  @get: (path, optionalArguments) ->
    @doRequest(path, 'GET', optionalArguments)

  @post: (path, body, optionalArguments) ->
    @doRequest(path, 'POST', optionalArguments, body)

  @put: (path, body, optionalArguments) ->
    @doRequest(path, 'PUT', optionalArguments, body)

  @delete: (path, optionalArguments) ->
    @doRequest(path, 'DELETE', optionalArguments)

  @doRequest: (path, method, optionalArguments, body) ->
    {params, authentication, serverUrl} = optionalArguments if optionalArguments

    options =
      method: method
      body: body
      auth: authentication || @DEFAULT_AUTHENTICATION
      params: params || {}

    serverUrl = serverUrl || @DEFAULT_SERVER_URL

    requestify.request "#{serverUrl}/#{path}", options


module.exports = Requests
