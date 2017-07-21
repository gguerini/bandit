module RaceReportSteps
  step "I am on my dashboard" do
    visit dashboard_path
  end

  step "I want to create a new race report" do
    click_on("Add Race Report")
  end

  step "I fill in the race report form" do
    within "form#new_race_report" do
      fill_in "Name", with: "Boston Marathon"
      fill_in "Distance", with: "26.2 mi"
      fill_in "Location", with: "Boston, MA"
      fill_in "Title", with: "Pre-race"
      fill_in "Description", with: "I was very nervous."

      click_button "Create Race report"
    end
  end

  step "I should have a new race report" do
    @race_report = @user.race_reports.find_by(name: "Boston Marathon")
    expect(@race_report).to be_present
  end

  step "I should see the race report" do
    expect(page).to have_content("Boston Marathon")
    expect(current_path).to eq(race_report_path(@race_report))
  end
end
