Airrecord.api_key = ENV['AIRTABLE_KEY']

class AirtableMembersTable < Airrecord::Table
  self.base_key   = ENV['AIRTABLE_APP']
  self.table_name = ENV['AIRTABLE_MEMBERS_TABLE_NAME']

  def self.add_or_update_member(member)
    if self.member_exists?(member)
      self.log("Updating member")
      self.update_member(member)
      self.log("Successfully updated member")
    else
      self.log("Creating member")
      self.create_member(member)
      self.log("Successfully created member")
    end
  end

  private
  def self.member_exists?(member)
    self.all({filter: "{slack_id} = \"#{member.id}\""}).any?
  end

  def self.member_id(member)
    self.all({filter: "{slack_id} = \"#{member.id}\""})[0].id 
  end

  def self.update_member(member)
    existing_member = self.find(member_id(member))
    existing_member["Member Handle"] = parse_handle(member)
    existing_member["Member Name"]   = member.real_name
    existing_member["TZ"]            = member.tz
    existing_member["TZ Label"]      = member.tz_label
    existing_member["What I Do"]     = member.profile.title
    existing_member["Deleted?"]      = member.deleted
    existing_member.save
  end

  def self.create_member(member)
    new_member = self.new({
      "Member Handle"  => parse_handle(member),
      "Member Name"    => member.real_name,
      "TZ"             => member.tz,
      "TZ Label"       => member.tz_label,
      "What I Do"      => member.profile.title,
      "Deleted?"       => member.deleted,
      "slack_id"       => member.id,
    })
    new_member.create
  end

  def self.log(msg)
    puts msg
  end

  def self.parse_handle(member)
    display_name = member.profile.display_name
    if display_name == ""
      member.name
    else
      display_name
    end
  end
end