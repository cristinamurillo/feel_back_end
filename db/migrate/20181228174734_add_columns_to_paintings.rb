class AddColumnsToPaintings < ActiveRecord::Migration[5.2]
  def change
    add_column :paintings, :color1, :string
    add_column :paintings, :color2, :string
    add_column :paintings, :color3, :string
    add_column :paintings, :color4, :string
    add_column :paintings, :color5, :string
    add_column :paintings, :color6, :string
    add_column :paintings, :color7, :string
    add_column :paintings, :color8, :string
  end
end
