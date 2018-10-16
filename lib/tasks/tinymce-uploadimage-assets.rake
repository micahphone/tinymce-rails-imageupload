assets_task = 'assets:precompile'

Rake::Task[assets_task].enhance do
  require "tinymce/rails/asset_installer"

  assets = Pathname.new(File.expand_path(File.dirname(__FILE__) + "/../../app/assets/javascripts/tinymce"))

  config   = Rails.application.config
  target   = File.join(Rails.public_path, config.assets.prefix)
  manifest = config.assets.manifest

  installer = TinyMCE::Rails::AssetInstaller.new(assets, target, manifest)
  installer.install
end
