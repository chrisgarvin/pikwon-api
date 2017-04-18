import React from 'react'

export default class Feed extends React.Component {

  constructor(props, _railsContext) {
    super(props)

    this.state = { post: null }
  }

  componentDidMount = () => {
    this.getPost()
  }

  getPost = () => {
      $.ajax({
        url: "/get_post",
        dataType: 'json',
        success: function(response, status) {
          console.log("Got post")
        },
        error: function(response, status, err) {
          console.log("An error occured")
        }
      }).then((resp) => {
        this.setState(resp)
      })
  }

  render() {
    if (this.props.currentUser) {
      return (
        <div>
          {this.state.post && <div>
            {this.state.post.options[0]}
          </div>}
        </div>
      )
    }

    return (
      <div> You must be logged in </div>
    )
  }
}
