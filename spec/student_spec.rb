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
end