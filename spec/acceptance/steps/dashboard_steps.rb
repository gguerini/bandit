module DashboardSteps
  step "I visit my dashboard" do
    @user = FactoryGirl.create(:user)
    sign_in(user: @user)
    visit user_dashboard_path(username: @user)
  end

  step "I should see and be able to edit my profile" do
    expect(page).to have_content("Edit Profile")
    expect(page).to have_content(@user.full_name)
  end

  step "I visit :first_name :last_name dashboard" do |first_name, last_name|
    @new_user = FactoryGirl.create(:user, first_name: first_name, last_name: last_name, username: first_name.downcase)
    visit user_dashboard_path(username: @new_user)
  end

  step "I should see their profile but not be able to edit their profile" do
    expect(page).to_not have_content("Edit Profile")
    expect(page).to have_content(@new_user.full_name)
  end
end
