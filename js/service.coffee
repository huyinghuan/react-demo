define ["q"], (Q)->
  class Service
    constructor: (@service)->
    q: (value)->
      deferred = Q.defer()
      deferred.resolve(value)
      deferred.promise
    
    address: ->
      @q(["长沙", "株洲", "湘潭"])
      
  