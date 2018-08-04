require "csv"
def replication_lesson(data, csv)
   w = data[2].split("\n")
   w.each do |whan|
    lesson = [data[0],data[1],whan,data[3],data[4],data[5],data[6],data[7],data[8],data[9],data[10],data[11],data[12],data[13],data[14]]
    csv << lesson
  end
end

intro_csv = CSV.generate do |csv|
  CSV.foreach('medical_lesson.csv') do |data|
    w = data[2].split("\n")
    if w.length <= 1
      csv << data
    else
      replication_lesson(data, csv)
    end
  end
end

File.open("medical_lesson_change.csv", 'w') do |file|
  file.write(intro_csv)
end