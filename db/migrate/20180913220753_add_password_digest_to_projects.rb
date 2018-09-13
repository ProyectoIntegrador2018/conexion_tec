class AddPasswordDigestToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :password_digest, :string
  end
end
