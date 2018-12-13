module SlackChannelsToAirtable
  def self.run
    begin
      self.log("Start: SlackChannelsToAirtable")
      self.connect_apis
      self.log("Finish: SlackChannelsToAirtable")    
    rescue
      self.log("Error: SlackChannelsToAirtable")    
    end
  end

  def self.connect_apis
    slack_client = SlackClient.new
    slack_client.channels.each do |channel|
      channel_details = slack_client.channels_info(channel)
      AirtableChannelListTable.add_or_update_channel(channel, channel_details)
    end
  end

  def self.log(msg)
    puts msg
  end
end