// Use jQuery in noConflict mode
var $j = jQuery.noConflict();

// Wait for the DOM to be fully loaded
$j(document).ready(function() {
  // Add a click event listener to elements with the 'next-item-img' class
  $j('.next-item-img').click(function() {
    // Log a message to the console when the image is clicked
    console.log("Clicked on next item image");

    // Get the source attribute of the clicked image
    var newSrc = $j(this).attr('src');
    console.log("New source: " + newSrc);

    // Set the source attribute of the '.item-box-img' element to the clicked image's source
    $j('.item-box-img').attr('src', newSrc);
  });
});
