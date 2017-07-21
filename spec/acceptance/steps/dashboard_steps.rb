module DashboardSteps
  step "I visit the dashboard" do
    visit dashboard_path
  end

  step "I should see my details" do
    expect(page).to have_content(@user.full_name)
  end

  step "I should be able to edit my profile and to add a new race report" do
    expect(page).to have_content("Edit Profile")
    expect(page).to have_content("Add Race Report")
  end

  step "I should be prompt to sign in" do
    expect(current_path).to eq(new_user_session_path)
  end
end
