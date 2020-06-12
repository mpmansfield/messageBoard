class AddPromptToDiscussions < ActiveRecord::Migration[6.0]
  def change
    add_column :discussions, :prompt, :string
  end
end
