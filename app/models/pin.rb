class Pin < ActiveRecord::Base
	include AutoHtml

	auto_html_for :video_link do
    html_escape
    youtube
    vimeo
  end

	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	validate :image_or_video
	validates :description, presence: true

	def image_or_video
		if !(image.blank? ^ video_link.blank?)
			errors.add(:base, "Please add an image or video!")
		end
	end

end
