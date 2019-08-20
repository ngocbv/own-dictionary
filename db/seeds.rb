# Init Dictionary
Dictionary.create!(name: 'Oxford Dictionaries', homepage: 'https://www.oxforddictionaries.com/',
  api_homepage: 'https://developer.oxforddictionaries.com/')
Dictionary.create!(name: 'Words API', homepage: 'https://www.wordsapi.com/',
  api_homepage: 'https://www.wordsapi.com/')
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?