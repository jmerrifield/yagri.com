When /^I browse to "([^"]*)"$/ do |url|
    visit url
end

Then /^I should be on URL "([^"]*)"$/ do |url|
    current_path.should == url
end

Then /^the post title should be "([^"]*)"$/ do |post_title|
    page.should have_selector 'h1', :text => post_title
end
