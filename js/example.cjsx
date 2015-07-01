define ["react", "service", "c/form/select"], (React, BaseFormService, SimpleSelect)->
  
  class Biz extends BaseFormService
    constructor: ->
    
  biz = new Biz()
  bean =
    getData: (name, params)-> biz[name](params)

    formChange: (name, value)->
      obj = {}
      obj[name] = value
      @setProps(obj)
        
    finishInit: (name, value)->
      obj = {}
      obj[name] = value
      @setProps(obj)
        
  React.createClass({
    mixins: [bean]
    
    #初始化 state
    getInitialState: -> null

    #初始化props
    getDefaultProps: ->
      #此处应该模拟　从url的query抽取默认值
      {
        address: "0732"
        area: "fr"
      }
    render: -> 
      (
        <div>
          <SimpleSelect name="address"
            init={true}
            getData={@getData}
            formChange={@formChange}
            finishiInit: {@finishiInit}
            value={@props.address}
          />
          <SimpleSelect name="area" 
            init={false}
            getData={@getData}
            formChange={@formChange}
            dependName="address"
            depend={@props.address}/>
        </div>
      )
})