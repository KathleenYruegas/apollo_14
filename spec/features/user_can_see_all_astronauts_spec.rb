require "rails_helper"

describe "When I visit /astronauts" do
  it 'should show all astronauts and info' do
    astro_1 = Astronaut.create!(name: "Neil Armstrong", age: 32, job: "Commander")
    astro_2 = Astronaut.create!(name: "Buzz Aldrin", age: 30, job: "Pilot")
    astro_3 = Astronaut.create!(name: "Bob Jones", age: 28, job: "Engineer")

    visit astronauts_path

    expect(page).to have_content(astro_1.name)
    expect(page).to have_content(astro_1.age)
    expect(page).to have_content(astro_1.job)
    expect(page).to have_content(astro_2.name)
    expect(page).to have_content(astro_2.age)
    expect(page).to have_content(astro_2.job)
  end
end
