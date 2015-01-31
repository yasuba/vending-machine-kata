Feature: Buying
  In order to buy delicious snacks
  As a hungry consumer
  I should see the vending machine

Scenario: A shopper buys an item
  Given I am on the homepage
  When I click "KitKat"
  And I check "200"
  When I press "Buy"
  Then I should receive my item