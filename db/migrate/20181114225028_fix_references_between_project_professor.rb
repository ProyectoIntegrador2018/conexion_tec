class FixReferencesBetweenProjectProfessor < ActiveRecord::Migration[5.2]
  def change
    remove_reference :projects, :professor, index: true
    add_reference :professors, :project, index:true
  end
end
