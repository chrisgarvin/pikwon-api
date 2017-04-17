import React from 'react'
import Modal from './Modal'

export default class Signup extends React.Component {

  newUser = (e) => {
    e.preventDefault()

    $.ajax({
      url: "/users",
      dataType: 'json',
      type: 'POST',
      data: { 'user': this.state },
      success: function(response, status) {
        window.location.href = '';
      },
      error: function(response, status, err) {
        console.log("An error occured")
      }
    })
  }

  handleEmailChange = (e) => {
   this.setState({email: e.target.value});
  }

  handleNameChange = (e) => {
   this.setState({name: e.target.value});
  }

  handleUsernameChange = (e) => {
   this.setState({handle: e.target.value});
  }

  handlePasswordChange = (e) => {
   this.setState({password: e.target.value});
  }

  handlePasswordVerifyChange = (e) => {
   this.setState({password_confirmation: e.target.value});
  }

  render() {
    return (
      <Modal buttonText='Sign Up' buttonClass='navbar-btn'>
        <form onSubmit={this.newUser}>
          <div className="form-group row">
            <label>Name</label>
            <input type="text" className="form-control" id="formGroupExampleInput" onChange={this.handleNameChange} />
          </div>
          <div className="form-group row">
            <label>Email</label>
            <input type="text" className="form-control" id="formGroupExampleInput" onChange={this.handleEmailChange} />
          </div>
          <div className="form-group row">
            <label>Username</label>
            <input type="text" className="form-control" id="formGroupExampleInput" onChange={this.handleUsernameChange} />
          </div>
          <div className="form-group row">
            <label>Password</label>
            <input type="password" className="form-control" id="formGroupExampleInput" onChange={this.handlePasswordChange} />
          </div>
          <div className="form-group row">
            <label>Verify password</label>
            <input type="password" className="form-control" id="formGroupExampleInput" onChange={this.handlePasswordVerifyChange} />
          </div>
          <div className="form-group row">
            <div className="col-sm-12">
              <button type="submit" className="pull-right btn btn-primary">Sign up</button>
            </div>
          </div>
        </form>
      </Modal>
    )
  }
}
