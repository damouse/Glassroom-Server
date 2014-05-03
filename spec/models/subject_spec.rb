require 'spec_helper'

describe Subject do
  it { should respond_to :name }
  it { should validate_presence_of :name }

  it { should respond_to :description }
  it { should validate_presence_of :description }

  it { should belong_to :user }
  it { should have_many :lectures }  
end
