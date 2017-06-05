const PlaceListElement = (props) => {
    // return <h1>{this.props.title}</h1>
    return (
      <div className="product" onClick={() => props.onPlaceItemClick(props.place.id)}>
        <div className="product-upvote">TODO</div>
        <div className="product-body">
          <h3>
            <a href={props.place.url} target="_blank">{props.place.title}</a>
            {/* <a href="#" target="_blank">{this.props.place.title}</a> */}

          </h3>
          {/* <p>{this.props.product.tagline}</p> */}
        </div>
        <div className="product-controls">
          <div className="product-control">
            <div className="user-badge-container ">
              {/* <img src={this.props.product.user.avatar_url} className="avatar"/> */}
            </div>
          </div>
        </div>
      </div>
    );
}
