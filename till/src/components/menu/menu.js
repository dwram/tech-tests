import React from 'react';
import ReactDOM from 'react-dom';
import './menu.css'

class Menu extends React.Component {

    state = {
        value: 0,
        quantities: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        sum: 0,
    }

    handleChange = (e, index) => {
        e.preventDefault()
        let costs = 0;
        const {items} = this.props
        const quantity = parseInt(e.target.value)
        let newQuantities = [...this.state.quantities]

        newQuantities[index] = (e.target.value === '' || e.target.value.match(/\D/)) ? 0 : quantity
        this.setState({quantities: newQuantities})

        Object.keys(items).map((key, item_index) => {
            costs += (newQuantities[item_index] > 0) ? newQuantities[item_index] * items[key] : 0
        });
        this.setState({value: costs})
        this.props.onChange(costs)

    }

    onSubmit = (e) => {
        e.preventDefault()
        this.props.onSubmit(this.state.quantities, this.state.value)
    }

    render() {
        const {items} = this.props
        if (!items) {
            return <div data-testid="menu"><h2>Items</h2></div>
        }
        return (
            <div data-testid="menu" id="menu">
                <h2>Items</h2>
                <div className='container'>
                    <form style={{textAlign: 'center'}}>
                        <div style={{margin: '0px 100px 20px'}}>
                            {
                                Object.keys(items).map((key, index) => {
                                    return (
                                        <li>
                                            <div
                                                key={index}> {(this.state.quantities[index] > 0) ? this.state.quantities[index] + ' x ' : ''} {key} : £{items[key]} {this.state.quantities[index] > 0 ? '-----------> £' + (this.state.quantities[index] * items[key]).toFixed(2) : ''}</div>

                                            <input
                                                type='text'
                                                onChange={e => this.handleChange(e, index)}
                                            />
                                        </li>
                                    )
                                })
                            }
                        </div>
                        <button onClick={this.onSubmit} style={{padding: '2px 15px', visibility: 'visible'}}>
                            Submit
                        </button>
                    </form>
                </div>
            </div>
        )
    }

}

export default Menu;