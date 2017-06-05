import App from './App';
import registerServiceWorker from './registerServiceWorker';
import './index.css';

import React from 'react';
import ReactDOM from 'react-dom';
import{createStore, combineReducers } from 'redux';
import { Provider } from 'react-redux';
import { Router, Route, browserHistory } from 'react-router';
import { syncHistoryWithStore, routerReducer } from 'react-router-redux';

import reducers from './reducers';

import store from './store';
// Add the reducer to your store on the `routing` key
// const store = createStore(
//   combineReducers({
//     ...reducers,
//     routing: routerReducer
//   })
// )

const history = syncHistoryWithStore(browserHistory, store);


ReactDOM.render(
  <Provider store={store}>
    {/* <App /> */}
      <Router history={history}>
      {/* path always a string if path then this component */}
        {/* <div> */}
          {/* <Switch> */}
            {/* for more specific to less specific */}
            {/* <Route path="/posts/new" component={BookNew} /> */}
            {/* <Route path="/posts/:id" component={PostsShow} /> */}
            <Route path="/" component={App} />
          {/* </Switch> */}
        {/* <Route path="/hello" component={Hello}/>
        <Route path="/goodbye" component={Goodbye}/> */}
        {/* </div> */}
      </Router>
    </Provider>,
  document.getElementById('root'));
registerServiceWorker();
