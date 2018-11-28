console.log("Hello from the JavaScript console!");

$.ajax({
  type: 'GET',
  url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b',
  success(data) {
    console.log("Here is the forecast:")
    console.log(data);
  },
  error() {
    console.error("Oops, something bad happened!");
  },
});

console.log("This is under the AJAX request.");


// Add another console log here, outside your AJAX request
