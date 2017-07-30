class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :content, presence: true 

  def upvote_by user_id
  	Upvote.where(qa_id: id, user_id: user_id, utype: 'question').length > 0
  end


  def upvote_string user_id
  	if upvote_by user_id
  		return "Cancel Upvote"
  	else
  		return "Upvote"
  	end

  end

  def upvote_count

  	return Upvote.where(qa_id: id , utype: 'question').length

  end	
end
