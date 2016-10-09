module RegistrationSteps
  step "I want to sign up for a new account" do
    visit new_user_registration_path

    expect(page).to have_content("Sign up")
  end

  step "I fill in my registration info" do
    fill_in_registration_form
  end

  step "I should have a new account" do
    @user = User.find_by(email: "johndoe@example.com")
    expect(@user).to be_present
  end

  step "I should be redirected to my dashboard page" do
    expect(page).to have_link("Sign out")
    expect(current_path).to eq(user_dashboard_path(username: @user))
  end
end
