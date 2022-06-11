# frozen_string_literal: true

class Product < ApplicationRecord
  redi_search do
    text_field :name, phonetic: 'dm:en', weight: 2
    text_field :description, phonetic: 'dm:en'
    numeric_field :quantity, sortable: true
  end
end
