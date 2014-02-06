namespace :solr do
  desc "delete all records from solr index"
  task :delete do
    system "curl -X POST http://0.0.0.0:8983/solr/update --data-binary '<delete><query>*:*</query></delete>' -H 'Content-type:text/xml; charset=utf8'"
    system "curl -X POST http://0.0.0.0:8983/solr/update --data-binary '<commit/>' -H 'Content-type:text/xml; charset=utf8'"
  end
end
