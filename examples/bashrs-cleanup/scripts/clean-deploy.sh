#!/bin/bash
# Clean deployment script following best practices

set -euo pipefail

# Configuration
readonly SCRIPT_NAME="$(basename "$0")"
readonly WEB_ROOT="/var/www/html"
readonly SERVICE_NAME="nginx"

# Display usage information
usage() {
    cat << USAGE
Usage: ${SCRIPT_NAME} <project_dir> <environment>

Arguments:
    project_dir    Path to the project directory
    environment    Deployment environment (dev|staging|prod)

Example:
    ${SCRIPT_NAME} /home/user/myapp prod

USAGE
    exit 1
}

# Validate required arguments
validate_args() {
    local project_dir="$1"
    local environment="$2"

    if [[ -z "${project_dir}" ]]; then
        echo "Error: Project directory is required" >&2
        usage
    fi

    if [[ ! -d "${project_dir}" ]]; then
        echo "Error: Directory '${project_dir}' does not exist" >&2
        exit 1
    fi

    if [[ ! "${environment}" =~ ^(dev|staging|prod)$ ]]; then
        echo "Error: Environment must be dev, staging, or prod" >&2
        usage
    fi
}

# Update project from git repository
update_repository() {
    local project_dir="$1"

    echo "Updating repository in ${project_dir}..."
    cd "${project_dir}"
    git pull
}

# Install project dependencies
install_dependencies() {
    echo "Installing dependencies..."
    npm install
}

# Build and deploy for production
deploy_production() {
    local web_root="$1"

    echo "Building for production..."
    npm run build

    echo "Deploying to ${web_root}..."
    cp -r dist "${web_root}"

    echo "Restarting ${SERVICE_NAME}..."
    sudo systemctl restart "${SERVICE_NAME}"
}

# Main deployment function
main() {
    local project_dir="${1:-}"
    local environment="${2:-}"

    validate_args "${project_dir}" "${environment}"

    echo "Deploying to ${environment} environment..."

    update_repository "${project_dir}"
    install_dependencies

    if [[ "${environment}" == "prod" ]]; then
        deploy_production "${WEB_ROOT}"
    fi

    echo "Deployment complete!"
}

# Execute main function with all arguments
main "$@"
