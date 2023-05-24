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
        
        it 'is created with an empty array of courses' do 
            gradebook = Gradebook.new("Mr.Dr.Prof. Patrick")

            expect(gradebook.courses).to eq([])
        end
    end

    describe '#add_course' do
        it 'shovels a course object into @courses and returns the new array' do
            gradebook = Gradebook.new("Mr.Dr.Prof. Patrick")
            course_1 = Course.new("Calculus", 2)
            course_2 = Course.new("English", 4)

            expect(gradebook.courses).to eq([])
            expect(gradebook.add_course(course_1)).to eq([course_1])
            expect(gradebook.courses).to eq([course_1])
            expect(gradebook.add_course(course_2)).to eq([course_1, course_2])
            expect(gradebook.courses).to eq([course_1, course_2])
        end
    end

    describe '#list_all_students' do
        it 'returns hash where course is the key and @students are the value in an array' do
            gradebook = Gradebook.new("Mr.Dr.Prof. Patrick")
            course_1 = Course.new("Calculus", 2)
            course_2 = Course.new("English", 4)
            student1 = Student.new({name: "Morgan", age: 21})
            student2 = Student.new({name: "Jordan", age: 29})    
            student3 = Student.new({name: "Tim", age: 19})    
            student4 = Student.new({name: "Larry", age: 22})  

            course_1.enroll(student1)
            course_1.enroll(student2)

            gradebook.add_course(course_1)
            
            expect(gradebook.courses[0].students).to eq([student1, student2])

            course_2.enroll(student3)
            course_2.enroll(student4)
            gradebook.add_course(course_2)

            expect(gradebook.courses[1].students).to eq([student3, student4])

            expect(gradebook.list_all_students).to eq({"Calculus" => [student1, student2], "English"=> [student3, student4]})
        end
    end
end