class Tag < ActiveRecord::Base
  has_many :stuffs_tags
  has_many :stuffs, through: :stuffs_tags
  belongs_to :user
  PRESET_TAGS =['at office','at home', 'at meeting','at phone','at outside']

  def Tag.folder_tags(user,folder_code)
    Tag.find_by_sql(["
        SELECT st.[tag_id],t.name,COUNT(st.tag_id) AS stuffs_num
    FROM stuffs_tags as st
    JOIN tags AS t ON t.id = st.tag_id
    JOIN stuffs AS s ON s.[id] = st.stuff_id
    WHERE s.[statu_code] = ? AND t.[user_id] =?
    GROUP BY st.tag_id", folder_code,user.id
    ])
  end

end
