class Profile < ActiveRecord::Base
  has_many :qualifications
  has_many :achievements
  has_attached_file :image
  validates_attachment_content_type :image\
  , content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  scope :list, -> { all.collect { |e| [e.full_name, e.id] } }

  def full_name
    [first_name, last_name].join(' ')
  end
end
