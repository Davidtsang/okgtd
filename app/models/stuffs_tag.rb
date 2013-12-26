class StuffsTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :stuff

  def self.tags_groups(user)
    user.stuffs_tags.all(
        :group => 'stuffs_tags.tag_id',
        :select => 'stuffs_tags.tag_id, COUNT(stuffs_tags.tag_id) AS tag_num'
    )
  end

end
