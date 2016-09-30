RSpec.configure do |config|
  config.before(turnip: true) do
    feature_file = ::RSpec.current_example.metadata[:file_path]
    turnip_file_path = Pathname.new(feature_file).realpath
    root_acceptance_folder = Rails.root.join("spec", "acceptance")

    default_steps_file = root_acceptance_folder + turnip_file_path.relative_path_from(root_acceptance_folder).to_s.gsub(/^features/, "steps").gsub(/\.feature$/, "_steps.rb")
    default_steps_module = [turnip_file_path.basename.to_s.remove(".feature").camelcase, "Steps"].join

    require default_steps_file
    extend default_steps_module.constantize
  end
end
