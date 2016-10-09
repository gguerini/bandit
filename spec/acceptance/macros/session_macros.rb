module SessionMacros
  step "I (am )sign(ed) in" do
    sign_in
  end

  step "I am not signed in" do
    Capybara.reset_sessions!
  end

  step "I sign out" do
    sign_out
  end

  private

  def sign_in(user: nil, password: "p@ssw0rd")
    @user ||= user || FactoryGirl.create(:user)

    Capybara.reset_sessions!

    visit new_user_session_path

    within "form#new_user" do
      fill_in "Email", with: @user.email
      fill_in "Password", with: password

      click_button "Log in"
    end

    @user
  end

  def sign_out
    click_link "Sign out"
  end

  def fill_in_registration_form
    within "form#new_user" do
      fill_in "First name", with: "John"
      fill_in "Last name", with: "Doe"
      fill_in "Username", with: "johndoe"
      fill_in "Email", with: "johndoe@example.com"
      fill_in "Password", with: "p@ssw0rd"
      fill_in "Password confirmation", with: "p@ssw0rd"

      click_button "Sign up"
    end
  end
end
