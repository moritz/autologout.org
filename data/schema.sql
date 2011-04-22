DROP TABLE IF EXISTS al_site;
CREATE TABLE al_site (
    id          INTEGER      NOT NULL AUTO_INCREMENT PRIMARY KEY,
    site_name   VARCHAR(255) NOT NULL,
    site_url    VARCHAR(255) NOT NULL,
    -- logout_url can be NULL if it's a protected site
    logout_url  VARCHAR(511),
    protected   BOOLEAN      NOT NULL DEFAULT FALSE,
    approved    BOOLEAN      NOT NULL DEFAULT FALSE,
    votes_yes   INTEGER      NOT NULL DEFAULT 0,
    votes_no    INTEGER      NOT NULL DEFAULT 0
)
