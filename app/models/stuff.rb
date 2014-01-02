class Stuff < ActiveRecord::Base
  has_many :tags, through: :stuffs_tags
  has_many :stuffs_tags

  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 250}
  STATU_CODE_AT_INBOX = 1
  STATU_CODE_AT_TRASH = -1
  STATU_CODE_AT_REF = -2
  STATU_CODE_AT_FUTURE = -3
  STATU_CODE_DONE = -99

  STATU_CODE_AT_ORG =3
  STATU_CODE_AT_OTHER =4

  STATU_CODE_AT_NEXT = 99
  STATU_CODE_AT_SCHEDULE =98
  STATU_CODE_AT_PROJECT =97
  NEED_DOING_STUFF_MIN_VAL = 50
  STATU_CODE_2_NAME =
      {
          -99 => 'Done',
          99 => 'at Next Action folder',
          98 => 'at Schedule folder',
          97 => 'at Project folder',
          -2 => 'at Refence folder',
          1 => 'at Inbox',
          -1 => 'at Trashcan',
          -3 => 'at Future folder',
          3 => 'at Organzie folder',
          -4 => 'at Other folder'
      }

  PLAN_TIME =[['', -1],
              ['5 m', 1],
              ['15 m', 2],
              ['30 m', 3],
              ['1 h', 4],
              ['2 h', 5],
              ['3 h', 6],
              ['4 h', 7],
              ['5 h', 8],
              ['6 h', 9],
              ['7 h', 10],
              ['1 day', 11],
              ['2 day', 12],
              ['3 day', 13],
              ['4 day', 14],
              ['1 week', 15],
              ['2 week', 16],
              ['3 week', 17],
              ['1 month', 18],
              ['2 month', 19],
              ['3 month', 20],
              ['4 month', 21],
              ['5 month', 22],
              ['6 month', 23],
              ['1 year', 24],
              ['2 year', 25],
              ['3 year', 26],
  ]

  def Stuff.statu_code_2_name(statu_code)
    STATU_CODE_2_NAME[statu_code]
  end

  def plan_time_set
    @plan_times = Stuff::PLAN_TIME
    @plan_times =@plan_times[0..10] if :parent_id?
  end

  def tags_ids
    self.stuffs_tags.all.map { |t|
      t.tag_id
    }

  end

  def Stuff.groups(user)
    user.stuffs.select('statu_code ,COUNT(statu_code ) AS statu_num').group(:statu_code).reorder('')
    #user.stuffs.all(
    #    :select => 'statu_code ,COUNT(statu_code ) AS statu_num',
    #    :group => "statu_code"
    #
    #)
  end

  def Stuff.stuff_code_2_group_num(groups, stuff_code)
    groups.each do |g|
      if g.stuff_code == stuff_code
        return g.statu_num
      end
    end
    return nil
  end

  #

  def update_tags(new_stuff_tags)
    old_stuff_tags = self.tags
    if new_stuff_tags.count == 1 && new_stuff_tags.first == "0"
      self.stuffs_tags.destroy_all

    else
      old_stuff_tags.each do |ost|
        self.stuffs_tags.find_by(tag_id: ost).destroy unless new_stuff_tags.include? ost
      end

      new_stuff_tags.each do |nst|
        self.stuffs_tags.create(tag_id: nst) unless old_stuff_tags.include? nst
      end

    end
  end


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
