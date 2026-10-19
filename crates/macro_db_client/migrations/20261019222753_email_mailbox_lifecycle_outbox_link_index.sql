-- no-transaction
-- Keep this a single statement: SQLx batches would create an implicit transaction.
CREATE INDEX CONCURRENTLY email_mailbox_lifecycle_outbox_link
    ON email_mailbox_lifecycle_outbox (link_id);
