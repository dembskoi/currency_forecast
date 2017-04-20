# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home page' do
  subject { create(:user) }
  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Calculations"
  scenario 'visit the home page' do
    signin(subject.email, subject.password)
    visit root_path
    expect(page).to have_content 'Calculations'
  end
end
