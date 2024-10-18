# OCaml Dream Web App Quick Start

Welcome to your OCaml Dream web application! This guide will help you get started quickly.

## Prerequisites

- [OCaml](https://ocaml.org/) installed
- [Opam](https://opam.ocaml.org/) package manager installed

## Installation

1. **Clone the repository:**
  ```sh
  git clone https://github.com/Colinster327/web_ocaml.git
  cd your-repo
  ```

2. **Install dependencies:**
  ```sh
  opam install . --deps-only
  ```

3. **Build the project:**
  ```sh
  dune build
  ```

## Running the Application

1. **Start the server:**
  ```sh
  dune exec ./bin/main.exe
  ```

2. **Access the application:**
  Open your web browser and navigate to `http://localhost:8080`.

## Project Structure

- `bin/`: Contains the main entry point of the application.
- `lib/`: Contains the core logic of the application.
- `static/`: Contains static files (CSS, JavaScript, images).

## Contributing

Feel free to open issues or submit pull requests. Contributions are welcome!

## License

This project is licensed under the MIT License.

Happy coding!
