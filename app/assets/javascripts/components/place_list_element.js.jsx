class PlaceListElement extends React.Component {
  render() {
    // return <h1>{this.props.title}</h1>
    return (
      <div className="product">
        <div className="product-upvote">TODO</div>
        <div className="product-body">
          <h3>
            <a href={this.props.place.url} target="_blank">{this.props.place.title}</a>
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
}


{/* <div class="product">
  <div class='product-upvote'>
    <div class="product-arrow"></div>
    <div class='product-count'>95</div>
  </div>
  <img src="kudoz.jpg" alt="kudoz" class="product-image hidden-xs">
  <div class='product-body'>
    <h3>Kudoz</h3>
    <p>Les meilleures offres d'emploi cadre sur mobile</p>
  </div>
  <ul class="list-inline product-controls product-controls-hidden hidden-sm hidden-xs">
    <li><a href=""><i class="fa fa-heart"></i></a></li>
    <li><a href=""><i class="fa fa-share"></i></a></li>
    <li><a href=""><i class="fa fa-star"></i></a></li>
  </ul>
</div> */}
