import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// function addLoggingToDispatch(store) {
//   const disp = store.dispatch;
//   return function(action) {
//     console.log("store.getState(): ", store.getState());
//     console.log("action: ", action);
//     disp(action);
//     console.log("store.getState(): ", store.getState());
//   }
// }

// 
// function applyMiddlewares(store, ...middleWare){
//   let dispatch = store.dispatch;
//   middleWare.forEach( middle => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch })
// }

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // store.dispatch = addLoggingToDispatch(store);
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
