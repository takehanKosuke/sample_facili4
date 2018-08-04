require "selenium-webdriver"
require "csv"
require 'pry-rails'


def sleeping
  sleep 2
end

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://syllabus.thu.ac.jp/campusweb/top.do"

driver.find_element(:xpath, '//*[@id="side_menu"]/div[3]/ul/li[2]/a').click


$count = 16

# 次の学部を指定
def faclty_select(driver, test)
  if $count < 26
    select = Selenium::WebDriver::Support::Select.new(driver.find_element(:xpath, '//*[@id="form"]/table[2]/tbody/tr[3]/td[3]/select'))
    select.select_by(:index, $count)
    driver.find_element(:xpath, '//*[@id="skgr_search"]').click
    sleeping
    $count += 1
    basic_lesson(driver, test)
  else
    driver.quit
  end
end

# 授業の詳細を取得しcsvに書き込む
def detail_lesson(driver, basic)
  sleeping
# 配当学年
  element = driver.find_element(:xpath, '//*[@id="form"]/div[2]/table/tbody/tr[7]/td[3]').text
  basic << element
# 選択or必修
  element = driver.find_element(:xpath, '//*[@id="form"]/div[2]/table/tbody/tr[11]/td[3]').text
  basic << element
# 単位数
  element = driver.find_element(:xpath, '//*[@id="form"]/div[2]/table/tbody/tr[15]/td[3]').text
  basic << element
# 学科
  element = driver.find_element(:xpath, '//*[@id="form"]/div[2]/table/tbody/tr[17]/td[3]').text
  basic << element
# 授業の狙い
  element = driver.find_element(:xpath, '//*[@id="form"]/div[3]/table/tbody/tr[1]/td[3]/table/tbody/tr/td').text
  basic << element
# 学習の狙い
  element = driver.find_element(:xpath, '//*[@id="form"]/div[3]/table/tbody/tr[5]/td[3]/table/tbody/tr/td').text
  basic << element
# 授業レベル
  element = driver.find_element(:xpath, '//*[@id="form"]/div[3]/table/tbody/tr[7]/td[3]/table/tbody/tr/td').text
  basic << element
# 教科書
  element = driver.find_element(:xpath, '//*[@id="form"]/div[3]/table/tbody/tr[13]/td[3]/table/tbody/tr/td').text
  basic << element
# 参考書
  element = driver.find_element(:xpath, '//*[@id="form"]/div[3]/table/tbody/tr[15]/td[3]/table/tbody/tr/td').text
  basic << element
# 成績評価法
  element = driver.find_element(:xpath, '//*[@id="form"]/div[3]/table/tbody/tr[17]/td[3]/table/tbody/tr/td').text
  basic << element
# 授業計画
  element = driver.find_element(:xpath, '//*[@id="form"]/div[3]/table/tbody/tr[19]/td[3]/table/tbody/tr/td').text
  basic << element
# 一覧画面に戻る
  driver.find_element(:xpath, '//*[@id="back"]').click
sleeping
  return basic
end



def chenge_lesson_code(basic)
end


# そのページの授業を取得
def basic_lesson(driver, test)
# CSVファイルに書きこむ

  # 第一授業処理
  # 基本情報の取得
    basic = []
    # 授業コード
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[3]/td[2]').text
    basic << element
    # 授業名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[3]/td[3]/a').text
    basic << element
    # 曜日・時限
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[3]/td[4]').text
    basic << element
    # 講師名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[3]/td[5]').text
    basic << element
  # 詳細情報の取得
    driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[3]/td[3]/a').click
    detail_lesson(driver, basic)
  # ↓↓↓にとってきた配列をlessonテーブルに入れられるように変換する。
    # chenge_lesson_code(basic)
  # CSVファイルに追記
    test << basic

