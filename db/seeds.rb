require 'csv'
 
# 鉄道会社CSVファイルパス
COMPANY_PATH = "db/data/companies.csv"
 
# 鉄道会社カラム指定定数 カラムは左から0,1,2
COMPANY_CSVROW_COMPANY_ID = 0
COMPANY_CSVROW_NAME = 2
COMPANY_CSVROW_KANA = 3
COMPANY_CSVROW_FORMAL_NAME = 4
COMPANY_CSVROW_ABBREVIATION_NAME = 5
 
# 鉄道会社CSVを読み込みテーブルに保存
# CSVファイルを読み込みブロック変数rowに代入
CSV.foreach(COMPANY_PATH) do |row|
    # CSVファイルから各カラムの要素を取り出し
    company_id = row[COMPANY_CSVROW_COMPANY_ID] 
    name = row[COMPANY_CSVROW_NAME]
    kana = row[COMPANY_CSVROW_KANA]
    formal_name = row[COMPANY_CSVROW_FORMAL_NAME]
    abbreviation_name = row[COMPANY_CSVROW_ABBREVIATION_NAME]
    # 各要素の初めの既存データを取得し、1件もなければ作成
    Company.find_or_create_by(
        :company_id => company_id,
        :name => name, :kana => kana,
        :formal_name => formal_name,
        :abbreviation_name => abbreviation_name
    )
end
 
# 路線CSVファイルパス
LINE_PATH = "db/data/lines.csv"
 
# 路線カラム指定定数
LINE_CSVROW_LINE_ID = 0
LINE_CSVROW_COMPANY_ID = 1
LINE_CSVROW_NAME = 2
LINE_CSVROW_KANA = 3
LINE_CSVROW_LNG = 8
LINE_CSVROW_LAT = 9
 
# 路線CSVを読み込みテーブルに保存
CSV.foreach(LINE_PATH) do |row|
    line_id = row[LINE_CSVROW_LINE_ID]
    company_id = row[LINE_CSVROW_COMPANY_ID]
    name = row[LINE_CSVROW_NAME]
    kana = row[LINE_CSVROW_KANA]
    lng = row[LINE_CSVROW_LNG]
    lat = row[LINE_CSVROW_LAT]
 
    Line.find_or_create_by(
        :line_id => line_id,
        :company_id => company_id,
        :name => name,
        :kana => kana,
        :lat => lat,
        :lng => lng
    )
end
 
# 駅CSVファイルパス
STATION_PATH = "db/data/stations.csv"
 
# 駅カラム指定定数
STATION_CSVROW_STATION_ID = 0
STATION_CSVROW_NAME = 2
STATION_CSVROW_LINE_ID = 5
STATION_CSVROW_ADDRESS = 8
STATION_CSVROW_LNG = 9
STATION_CSVROW_LAT = 10
 
# 駅CSVを読み込みテーブルに保存
CSV.foreach(STATION_PATH) do |row|
    station_id = row[STATION_CSVROW_STATION_ID]
    name = row[STATION_CSVROW_NAME]
    line_id = row[STATION_CSVROW_LINE_ID]
    address = row[STATION_CSVROW_ADDRESS]
    lng = row[STATION_CSVROW_LNG]
    lat = row[STATION_CSVROW_LAT]
 
    Station.find_or_create_by(
        :station_id => station_id,
        :line_id => line_id,
        :name => name,
        :address => address,
        :lat => lat,
        :lng => lng
    )
end