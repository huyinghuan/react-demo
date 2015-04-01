define ["react"], (React)->
  
  Comment = React.createClass(
    {
      render: ->
        (
          <div className="comment">
            <h2 className="commentAuthor">{this.props.author}</h2>
            {this.props.children}
          </div>
        )
    }
  )
  
  CommentList = React.createClass({
    render: ->
      (
        <div className="commentList">
          {@props.data.map((comment)->
            <Comment author={comment.author}>{comment.text}</Comment>
          )}
        </div>
      )
  })
  
  CommentForm = React.createClass({
    render: ->
      (
        <div className="commentForm">
          Hello, world! I am a CommentForm.
        </div>
      )
  })
  
  React.createClass({
    displayName: 'CommentBox'
    #初始化 state
    getInitialState: -> 
      data:  [
        {author: "Pete Hunt", text: "This is one comment"},
        {author: "Jordan Walke", text: "This is *another* comment"}
      ]
      
    #初始化props
    getDefaultProps: -> {className: "a123"}
    
    #校验数据
    propTypes: 
      #支持isRequired的链式调用．该校验仅会给出警告，不会报错！
      validationTest: React.PropTypes.string.isRequired #React.PropTypes.string 
      #自定义也会给出警告
      validationCustome: (props, propName, componentName)-> 
        return new Error("Validation faild!") if not React.PropTypes.string(props, propName, componentName)
    
    render: ->
      (
        <div className="commentBox" {...@props}>
          <a {...@props}></a>
          <h1>Comments</h1>
          <CommentList data={@state.data}/>
          <CommentForm />
        </div>
      )
  })
  
  