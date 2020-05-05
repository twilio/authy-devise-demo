window.addEventListener('DOMContentLoaded', function() { 
  var authySuccess = function(event) {
    var data = event.detail[0];
    if (data && data.message) {
      alert(data.message);
    }
  }
  var requestSmsLink = document.getElementById('authy-request-sms-link');
  var requestPhoneCallLink = document.getElementById('authy-request-phone-call-link');
  if (requestSmsLink) {
    requestSmsLink.removeEventListener('ajax:success', authySuccess);
    requestSmsLink.addEventListener('ajax:success', authySuccess);
  }
  if (requestPhoneCallLink) {
    requestPhoneCallLink.removeEventListener('ajax:success', authySuccess);
    requestPhoneCallLink.addEventListener('ajax:success', authySuccess);
  }
});