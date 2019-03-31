class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :gender
      t.string :date_of_birth
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
