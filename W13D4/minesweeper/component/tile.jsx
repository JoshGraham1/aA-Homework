import React from 'react';

class Tile extends React.Component {
    constructor(props) {
        super(props);
        // this.state = {
        //     value: ""
        // }
        this.value = "";
        this.display = this.display.bind(this);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        const tile = this.props.tile;
        if(e.altKey) {
          this.props.updateGame(tile, true)
        } else {
          this.props.updateGame(tile, false)
        }
    }

    display() {
        // const tile = this.props.tile;
        // if(tile.flagged) {
        //     this.setState({ value: "⛳"})
        // } else if (tile.bombed && tile.explored) {
        //     this.setState({ value: "💣"})
        // } else if (tile.explored) {
        //     const count = tile.adjacentBombCount();
        //     this.setState({value: count})
        // } else {
        //   this.setState({value: ""})
        // }


        const tile = this.props.tile;
        if (tile.flagged) {
            this.value = "⛳";
        } else if (tile.bombed && tile.explored) {
            this.value = "💣";
        } else if (tile.explored) {
            const count = tile.adjacentBombCount();
            this.value = count;
        } else {
            this.value = ""
        }
        return this.value;
    }

    render() {
        return <div onClick={this.handleClick} className="tile">{this.display()}</div>
    }
}

export default Tile;