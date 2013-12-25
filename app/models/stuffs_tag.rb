class StuffsTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :stuff

  def StuffsTag.tags_gruops(user)
    #StuffsTag.find_by_sql("select stuffs_tags.tag_id ,count( stuffs_tags.tag_id)  as tag_num from stuffs_tags
    #join tags on tags.id = stuffs_tags.tag_id WHERE tags.[user_id] =#{user.id} group by stuffs_tags.[tag_id] ")
    StuffsTag.find_by(
        
    )
  end


end
