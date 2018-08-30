class RenameAstronautMissionsToAstronautSpaceMissions < ActiveRecord::Migration[5.1]
  def change
    rename_table :astronaut_missions, :astronaut_space_missions
  end
end
