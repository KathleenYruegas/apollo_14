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
end
