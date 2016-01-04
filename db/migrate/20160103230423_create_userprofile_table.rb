class CreateUserprofileTable < ActiveRecord::Migration
    def change
        create_table :profiles do |t|
            t.string :username
            t.string :about
            t.integer :user_id
        end
    end
end
