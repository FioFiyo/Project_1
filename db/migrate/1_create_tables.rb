class CreateTables < ActiveRecord::Migration

  def change
    
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.text   :description
      t.integer :age
      t.text    :tags #for different KINDS of posts ex: videos, photos, sound(soundcloud widgets)
      t.timestamps
    end

    create_table :comments do |t|
      t.text   :body
      t.string :title 
      t.references :user
      t.references :post
      t.timestamps
    end

    create_table :posts do |t|
      t.text :post
      t.text :repost
      t.references :user
      t.timestamps
    end

    create_table :repost do |t|
      t.references :user
      

  end

end