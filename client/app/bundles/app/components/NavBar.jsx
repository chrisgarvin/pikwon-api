import React, { PropTypes } from 'react'
import Login from './Login'
import Signup from './Signup'

export default class NavBar extends React.Component {

  logOut = (e) => {
    e.preventDefault()

    $.ajax({
      url: "/logout",
      type: 'DELETE',
      success: function(response, status) {
        console.log("logged out")
      },
      error: function(response, status, err) {
        console.log("An error occured")
      }
    })
  }

  render() {
    return (
      <nav className='navbar navbar-default'>
        <div className='container-fluid'>
          <div className='nav navbar-header pull-right'>
            {!this.props.currentUser &&
              <span>
                <Signup />
                <Login />
              </span>}
            {this.props.currentUser &&
              <span>
                <a className='navbar-text navbar-link' onClick={this.logOut}>Log Out</a>
              </span>}
          </div>
        </div>
      </nav>
    )
  }
}
