-- no-transaction
-- Keep this a single statement: SQLx batches would create an implicit transaction.
-- Lets the starred views read one inbox's starred messages without scanning the inbox.
CREATE INDEX CONCURRENTLY idx_email_messages_starred_view
    ON email_messages (link_id, thread_id)
    WHERE is_starred;
