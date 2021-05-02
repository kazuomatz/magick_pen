class CreateSnippetsMagickPen < ActiveRecord::Migration[6.0]
  def change
    create_table :magick_pen_snippets do |t|
      t.string :pen_key, comment: 'key'
      t.string :controller_name
      t.string :action_name
      t.boolean :is_global, default: false, comment: 'for Global Snippet'
      t.text :content, comment: 'content html / limit: 4294967295 If necessary'
      t.text :original_content, comment: 'Original content html / limit: 4294967295 If necessary'
      t.timestamps
    end
    add_index :magick_pen_snippets, :pen_key
    add_index :magick_pen_snippets, [:pen_key, :controller_name, :action_name], name: 'key_controller_action'
  end
end
