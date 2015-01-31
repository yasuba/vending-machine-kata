When(/^I click "(.*?)"$/) do |arg1|
  click_link arg1
end

Then(/^I should receive my item$/) do
  find(:css, 'img').text
end