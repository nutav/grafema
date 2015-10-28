class Category < ActiveRecord::Base

  has_attached_file :fon, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :fon, content_type: /\Aimage\/.*\Z/

  has_many :projects, dependent: :destroy

end