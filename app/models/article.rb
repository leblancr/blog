# frozen_string_literal: true

# Represents an article in the system.
#
# This model handles the data validation for articles.
# Each article must have a title and body. The body must be
# at least 10 characters long.
class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
