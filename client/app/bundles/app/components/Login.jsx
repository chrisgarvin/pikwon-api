import React from 'react'
import { withRouter } from 'react-router';
import Modal from './Modal'

export default class Login extends React.Component {
  login = (e) => {
    e.preventDefault()

    $.ajax({
      url: "/login",
      dataType: 'json',
      type: 'POST',
      data: this.state,
      success: function(response, status) {
        window.location.href = '';
      },
      error: function(response, status, err) {
        console.log("An error occured")
      }
    })
  }

  handleUsernameChange = (e) => {
   this.setState({handle: e.target.value});
  }

  handlePasswordChange = (e) => {
   this.setState({password: e.target.value});
  }

  render() {
    return (
      <Modal buttonText='Login' buttonClass='btn-primary navbar-btn'>
        <form onSubmit={this.login}>
          <div className="form-group row">
            <label>Username</label>
            <input type="text" className="form-control" id="formGroupExampleInput" onChange={this.handleUsernameChange} />
          </div>
          <div className="form-group row">
            <label>Password</label>
            <input type="password" className="form-control" id="formGroupExampleInput" onChange={this.handlePasswordChange} />
          </div>
          <div className="form-group row">
            <div className="col-sm-12">
              <button type="submit" className="pull-right btn btn-primary">Login</button>
            </div>
          </div>
        </form>
      </Modal>
    )
  }
}
