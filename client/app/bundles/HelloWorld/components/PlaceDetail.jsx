import React from 'react';

const PlaceDetail = (props, _railsContext) => {
  return (
    <div className="">
      <div className="details">
        <div>{props.title}</div>
        <div>{props.description}</div>
      </div>
    </div>
  );
};

export default PlaceDetail;
