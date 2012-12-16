CarrierWave.configure do |config|
  config.sftp_host = "gdocs.kflink.com"
  config.sftp_user = "gdocs_user"
  config.sftp_folder = "gdocs.kflink.com"
  config.sftp_url = "http://gdocs.kflink.com"
  config.sftp_options = {
    :password => "Jh^UzWJB",
    :port     => 22
  }
end
