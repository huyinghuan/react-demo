define ["react", "c/form/select"], (React, SimpleSelect)->
    
    getHtml = ->
    
    bean = 
      getData: ->
        [1, 2, 3]
    
    form = 
      address: 
        name: "address"
        bean: bean
        
    
    React.createClass({
      displayName: 'example'
      
      #初始化 state
      getInitialState: -> form
      
      #初始化props
      getDefaultProps: -> null

      render: -> 
        (
          <div>
            <SimpleSelect {...@state.address}/>
          </div>
        )
  })