module SlackMembersToAirtable
  def self.run
    begin
      self.log("Start: SlackMembersToAirtable")
      self.connect_apis
      self.log("Finish: SlackMembersToAirtable")    
    rescue => e
      self.handle_errors(e)    
    end
  end

  def self.connect_apis
    slack_client = SlackClient.new
    members = slack_client.members
    total_members = members.length
    members.reverse.each_with_index do |member, index|
      self.log("SlackMembersToAirtable #{index} of #{total_members}")
      AirtableMembersTable.add_or_update_member(member)
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