module AuthenticationSteps
  step "I should be signed in" do
    expect(page).to have_link("Sign out")
    expect(page).to have_content("Welcome!")
  end

  step "I should not be signed in" do
    expect(current_path).to eq(root_path)
    expect(page).to_not have_link("Sign out")
    expect(page).to have_link("Sign in")
  end
end
