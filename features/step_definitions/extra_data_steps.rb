Given /the extra data of "(.+?)"/ do |name|
  @extra_data = VBoxManage.extra_data(name)
end

Given /I set the extra data "(.+?)" to "(.+?)"/ do |key, value|
  @relationship[key] = value
end

Given /the extra data is saved/ do
  @relationship.save
end

Then /all the extra data should match/ do
  @relationship.length.should == @extra_data.length
  @extra_data.each do |k,v|
    @relationship[k].should == v
  end
end

Then /the extra data should include "(.+?)" as "(.+?)"/ do |key, value|
  @extra_data[key].should == value
end
