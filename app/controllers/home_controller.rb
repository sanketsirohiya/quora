class HomeController < ApplicationController	
  def index
   	if current_user==nil && Question.all.length == 0 
   		return redirect_to new_user_session_path
  	else
  	@question= Question.new
  	@questions=Question.all.order(created_at: :desc)
  	@answer= Answer.new
 	end
  end

  
  def profile
  end


  def upload_image
  	uploaded_file = params[:image]
  	filename = SecureRandom.hex + "." +uploaded_file.original_filename.split('.')[1]
  	filepath = Dir.pwd + "/public/uploads/" + filename
	File.open(filepath,'wb') do |file|
		file.write(uploaded_file.read())
	end

	current_user.profile_picture = filename
	current_user.save!
  	return redirect_to '/profile'
  end

end
