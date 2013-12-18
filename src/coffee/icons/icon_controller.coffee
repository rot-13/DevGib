class DevGib.Icons.IconController

  siteModel: null
  iconView: null
  url: null

  constructor: (anchorEl, @url, @siteModel) ->
    @iconView = new DevGib.Icons.IconView(anchorEl, siteModel)
    _.bindAll(@, '_onFetchScoreSuccess', '_onFetchScoreFailure')

  show: ->
    @iconView.attach()
    @iconView.showSpinner()
#    @siteModel.fetchScoreForURL(@url, @_onFetchScoreSuccess, @_onFetchScoreFailure)

  _onFetchScoreSuccess: (score) ->
    @iconView.showScore(score)

  _onFetchScoreFailure: ->
    @iconView.showError()