import React from 'react'

export default class Modal extends React.Component {
  constructor(props, _railsContext) {
    super(props)

    this.state = { isShowing: false }
  }

  showModal = () => {
    this.setState({ isShowing: true })
  }

  hideModal = () => {
    this.setState({ isShowing: false })
  }

  render() {
    return (
      <span>
        <button type='button' className={`btn btn-default ${this.props.buttonClass}`} onClick={this.showModal}>
          {this.props.buttonText}
        </button>
        {this.state.isShowing &&
          <div className='modal-main'>
            <div className='modal-backdrop' onClick={this.hideModal}>

            </div>
            <div className='modal-content'>
              <div className='modal-header'>
                {this.props.title}
              </div>
              <div className='modal-text'>
                {this.props.children}
              </div>
            </div>
          </div>}
      </span>
    )
  }
}
