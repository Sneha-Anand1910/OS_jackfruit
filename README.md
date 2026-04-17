# OS Jackfruit Project

## 📌 Overview
This project contains system-level programs developed in C for Linux. It demonstrates concepts like CPU usage, memory consumption, I/O operations, and kernel module interaction.

---

## 📂 Files Description

- `cpu_hog.c`  
  Simulates high CPU usage.

- `memory_hog.c`  
  Consumes system memory intentionally.

- `io_pulse.c`  
  Generates I/O load on the system.

- `engine.c`  
  Main driver program to execute different modules.

- `monitor.c`  
  Kernel module to monitor system activity.

- `monitor_ioctl.h`  
  Header file for communication with the monitor module.

- `setup_rootfs.sh`  
  Script to set up the root file system.

- `Makefile`  
  Used to compile all programs.

---

## ⚙️ How to Compile

```bash
make
```

---

## ▶️ How to Run

### Load kernel module:
```bash
sudo insmod monitor.ko
```

### Run engine:
```bash
./engine
```

### Remove module:
```bash
sudo rmmod monitor
```

---

##  Requirements
- Linux OS (Ubuntu recommended)
- GCC compiler
- Root privileges (for kernel module)

---

##  Concepts Used
- System calls
- Kernel modules
- CPU & Memory management
- I/O handling


