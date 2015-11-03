class CreateTables < ActiveRecord::Migration

  def change
    
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.text   :description
      t.timestamps
    end

      create_table :profiles do |t|
      t.integer :age
      t.text    :tags #for different KINDS of posts ex: videos, photos, sound(soundcloud widgets)
      t.date    :latestpost
      t.timestamps
    end
    

  end

end