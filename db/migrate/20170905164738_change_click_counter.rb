class ChangeClickCounter < ActiveRecord::Migration[5.0]
	def change
		change_column :urls, :click_counter, :integer, default: 0
	end
end
