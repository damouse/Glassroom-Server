class Note < ActiveRecord::Base
	belongs_to :lecture

  def eql? other
    return false unless other.instance_of? Note

    if other.text == @text and other.order == @order
      return true
    end
    return false
  end
end
