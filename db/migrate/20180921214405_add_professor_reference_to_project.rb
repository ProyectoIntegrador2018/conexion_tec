class AddProfessorReferenceToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :professor, index: true
  end
end
