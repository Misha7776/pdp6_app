class CreateDbStatistics < ActiveRecord::Migration[7.0]
  def change
    create_view :db_statistics, materialized: true
  end
end
