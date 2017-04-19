import React from 'react'

export default class Profile extends React.Component {

  currentUserProfile = () => {
    if (!this.props.currentUser) return false
    if (this.props.currentUser.id == this.props.profileUser.id) {
      return true
    }
    return false
  }

  profileUserExists = () => {
    if (!this.props.profileUser) return false
    return true
  }

  render() {
    if (this.profileUserExists() && this.currentUserProfile()) {
      return (
        <h1>
          Check out your profile {this.props.currentUser.handle}
        </h1>
      )
    }

    if (this.profileUserExists()){
      return (
        <h1>
          This is {this.props.profileUser.handle}s profile
        </h1>
      )
    }
    return (
      <h1>
        This page does not exists
      </h1>
    )
  }
}
