# config/initializers/paperclip.rb
Paperclip::Attachment.default_options.merge!(
  storage: :s3,
  s3_host_name: ENV['S3_BUCKET_ENDPOINT'],
  bucket: ENV['S3_BUCKET_NAME']
)

Rails.application.config.paperclip_defaults = {
  s3_credentials: {
    bucket: ENV['S3_BUCKET_NAME']
  }
}
