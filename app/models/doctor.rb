# 医生
class Doctor
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :image_url, PictureUploader

  field :name, type: String
  field :summary, type: String
  field :nationality, type: String
  field :description, type: String
  field :position, type: String
  field :telephone, type: String
  field :image_url, type: String
  field :url, type: String
  field :click_count, type: String
  field :star, type: Integer
  field :room, type: String
  field :status, type: Boolean
  field :person_website, type: String
  field :is_home_visit, type: Boolean, default: false

  belongs_to :hospital
  belongs_to :department

  has_many :comments, as: :commentable

  validates :name, presence: true

  index name: 1
end
