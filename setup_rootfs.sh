#!/bin/bash
# setup_rootfs.sh - Creates minimal chroot environments for the container runtime
# Run from inside ~/container-runtime as: bash setup_rootfs.sh

set -e
WORKDIR="$(pwd)"

echo "==> Setting up rootfs directories in $WORKDIR"

for ROOTFS in rootfs-base rootfs-alpha rootfs-beta; do
    mkdir -p "$ROOTFS"/{bin,lib,lib64,proc,tmp,dev}
    # Copy busybox static binary as the shell
    cp /bin/busybox "$ROOTFS/bin/busybox"
    chmod +x "$ROOTFS/bin/busybox"
    ln -sf busybox "$ROOTFS/bin/sh"
    echo "  [OK] $ROOTFS shell ready"
done

echo ""
echo "==> Compiling workload binaries as STATIC (so they work inside chroot)"

gcc -Wall -O2 -static -o rootfs-alpha/cpu_hog    cpu_hog.c
gcc -Wall -O2 -static -o rootfs-alpha/memory_hog memory_hog.c
gcc -Wall -O2 -static -o rootfs-beta/io_pulse    io_pulse.c
gcc -Wall -O2 -static -o rootfs-beta/cpu_hog     cpu_hog.c   # needed for nice demo

echo "  [OK] cpu_hog    -> rootfs-alpha/cpu_hog"
echo "  [OK] memory_hog -> rootfs-alpha/memory_hog"
echo "  [OK] io_pulse   -> rootfs-beta/io_pulse"
echo "  [OK] cpu_hog    -> rootfs-beta/cpu_hog"
echo ""
echo "==> All rootfs ready!"
ls -lh rootfs-alpha/ rootfs-beta/ rootfs-base/bin/ 2>/dev/null || true
