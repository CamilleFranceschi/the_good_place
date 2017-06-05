// import '../../stylesheets/application.scss';
import { connect } from 'react-redux';


// const initialBooks = [{title: 'book1', id:1},{title: 'book2', id:2},{title: 'book3', id:3}];

class App extends React.Component {


  // addBook(title){
  //   let {books} = this.state;
  //   books.push({title: title});
  //   this.setState({books: books});
  // }

  getSelectedPlace(placeId, places) {
    return places.find(place => place.id === placeId)
  }

  render() {
    // va chercher la variable books dans this.state
    // const {books, selectedBookId, buttonIsClicked} = this.state;
    // console.log(selectedBookId);
    // console.log(this.props.books);
    const {addNewPlace, places, selectedPlaceId, changeSelectedPlace} = this.props;
    // equivalent
    // const books = this.state.books;
    // const selectedBook = {title: 'test', id:4}
    const selectedPlace = this.getSelectedPlace(selectedPlaceId, places);
    // const currentBook = this.getCurrentBook(books, selectedBookId);
    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to Reac edjieofiephbbbbt</h2>
        </div>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
        <Button text='Add a book with redux' onClick={() => addNewPlace('coucoumonamour'+(new Date().getTime()).toString())}/>
        <Button text='click me 1' onclick={() => alert('cocou 1')}/>
        {/* this.addbook we add a book to app */}
        {/* <Button text='Add a book' onclick={() => this.addBook('hhhhhhh')}/> */}
        {/* <Button text='Next book' onclick={() => this.changeSelectedBook(2)}/> */}
        <PlaceList places={this.props.places} onPlaceItemClick={(placeId) => changeSelectedPlace(placeId)}/>
        <PlaceDetail selectedPlace={selectedPlace}/>
        {/* <Button text={buttonIsClicked ? 'coucou' : 'hello'} buttonIsClicked={buttonIsClicked} onclick={() => this.setState({ */}
            {/* buttonIsClicked: !buttonIsClicked */}
          {/* })}/> */}
      </div>
    );
  }
}
const mapStateToProps = ({place}) => ({
  places: place.places,
  selectedPlaceId: place.selectedPlaceId,
  // initialBooks: state.book.books
})

const mapDispatchToProps = dispatch => ({
  addNewPlace: (bookTitle) => dispatch({
    type: 'ADD_PLACE',
    newPlace: {id: new Date().getTime(), title: placeTitle}}),
  changeSelectedPlace: (placeId) => dispatch({
    type: 'SELECT_PLACE',
    placeId: placeId}),
})

export default connect(mapStateToProps, mapDispatchToProps)(App)
