define ["react", "service", "c/form/select", "chart", "_", "utils"], (React, BaseFormService, SimpleSelect, Chart, _, utils)->
  
  class Biz extends BaseFormService
    constructor: ->
    
  biz = new Biz()    
  
  bean =
    getData: (name, params)-> biz[name](params)

    formChange: (name, value)->
      obj = {}
      obj[name] = value
      utils.setHash(obj)
      switch name
        when "address"
          @setProps(obj)
        when "area"
          @setState({chartParams: utils.getHash()})
        
    finishInit: (name, value)->
      obj = {}
      obj[name] = value
      utils.setHash(obj)
      switch name
        when "address"
          @setProps(obj)
        when "area"
          @setState({chartParams: utils.getHash()})
          

      
  React.createClass({
    mixins: [bean]
    
    #初始化 state
    getInitialState: -> {}

    #初始化props
    getDefaultProps: -> {}

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
          <Chart name="memery" params={@state.chartParams}/>
          <Chart name="cpu" params={@state.chartParams}/>
        </div>
      )
})