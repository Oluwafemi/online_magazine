CarrierWave.configure do |config|
	config.fog_credentials = {
		:provider => 'AWS',
		:aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
		:aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
		#:region => 'eu-west-1', # optional, defaults to 'us-east-1'
		#:host => 's3.example.com', # optional, defaults to nil
		#:endpoint => 'https://s3.example.com:8080' # optional, defaults to nil
	}
	config.fog_directory = ENV['FOG_DIRECTORY']
	#config.cache_dir = "#{Rails.root}/tmp/uploads"
	config.fog_public     = false
	config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
end