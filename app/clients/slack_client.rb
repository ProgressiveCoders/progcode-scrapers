class SlackClient
  def initialize
    @client = Slack::Web::Client.new(token: ENV['SLACK_API_TOKEN'])
  end

  def channels
    @client.channels_list.channels
  end

  def members
    @client.users_list.members
  end

  def channels_info(channel)
    @client.channels_info(channel: channel[:id]).channel
  end
end
