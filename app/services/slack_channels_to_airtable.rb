module SlackChannelsToAirtable
  def self.run
    slack_client = SlackClient.new
    slack_client.channels.each do |channel|
      channel_details = slack_client.channels_info(channel)
      AirtableChannelListTable.add_or_update_channel(channel, channel_details)
    end
  end
end