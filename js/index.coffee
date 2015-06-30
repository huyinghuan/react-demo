require ["react", "example"],
  (React, Example)->
    React.render React.createElement(Example), document.querySelector("body")
