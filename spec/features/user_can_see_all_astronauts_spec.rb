require "rails_helper"

describe "When I visit /astronauts" do
  before(:each) do
    @astro_1 = Astronaut.create!(name: "Neil Armstrong", age: 32, job: "Commander")
    @astro_2 = Astronaut.create!(name: "Buzz Aldrin", age: 30, job: "Pilot")
    @astro_3 = Astronaut.create!(name: "Bob Jones", age: 28, job: "Engineer")
    @space_mission_1 = @astro_1.space_missions.create(title: "Jupiter", trip_length: 55)
    @space_mission_2 = @astro_1.space_missions.create(title: "Mars", trip_length: 28)
    @space_mission_3 = @astro_1.space_missions.create(title: "Apollo", trip_length: 14)
    @space_mission_4 = @astro_2.space_missions.create(title: "Mars", trip_length: 28)
    @space_mission_5 = @astro_2.space_missions.create(title: "Jupiter", trip_length: 55)
    @space_mission_6 = @astro_2.space_missions.create(title: "Apollo", trip_length: 14)
    @space_mission_7 = @astro_3.space_missions.create(title: "Mars", trip_length: 28)
    @space_mission_8 = @astro_3.space_missions.create(title: "Jupiter", trip_length: 55)
  end

  it 'should show all astronauts and info' do
    visit astronauts_path

    expect(page).to have_content(@astro_1.name)
    expect(page).to have_content(@astro_1.age)
    expect(page).to have_content(@astro_1.job)
    expect(page).to have_content(@astro_2.name)
    expect(page).to have_content(@astro_2.age)
    expect(page).to have_content(@astro_2.job)
  end

  it 'should show average age of all astronauts' do
    visit astronauts_path

    within("#ave-age") do
      expect(page).to have_content(Astronaut.average_age)
    end
  end

  it 'should show all missions in alpha order' do
    visit astronauts_path

    within("#astro-#{@astro_1.id}") do
      expect(page).to have_content("Apollo\nJupiter\nMars")
    end

    within("#astro-#{@astro_3.id}") do
      expect(page).to have_content("Jupiter\nMars")
    end
  end

  it 'should show total time in space' do
    visit astronauts_path

    within("#astro-#{@astro_1.id}") do
      expect(page).to have_content("Time in Space: #{@astro_1.space_time}")
    end

    within("#astro-#{@astro_3.id}") do
      expect(page).to have_content("Time in Space: #{@astro_3.space_time}")
    end
  end
end
