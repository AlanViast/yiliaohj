# 体检套餐
class Examination
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :image_url, PictureUploader

  field :name, type: String
  field :origin_price, type: Float
  field :price, type: Float
  field :image_url, type: String
  field :feature, type: String
  field :applicable, type: String

  belongs_to :examination_category, index: true
  # belongs_to :examination, index: true
  # belongs_to :examinationable, polymorphic: true

  has_many :comments, as: :commentable
  has_many :commodities, as: :commoditiable
  has_many :examination_details
end
