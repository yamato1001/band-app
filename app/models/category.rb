class Category < ApplicationRecord
  has_many :bandposts
  has_many :soloposts
  has_ancestry
end
