# Be sure to restart your server when you modify this file.

Rails.application.config.cache_store = :redis_store, { host: 'localhost',
                                                       port: 6379,
                                                       namespace: "currency_forecast_#{Rails.env}",
                                                       expires_in: 6.hours }
