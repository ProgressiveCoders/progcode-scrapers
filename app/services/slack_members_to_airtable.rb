module SlackMembersToAirtable
  def self.run
    slack_client = SlackClient.new
    slack_client.members.each do |member|
      AirtableMembersTable.add_or_update_member(member)
    end
  end
end