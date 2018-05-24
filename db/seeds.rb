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
Department.create(:name => "臨床工学コース", :faculty_id =>1 )
Department.create(:name => "救急救命コース", :faculty_id =>1 )
Department.create(:name => "薬学科", :faculty_id =>2)

Faculty.create(:name => "健康メディカル学部")
Faculty.create(:name => "薬学部")
Faculty.create(:name => "現代ライフ学部")
Faculty.create(:name => "ヒューマンケア学部")
Faculty.create(:name => "健康医療スポーツ学部")

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
Term.create(:term => "前期")
Term.create(:term => "後期")
Term.create(:term => "通年")
Term.create(:term => "集中")


Year.create(:year => 2018)
Year.create(:year => 2019)
Year.create(:year => 2020)
Year.create(:year => 2021)
Year.create(:year => 2022)