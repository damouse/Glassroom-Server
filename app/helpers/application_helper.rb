module ApplicationHelper
  def getUserSubjects
    @subjects = Subject.all
    # @user_subjects = @subjects.select do |subject|
    #   if current_user.id == nil # Had to add this because authentication is not currently working
    #     id = 2
    #   else 
    #     id = current_user.id
    #   end
    #   subject.user_id.include? id
    # end
  end

  def getSubjectUrl subject
    url = subject_url(subject)
  end
end
