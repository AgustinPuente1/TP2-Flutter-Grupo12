const List movies = [
  {
    "id": 1,
    "title": "Avatar",
    "description": "En el planeta Pandora, Jake Sully, un exmarine parapléjico, se encuentra en medio de un conflicto entre los humanos y los Na'vi, los habitantes locales, mientras explora su conexión con este mundo único.",
    "genre": "Ciencia ficción",
    "rating": 8.5,
    "image": "assets/images/Avatar.jpg"
  },
  {
    "id": 2,
    "title": "AvengersEndgame",
    "description": "Después de los devastadores eventos de Infinity War, los Vengadores restantes deben reunir sus fuerzas y encontrar una manera de revertir las acciones de Thanos para salvar el universo.",
    "genre": "Acción/Aventura",
    "rating": 8.4,
    "image": "assets/images/AvengersEndgame.jpg"
  },
  {
    "id": 3,
    "title": "Titanic",
    "description": "Una épica historia de amor prohibido entre Jack y Rose se desarrolla en el fatídico viaje del Titanic, el barco que chocó con un iceberg y se hundió en el Atlántico.",
    "genre": "Drama/Romance",
    "rating": 7.9,
    "image": "assets/images/Titanic.jpg"
  },
  {
    "id": 4,
    "title": "Star Wars: The Force Awakens",
    "description": "Treinta años después de la caída del Imperio, una nueva amenaza surge mientras la Resistencia y la Primera Orden luchan por el control de la galaxia.",
    "genre": "Ciencia ficción/Aventura",
    "rating": 7.8,
    "image": "assets/images/Star Wars The Force Awakens.jpg"
  },
  {
    "id": 5,
    "title": "Avengers: Infinity War",
    "description": "Los Vengadores y sus aliados deben enfrentarse al poderoso Thanos, quien busca reunir las gemas del infinito para imponer su visión de equilibrio universal.",
    "genre": "Acción/Aventura",
    "rating": 8.4,
    "image": "assets/images/Avengers Infinity War.jpg"
  },
  {
    "id": 6,
    "title": "Jurassic World",
    "description": "En un parque temático de dinosaurios completamente funcional, los visitantes se enfrentan al caos cuando un dinosaurio genéticamente modificado escapa y desata el terror.",
    "genre": "Ciencia ficción/Aventura",
    "rating": 7.0,
    "image": "assets/images/Jurassic World.jpg"
  },
  {
    "id": 7,
    "title": "The Lion King (2019)",
    "description": "El joven Simba debe enfrentarse a su destino como el legítimo rey de la sabana tras el asesinato de su padre por su tío Scar, quien toma el trono por la fuerza.",
    "genre": "Animación/Drama",
    "rating": 6.9,
    "image": "assets/images/The Lion King 2019.jpg"
  },
  {
    "id": 8,
    "title": "The Avengers",
    "description": "Un equipo de superhéroes se reúne para proteger al mundo de Loki y su ejército alienígena, en un enfrentamiento épico en Nueva York.",
    "genre": "Acción/Aventura",
    "rating": 8.0,
    "image": "assets/images/The Avengers.jpg"
  },
  {
    "id": 9,
    "title": "Furious 7",
    "description": "La familia de Dominic Toretto enfrenta a Deckard Shaw, un asesino que busca venganza por la muerte de su hermano, en una serie de persecuciones llenas de adrenalina.",
    "genre": "Acción/Aventura",
    "rating": 7.1,
    "image": "assets/images/Furious 7.jpg"
  },
  {
    "id": 10,
    "title": "Frozen II",
    "description": "Elsa y Anna se embarcan en una aventura para descubrir el origen de los poderes de Elsa y salvar su reino de una amenaza inminente.",
    "genre": "Animación/Familiar",
    "rating": 7.0,
    "image": "assets/images/Frozen II.jpg"
  },
  {
    "id": 11,
    "title": "Black Panther",
    "description": "T'Challa regresa a Wakanda para asumir su lugar como rey, pero debe enfrentarse a enemigos que desafían tanto su gobierno como el futuro de su nación.",
    "genre": "Acción/Aventura",
    "rating": 7.3,
    "image": "assets/images/Black Panther.jpg"
  },
  {
    "id": 12,
    "title": "Harry Potter and the Deathly Hallows: Part 2",
    "description": "Harry, Ron y Hermione enfrentan una última batalla contra Voldemort en Hogwarts, poniendo fin a la saga épica del joven mago.",
    "genre": "Fantasía/Aventura",
    "rating": 8.1,
    "image": "assets/images/Harry Potter and the Deathly Hallows Part 2.jpg"
  },
  {
    "id": 13,
    "title": "The Incredibles 2",
    "description": "La familia Parr enfrenta nuevos desafíos mientras intentan equilibrar su vida cotidiana con sus responsabilidades como superhéroes.",
    "genre": "Animación/Familiar",
    "rating": 7.6,
    "image": "assets/images/The Incredibles 2.jpg"
  },
  {
    "id": 14,
    "title": "The Dark Knight",
    "description": "Batman enfrenta al Joker, un villano anárquico que amenaza con sumir a Gotham en el caos, en una de las batallas más personales del Caballero Oscuro.",
    "genre": "Acción/Drama",
    "rating": 9.0,
    "image": "assets/images/The Dark Knight.jpg"
  },
  {
    "id": 15,
    "title": "Spider-Man: No Way Home",
    "description": "Peter Parker busca la ayuda de Doctor Strange para borrar su identidad como Spider-Man de la memoria de todos, pero el hechizo tiene consecuencias imprevistas.",
    "genre": "Acción/Aventura",
    "rating": 8.7,
    "image": "assets/images/Spider-Man No Way Home.jpg"
  },
  {
    "id": 16,
    "title": "Minions",
    "description": "Los pequeños secuaces amarillos buscan a un nuevo villano al que servir, lo que los lleva a unirse a Scarlet Overkill en una misión hilarante.",
    "genre": "Animación/Comedia",
    "rating": 6.4,
    "image": "assets/images/Minions.jpg"
  },
  {
    "id": 17,
    "title": "Iron Man 3",
    "description": "Tony Stark enfrenta sus demonios internos y una nueva amenaza en la forma del Mandarín, mientras lidia con las secuelas de la batalla de Nueva York.",
    "genre": "Acción/Aventura",
    "rating": 7.2,
    "image": "assets/images/Iron Man 3.jpg"
  },
  {
    "id": 18,
    "title": "Aquaman",
    "description": "Arthur Curry, mitad humano y mitad atlante, debe aceptar su destino como el legítimo rey de Atlantis para evitar una guerra entre los mundos.",
    "genre": "Acción/Aventura",
    "rating": 6.9,
    "image": "assets/images/Aquaman.jpg"
  },
  {
    "id": 19,
    "title": "Captain Marvel",
    "description": "Carol Danvers descubre su pasado mientras lucha por salvar la Tierra de un conflicto intergaláctico entre los Kree y los Skrulls.",
    "genre": "Acción/Ciencia ficción",
    "rating": 6.8,
    "image": "assets/images/Captain Marvel.jpg"
  },
  {
    "id": 20,
    "title": "Toy Story 4",
    "description": "Woody, Buzz y el resto de los juguetes enfrentan nuevas aventuras mientras intentan ayudar a Forky, un juguete hecho a mano, a encontrar su propósito.",
    "genre": "Animación/Familiar",
    "rating": 7.7,
    "image": "assets/images/Toy Story 4.jpg"
  },
  {
    "id": 21,
    "title": "Frozen",
    "description": "Elsa, una joven reina con poderes de hielo, accidentalmente congela su reino, lo que lleva a su hermana Anna a embarcarse en una misión para salvarla.",
    "genre": "Animación/Fantasía",
    "rating": 7.4,
    "image": "assets/images/Frozen.jpg"
  },
  {
    "id": 22,
    "title": "Zootopia",
    "description": "En una ciudad donde los animales antropomórficos coexisten, una coneja policía y un astuto zorro unen fuerzas para resolver un misterio.",
    "genre": "Animación/Familiar",
    "rating": 8.0,
    "image": "assets/images/Zootopia.jpg"
  }
];
