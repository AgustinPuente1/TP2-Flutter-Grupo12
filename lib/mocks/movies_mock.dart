const List movies = [
  {
    "id": 1,
    "title": "Avatar",
    "description": "En el planeta Pandora, Jake Sully, un exmarine parapléjico, se encuentra en medio de un conflicto entre los humanos y los Na'vi, los habitantes locales, mientras explora su conexión con este mundo único.",
    "genre": "Ciencia ficción",
    "rating": 8.5
  },
  {
    "id": 2,
    "title": "Avengers: Endgame",
    "description": "Después de los devastadores eventos de Infinity War, los Vengadores restantes deben reunir sus fuerzas y encontrar una manera de revertir las acciones de Thanos para salvar el universo.",
    "genre": "Acción/Aventura",
    "rating": 8.4
  },
  {
    "id": 3,
    "title": "Titanic",
    "description": "Una épica historia de amor prohibido entre Jack y Rose se desarrolla en el fatídico viaje del Titanic, el barco que chocó con un iceberg y se hundió en el Atlántico.",
    "genre": "Drama/Romance",
    "rating": 7.9
  },
  {
    "id": 4,
    "title": "Star Wars: The Force Awakens",
    "description": "Treinta años después de la caída del Imperio, una nueva amenaza surge mientras la Resistencia y la Primera Orden luchan por el control de la galaxia.",
    "genre": "Ciencia ficción/Aventura",
    "rating": 7.8
  },
  {
    "id": 5,
    "title": "Avengers: Infinity War",
    "description": "Los Vengadores y sus aliados deben enfrentarse al poderoso Thanos, quien busca reunir las gemas del infinito para imponer su visión de equilibrio universal.",
    "genre": "Acción/Aventura",
    "rating": 8.4
  },
  {
    "id": 6,
    "title": "Jurassic World",
    "description": "En un parque temático de dinosaurios completamente funcional, los visitantes se enfrentan al caos cuando un dinosaurio genéticamente modificado escapa y desata el terror.",
    "genre": "Ciencia ficción/Aventura",
    "rating": 7.0
  },
  {
    "id": 7,
    "title": "The Lion King (2019)",
    "description": "El joven Simba debe enfrentarse a su destino como el legítimo rey de la sabana tras el asesinato de su padre por su tío Scar, quien toma el trono por la fuerza.",
    "genre": "Animación/Drama",
    "rating": 6.9
  },
  {
    "id": 8,
    "title": "The Avengers",
    "description": "Un equipo de superhéroes se reúne para proteger al mundo de Loki y su ejército alienígena, en un enfrentamiento épico en Nueva York.",
    "genre": "Acción/Aventura",
    "rating": 8.0
  },
  {
    "id": 9,
    "title": "Furious 7",
    "description": "La familia de Dominic Toretto enfrenta a Deckard Shaw, un asesino que busca venganza por la muerte de su hermano, en una serie de persecuciones llenas de adrenalina.",
    "genre": "Acción/Aventura",
    "rating": 7.1
  },
  {
    "id": 10,
    "title": "Frozen II",
    "description": "Elsa y Anna se embarcan en una aventura para descubrir el origen de los poderes de Elsa y salvar su reino de una amenaza inminente.",
    "genre": "Animación/Familiar",
    "rating": 7.0
  },
  {
    "id": 11,
    "title": "Black Panther",
    "description": "T'Challa regresa a Wakanda para asumir su lugar como rey, pero debe enfrentarse a enemigos que desafían tanto su gobierno como el futuro de su nación.",
    "genre": "Acción/Aventura",
    "rating": 7.3
  },
  {
    "id": 12,
    "title": "Harry Potter and the Deathly Hallows: Part 2",
    "description": "Harry, Ron y Hermione enfrentan una última batalla contra Voldemort en Hogwarts, poniendo fin a la saga épica del joven mago.",
    "genre": "Fantasía/Aventura",
    "rating": 8.1
  },
  {
    "id": 13,
    "title": "The Incredibles 2",
    "description": "La familia Parr enfrenta nuevos desafíos mientras intentan equilibrar su vida cotidiana con sus responsabilidades como superhéroes.",
    "genre": "Animación/Familiar",
    "rating": 7.6
  },
  {
    "id": 14,
    "title": "The Dark Knight",
    "description": "Batman enfrenta al Joker, un villano anárquico que amenaza con sumir a Gotham en el caos, en una de las batallas más personales del Caballero Oscuro.",
    "genre": "Acción/Drama",
    "rating": 9.0
  },
  {
    "id": 15,
    "title": "Spider-Man: No Way Home",
    "description": "Peter Parker busca la ayuda de Doctor Strange para borrar su identidad como Spider-Man de la memoria de todos, pero el hechizo tiene consecuencias imprevistas.",
    "genre": "Acción/Aventura",
    "rating": 8.7
  },
  {
    "id": 16,
    "title": "Minions",
    "description": "Los pequeños secuaces amarillos buscan a un nuevo villano al que servir, lo que los lleva a unirse a Scarlet Overkill en una misión hilarante.",
    "genre": "Animación/Comedia",
    "rating": 6.4
  },
  {
    "id": 17,
    "title": "Iron Man 3",
    "description": "Tony Stark enfrenta sus demonios internos y una nueva amenaza en la forma del Mandarín, mientras lidia con las secuelas de la batalla de Nueva York.",
    "genre": "Acción/Aventura",
    "rating": 7.2
  },
  {
    "id": 18,
    "title": "Aquaman",
    "description": "Arthur Curry, mitad humano y mitad atlante, debe aceptar su destino como el legítimo rey de Atlantis para evitar una guerra entre los mundos.",
    "genre": "Acción/Aventura",
    "rating": 6.9
  },
  {
    "id": 19,
    "title": "Captain Marvel",
    "description": "Carol Danvers descubre su pasado mientras lucha por salvar la Tierra de un conflicto intergaláctico entre los Kree y los Skrulls.",
    "genre": "Acción/Ciencia ficción",
    "rating": 6.8
  },
  {
    "id": 20,
    "title": "Toy Story 4",
    "description": "Woody, Buzz y el resto de los juguetes enfrentan nuevas aventuras mientras intentan ayudar a Forky, un juguete hecho a mano, a encontrar su propósito.",
    "genre": "Animación/Familiar",
    "rating": 7.7
  },
  {
    "id": 21,
    "title": "Frozen",
    "description": "Elsa, una joven reina con poderes de hielo, accidentalmente congela su reino, lo que lleva a su hermana Anna a embarcarse en una misión para salvarla.",
    "genre": "Animación/Fantasía",
    "rating": 7.4
  },
  {
    "id": 22,
    "title": "Zootopia",
    "description": "En una ciudad donde los animales antropomórficos coexisten, una coneja policía y un astuto zorro unen fuerzas para resolver un misterio.",
    "genre": "Animación/Familiar",
    "rating": 8.0
  },
  {
    "id": 23,
    "title": "Finding Nemo",
    "description": "Un pez payaso llamado Marlin emprende una aventura a través del océano para encontrar a su hijo perdido, Nemo.",
    "genre": "Animación/Familiar",
    "rating": 8.1
  },
  {
    "id": 24,
    "title": "Shrek 2",
    "description": "Shrek y Fiona enfrentan nuevos desafíos cuando viajan al reino de Muy Muy Lejano para conocer a los padres de Fiona.",
    "genre": "Animación/Comedia",
    "rating": 7.9
  },
  {
    "id": 25,
    "title": "The Matrix",
    "description": "Neo descubre la verdad detrás de la realidad y se une a la resistencia contra las máquinas que han esclavizado a la humanidad.",
    "genre": "Ciencia ficción/Acción",
    "rating": 8.7
  }
];
