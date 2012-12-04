require 'importers/oai_importer'

namespace :import do
  task :oai do
    if ENV['FILE']
      files = [ENV['FILE']]
    else
      files = Dir["#{Rails.root}/import_data/oai/*.xml"]
    end

    importer = OaiImporter.new

    files.each do |file|
      puts "Importing from #{file}..."
      importer.import(file)
    end
  end
end