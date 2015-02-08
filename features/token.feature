@javascript
Feature: Token Generation

Scenario: As a survivor, I want to have a printed token
Given a basic token layout is defined
And I am registered in the database using
| Attribute | Value       |
| id        | 1           |
| input2-1  | Input 2 - 1 |
| input2-2  | Input 2 - 2 |
| input3-1  | Input 3 - 1 |
| input3-2  | Input 3 - 2 |
Then I can generate and see a token
