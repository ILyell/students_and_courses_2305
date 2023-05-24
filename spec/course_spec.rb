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

    describe '#full?' do
        it 'checks # of students against @capacity and returns a boolean' do
            course_1 = Course.new("Calculus", 2)
            course_2 = Course.new("English", 0)

            expect(course_1.full?).to eq(false)
            expect(course_2.full?).to eq(true)
        end
    end

    describe '#enroll' do
        it 'takes a student class and shovels it into @students array' do
            course_1 = Course.new("Calculus", 2)
            course_2 = Course.new("English", 4)
            student1 = Student.new({name: "Morgan", age: 21})
            student2 = Student.new({name: "Jordan", age: 29})    

            expect(course_1.full?).to eq(false)
            expect(course_2.full?).to eq(false)

            course_1.enroll(student1)

            expect(course_1.full?).to eq(false)

            course_1.enroll(student2)

            expect(course_1.full?).to eq(true)
            
            course_2.enroll(student1)
            course_2.enroll(student2)
            
            expect(course_2.full?).to eq(false)
        end
    end
end