class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :physician_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
