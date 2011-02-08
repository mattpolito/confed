class FullTextSearch1297194457 < ActiveRecord::Migration
  def self.up
      ActiveRecord::Base.connection.execute(<<-'eosql')
        DROP index IF EXISTS events_fts_idx
      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
                CREATE index events_fts_idx
        ON events
        USING gin((setweight(to_tsvector('english', coalesce(events.name, '')), 'A')))

      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
        DROP index IF EXISTS presentations_fts_idx
      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
                CREATE index presentations_fts_idx
        ON presentations
        USING gin((setweight(to_tsvector('english', coalesce(presentations.title, '')), 'A') || ' ' || setweight(to_tsvector('english', coalesce(presentations.speaker_cache, '')), 'B') || ' ' || setweight(to_tsvector('english', coalesce(presentations.event_cache, '')), 'C') || ' ' || setweight(to_tsvector('english', coalesce(presentations.tag_cache, '')), 'D') || ' ' || to_tsvector('english', coalesce(presentations.description, ''))))

      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
        DROP index IF EXISTS speakers_fts_idx
      eosql
      ActiveRecord::Base.connection.execute(<<-'eosql')
                CREATE index speakers_fts_idx
        ON speakers
        USING gin((setweight(to_tsvector('english', coalesce(speakers.name, '')), 'A') || ' ' || setweight(to_tsvector('english', coalesce(speakers.company_name, '')), 'B') || ' ' || setweight(to_tsvector('english', coalesce(speakers.location, '')), 'C')))

      eosql
  end
end
