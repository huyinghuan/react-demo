define ["react", "service", "c/form/select"], (React, BaseFormService, SimpleSelect)->
  
  class Biz extends BaseFormService
    constructor: ->
    
  biz = new Biz()

  bean = 
    getData: (name)-> biz[name]()
    
    formChange: (name, value)->
      console.log(name, " changed to ", value)
    
    finishInit: (name, value)->
      console.log(name, " init to ", value)
      
  getParams = ->
    address: "湘潭"

  React.createClass({

    #初始化 state
    getInitialState: -> null

    #初始化props
    getDefaultProps: -> null

    render: -> 
      (
        <div>
          <SimpleSelect name="address" bean={bean} init={true}， params={getParams()}/>
        </div>
      )
})