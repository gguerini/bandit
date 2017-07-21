module AuthenticationSteps
  step "I should be signed in" do
    expect(page).to have_link("Sign out")
  end

  step "I should not be signed in" do
    expect(current_path).to eq(root_path)
    expect(page).to_not have_link("Sign out")
    expect(page).to have_link("Sign in")
  end

  step "I should be redirected to my dashboard" do
    expect(current_path).to eq(dashboard_path)
  end
end
