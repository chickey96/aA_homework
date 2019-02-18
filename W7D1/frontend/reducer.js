import selectLocation from './actions';
const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case "SWITCH LOCATION":
      return ({
        city: action.city,
        jobs: action.jobs,
        id: action.id,
      });
      
    default:
      return state;
  }
};

window.reducer = reducer;

export default reducer;
