function form() {
  var contentNameField = document.getElementById('content-info');
  var eventNameField = document.getElementById('event-info');

  contentNameField.addEventListener('input', function() {
    if (contentNameField.value !== '') {
      eventNameField.setAttribute('disabled', 'disabled');
    } else {
      eventNameField.removeAttribute('disabled');
    }
  });

  eventNameField.addEventListener('input', function() {
    if (eventNameField.value !== '') {
      contentNameField.setAttribute('disabled', 'disabled');
    } else {
      contentNameField.removeAttribute('disabled');
    }
  });
}

document.addEventListener("DOMContentLoaded", form);
document.addEventListener("turbo:load", form);
document.addEventListener("turbo:render", form);