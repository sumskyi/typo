Given /^the following users exist:$/ do |table|
  table.hashes.each { |article|  User.create!(article) }
end

Given /^the following articles exist:$/ do |table|
  table.hashes.each { |article|  Article.create!(article) }
end

Given /I am logged in as "(.*?)"$/ do |login|
  visit '/accounts/login'
  fill_in 'user_login', :with => login
  fill_in 'user_password', :with => login + "_passwd"
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given /^I merge with "(.*)"$/ do |title|
  fill_in 'merge_with', :with => Article.find_by_title(title).id
  click_button 'Merge'
end
