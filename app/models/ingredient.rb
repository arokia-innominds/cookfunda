class Ingredient < ActiveRecord::Base
  has_attached_file :attach, :styles => 
           { :medium => "300x300>", small: "100x100>", :thumb => "50x50>" }
end
