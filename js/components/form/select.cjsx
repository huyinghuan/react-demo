define ["react"], (React)->
    React.createClass({
      displayName: 'simple-select'
      #初始化 state
      getInitialState: -> 
        console.log @props.name, @props.bean
        null

      #初始化props
      getDefaultProps: -> null

      render: ->
        (
          <select name={@props.name}>
            
          </select>
        )
  })