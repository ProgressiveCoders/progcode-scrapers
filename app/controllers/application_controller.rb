class ApplicationController < Sinatra::Base
  get '/' do
    thing = AirtableMembersTable.add_or_update_channel({:name => "Calendar"}, "")
     "Hello, Scraper! #{thing}"
  end
end