# /////////↑までで１処理
  # 第二授業処理
    basic = []
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[4]/td[2]').text
    basic << element
  # 授業名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[4]/td[3]/a').text
    basic << element
    # 曜日・時限
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[4]/td[4]').text
    basic << element
    # 講師名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[4]/td[5]').text
    basic << element
    driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[4]/td[3]/a').click
    detail_lesson(driver,basic)
    test << basic

    # 第三授業処理
    basic = []
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[5]/td[2]').text
    basic << element
    # 授業名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[5]/td[3]/a').text
    basic << element
    # 曜日・時限
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[5]/td[4]').text
    basic << element
    # 講師名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[5]/td[5]').text
    basic << element
    driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[5]/td[3]/a').click
    # 詳細情報の取得
    detail_lesson(driver, basic)
  # CSVファイルに追記
    test << basic

    # 第四授業処理
    basic = []
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[6]/td[2]').text
    basic << element
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[6]/td[3]/a').text
    basic << element
    # 曜日・時限
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[6]/td[4]').text
    basic << element
    # 講師名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[6]/td[5]').text
    basic << element
    driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[6]/td[3]/a').click
    detail_lesson(driver, basic)
  # CSVファイルに追記
    test << basic


  # 第五授業処理
    basic = []
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[7]/td[2]').text
    basic << element
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[7]/td[3]/a').text
    basic << element
    # 曜日・時限
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[7]/td[4]').text
    basic << element
    # 講師名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[7]/td[5]').text
    basic << element
    driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[7]/td[3]/a').click
    detail_lesson(driver, basic)
  # CSVファイルに追記
    test << basic

  # 第六授業処理
    basic = []
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[8]/td[2]').text
    basic << element
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[8]/td[3]/a').text
    basic << element
    # 曜日・時限
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[8]/td[4]').text
    basic << element
    # 講師名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[8]/td[5]').text
    basic << element
    driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[8]/td[3]/a').click
    detail_lesson(driver, basic)
  # CSVファイルに追記
    test << basic

  # 第七授業処理
    basic = []
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[9]/td[2]').text
    basic << element
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[9]/td[3]/a').text
    basic << element
    # 曜日・時限
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[9]/td[4]').text
    basic << element
    # 講師名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[9]/td[5]').text
    basic << element
    driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[9]/td[3]/a').click
    detail_lesson(driver, basic)
  # CSVファイルに追記
    test << basic


  # 第八授業処理
    basic = []
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[10]/td[2]').text
    basic << element
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[10]/td[3]/a').text
    basic << element
    # 曜日・時限
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[10]/td[4]').text
    basic << element
    # 講師名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[10]/td[5]').text
    basic << element
    driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[10]/td[3]/a').click
    detail_lesson(driver, basic)
  # CSVファイルに追記
    test << basic


  # 第九授業処理
    basic = []
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[11]/td[2]').text
    basic << element
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[11]/td[3]/a').text
    basic << element
    # 曜日・時限
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[11]/td[4]').text
    basic << element
    # 講師名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[11]/td[5]').text
    basic << element
    driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[11]/td[3]/a').click
    detail_lesson(driver, basic)
  # CSVファイルに追記
    test << basic


  # 第十授業処理
    basic = []
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[12]/td[2]').text
    basic << element
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[12]/td[3]/a').text
    basic << element
    # 曜日・時限
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[12]/td[4]').text
    basic << element
    # 講師名
    element = driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[12]/td[5]').text
    basic << element
    driver.find_element(:xpath, '//*[@id="form"]/div[4]/table/tbody/tr[12]/td[3]/a').click
    detail_lesson(driver, basic)
  # CSVファイルに追記
    test << basic


    # 次の１０件に飛ぶ
    begin
      driver.find_element(:partial_link_text, "次の10件>>").click
      sleeping
      basic_lesson(driver, test)
    rescue => error
      driver.find_element(:partial_link_text, "講義から検索").click
      sleeping
      faclty_select(driver, test)
    end
end

CSV.open("medical_lesson.csv","w") do |test|
  faclty_select(driver, test)
end
