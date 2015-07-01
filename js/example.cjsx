define ["react", "service", "c/form/select", "chart", "_", "utils"], (React, BaseFormService, SimpleSelect, Chart, _, utils)->
  
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
      utils.setHash(obj)
      switch name
        when "area"
         @setProps({chartParams: utils.getHash()})
          
        
      @setProps(obj)
        
  React.createClass({
    mixins: [bean]
    
    #初始化 state
    getInitialState: -> null

    #初始化props
    getDefaultProps: -> 
      chartParams: {}

    render: -> 
      (
        <div>
          <div>
            <SimpleSelect name="address"
              getData={@getData}
              formChange={@formChange}
              finishInit={@finishInit}
              value={@props.address}
            />
            <SimpleSelect name="area" 
              init={false}
              getData={@getData}
              formChange={@formChange}
              finishInit={@finishInit}
              dependName="address"
              depend={@props.address}/>
          </div>
          <Chart name="memery" params={@props.chartParams}/>
          <Chart name="cpu" params={@props.chartParams}/>
        </div>
      )
})