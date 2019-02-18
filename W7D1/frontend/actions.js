
const selectLocation = (city, jobs) => ({
  type: "SWITCH LOCATION",
  city: city,
  jobs: jobs
});

window.selectLocation = selectLocation;

export default selectLocation;