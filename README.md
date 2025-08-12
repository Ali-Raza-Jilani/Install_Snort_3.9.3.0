# Install_Snort_3.9.3.0
========================================================
Snort 3.9.3.0 Installation Script
========================================================

This script (snort_3.9.3.0.sh) automates the installation of Snort 3.9.3.0 
on Debian/Ubuntu-based systems. It installs all dependencies, builds and 
installs libdaq, configures Snort, and verifies the installation.

--------------------------------------------------------
Features
--------------------------------------------------------
- Fully automated installation
- Installs all required dependencies
- Downloads Snort 3.9.3.0 from the official GitHub release
- Builds and installs libdaq
- Configures Snort with tcmalloc for better performance
- Verifies installation

--------------------------------------------------------
Requirements
--------------------------------------------------------
- Ubuntu/Debian-based OS
- sudo privileges
- Stable internet connection
- At least 2 GB RAM and 2 CPU cores recommended

--------------------------------------------------------
Installation Steps
--------------------------------------------------------
1. Clone the repository:
   git clone https://github.com/Ali-Raza-Jilani/Install_Snort_3.9.3.0.git
   cd Install_Snort_3.9.3.0

2. Make the script executable:
   chmod +x install_snort.sh

3. Run the script:
   ./install_snort.sh

--------------------------------------------------------
What the Script Does
--------------------------------------------------------
1. Updates and installs all required dependencies
2. Downloads Snort 3.9.3.0 source code
3. Extracts the tarball into a build directory
4. Clones, builds, and installs libdaq
5. Configures, compiles, and installs Snort
6. Verifies installation by running "snort -V"

--------------------------------------------------------
Troubleshooting
--------------------------------------------------------
- If you get "Permission denied", make sure the script is executable:
  chmod +x snort_3.9.3.0.sh

- If "snort" command is not found after installation:
  export PATH=/usr/local/bin:$PATH

--------------------------------------------------------
Notes
--------------------------------------------------------
- Tested on Kali Linux 2025.2
- Uses --enable-tcmalloc for memory optimization
- Installation may take 10–20 minutes depending on system speed

--------------------------------------------------------
License
--------------------------------------------------------
This script is licensed under the MIT License.
You are free to modify and use it.

--------------------------------------------------------
Author
--------------------------------------------------------
Your Ali Raza Jilani
GitHub: https://github.com/Ali-Raza-Jilani
========================================================
