define ["q"], (Q)->
  class Service
    constructor: (@service)->
    q: (value)->
      deferred = Q.defer()
      deferred.resolve(value)
      deferred.promise
    
    address: ->
      @q([
        {value:"0731", name:"长沙"}
        {value:"0732", name:"株洲"}
      ])
      
    area: (params)->
      def = {
        "0731": [
          {name: "芙蓉", value: "fr"}
          {name: "天心", value: "tx"}
        ]
        "0732": [
          {name: "天元", value: "ty"}
          {name: "石峰", value: "sf"}
        ]
      }
      @q(def[params.address])
      
      
  