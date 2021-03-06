# Information 分类
class InformationCategory
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :parent, class_name: 'InformationCategory', inverse_of: :children, index: true
  has_many :children, class_name: 'InformationCategory', inverse_of: :parent

  field :name, type: String

  has_many :information
end
