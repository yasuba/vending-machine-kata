Feature: Buying
  In order to buy delicious snacks
  As a hungry consumer
  I should see the vending machine

Scenario: A shopper buys an item
  Given I am on the homepage
  When I check "cola"
  And I check "hundred"
  When I press "Buy"
  Then I should receive my item

Scenario: A shopper receives change
  Given I am on the homepage
  When I check "twirl"
  And I check "twohundred"
  When I press "Buy"
  Then I should receive my change