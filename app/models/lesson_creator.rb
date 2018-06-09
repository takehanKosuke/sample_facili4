# require "csv"

# class LessonCreator
#   def initialize
#     file_path = File.join(Rails.root, "db", "teachers_names.csv")
#     @csv = CSV.table(file_path)
#   end

#   def say
#     # p @csv

#     # lessonモデルでやる
#     teacher = Teacher.new
#     teacher.name = "Hello"
#     teacher.save
#   end


#   private
#   def fetch_teacher_id_by_name(name)
#     Teacher.find_by(name: name).id
#   end
# end


