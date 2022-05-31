Apipie.configure do |config|
  config.app_name                = 'Armies'
  config.app_info                = 'The Armies API documentation'
  config.api_base_url            = '/'
  config.doc_base_url            = '/apipie'
  config.show_all_examples       = true
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
