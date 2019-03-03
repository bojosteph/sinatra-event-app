<script>
  function myFunction() {
  var x = document.getElementById("myDate").value;
  document.getElementById("date").innerHTML = x;
}
</script>

$(document).ready(function () {
  function init() {
    if (localStorage["name"]) {
      $('#name').val(localStorage["name"]);
    }
    if (localStorage["date"]) {
      $('#date').val(localStorage["date"]);
    }
    if (localStorage["location"]) {
      $('#location').val(localStorage["location"]);
    }
    
    if (localStorage["description"]) {
      $('#description').val(localStorage["description"]);
    }
    
  }
  init();
});

$('.stored').keyup(function () {
  localStorage[$(this).attr('name')] = $(this).val();
});

$('#clear').click(function () {
  window.localStorage.clear();
  $('#localStorage').get(0).reset();
});