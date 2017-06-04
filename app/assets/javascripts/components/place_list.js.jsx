// import React, { Component } from 'react';


class PlaceList extends React.Component {
  render() {
    // return <h1>{this.props.title}</h1>
    // return <h1>HELLO</h1>
    return (
      <div>
        {this.props.places.map(function(place){
          return <PlaceListElement place={place} key={place.id} />;
        })}
      </div>
    );
  }
}

// export default PlaceList;
