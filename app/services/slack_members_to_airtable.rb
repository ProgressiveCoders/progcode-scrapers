module SlackMembersToAirtable
  def self.run
    begin
      self.log("Start: SlackMembersToAirtable")
      self.connect_apis
      self.log("Finish: SlackMembersToAirtable")    
    rescue
      self.log("Error: SlackMembersToAirtable")    
    end
  end

  def self.connect_apis
    slack_client = SlackClient.new
    slack_client.members.each do |member|
      AirtableMembersTable.add_or_update_member(member)
    end
  end

  def self.log(msg)
    puts msg
  end
end