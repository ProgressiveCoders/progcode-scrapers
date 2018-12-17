module SlackChannelsToAirtable
  def self.run
    begin
      self.log("Start: SlackChannelsToAirtable")
      self.connect_apis
      self.log("Finish: SlackChannelsToAirtable")    
    rescue => e
      self.handle_errors(e)    
    end
  end

  def self.connect_apis
    slack_client = SlackClient.new
    channels = slack_client.channels
    total_channels = channels.length
    channels.reverse.each_with_index do |channel, index|
      self.log("SlackChannelsToAirtable #{index + 1} of #{total_channels}")
      channel_details = slack_client.channels_info(channel)
      AirtableChannelListTable.add_or_update_channel(channel, channel_details)
    end
  end

  def self.log(msg)
    puts msg
  end

  def self.handle_errors(e)
    puts "Error #{e.message}"
    puts "Error: SlackMembersToAirtable"
  end
end
