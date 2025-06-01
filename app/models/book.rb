class Book < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
end

private
def title_length
  if title.length == 0
    errors.add(:title, "Title can't be blank")
  end
end

def body_length
  if body.length == 0
    errors.add(:body, "Body can't be blank")
  elsif body.length > 200
    errors.add(:body, "Body is too long (maximum is 200 characters)")
  end
end