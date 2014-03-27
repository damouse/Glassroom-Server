module ApplicationHelper
  def getUserSubjects
    @subjects = Subjects.all
    @user_subjects = @subjects.select do |subject|
      subject.user_id.include? current_user.id
    end
  end
end
