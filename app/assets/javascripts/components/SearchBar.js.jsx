// import React, { Component } from 'react';

class SearchBar extends React.Component {
// to initialize state
// all Js classes have a constructor function
// constructor method is reserved for doing some set up inside of our class like initializing variables
  constructor(props) {
    // take constructor method of Component class
    super(props);
// we pass an object to this.state
// we want to record propery term on the state / We initilize
    this.state = { term: " "};
    // to avoid the error -> cannot rad property 'setState'
    // because this is not the good this it is undifined
    // befor we used arrow fucntion onChange but here we do differently
    // we will bind the context of onInputChange
    // bind the context when we have a callback
    this.onInputChange = this.onInputChange.bind(this);
    // we bind to avoid a "can't raad props of nil" error
    this.onFormSubmit = this.onFormSubmit.bind(this);
  }

  onInputChange(event) {
    console.log(event.target.value);
    // make appear what we write on input bar
    this.setState({term: event.target.value});
  }
  //
  // onInputChange(term) {
  //   console.log({term});
  //   // want to call the callback from the app
  //   this.setState({term});
  //   // this.props.onSearchTermChange(term);
  // }

  // to stop the post requestion on clicking enter or clicking button
  onFormSubmit(event) {
    event.preventDefault();
    // we need to go and fetch weather data
    // this.props.fetchWeather(this.state.term);
    // to clear the search input
    this.setState({term: ""});
  }

  // this is a function
  render() {
    // return <input onChange = {(event) => console.log(event.target.value);} />;
    // to change our state setSate
    return (
      <form onSubmit={this.onFormSubmit} className="input-group">
        <input
          placeholder ="Type your city"
          className="form-control"
          value= {this.state.term}
          // onChange = {event => this.onInputChange(event.target.value)} />
          onChange= {this.onInputChange} />
        <span className="input-group-btn">
          <button type="submit" className="btn btn-secondary"> Go! </button>
        </span>
      </form>
      );
    }

}

// export default SearchBar;
