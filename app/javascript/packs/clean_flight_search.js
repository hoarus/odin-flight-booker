function checkSearchResults(){
  const search_error = document.querySelector('#search-error');
  const flight_details = document.querySelector('.flight-details');
  const flight_containers = document.getElementsByClassName('flight-container');
  if (flight_details) {
    if (flight_containers.length == 0) {
      flight_details.classList.add('hidden');
      search_error.classList.remove('hidden');
    } else {
      flight_details.classList.remove('hidden');
      search_error.classList.add('hidden');
    }
  }
  
}



checkSearchResults();