class TeacherCreator
  def initialize(csv)
    @csv = csv
  end

  def create_teacher
    Lessonのcsvを読み込む
    １行ずつをLessonモデルに保存していく処理
      その時teacher_idについてはCSVの教授名の１行目の教授と同一の名前のレコードを取得し
      そのidを保存する。

    csv = CSV.table ...

    csv.each do |line|
      lesson = Lesson.new
      lesson.name = line.name
      lesson.teacher_id = fetch_teacher_id_by_name(line.teacher)
      lesson.save
    end
  end


  private
  def fetch_teacher_id_by_name(name)
    Teacher.find_by(name: name).id
  end
end