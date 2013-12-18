class Stuff < ActiveRecord::Base
  #has_many :tag , through: :stuff_tag ,source: :tag_id
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250}
  STATU_CODE_AT_INBOX = 1
end
