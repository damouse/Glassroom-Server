require 'spec_helper'

describe Lecture do
  it { should respond_to :name }
  it { should validate_presence_of :name }

  it { should belong_to :subject }
  it { should have_many :audios }  
  it { should have_many :videos }  
  it { should have_many :images }  
  it { should have_many :notes }  
end
