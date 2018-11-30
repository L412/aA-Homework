import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = { num1: "", num2: "", result: 0 }

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
  }

  setNum1(e) {
    // I don't understand what goes here.
  }

  setNum2(e) {
    // I don't understand what goes here.
  }

  add(e){
    e.preventDefault();
    const res = this.state.num1 + this.state.num2;
    this.setState({ res });
  }

  subtract(e){
    e.preventDefault();
    const res = this.state.num1 - this.state.num2;
    this.setState({ res });
  }

  multiply(e){
    e.preventDefault();
    const res = this.state.num1 * this.state.num2;
    this.setState({ res });
  }

  divide(e){
    e.preventDefault();
    const res = this.state.num1 / this.state.num2;
    this.setState({ res });

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={this.state.num1}/>
        <input onChange={this.setNum2} value={this.state.num2}/>

        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
      </div>
    );
  }
}

export default Calculator;
