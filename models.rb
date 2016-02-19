ActiveRecord::Base.establish_connection("sqlite3:db/development.db")

class Memo < ActiveRecord::Base
    belongs_to :category
end

class Category < ActiveRecord::Base
    has_many :memos
end