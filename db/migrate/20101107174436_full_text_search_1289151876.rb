class FullTextSearch1289151876 < ActiveRecord::Migration
  def self.up
    execute(<<-'eosql'.strip)
      DROP index IF EXISTS events_fts_idx
    eosql
    execute(<<-'eosql'.strip)
      CREATE index events_fts_idx
      ON events
      USING gin((setweight(to_tsvector('english', coalesce("events"."name", '')), 'A')))
    eosql
    execute(<<-'eosql'.strip)
      DROP index IF EXISTS presentations_fts_idx
    eosql
    execute(<<-'eosql'.strip)
      CREATE index presentations_fts_idx
      ON presentations
      USING gin((setweight(to_tsvector('english', coalesce("presentations"."tag_cache", '')), 'A') || ' ' || setweight(to_tsvector('english', coalesce("presentations"."title", '')), 'B') || ' ' || setweight(to_tsvector('english', coalesce("presentations"."description", '')), 'C')))
    eosql
    execute(<<-'eosql'.strip)
      DROP index IF EXISTS speakers_fts_idx
    eosql
    execute(<<-'eosql'.strip)
      CREATE index speakers_fts_idx
      ON speakers
      USING gin((setweight(to_tsvector('english', coalesce("speakers"."name", '')), 'A') || ' ' || setweight(to_tsvector('english', coalesce("speakers"."company_name", '')), 'B') || ' ' || setweight(to_tsvector('english', coalesce("speakers"."location", '')), 'C')))
    eosql
  end

  def self.down
    execute(<<-'eosql'.strip)
      DROP index IF EXISTS events_fts_idx
    eosql
    execute(<<-'eosql'.strip)
      DROP index IF EXISTS presentations_fts_idx
    eosql
    execute(<<-'eosql'.strip)
      DROP index IF EXISTS speakers_fts_idx
    eosql
  end
end
