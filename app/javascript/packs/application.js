// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

$( document ).on('turbolinks:load', function() {

  displayWeightOrPortionFields();

  $('.type-dropdown').change(function(){
    displayWeightOrPortionFields();
  });

  // Switch between showing portion and weight fields
  function displayWeightOrPortionFields() {
    if ($('.type-dropdown').val() === 'PortionBased') {
      $('.weight-group').addClass('d-none');
      $('.portion-group').removeClass('d-none');
    } else {
      $('.weight-group').removeClass('d-none');
      $('.portion-group').addClass('d-none');
    };  
  };

  // Show suggested price for chosen course during daily menu creation
  $('.daily-menu-courses-dropdown').change(function(){
    var quantity = $(this).children('option:selected').data('quantity') + $(this).children('option:selected').data('unit');
    var selected_course = $(this).children('option:selected').val();
    console.log(selected_course)
    $('.pricing-course-' + $(this).data('category-id')).val(selected_course);
    $('#dropdown-' + $(this).data('category-id')).text(quantity);
  });

});
