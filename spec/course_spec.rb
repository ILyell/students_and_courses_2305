require 'rspec'
require './lib/course'
require './lib/student'

RSpec.describe Course do 
    describe '#initialize' do
        it 'exist, and takes 2 arguments' do
            course = Course.new("Calculus", 2)

            expect(course).to be_a(Course)
        end
        
        it 'stores arguments as a name and a integer' do
            course = Course.new("Calculus", 2)

            expect(course.name).to eq("Calculus")
            expect(course.capacity).to eq(2)
        end

        it 'Hold an array of students that starts empty' do
            course = Course.new("Calculus", 2)

            expect(course.students).to eq([])
        end
    end
end