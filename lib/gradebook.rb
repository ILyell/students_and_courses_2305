class Gradebook

    attr_reader :instructor, :courses

    def initialize(instructor)
        @instructor = instructor
        @courses = []
    end

    def add_course(course)
        @courses << course
        @courses
    end

    def list_all_students
        student_list = {}
        @courses.each do |course|
            student_list[course.name] = course.students
        end
        student_list
    end
    
    def students_below(score)
        list_all_students.values.flatten.find_all do |student|
            student.grade < score
        end
    end
    
    def all_grades
        grades_list = {}
        @courses.each do |course|
            grade_array = []
            course.students.each {|student| grade_array << student.grade}
            grades_list[course.name] = grade_array
        end
        grades_list
    end
end
