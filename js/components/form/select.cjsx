define ["react"], (React)->
    React.createClass({
      #加载数据
      loadData: (params = {})->
        name = @props.name
        self = @
        @props.getData(name, params).then((result)->
          self.setState(options: result)
          #TODO 应该触发 finishiInit 函数
          ###
            self.finishiInit(name, result[0])
          ###
        )
      
      #初始化 state
      getInitialState: -> options: []
        
      #自定义属性
      handleChange: (e)->
        @props.formChange(@props.name, e.currentTarget.value)
        
      #初始化props
      getDefaultProps: -> null

      componentWillMount: ->
        @loadData() if @props.init isnt false
        
      componentDidMount: ->
        
      #初始化的时候不会调用，后续依赖改变会调用
      componentWillReceiveProps: (nextProps, nextState)->
        
        return true if @props.init isnt false
        obj = {}
        obj[nextProps.dependName] =  nextProps.depend
        @loadData(obj)
        true
        
      render: ->
        options = @state.options
        (
          <select name={@props.name} onChange={@handleChange}>
            {options.map((item)->
              <option key={item.value or item} value={item.value or item}>{item.name or item}</option>
            )}
          </select>
        )
  })