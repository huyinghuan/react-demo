define ["react"], (React)->
    React.createClass({
      #加载数据
      name = @props.name
      loadData: (params = {})->
        self = @
        @props.bean.getData(name, params).then((result)->
          self.setState(options: result)
          #TODO 应该触发finishiInit函数
          ###
            self.init(name, result[0])
          ###
        )
      
      #初始化 state
      getInitialState: -> options: []
        
      #自定义属性
      handleChange: ->
        @props.bean.formChange(@props.name, React.findDOMNode(@).value)
        
      #初始化props
      getDefaultProps: -> null

      componentDidMount: ->
        @loadData() if @props.init isnt false
          
        
        
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