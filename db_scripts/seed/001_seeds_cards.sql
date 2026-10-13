INSERT INTO tbl_collections (id, collection_set_name, release_date, total_cards_in_collection) VALUES
    (1, 'Base Set', '1999-01-09', 102),
    (2, 'Jungle', '1999-06-16', 64),
    (3, 'Fossil', '1999-10-10', 62);

INSERT INTO tbl_card_types (id, type_name) VALUES
    (1, 'Fire'),
    (2, 'Water'),
    (3, 'Grass'),
    (4, 'Lightning'),
    (5, 'Psychic');

INSERT INTO tbl_stages (id, stage_name) VALUES
    (1, 'Basic'),
    (2, 'Stage 1'),
    (3, 'Stage 2');

INSERT INTO tbl_cards (
    collection_id,
    card_type_id,
    stage_id,
    hp,
    name,
    info,
    attack,
    damage,
    weak,
    resist,
    retreat,
    card_number_in_collection
)
SELECT
    1 + ((n - 1) % 3) AS collection_id,
    1 + ((n - 1) % 5) AS card_type_id,
    1 + ((n - 1) % 3) AS stage_id,
    30 + ((n * 7) % 120) AS hp,
    CASE (n - 1) % 20
        WHEN 0 THEN 'Pikachu'
        WHEN 1 THEN 'Charmander'
        WHEN 2 THEN 'Bulbasaur'
        WHEN 3 THEN 'Squirtle'
        WHEN 4 THEN 'Pidgey'
        WHEN 5 THEN 'Raichu'
        WHEN 6 THEN 'Charmeleon'
        WHEN 7 THEN 'Ivysaur'
        WHEN 8 THEN 'Wartortle'
        WHEN 9 THEN 'Venusaur'
        WHEN 10 THEN 'Lapras'
        WHEN 11 THEN 'Snorlax'
        WHEN 12 THEN 'Jigglypuff'
        WHEN 13 THEN 'Magikarp'
        WHEN 14 THEN 'Gyarados'
        WHEN 15 THEN 'Dratini'
        WHEN 16 THEN 'Dragonite'
        WHEN 17 THEN 'Eevee'
        WHEN 18 THEN 'Vaporeon'
        ELSE 'Flareon'
    END AS name,
    CASE (n - 1) % 20
        WHEN 0 THEN 'A small electric mouse that can generate a powerful static charge.'
        WHEN 1 THEN 'A flame Pokémon that breathes fire and loves warmth.'
        WHEN 2 THEN 'A grass Pokémon with a seed on its back that stores energy.'
        WHEN 3 THEN 'A water Pokémon that hides in its shell for protection.'
        WHEN 4 THEN 'A fast flying Pokémon that loves open skies.'
        WHEN 5 THEN 'An evolved form of Pikachu with stronger electric attacks.'
        WHEN 6 THEN 'A fiery evolution that grows more powerful with each battle.'
        WHEN 7 THEN 'A stronger grass Pokémon with thick vines and endurance.'
        WHEN 8 THEN 'A water Pokémon known for its strong defenses.'
        WHEN 9 THEN 'A towering grass Pokémon with a massive flower.'
        WHEN 10 THEN 'A gentle sea Pokémon with excellent swimming speed.'
        WHEN 11 THEN 'A huge Pokémon that can sleep for long periods.'
        WHEN 12 THEN 'A cheerful balloon Pokémon that sings to relax enemies.'
        WHEN 13 THEN 'A weak but famous fish Pokémon that splashes around.'
        WHEN 14 THEN 'A powerful sea serpent that strikes with force.'
        WHEN 15 THEN 'A dragon Pokémon that grows stronger over time.'
        WHEN 16 THEN 'A majestic dragon with powerful flying abilities.'
        WHEN 17 THEN 'A versatile Pokémon with many evolutions.'
        WHEN 18 THEN 'A graceful water Pokémon with elegant movement.'
        ELSE 'A fiery evolution that burns with intensity.'
    END AS info,
    CASE (n - 1) % 10
        WHEN 0 THEN 'Thunder Shock'
        WHEN 1 THEN 'Ember'
        WHEN 2 THEN 'Vine Whip'
        WHEN 3 THEN 'Water Pulse'
        WHEN 4 THEN 'Gust'
        WHEN 5 THEN 'Spark'
        WHEN 6 THEN 'Flame Burst'
        WHEN 7 THEN 'Leaf Blade'
        WHEN 8 THEN 'Aqua Tail'
        ELSE 'Double Kick'
    END AS attack,
    CAST((10 + ((n * 7) % 70)) AS VARCHAR(20)) AS damage,
    CASE (n - 1) % 5
        WHEN 0 THEN 'Fighting'
        WHEN 1 THEN 'Water'
        WHEN 2 THEN 'Fire'
        WHEN 3 THEN 'Lightning'
        ELSE 'Psychic'
    END AS weak,
    CASE (n - 1) % 4
        WHEN 0 THEN 'Psychic'
        WHEN 1 THEN 'Grass'
        WHEN 2 THEN 'Metal'
        ELSE 'None'
    END AS resist,
    CAST((1 + ((n - 1) % 3)) AS VARCHAR(20)) AS retreat,
    n AS card_number_in_collection
FROM generate_series(1, 200) AS g(n);
