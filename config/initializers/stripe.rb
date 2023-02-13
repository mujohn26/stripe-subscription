Rails.configuration.stripe = {
  publishable_key: "pk_test_51MNs51EBYr4Xth1xY8YDuS7LrsjCjO0ox9N8P8wrggjzZEuDVLl3nREMSGdbBs1r97ndEdyQ8KFHcIjn5zy4e6iH006oXdkcHv",
  secret_key: "sk_test_51MNs51EBYr4Xth1xVSCpJazNIpxmXkeHrkJOXY1KMDZm1y4tHjBJvaBHxaXTpK9wEkmwRk5Bu0thM9b4ew4nw6Jt00n2KlcSFg"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
