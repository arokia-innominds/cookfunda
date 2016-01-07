class Ingredient < ActiveRecord::Base
  has_attached_file :attach, :styles => 
           { :medium => "300x300>", :thumb => "100x100>" }
end