CREATE TABLE tbl_collections (
    id SERIAL PRIMARY KEY,
    collection_set_name VARCHAR(100) NOT NULL,
    release_date DATE NOT NULL,
    total_cards_in_collection INTEGER NOT NULL CHECK (total_cards_in_collection >= 0)
);

CREATE TABLE tbl_card_types (
    id SERIAL PRIMARY KEY,
    type_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE tbl_stages (
    id SERIAL PRIMARY KEY,
    stage_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE tbl_cards (
    id SERIAL PRIMARY KEY,
    collection_id INTEGER NOT NULL,
    card_type_id INTEGER NOT NULL,
    stage_id INTEGER NOT NULL,
    hp INTEGER,
    name VARCHAR(150) NOT NULL,
    info TEXT,
    attack VARCHAR(100),
    damage VARCHAR(20),
    weak VARCHAR(50),
    resist VARCHAR(50),
    retreat VARCHAR(20),
    card_number_in_collection INTEGER,
    CONSTRAINT fk_cards_collection
        FOREIGN KEY (collection_id)
        REFERENCES tbl_collections (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_cards_type
        FOREIGN KEY (card_type_id)
        REFERENCES tbl_card_types (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_cards_stage
        FOREIGN KEY (stage_id)
        REFERENCES tbl_stages (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE INDEX idx_cards_collection_id ON tbl_cards (collection_id);
CREATE INDEX idx_cards_type_id ON tbl_cards (card_type_id);
CREATE INDEX idx_cards_stage_id ON tbl_cards (stage_id);
