#!/bin/bash

# Function to encrypt a file
encrypt_file() {
    local input_file="$1"
    local output_file="$2"
    local password="$3"
    
    openssl enc -aes-256-cbc -salt -in "$input_file" -out "$output_file" -pass pass:"$password"
}

# Function to decrypt a file
decrypt_file() {
    local input_file="$1"
    local output_file="$2"
    local password="$3"
    
    openssl enc -aes-256-cbc -d -in "$input_file" -out "$output_file" -pass pass:"$password"
}

# Main execution
echo "File Encryption/Decryption Tool"

while true; do
    echo "1. Encrypt a file"
    echo "2. Decrypt a file"
    echo "3. Quit"
    
    read -p "Enter your choice (1/2/3): " choice
    
    case $choice in
        1)
            read -p "Enter the input file: " input_file
            read -p "Enter the output file (encrypted): " output_file
            read -s -p "Enter the encryption password: " password
            echo
            encrypt_file "$input_file" "$output_file" "$password"
            echo "File encrypted successfully."
            ;;
        2)
            read -p "Enter the input file (encrypted): " input_file
            read -p "Enter the output file (decrypted): " output_file
            read -s -p "Enter the decryption password: " password
            echo
            decrypt_file "$input_file" "$output_file" "$password"
            echo "File decrypted successfully."
            ;;
        3)
            echo "Exiting the program."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a valid option (1/2/3)."
            ;;
    esac
done
