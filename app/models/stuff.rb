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
  STATU_CODE_DONE = -99
  STATU_CODE_AT_PROCESS =2
  STATU_CODE_AT_ORG =3
  STATU_CODE_AT_OTHER =4
  STATU_CODE_AT_NEXT = 99
  STATU_CODE_AT_SCHEDULE =98
  STATU_CODE_AT_PROJECT =97
  NEED_DOING_STUFF_MIN_VAL = 50

  PLAN_TIME =[['',-1],
              ['5 m',1],
              ['15 m',2],
              ['30 m',3],
              ['1 h',4],
              ['2 h',5],
              ['3 h',6],
              ['4 h',7],
              ['5 h',8],
              ['6 h',9],
              ['7 h',10],
              ['1 day',11],
              ['2 day',12],
              ['3 day',13],
              ['4 day',14],
              ['1 week',15],
              ['2 week',16],
              ['3 week',17],
              ['1 month',18],
              ['2 month',19],
              ['3 month',20],
              ['4 month',21],
              ['5 month',22],
              ['6 month',23],
              ['1 year',24],
              ['2 year',25],
              ['3 year',26],
  ]

  def to_next_act
    STATU_CODE_AT_NEXT
  end

  def to_schedule
    STATU_CODE_AT_SCHEDULE
  end

  def to_project
    STATU_CODE_AT_PROJECT
  end


end
