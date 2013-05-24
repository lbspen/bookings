class CreateEngineers < ActiveRecord::Migration
  def change
    create_table :engineers do |t|
      t.string :name

      t.timestamps
    end
  end
end
