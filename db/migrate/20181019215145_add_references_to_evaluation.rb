class AddReferencesToEvaluation < ActiveRecord::Migration[5.2]
  def change
    add_reference :evaluations, :professor, index: true
    add_reference :evaluations, :project, index: true
  end
end
