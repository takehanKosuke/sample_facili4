# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Department.create(:name => "臨床心理学科", :faculty_id =>1 )
Department.create(:name => "健康栄養学科", :faculty_id =>1 )
Department.create(:name => "理学療法学科", :faculty_id =>1 )
Department.create(:name => "作業療法学科", :faculty_id =>1 )
Department.create(:name => "言語聴覚学科", :faculty_id =>1 )
Department.create(:name => "医療科学科", :faculty_id =>1 )
Department.create(:name => "薬学科", :faculty_id =>2)
Department.create(:name => "児童学科", :faculty_id =>3)
Department.create(:name => "人間文化学科", :faculty_id =>3)
Department.create(:name => "経営マネージメント学科", :faculty_id =>3)
Department.create(:name => "観光経営学科", :faculty_id =>3)
Department.create(:name => "鍼灸学科", :faculty_id =>4)
Department.create(:name => "柔道整復学科", :faculty_id =>4)
Department.create(:name => "看護学科", :faculty_id =>4)
Department.create(:name => "柔道整復学科", :faculty_id =>5)
Department.create(:name => "作業療法学科", :faculty_id =>5)
Department.create(:name => "理学療法学科", :faculty_id =>5)
Department.create(:name => "医療スポーツ学科", :faculty_id =>5)
Department.create(:name => "薬学研究科", :faculty_id =>6)
Department.create(:name => "環境情報学研究科", :faculty_id =>6)
Department.create(:name => "健康科学研究", :faculty_id =>6)
Department.create(:name => "臨床心理研究科", :faculty_id =>6)
Department.create(:name => "看護学研究科", :faculty_id =>6)
Department.create(:name => "助産別科", :faculty_id =>7)



Faculty.create(:name => "健康メディカル学部")
Faculty.create(:name => "薬学部")
Faculty.create(:name => "現代ライフ学部")
Faculty.create(:name => "ヒューマンケア学部")
Faculty.create(:name => "健康医療スポーツ学部")
Faculty.create(:name => "大学院")
Faculty.create(:name => "助産別科")

Gread.create(:gread => 1)
Gread.create(:gread => 2)
Gread.create(:gread => 3)
Gread.create(:gread => 4)

require "csv"

CSV.foreach('db/teachers_names.csv') do |row|
  i = 0
  while i < row.length
    Teacher.create(:name => row[i])
    i += 1
  end
end

Teacher.create(:name => "非常勤講師", :id => 1000 )


Term.create(:term => "前期")
Term.create(:term => "後期")
Term.create(:term => "通年・前期")
Term.create(:term => "通年・後期")
Term.create(:term => "集中")

Classification.create(:word => "必修")
Classification.create(:word => "選択")


Year.create(:year => 2018)
Year.create(:year => 2019)
Year.create(:year => 2020)
Year.create(:year => 2021)
Year.create(:year => 2022)
