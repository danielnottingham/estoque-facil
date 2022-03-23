class CreateBusinessUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :business_units do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
