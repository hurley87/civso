class Org < ActiveRecord::Base
  attr_accessible :description, :title, :industry, :tags_attributes

  validates :title, :presence => true,
                    :length => { :maximum => 40 }
  
  validates :description,  :presence => true
  validates :industry,  :presence => true
  validates :user_id,  :presence => true

  #has_many :comments, :dependent => :destroy
  has_many :comments, :dependent => :destroy, :as => :commentable
  has_many :tags, :dependent => :destroy

  accepts_nested_attributes_for :tags, 
                                :allow_destroy => :true,
                                :reject_if => proc {
                                    |attrs| attrs.all? { 
                                        |k, v| v.blank? 
                                    } 
                                }

  belongs_to :user

  

end
