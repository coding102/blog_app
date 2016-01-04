class CreatePostsTable < ActiveRecord::Migration
    def change
        create_table :posts do |t|
            t.string :message
            t.datetime :posted
            t.integer :user_id
        end
    end
end
