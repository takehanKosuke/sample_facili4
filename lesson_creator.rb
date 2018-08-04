
require "csv"

def whan(a)
  s = a.split("　")
  if s.length == 1
    s[0] =5
  else
    #termをID変換
    if s[0] == "通年・前期"
        s[0] = 3
      elsif s[0] == "通年・後期"
        s[0] = 4
      elsif s[0] == "前期"
        s[0] = 1
      elsif s[0] == "後期"
        s[0] = 2
      else
        s[0] = "!"
    end
    #wdayを数字変換
    if s[1] == "月曜日"
        s[1] = 0
      elsif s[1] == "火曜日"
        s[1] = 1
      elsif s[1] == "水曜日"
        s[1] = 2
      elsif s[1] == "木曜日"
        s[1] = 3
      elsif s[1] == "金曜日"
        s[1] = 4
      elsif s[1] =="土曜日"
        s[1] = 5
      else
        s[1] = '!'
    end
    #periodを数字変換
    if s[2] == "1時限"
        s[2] = 0
      elsif s[2] == "2時限"
        s[2] = 1
      elsif s[2] == "3時限"
        s[2] = 2
      elsif s[2] == "4時限"
        s[2] = 3
      elsif s[2] == "5時限"
        s[2] = 4
      elsif s[2] == "6時限"
        s[2] = 5
      else
        s[2] = "!"
    end
  end
  return s
end

# 先生名簿に一致する名前があるか？
def teachers_name(teacher)
  path = File.join(Rails.root, "db", "teachers_names.csv")
  data = CSV.read(path)
  data.each do |data|
    if data == teacher
      return true
    end
  end
end


# 先生をID化
def fetch_teacher_id_by_name(teacher)
  begin
    t = teacher.split("\n")
    i = Teacher.find_by(name: t[0]).id
    return i
  rescue => error
    return 1000
  end
end

def classificat(c)
  if c == "必修 "
    c = 1
  else
    c = 2
  end
end

def lesson_id_chenge(data)
  d = data.split("　")
  faculty = Faculty.find_by(name: d[0]).id
  department = Department.find_by(faculty_id: faculty, name:d[1]).id
  return department
end

def greads(a)
  if a == "１年次 "
    return 1
  elsif a == "２年次 "
    return 2
  elsif a == "３年次 "
    return 3
  elsif a == "４年次 "
    return 4
  end
end


class LessonCreator
  # detail_lessonを読み込む
  file_path = File.join(Rails.root, "db", "medical_lesson_change.csv")
  csv_data = CSV.read(file_path)
    csv_data.each do |data|
      s = []
      lesson = Lesson.new
  # 講義ID
      lesson.code = data[0]
  # 講義名
      lesson.name = data[1]
  # 曜日・時期・時限
      s = whan(data[2])
  # 時期
      lesson.term_id = s[0]
  # 曜日
      lesson.wday = s[1]
  # 時限
      lesson.period = s[2]
  #先生IDに変換
      lesson.teacher_id = fetch_teacher_id_by_name(data[3])
  # 対象学年を数字のみに変更
      lesson.gread_id = greads(data[4])
  #必須or選択をID変換
      lesson.classification_id = classificat(data[5])
  # 単位数
      lesson.unit = data[6]
  #学部IDに変更
      lesson.department_id = lesson_id_chenge(data[7])
  #目標
      lesson.target = data[8]
  # 内容
      lesson.contents = data[9]
  # レベル
      lesson.level = data[10]
  # 教科書
      if data[11].scan(/\「.*\」|\『.*\』/) == []
        lesson.textbook = ""
      else
        lesson.textbook = data[11].scan(/\「.*\」|\『.*\』/)
      end
  # 参考書
      if data[12].scan(/\「.*\」|\『.*\』/)== []
        lesson.referencebook = ""
      else
        lesson.referencebook = data[12].scan(/\「.*\」|\『.*\』/)
      end
  # 評価
      lesson.evaluation = data[13]
  # 計画
      lesson.plan = data[14]
  # 保存
      lesson.save
    end
end

