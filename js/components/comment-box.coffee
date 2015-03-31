define ["react"], (React)->
  React.createClass({
    displayName: 'CommentBox'
    render: ->
      React.createElement 'div', {className: "commentBox"}, "Hello, world"
  })