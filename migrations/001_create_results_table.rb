Sequel.migration {
  up do
    create_table(:results) do
      primary_key :id
      Integer :result, null: false
    end
  end

  down do
    drop_table(:results)
  end
}
