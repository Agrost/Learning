# frozen_string_literal: true

class CreateAddBestToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :best, :boolean, default: false, null: false
  end
end
