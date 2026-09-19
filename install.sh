#!/bin/bash

# 1. Enforce Root Privileges
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this script as root (sudo ./install.sh)"
  exit 1
fi

echo "Installing Battletoads GRUB Theme..."

THEME_DIR="/boot/grub2/themes/Battletoads"
GRUB_FILE="/etc/default/grub"

# 2. Stage the Assets
echo "Creating directories and copying assets..."
mkdir -p "${THEME_DIR}"
cp -r background.png theme.txt arcade18.pf2 icons "${THEME_DIR}/"

# 3. Backup Existing Configuration
cp "${GRUB_FILE}" "${GRUB_FILE}.bak"
echo "Backed up ${GRUB_FILE} to ${GRUB_FILE}.bak"

# 4. Modify GRUB Configuration
echo "Applying theme configuration to ${GRUB_FILE}..."

# Comment out text-only console override if it exists
sed -i 's/^GRUB_TERMINAL_OUTPUT="console"/# GRUB_TERMINAL_OUTPUT="console"/' "${GRUB_FILE}"

# Set or inject the GRUB_THEME variable
if grep -q "^GRUB_THEME=" "${GRUB_FILE}"; then
    sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"${THEME_DIR}/theme.txt\"|" "${GRUB_FILE}"
else
    echo "GRUB_THEME=\"${THEME_DIR}/theme.txt\"" >> "${GRUB_FILE}"
fi

# Set or inject the GRUB_GFXMODE variable
if grep -q "^GRUB_GFXMODE=" "${GRUB_FILE}"; then
    sed -i 's/^GRUB_GFXMODE=.*/GRUB_GFXMODE="1920x1080x32,auto"/' "${GRUB_FILE}"
else
    echo 'GRUB_GFXMODE="1920x1080x32,auto"' >> "${GRUB_FILE}"
fi

# 5. Compile the Bootloader
echo "Generating new GRUB configuration..."
grub2-mkconfig -o /boot/grub2/grub.cfg

echo "Installation complete! The theme will be active on the next reboot."
