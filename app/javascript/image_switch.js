import * as $ from 'jquery'; // Import jQuery

// Wait for the DOM to be fully loaded
$(document).ready(function() {
  // Add a click event listener to elements with the 'next-item-img' class
  $('.next-item-img').click(function() {
    // Log a message to the console when the image is clicked
    console.log("Clicked on next item image");

    // Get the source attribute of the clicked image
    var newSrc = $(this).attr('src');
    console.log("New source: " + newSrc);

    // Set the source attribute of the '.item-box-img' element to the clicked image's source
    $('.item-box-img').attr('src', newSrc);
  });
});
