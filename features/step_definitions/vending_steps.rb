# Given(/^I check the (\d+)st of the "(.*?)" checkboxes$/) do |arg1, arg2|
#   page.all("input[value=\"kitkat\"]").check('product')
# end

When(/^I click "(.*?)"$/) do |arg1|
  click_link arg1
end

Then(/^I should receive my item$/) do
  find(:css, 'img').text
end

