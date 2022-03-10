class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :username, :book_id

  def username
    user = User.joins(:comments).find_by({ comments: { user_id: object.user_id } })
    user.last_name
  end
end
