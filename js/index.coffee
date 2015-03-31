require ["react", "c/comment-box"],
  (React, CommentBox)->
    React.render React.createElement(CommentBox), document.querySelector("body")
