module ProfileSteps
  step "I visit my profile" do
    visit profile_path(@user)
  end

  step "I should see my profile" do
    expect(page).to have_content(@user.full_name)
  end

  step "I should be able to edit my profile" do
    expect(page).to have_content("Edit Profile")
  end

  step "I visit :first_name :last_name profile" do |first_name, last_name|
    @new_user = FactoryGirl.create(:user, first_name: first_name, last_name: last_name, username: first_name.downcase)
    visit profile_path(@new_user)
  end

  step "I should see their profile" do
    expect(page).to have_content(@new_user.full_name)
  end

  step "I should not be able to edit their profile" do
    expect(page).to_not have_content("Edit Profile")
  end

  step "I should be able to sign in or sign up" do
    expect(page).to have_link("Sign up")
    expect(page).to have_link("Sign in")
  end
end
