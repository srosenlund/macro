-- no-transaction
-- Keep this a single statement: SQLx batches would create an implicit transaction.
-- Matches the sort key of every email view not ordered by inbound or outbound time.
CREATE INDEX CONCURRENTLY idx_email_threads_updated_view
    ON email_threads (link_id, COALESCE(latest_non_spam_message_ts, updated_at) DESC, id DESC);
