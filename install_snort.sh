#!/bin/bash

# Snort 3.9.3.0 Installation Script by Ali-Raza-Jilani
# This script will install Snort 3.9.3.0 on your system.

set -e # Exit on any error

echo "=== Step 1: Installing Dependencies ==="
sudo apt update -y
sudo apt install -y git cmake build-essential flex bison libpcap-dev \
    libpcre2-dev libdumbnet-dev libluajit-5.1-dev zlib1g-dev pkg-config \
    libhwloc-dev liblzma-dev openssl libssl-dev libnetfilter-queue-dev \
    libmnl-dev libunwind-dev libfl-dev libmaxminddb-dev libgoogle-perftools-dev

echo -e "\n=== Step 2: Downloading and Extracting Snort 3.9.3.0 ==="
SNORT_VER="3.9.3.0"
TAR_FILE="${SNORT_VER}.tar.gz"
INSTALL_DIR="$HOME/snort_src"
EXTRACT_DIR="snort3-$SNORT_VER"

mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

if [ ! -f "$TAR_FILE" ]; then
    wget -q "https://github.com/snort3/snort3/archive/refs/tags/${TAR_FILE}" -O "$TAR_FILE"
else
    echo "Tar file already exists. Skipping download."
fi

mkdir -p "$EXTRACT_DIR"
echo "Extracting $TAR_FILE..."
tar -xzf "$TAR_FILE" --strip-components=1 -C "$EXTRACT_DIR" || \
    { echo "Extraction failed"; exit 1; }

echo -e "\n=== Installing libdaq (Required Dependency) ==="
cd "$INSTALL_DIR"
if [ ! -d "libdaq" ]; then
    git clone https://github.com/snort3/libdaq.git
fi
cd libdaq
./bootstrap
./configure
make -j$(nproc)
sudo make install
sudo ldconfig

echo -e "\n=== Step 3: Building & Installing Snort ==="
cd "$INSTALL_DIR/$EXTRACT_DIR"
./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc
cd build  
make -j$(nproc)
sudo make install
sudo ldconfig

echo -e "\n=== Step 4: Verifying Installation ==="
if command -v snort &> /dev/null; then
    snort -V
    echo -e "\nSnort ${SNORT_VER} installed successfully!"
else
    echo "Installation verification failed!"
    exit 1
fi