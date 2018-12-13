module SlackMembersToAirtable
  def self.run
    self.log("Start SlackMembersToAirtable")
    slack_client = SlackClient.new
    slack_client.members.each do |member|
      AirtableMembersTable.add_or_update_member(member)
    end
    self.log("Finish SlackMembersToAirtable")

  end

  def self.log(msg)
    puts msg
  end
end