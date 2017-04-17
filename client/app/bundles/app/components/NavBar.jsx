import React, { PropTypes } from 'react'
import Login from './Login'
import LoggedInMenu from './LoggedInMenu'
import Signup from './Signup'

export default class NavBar extends React.Component {

  render() {
    return (
      <nav className='navbar navbar-default'>
        <div className='container-fluid'>
          <a className="navbar-brand" href='/'>
            pikwon
          </a>
          <div className='nav navbar-header pull-right'>
            {!this.props.currentUser &&
              <span>
                <Signup />
                <Login />
              </span>}
            {this.props.currentUser &&
              <span>
                <LoggedInMenu currentUser={this.props.currentUser} />
              </span>}
          </div>
        </div>
      </nav>
    )
  }
}
