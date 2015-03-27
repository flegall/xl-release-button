require 'coffee-script'
Requests = require './requests.coffee'
readline = require 'readline'
open = require 'open'

rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

rl.question "Press the button when you're ready to RELEASE !", (answer) ->
  if (answer == "redButton.command")
    rl.close()

    configuration = require('./config.js')
    serverUrl = configuration.serverUrl
    authentication = configuration.authentication
    releaseStartForm = configuration.releaseStartForm

    url = "api/v1/templates/Applications/#{configuration.templateId}/start"
    Requests.post(url, releaseStartForm, {authentication, serverUrl}).then (result) ->
      createdReleaseId = result.getBody().id.replace('Applications/', '')
      console.log createdReleaseId
      open "#{serverUrl}/#/releases/#{createdReleaseId}"
