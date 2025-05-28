class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }



  private

  def name_length
    if name.present? && (name.length > 20)
      errors.add(:name, "name is too long (maximum is 20 characters)")
    elsif name.present? && (name.length < 2)
      errors.add(:name, "name is too short (minimum is 2 characters)")
    end
  end

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end

  def introduction_length
    if introduction.present? && introduction.length > 50
      errors.add(:introduction, "introduction is too long (maximum is 50 characters)")
    end
  end
  
end

