// populate autocomplete
var startAutocomplete = function(terms) {

}
var termsArray;

var getTerms = function(terms) {
  termsArray = terms;
}

$(document).ready(function() {

  // toggle nav bar on scroll
  var headerBottom = $('.header').offset().top + $('.header').height();

  $(window).on('scroll', function() {
    var threshold = Math.round($(window).scrollTop());

    if (threshold > headerBottom) {
      $('.header').addClass('past-threshold');
    } else {
      $('.header').removeClass('past-threshold');
    }
  });

  // populate autocomplete
  $( "#terms-search" ).autocomplete({
    source: termsArray,
    select: function (event, ui) {
      $(document.body).animate({
        'scrollTop':   $('#' + ui.item.value.replace(' ', '-')).offset().top - 40
      }, 300);
    }
  });
})
