if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_cxvQBm8DbmKYGKgHjQooPNSv00U6H28c29',
    secret_key: 'sk_test_qtHihyy8F5VN4a77SsAAEd5300REkp8yjB'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
