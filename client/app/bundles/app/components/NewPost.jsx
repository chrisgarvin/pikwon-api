import React from 'react'

export default class NewPost extends React.Component {

  constructor(props, _railsContext) {
    super(props)

    this.state = { user_id: null }
  }

  componentDidMount = () => {
    if (!this.props.currentUser){
      window.location.href = '/'
    } else {
      this.setState({user_id: this.props.currentUser.id})
    }
  }

  handleFirstOptionChange = (e) => {
   this.setState({option_1_text: e.target.value});
  }

  handleSecondOptionChange = (e) => {
   this.setState({option_2_text: e.target.value});
  }

  newPost = (e) => {
    e.preventDefault()

    $.ajax({
      url: "/new_post",
      dataType: 'json',
      type: 'POST',
      data: this.state,
      success: function(response, status) {
        window.location.href = '/';
      },
      error: function(response, status, err) {
        console.log("An error occured")
      }
    })
  }

  render() {
    console.log(this.props.currentUser)
    return (
      <form onSubmit={this.newPost}>
        <div className="form-group row">
          <label>Option 1</label>
          <input type="text" className="form-control" id="formGroupExampleInput" onChange={this.handleFirstOptionChange} />
        </div>
        <div className="form-group row">
          <label>Option 2</label>
          <input type="text" className="form-control" id="formGroupExampleInput" onChange={this.handleSecondOptionChange} />
        </div>
        <div className="form-group row">
          <div className="col-sm-12">
            <button type="submit" className="pull-right btn btn-primary">Submit</button>
          </div>
        </div>
      </form>
    )
  }
}
