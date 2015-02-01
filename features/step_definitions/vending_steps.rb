Then(/^I should receive my item$/) do
  find(:css, '.product').text
end

Then(/^I should receive my change$/) do
  find(:css, '#pound').text
end

