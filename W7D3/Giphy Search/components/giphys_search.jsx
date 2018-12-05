import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "../store/store";
import Root from './root';
import GiphysIndex from './giphys_index';

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
	const root = document.getElementById('root');
	ReactDOM.render(<Root store={store} />, root);
});

//////////

class GiphysSearch extends React.Component {

  constructor() {
     super();
     this.state = { searchTerm: 'balloons' };

     this.handleChange = this.handleChange.bind(this);
     this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
  }

  handleChange(e) {
    this.setState({ searchTerm: e.currentTarget.value });
  }


  render() {
    let { giphys } = this.props;

    return (
      <div>
      <form className="search-bar">
      <input value={this.state.searchTerm} onChange={this.handleChange} />
      <button type="submit" onClick={this.handleSubmit}>Search Giphy</button>
      </form>
      <GiphysIndex giphys={giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
