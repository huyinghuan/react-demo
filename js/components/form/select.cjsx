define ["react"], (React)->
    React.createClass({
      #加载数据
      loadData: (params = {})->
        name = @props.name
        self = @
        @props.getData(name, params).then((result)->
          self.setState(options: result)
          #触发 finishiInit 函数
          firstItem =  result[0]
          value = firstItem.value or firstItem
          self.props.finishInit(name, value)
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
        #是否自动初始化
        return if @props.init isnt false
        #前后两次依赖的值是否改变
        return if @props.depend is nextProps.depend
        obj = {}
        obj[nextProps.dependName] =  nextProps.depend
        @loadData(obj)
        
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