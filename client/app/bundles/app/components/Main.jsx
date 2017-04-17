import React from 'react'
import NavBar from './NavBar'

export default class Main extends React.Component {
  /**
   * @param props - Comes from your rails view.
   * @param _railsContext - Comes from React on Rails
   */
  constructor(props, _railsContext) {
    super(props)

    this.state = { currentUser: this.props.currentUser }
  }

  render() {
    return (
      <div className='container-fluid'>
        <NavBar currentUser={this.state.currentUser} />
      </div>
    )
  }
}
