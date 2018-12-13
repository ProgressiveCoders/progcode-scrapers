require_relative './config/environment'

task :slack_channels_to_airtable do
  log("Starting rake task: SlackChannelsToAirtable")
  SlackChannelsToAirtable.run
  log("Finishing rake task: SlackChannelsToAirtable")
end

task :slack_members_to_airtable do
  log("Starting rake task: SlackMembersToAirtable")
  SlackMembersToAirtable.run
  log("Finishing rake task: SlackMembersToAirtable")
end

def log(msg)
  puts msg
end