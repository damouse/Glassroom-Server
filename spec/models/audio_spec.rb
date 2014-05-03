require 'spec_helper'

describe Audio do
  it { should respond_to :name }
  it { should validate_presence_of :name }
 
  it { should belong_to :lecture }  
end
