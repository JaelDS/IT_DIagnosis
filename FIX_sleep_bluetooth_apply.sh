#!/bin/bash
# ============================================================
# Fix Script: Sleep Freeze + Bluetooth Dropout
# Generated: 2026-03-28
# System: Nobara Linux, kernel 6.19.9, AMD Raven/Picasso iGPU
# ============================================================
# Run this with: sudo bash FIX_sleep_bluetooth_apply.sh
# ============================================================

set -e

echo "=========================================="
echo " FIX A: Switch sleep mode from S3 to s2idle"
echo "=========================================="

# Back up current GRUB config
cp /etc/default/grub /etc/default/grub.bak.$(date +%Y%m%d)
echo "[OK] Backed up /etc/default/grub"

# Add mem_sleep_default=s2idle to kernel parameters
sed -i "s|GRUB_CMDLINE_LINUX_DEFAULT='quiet splash resume=UUID=2cd2fe97-e4b7-4561-b28a-d9cbdc9e7c71'|GRUB_CMDLINE_LINUX_DEFAULT='quiet splash resume=UUID=2cd2fe97-e4b7-4561-b28a-d9cbdc9e7c71 mem_sleep_default=s2idle'|" /etc/default/grub
echo "[OK] Added mem_sleep_default=s2idle to GRUB_CMDLINE_LINUX_DEFAULT"

# Regenerate GRUB config
if [ -f /boot/grub2/grub.cfg ]; then
    grub2-mkconfig -o /boot/grub2/grub.cfg
    echo "[OK] Regenerated /boot/grub2/grub.cfg"
elif [ -f /boot/efi/EFI/nobara/grub.cfg ]; then
    grub2-mkconfig -o /boot/efi/EFI/nobara/grub.cfg
    echo "[OK] Regenerated /boot/efi/EFI/nobara/grub.cfg"
else
    echo "[WARN] Could not find grub.cfg -- you may need to run grub2-mkconfig manually"
    echo "       Try: grub2-mkconfig -o /boot/grub2/grub.cfg"
fi

echo ""
echo "=========================================="
echo " FIX B: Disable Bluetooth USB autosuspend"
echo "=========================================="

# Create udev rule for Realtek Bluetooth adapter (1358:c123)
cat > /etc/udev/rules.d/50-bluetooth-autosuspend.rules << 'UDEV_EOF'
# Disable USB autosuspend for Realtek Bluetooth Radio (1358:c123)
# Prevents BT adapter from being power-cycled, which drops HID connections
ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="1358", ATTR{idProduct}=="c123", ATTR{power/autosuspend}="-1"
UDEV_EOF
echo "[OK] Created /etc/udev/rules.d/50-bluetooth-autosuspend.rules"

# Back up bluetooth main.conf
cp /etc/bluetooth/main.conf /etc/bluetooth/main.conf.bak.$(date +%Y%m%d)
echo "[OK] Backed up /etc/bluetooth/main.conf"

# Uncomment and enable AutoEnable=true in [Policy] section
sed -i 's/^#AutoEnable=true/AutoEnable=true/' /etc/bluetooth/main.conf
echo "[OK] Set AutoEnable=true in /etc/bluetooth/main.conf"

# Reload udev rules
udevadm control --reload-rules && udevadm trigger
echo "[OK] Reloaded udev rules"

echo ""
echo "=========================================="
echo " ALL FIXES APPLIED"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  1. Reboot the system"
echo "  2. After reboot, run: cat /sys/power/mem_sleep"
echo "     You should see: s2idle [deep]  (s2idle should NOT be in brackets)"
echo "     Or better:       [s2idle] deep  (s2idle IS the default now)"
echo "  3. Put the system to sleep and wake it -- it should resume cleanly"
echo "  4. Check MX Ergo stays connected for >10 minutes without drops"
echo ""
