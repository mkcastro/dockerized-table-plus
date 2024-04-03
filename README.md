# TablePlus Docker Setup

This project allows you to run TablePlus, a modern and intuitive GUI for database management, in a Docker container on Linux systems. This approach facilitates running TablePlus on distributions where direct installation might not be straightforward.

## Prerequisites

- Docker and Docker Compose installed on your Linux system.
- Basic understanding of Docker and command-line interface usage.

## Installation and Setup

### 1. Clone the Repository

Clone this repository to your local machine or download the Dockerfile, `docker-compose.yml`, and `run_tableplus.sh` script.

```bash
git clone git@github.com:mkcastro/dockerized-table-plus.git
cd dockerized-table-plus
```

### 2. Build the Docker Image

Navigate to the project directory and build the Docker image with the following command:

```bash
docker-compose build
```

### 3. Running TablePlus

To run TablePlus, execute the provided script:

```bash
./run_tableplus.sh
```

The script automatically handles `xhost` permissions to allow the Docker container to display the GUI on your local X server. It also ensures that permissions are revoked when the script exits to maintain system security.

### 4. Stopping TablePlus

Simply press `Ctrl+C` in the terminal where the script is running. The script will gracefully stop the TablePlus container and revoke any granted `xhost` permissions.

## Troubleshooting

- **Issue**: TablePlus doesn't start or displays errors about missing libraries.
  - **Solution**: Ensure that all required libraries are included in your Dockerfile and rebuild the image.
- **Issue**: Errors related to X server display.
  - **Solution**: Check that the `DISPLAY` environment variable is correctly passed to the Docker container and that your X server is configured to allow connections from local Docker containers.

## Security Note

Running GUI applications in Docker containers requires allowing access to your X server, which can introduce security risks. Only use trusted Docker images and be cautious when granting `xhost` permissions.

## Contributing

Contributions to this project are welcome. Please submit issues and pull requests with any improvements or bug fixes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
