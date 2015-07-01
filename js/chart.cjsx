define ["react"], (React)->
    React.createClass({
      #加载数据
      loadData: (params = {})->
        #TODO
          
      getDefaultProps: -> null
        
      componentDidMount: ->
        container = React.findDOMNode(@)
        #TODO 画图
        
      componentWillReceiveProps: (nextProps, nextState)->
        #TODO 需要每次对比params的值是否改变
        #当非目标select的值改变时，也会触发
        console.log nextProps.params
        @loadData(params)
        
      render: ->
        (
          <div>
            
          </div>
        )
  })