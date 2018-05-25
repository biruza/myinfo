class Post < ActiveRecord::Base
	belongs_to :user
	has_many :categorys
	has_many :pictures, dependent: :destroy
  	accepts_nested_attributes_for :pictures, allow_destroy: true

	#serialize เกี่ยวกับการตัดอัขระ ก่อนเก็บลง ดาต้าเบส  อันนี้ยังติดไว้อยู่ ยังไม่เข้าใจ
	#serialize :categories
	
	include ImageUploader::Attachment.new(:cover_photo)

	validates :title, presence: true
	validates :categories, presence: true
	validates_presence_of :cover_photo

	#has_attached_file :image, styles: { large: "1000x1000>", medium: "480x480>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	#validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	#tag list
  	acts_as_taggable

  	


end
