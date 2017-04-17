import React from 'react'

export default class LoggedInMenu extends React.Component {

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
      <ul className="nav navbar-nav navbar-right">
        <li className="dropdown">
          <a href="#" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            {this.props.currentUser.handle} <span className="caret"></span></a>
          <ul className="dropdown-menu">
            <li><a href={`/users/${this.props.currentUser.id}`}>Profile</a></li>
            <li role="separator" className="divider"></li>
            <li><a href="#" onClick={this.logOut}>Log out</a></li>
          </ul>
        </li>
      </ul>
    )
  }
}
