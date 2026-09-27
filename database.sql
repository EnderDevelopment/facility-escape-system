CREATE TABLE IF NOT EXISTS facility_escape (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    escape_count INT DEFAULT 0,
    last_escape TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (player_id) REFERENCES users(identifier)
);

INSERT INTO facility_escape (player_id, escape_count) SELECT identifier, 0 FROM users WHERE identifier NOT IN (SELECT player_id FROM facility_escape);