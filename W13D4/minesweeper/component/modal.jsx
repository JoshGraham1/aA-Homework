import React from 'react';

class Modal extends React.Component {
   constructor(props) {
       super(props)
       this.handleClick = this.handleClick.bind(this)
   }
   
   handleClick(e) {
     e.preventDefault();
     this.props.restartGame();
     const body = document.querySelector("body");
     body.classList.remove("ricked");
   }

    render() {
        const body = document.querySelector("body");
        body.classList.add("ricked");
        return (
            <div className="modal">
                <div className="modal-popup">
                    You have {this.props.future}
                    <button onClick={this.handleClick} >Try again</button>
                </div>
            </div>
        )
   }
}

export default Modal;