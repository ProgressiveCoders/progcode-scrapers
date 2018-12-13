require_relative './config/environment'

task :slack_channels_to_airtable do
  begin
    log("Starting rake task: SlackChannelsToAirtable")
    SlackChannelsToAirtable.run
    log("Finishing rake task: SlackChannelsToAirtable")
  rescue
    log("Error: SlackChannelsToAirtable")
  end
end

task :slack_members_to_airtable do
  begin
    log("Starting rake task: SlackMembersToAirtable")
    SlackMembersToAirtable.run
    log("Finishing rake task: SlackMembersToAirtable")
  rescue
    log("Error: SlackMembersToAirtable")
  end
end

def log(msg)
  puts msg
end