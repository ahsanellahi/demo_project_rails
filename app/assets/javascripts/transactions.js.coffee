$ ->
  token = $('#client_token').val();
  if (token)
    braintree.setup(token, 'dropin', { container: 'dropin' });
