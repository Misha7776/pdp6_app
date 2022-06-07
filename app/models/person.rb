class Person < ApplicationRecord
  MARITAL_STATUS = %w[single in_love engaged divorced complicated].freeze
  kredis_string :first_name
  kredis_string :last_name
  kredis_integer :age
  kredis_boolean :any_pets
  kredis_enum :marital_status, values: MARITAL_STATUS, default: 'complicated'
  kredis_list :favourite_food
  kredis_unique_list :skills, limit: 5

  def assign_redis_params(params)
    first_name.value = params[:first_name]
    last_name.value = params[:last_name]
    age.value = params[:age]
    any_pets.value = params[:any_pets]
    marital_status.value = params[:marital_status]
    favourite_food.append(*params[:favourite_food]) if params[:favourite_food].present?
    skills.append(*params[:skills]) if params[:skills].present?
    true
  end
end
