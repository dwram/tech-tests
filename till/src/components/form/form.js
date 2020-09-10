import React from 'react';
import ReactDOM from 'react-dom';

class Form extends React.Component {
    state = {
        value: 0,
    }

    onSubmit = (e) => {
        e.preventDefault();
        this.props.onSubmit(parseInt(this.state.value))
        this.setState({ value: 0 })
    }

    render() {
      return (
          <form style={{ textAlign: 'center' }}>
              <div style={{ marginRight: '100px' }}>
                  <input
                      type='text'
                      onChange={e => this.setState({ value: e.target.value })}
                      value={this.state.value}
                  />
              </div>
          </form>
      )
    };
}

export default Form;