class AddVoteCountTriggers < ActiveRecord::Migration[6.1]
  def up
    # SQLite triggers for tag votes - INSERT
    execute <<-SQL
      CREATE TRIGGER tag_vote_insert_trigger
        AFTER INSERT ON tag_votes
        FOR EACH ROW
        BEGIN
          UPDATE restaurant_tags#{' '}
          SET upvotes = upvotes + CASE WHEN NEW.vote_type = 'up' THEN 1 ELSE 0 END,
              downvotes = downvotes + CASE WHEN NEW.vote_type = 'down' THEN 1 ELSE 0 END
          WHERE id = NEW.restaurant_tag_id;
        END;
    SQL

    # SQLite triggers for tag votes - DELETE
    execute <<-SQL
      CREATE TRIGGER tag_vote_delete_trigger
        AFTER DELETE ON tag_votes
        FOR EACH ROW
        BEGIN
          UPDATE restaurant_tags#{' '}
          SET upvotes = MAX(upvotes - CASE WHEN OLD.vote_type = 'up' THEN 1 ELSE 0 END, 0),
              downvotes = MAX(downvotes - CASE WHEN OLD.vote_type = 'down' THEN 1 ELSE 0 END, 0)
          WHERE id = OLD.restaurant_tag_id;
        END;
    SQL

    # SQLite triggers for tag votes - UPDATE
    execute <<-SQL
      CREATE TRIGGER tag_vote_update_trigger
        AFTER UPDATE ON tag_votes
        FOR EACH ROW
        WHEN OLD.vote_type != NEW.vote_type
        BEGIN
          UPDATE restaurant_tags#{' '}
          SET upvotes = upvotes#{' '}
                      - CASE WHEN OLD.vote_type = 'up' THEN 1 ELSE 0 END
                      + CASE WHEN NEW.vote_type = 'up' THEN 1 ELSE 0 END,
              downvotes = downvotes#{' '}
                        - CASE WHEN OLD.vote_type = 'down' THEN 1 ELSE 0 END
                        + CASE WHEN NEW.vote_type = 'down' THEN 1 ELSE 0 END
          WHERE id = NEW.restaurant_tag_id;
        END;
    SQL

    # SQLite triggers for review votes - INSERT
    execute <<-SQL
      CREATE TRIGGER review_vote_insert_trigger
        AFTER INSERT ON review_votes
        FOR EACH ROW
        BEGIN
          UPDATE reviews#{' '}
          SET helpful_votes = helpful_votes + CASE WHEN NEW.vote_type = 'helpful' THEN 1 ELSE 0 END,
              unhelpful_votes = unhelpful_votes + CASE WHEN NEW.vote_type = 'unhelpful' THEN 1 ELSE 0 END
          WHERE id = NEW.review_id;
        END;
    SQL

    # SQLite triggers for review votes - DELETE
    execute <<-SQL
      CREATE TRIGGER review_vote_delete_trigger
        AFTER DELETE ON review_votes
        FOR EACH ROW
        BEGIN
          UPDATE reviews#{' '}
          SET helpful_votes = MAX(helpful_votes - CASE WHEN OLD.vote_type = 'helpful' THEN 1 ELSE 0 END, 0),
              unhelpful_votes = MAX(unhelpful_votes - CASE WHEN OLD.vote_type = 'unhelpful' THEN 1 ELSE 0 END, 0)
          WHERE id = OLD.review_id;
        END;
    SQL

    # SQLite triggers for review votes - UPDATE
    execute <<-SQL
      CREATE TRIGGER review_vote_update_trigger
        AFTER UPDATE ON review_votes
        FOR EACH ROW
        WHEN OLD.vote_type != NEW.vote_type
        BEGIN
          UPDATE reviews#{' '}
          SET helpful_votes = helpful_votes#{' '}
                            - CASE WHEN OLD.vote_type = 'helpful' THEN 1 ELSE 0 END
                            + CASE WHEN NEW.vote_type = 'helpful' THEN 1 ELSE 0 END,
              unhelpful_votes = unhelpful_votes#{' '}
                              - CASE WHEN OLD.vote_type = 'unhelpful' THEN 1 ELSE 0 END
                              + CASE WHEN NEW.vote_type = 'unhelpful' THEN 1 ELSE 0 END
          WHERE id = NEW.review_id;
        END;
    SQL

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

  def down
    # Drop SQLite triggers
    execute "DROP TRIGGER IF EXISTS tag_vote_insert_trigger;"
    execute "DROP TRIGGER IF EXISTS tag_vote_delete_trigger;"
    execute "DROP TRIGGER IF EXISTS tag_vote_update_trigger;"
    execute "DROP TRIGGER IF EXISTS review_vote_insert_trigger;"
    execute "DROP TRIGGER IF EXISTS review_vote_delete_trigger;"
    execute "DROP TRIGGER IF EXISTS review_vote_update_trigger;"
    execute "DROP TRIGGER IF EXISTS tag_removal_trigger;"
  end
end
