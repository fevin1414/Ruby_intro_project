class AddApiIdToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :api_id, :string
  end
end
