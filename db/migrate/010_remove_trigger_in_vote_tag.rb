class RemoveTriggerInVoteTag < ActiveRecord::Migration[8.0]
  def up
    execute <<-SQL
      DROP TRIGGER IF EXISTS tag_removal_trigger;
    SQL
  end

  def down
    # SQLite trigger for automatic tag removal
    execute <<-SQL
      CREATE TRIGGER tag_removal_trigger
        AFTER UPDATE ON restaurant_tags
        FOR EACH ROW
        WHEN (NEW.upvotes + NEW.downvotes >= 5)#{' '}
         AND (NEW.upvotes > 0)#{' '}
         AND (CAST(NEW.downvotes AS REAL) / CAST(NEW.upvotes AS REAL) > 3.0)
        BEGIN
          DELETE FROM restaurant_tags WHERE id = NEW.id;
        END;
    SQL
  end
end