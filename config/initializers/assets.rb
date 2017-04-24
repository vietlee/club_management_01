# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += %w(application_admin.js ckeditor/config.js images.js club_manager/select_tag.js manager/select_tag.js chosen.js bootstrap-tagsinput.js)
Rails.application.config.assets.precompile += %w(application_admin.css user_login.scss organization-details.css intro.css)
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
