class Post < ApplicationRecord
  validates :circle_name, :university, :body, presence: true
  validates :circle_name, :university, length: { maximum: 30 }
  validates :body, length: { maximum: 2000 }

  validate if: :new_picture do
    if new_picture.respond_to?(:content_type)
      unless new_picture.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_picture, :invalid_image_type)
      end
    else
      errors.add(:new_picture, :invalid)
    end
  end
  
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_one_attached :picture
  attribute :new_picture
  attribute :remove_picture, :boolean

  before_save do
    if new_picture
      self.picture = new_picture
    elsif remove_picture
      self.picture.purge
    end
  end
end
