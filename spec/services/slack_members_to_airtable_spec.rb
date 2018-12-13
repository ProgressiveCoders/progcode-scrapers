require File.expand_path '../../spec_helper.rb', __FILE__
require File.expand_path '../../../app/services/slack_members_to_airtable.rb', __FILE__

describe "SlackMembersToAirtable" do
  describe "#run" do
    it "should call #connect_apis if there are no errors" do
      allow(SlackMembersToAirtable).to receive(:connect_apis)
      SlackMembersToAirtable.run
      expect(SlackMembersToAirtable).to have_received(:connect_apis)
    end

    it "should call #handle_errors if there are errors" do
      allow(SlackMembersToAirtable).to receive(:connect_apis).and_raise("Exception")
      allow(SlackMembersToAirtable).to receive(:handle_errors)
      SlackMembersToAirtable.run
      expect(SlackMembersToAirtable).to have_received(:handle_errors)
    end
  end
end