class Picture < ActiveRecord::Base
  #belongs_to :post
  include ImageUploader::Attachment.new(:image) 
end
