class AddCompetitionRefToPrize < ActiveRecord::Migration[6.0]
  def change
    add_reference :prizes, :competition, null: false, foreign_key: true
  end
end
