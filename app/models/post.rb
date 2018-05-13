class Post < ApplicationRecord
	belongs_to :user
	has_many :categorys

	#serialize เกี่ยวกับการตัดอัขระ ก่อนเก็บลง ดาต้าเบส  อันนี้ยังติดไว้อยู่ ยังไม่เข้าใจ
	#serialize :categories


	validates :title, presence: true

	has_attached_file :image, styles: { large: "1000x1000>", medium: "480x480>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	acts_as_taggable


end
