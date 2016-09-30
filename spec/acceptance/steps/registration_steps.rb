module RegistrationSteps
  step "I want to sign up for a new account" do
    visit new_user_registration_path

    expect(page).to have_content("Sign up")
  end

  step "I fill in my registration info" do
    fill_in_registration_form
  end

  step "I should have a new account" do
    expect(page).to have_link("Sign out")
    expect(page).to have_content("Welcome!")

    user = User.find_by(email: "johndoe@example.com")
    expect(user).to be_present
  end
end
