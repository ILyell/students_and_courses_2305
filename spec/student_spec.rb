require 'rspec'
require './lib/student'

RSpec.describe Student do
    describe '#initialize' do
        it 'exist, and takes a hash attribute on initialize' do
            student = Student.new({name: "Morgan", age: 21})

            expect(student).to be_a(Student)
        end

        it 'Stores a name and an age from the hash passed to it' do
            student = Student.new({name: "Morgan", age: 21})
            
            expect(student.name).to eq("Morgan")
            expect(student.age).to eq(21)
        end

        it 'Starts with a @scores as an empty array' do
            student = Student.new({name: "Morgan", age: 21})
            
            expect(student.scores).to eq([])
            
        end
    end

    describe "#log_score" do 
        it 'takes an integer argument and pushes it to @scores array' do
            student = Student.new({name: "Morgan", age: 21})

            expect(student.scores).to eq([])

            student.log_score(89)
            expect(student.scores).to eq([89])
            
            student.log_score(78)
            expect(student.scores).to eq([89, 78])
        end
    end
end