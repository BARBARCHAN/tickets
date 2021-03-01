# Detabase_design

## companies table
|Column|Type|Options|
|------|----|-------|
|name|string||
|kana|string||
|formal_name||
|abbreviation_name||

### Association
- has_many :lines


## lines table
|Column|Type|Options|
|------|----|-------|
|name|string||
|kana|string||
|company|references|foreign_key: true|

### Association
- belongs_to :company
- has_many :stations


## stations table

|Column|Type|Options|
|------|----|-------|
|name|string||
|address|string||
|line|references|foreign_key: true|

### Association
- belongs_to :line