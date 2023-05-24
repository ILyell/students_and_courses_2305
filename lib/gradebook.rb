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
end
