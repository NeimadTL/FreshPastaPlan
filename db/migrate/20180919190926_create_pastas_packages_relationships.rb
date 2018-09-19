class CreatePastasPackagesRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :pastas_packages_relationships do |t|
      t.integer :pasta_id
      t.integer :package_id

      t.timestamps
    end
  end
end
