require 'importers/xml_importer'

class OaiImporter < XmlImporter
  def initialize
    super

    @namespaces = {
      "xmlns" => "http://www.openarchives.org/OAI/2.0/static-repository",
      "dc" => "http://purl.org/dc/elements/1.1/",
      "dcterms" => "http://purl.org/dc/terms/",
      "oai" => "http://www.openarchives.org/OAI/2.0/",
      "oai_dc" => "http://www.openarchives.org/OAI/2.0/oai_dc/"
    }

    @record_delimiter = "//oai:record"

    @mappings_prefix = "./oai:metadata/oai_dc:dc/"
    @mappings = {
      "dc:id" => :id,
      "dc:publisher" => :publisher,
      "dcterms:isPartOf" => :isPartOf,
      # "dc:identifier" => :id,
      "dc:description" => :description,
      "dc:creator" => :creator,
      "dc:date" => :date,
      "dc:format" => :formats,
      "dcterms:medium" => :medium,
      "dc:title" => :title,
      "dc:contributor" => :contributor,
      "dc:provenance" => :provenance,
      "dc:subject" => :subject,
      "dc:source" => :source
    }

    @filters = {
      :id => XmlImporter.gsub_filter(/\./, '_'),
    }
  end
end