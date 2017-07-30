class UpvoteController < ApplicationController
	before_action :authenticate_user!


	def toggle_upvote
		@utype=params[:utype]
		@qa_id=params[:qa_id]
		if @utype == "question"
			@question = Question.find(params[:qa_id])
			upvote = Upvote.where(user_id: current_user.id , qa_id: @qa_id, utype: 'question').first
			if upvote
				upvote.destroy!
				@is_upvote = false	

			else
				Upvote.create(user_id: current_user.id, qa_id: @qa_id , utype: 'question')
				@is_upvote = true
			end
		else
			@answer = Answer.find(params[:qa_id])
			upvote = Upvote.where(user_id: current_user.id , qa_id: @qa_id , utype: 'answer').first
			if upvote
				upvote.destroy!
				@is_upvote = false	
			else
				Upvote.create(user_id: current_user.id, qa_id: @qa_id , utype: 'answer')
				@is_upvote = true
			end
		end	

				
		respond_to do |format|
			format.js {}
		end
	end
end
