require File.expand_path '../../spec_helper.rb', __FILE__
require File.expand_path '../../../app/services/slack_channels_to_airtable.rb', __FILE__

describe "SlackChannelsToAirtable" do
  describe "#run" do
    it "should call #connect_apis if there are no errors" do
      allow(SlackChannelsToAirtable).to receive(:connect_apis)
      SlackChannelsToAirtable.run
      expect(SlackChannelsToAirtable).to have_received(:connect_apis)
    end

    it "should call #handle_errors if there are errors" do
      allow(SlackChannelsToAirtable).to receive(:connect_apis).and_raise("Exception")
      allow(SlackChannelsToAirtable).to receive(:handle_errors)
      SlackChannelsToAirtable.run
      expect(SlackChannelsToAirtable).to have_received(:handle_errors)
    end
  end
end