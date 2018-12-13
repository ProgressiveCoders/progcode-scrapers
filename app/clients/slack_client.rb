class SlackClient
  def initialize
    @client = Slack::Web::Client.new(token: ENV['SLACK_API_TOKEN'])
  end

  def channels
    log("Fetching slack channels")
    @client.channels_list.channels
  end

  def members
    log("Fetching members")
    @client.users_list.members
  end

  def channels_info(channel)
    log("Fetching channels info")
    @client.channels_info(channel: channel[:id]).channel
  end

  private
  def log(msg)
    puts msg
  end
end
