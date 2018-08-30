require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'class methods' do
    it '.average_age' do
      astro_1 = Astronaut.create!(name: "Neil Armstrong", age: 32, job: "Commander")
      astro_2 = Astronaut.create!(name: "Buzz Aldrin", age: 30, job: "Pilot")
      astro_3 = Astronaut.create!(name: "Bob Jones", age: 28, job: "Engineer")

      target = (astro_1.age + astro_2.age + astro_3.age) / 3.0
      expect(Astronaut.average_age).to eq(target)
    end
  end

  describe 'instance methods' do
    it "#mission_list" do
      astro = Astronaut.create!(name: "Neil Armstrong", age: 32, job: "Commander")
      space_mission_1 = astro.space_missions.create(title: "Jupiter", trip_length: 30)
      space_mission_2 = astro.space_missions.create(title: "Mars", trip_length: 22)
      space_mission_3 = astro.space_missions.create(title: "Apollo", trip_length: 90)

      expect(astro.mission_list).to eq(["Apollo", "Jupiter", "Mars"])
    end

    it '#space_time' do
      astro = Astronaut.create!(name: "Neil Armstrong", age: 32, job: "Commander")
      sm_1 = astro.space_missions.create(title: "Jupiter", trip_length: 30)
      sm_2 = astro.space_missions.create(title: "Mars", trip_length: 22)
      sm_3 = astro.space_missions.create(title: "Apollo", trip_length: 90)

      target = (sm_1.trip_length + sm_2.trip_length + sm_3.trip_length)
      expect(astro.space_time).to eq(target)
    end
  end
end
