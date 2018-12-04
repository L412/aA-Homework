import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import applyMiddleware from "redux";

function addLoggingToDispatch(store) {
  return function(next){
    return function(action){
      console.log("store.getState(): ", store.getState());
          console.log("action: ", action);
          next(action);
          console.log("store.getState(): ", store.getState());
    }
  }
}

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
