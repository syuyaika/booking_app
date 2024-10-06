// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require jquery_ujs
//= require_tree .

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';
import 'bootstrap/dist/css/bootstrap';


Rails.start()
ActiveStorage.start()

document.addEventListener("DOMContentLoaded", function() {
    const userInfo = document.getElementById("user-info");
    const dropdownContent = document.getElementById("dropdown-content");
  
    userInfo.addEventListener("click", function(event) {
      dropdownContent.classList.toggle("show");
      event.stopPropagation();
    });
  
    window.addEventListener("click", function(event) {
      if (!userInfo.contains(event.target)) {
        dropdownContent.classList.remove("show");
      }
    });
  });
  
  document.addEventListener('DOMContentLoaded', function() {
  const form = document.querySelector('form');
  if (form) {
    form.addEventListener('submit', function() {
      console.log('Check-in:', document.getElementById('reservation_check_in').value);
      console.log('Check-out:', document.getElementById('reservation_check_out').value);
      console.log('Guests:', document.getElementById('reservation_guests').value);
    });
  } else {
    console.error('Form element not found');
  }
});
