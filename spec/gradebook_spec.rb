require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do
    describe '#initialize' do
        it 'exist, and takes a string argument' do
            gradebook = Gradebook.new("Mr.Dr.Prof. Patrick")

            expect(gradebook).to be_a(Gradebook)
        end

        it 'stores the string argument in @instructor' do
            gradebook = Gradebook.new("Mr.Dr.Prof. Patrick")

            expect(gradebook.instructor).to eq("Mr.Dr.Prof. Patrick")
        end
        
        it 'its created with an empty array of courses' do 
            gradebook = Gradebook.new("Mr.Dr.Prof. Patrick")

            expect(gradebook.courses).to eq([])
        end
    end
end