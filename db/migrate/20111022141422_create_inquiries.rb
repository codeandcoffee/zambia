class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :business_type
      t.string :category
      t.string :application_type
      t.string :application_budget
      t.string :application_contract
      t.string :training_format
      t.string :training_topic
      t.string :training_group_size
      t.text :discussion_topic
      t.string :phone
      t.string :email
      t.string :contact_preference

      t.timestamps
    end
  end
end
