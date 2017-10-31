class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum sex: { male: 1, female: 2, other: 3}
  mount_uploader :form_photo, FormPhotoUploader
  has_one :address
end
