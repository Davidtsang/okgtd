class Stuff < ActiveRecord::Base
  #has_many :tag , through: :stuff_tag ,source: :tag_id
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250}
  STATU_CODE_AT_INBOX = 1
  STATU_CODE_AT_TRASH = -1
  STATU_CODE_AT_REF = -2
  STATU_CODE_AT_FUTURE = -3
  STATU_CODE_DONE = -9

end
