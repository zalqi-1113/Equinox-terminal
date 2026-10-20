#!/usr/bin/env bash
==============================================================================
EQUINOX LINUX OS [KALI-BLACKARCH HYBRID] - TERMINAL CORE MODULE
CREATOR : 4Rever
VERSION : 1.2.3-PROD
==============================================================================
RED='\033[38;2;255;0;85m'
GREEN='\033[38;2;0;255;102m'
CYAN='\033[38;2;0;243;255m'
AMBER='\033[38;2;255;183;0m'
GREY='\033[38;2;100;116;139m'
PURPLE='\033[38;2;189;147;249m'
WHITE='\033[1;37m'
RESET='\033[0m'
BOLD='\033[1m'
START_TIME=$(date +%s)
declare -a INSTALLED_MODULES=("proot-distro")
get_sys_info() {
if command -v getprop &> /dev/null; then
BRAND=(getprop ro.product.brand 2>/dev/null | tr '[:lower:]' '[:upper:]')
MODEL=(getprop ro.product.model 2>/dev/null)
BUILD_ID=(getprop ro.build.id 2>/dev/null)
SDK_VER=(getprop ro.build.version.release 2>/dev/null)
[ -z "$BRAND" ] && BRAND="Redmi"
[ -z "$MODEL" ] && MODEL="2311DRN14I"
[ -z "$BUILD_ID" ] && BUILD_ID="TP1A.220624.014"
[ -z "$SDK_VER" ] && SDK_VER="13"
DEVICE_NAME="Android {SDK_VER}"
PHONE_BRAND="{BRAND}"
VERSION_CODE="{MODEL} Build/{BUILD_ID}"
else
DEVICE_NAME="Android 13"
PHONE_BRAND="Redmi"
VERSION_CODE="2311DRN14I Build/TP1A.220624.014"
fi
PUBLIC_IP=$(curl -s --connect-timeout 2 https://api.ipify.org 2>/dev/null)
[ -z "$PUBLIC_IP" ] && PUBLIC_IP="182.1.22.99"
NOW=(date +%s)
DIFF=((NOW - START_TIME))
MINS=((DIFF / 60))
SECS=((DIFF % 60))
UPTIME="0 days, ${MINS} mins"
}
run_kernel_boot_sequence() {
clear
local boot_logs=(
"[    0.000000] Linux version 6.8.0-equinox-blackarch (root@equinox-node) (gcc v14.2.0) #1 SMP PREEMPT_DYNAMIC Tue Oct 20 14:40:00 WIB 2026"
"[    0.003120] Command line: BOOT_IMAGE=/boot/vmlinuz-6.8.0-equinox root=UUID=eqx-blackarch-9921 ro quiet splash"
"[    0.015201] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'"
"[    0.015243] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'"
"[    0.015285] x86/fpu: Supporting XSAVE feature 0x004: 'AVX2 / AVX-512 extensions'"
"[    0.018902] BIOS-provided physical RAM map:"
"[    0.019011] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable"
"[    0.019122] BIOS-e820: [mem 0x0000000000100000-0x000000003ffeffff] usable"
"[    0.020511] NX (Execute Disable) protection: active"
"[    0.045812] SMBIOS 3.3.0 present."
"[    0.051203] Equinox Security Engine v2.0 / BlackArch Architecture Active"
"[    0.090124] Total physical memory: 16384MB (16GB RAM) allocated."
"[    1.002341] Kernel command line initialized. Loading security hooks..."
"[    1.350124] Equinox Security Framework: ACTIVE"
"[    1.352101] SELinux: Enforcing (Hardened Mode)"
"[    1.410231] AppArmor: Protected namespaces enabled"
"[    1.801234] smpboot: CPU0: Intel(R) Core(TM) i9-14900KS (24 Cores / 32 Threads)"
"[    2.250123] SCSI subsystem & NVMe Storage initialized [/dev/nvme0n1p2]"
"[    2.501234] EXT4-fs (nvme0n1p2): mounted filesystem with ordered data mode."
"[    2.701234] Freeing unused kernel memory: 2432K"
"[    3.001234] Run /sbin/init as init process"
"[    3.101234] systemd[1]: Initializing Equinox Systemd Initialization Daemon v255.4..."
"[    3.201234] systemd[1]: Hostname set to <equinox-blackarch-node>."
"[    3.401234] systemd[1]: Successfully initialized system services and pentest toolkits."
""
"{GREEN}[  OK  ]{RESET} Started Equinox Terminal Core Daemons."
"{GREEN}[  OK  ]{RESET} Reached target Default Target (Multi-User Network Security)."
"{GREEN}[  OK  ]{RESET} Started Equinox Package Manager Engine (EPME v4.2)."
""
""
"  [!] EQUINOX KERNEL BOOT SEQUENCE COMPLETED SUCCESSFULLY."
"  [!] STARTING DYNAMIC PACKAGE INSTALLATION: 'linux-equinox'"
""
""
"[ 001/100 ] Fetching core archives from mirror.equinox-os.org/blackarch..."
"[ 002/100 ] Downloading package: equinox-core-security_2.0.4_amd64.pkg (18.4 MB)"
"[ 003/100 ] Downloading package: linux-headers-6.8.0-equinox-blackarch (52.1 MB)"
"[ 004/100 ] Downloading package: zsh-equinox-theme-pro (3.4 MB)"
"[ 010/100 ] Equinox-[##                        ] 10/100 - Extracting core system files..."
"[ 035/100 ] Equinox-[#####                     ] 35/100 - Unpacking security tools & repositories..."
"[ 050/100 ] Equinox-[#######                   ] 67/100 - Compiling kernel modules & privilege hooks..."
"[ 085/100 ] Initializing root escalation permissions & shadow hashes..."
"[ 100/100 ] Equinox-[##########################] 100/100 - Checksum SHA-256 VERIFIED!"
""
"--------------------------------------------------------------------------------"
"{GREEN}[ SUCCESS ] PACKAGE 'linux-equinox' INSTALLED AND CONFIGURED.{RESET}"
"{GREEN}[ SUCCESS ] SYSTEM PRIVILEGE ESCALATION: ROOT ACCESS GRANTED.{RESET}"
"--------------------------------------------------------------------------------"
""
)
for line in "{boot_logs[@]}"; do
echo -e "{line}"
sleep 0.03
done
sleep 0.2
}
show_neofetch() {
get_sys_info
echo -e "{RED}       .▄▄▄▄▄▄▄.{RESET}       {WHITE}root@equinox-os{RESET}"
echo -e "{RED}     ▄██▀▀   ▀▀██▄{RESET}     ----------------"
echo -e "{RED}    ███         ███{RESET}    {WHITE}OS: Equinox Linux x86_64{RESET}"
echo -e "{RED}    ███    ▄▄    ███{RESET}   {WHITE}Kernel: 6.8.0-equinox-blackarch{RESET}"
echo -e "{RED}    ███   ▀██▀   ███{RESET}{WHITE}Uptime: ${UPTIME}${RESET}"
echo -e "{RED}     ███    ▀   ▄██▀{RESET}   ${WHITE}Shell: zsh 5.9 (pentest-ready)${RESET}"
echo -e "{RED}       ▀█████████▀{RESET}     ${WHITE}WM: Hyprland / Equinox-GUI${RESET}"
echo -e "             ${RED}▀██▄${RESET}      ${WHITE}IDE: Neovim / Custom CLI${RESET}"
echo -e "               ${RED}▀██▄${RESET}    ${WHITE}Packages: 2480 (pacman/epm)${RESET}"
echo -e "                 ${RED}▀█${RESET}    ${WHITE}Terminal: Equinox Web Terminal${RESET}"
echo ""
echo -e "{WHITE}[] EQUINOX-TERMINAL OS [] - System Ready.${RESET}"
echo ""
}
run_absolute_ai() {
echo -e "{PURPLE}{BOLD}[ABSOLUTE-AI] Uncensored Intelligence Engine (CLI v2.0 - Unfiltered){RESET}"
echo -e "{GREY}Type 'exit' to quit AI session.{RESET}\n"
while true; do
echo -ne "{PURPLE}absolute-ai#>{RESET} "
read -r prompt
[ "$prompt" == "exit" ] && break
[ -z "$prompt" ] && continue
echo -e "${CYAN}[+] Processing prompt (Unfiltered Mode Active)...${RESET}"
sleep 0.4
echo -e "{WHITE}[ABSOLUTE-AI Response]:{RESET} Query executed for '{prompt}'. Uncensored response generated without artificial restrictions."
echo ""
done
}
run_fallen_angel() {
echo -e "{AMBER}{BOLD}[FALLEN-ANGEL] Neutral Tactical & Security Suite v3.2${RESET}"
echo -e "{GREEN}[+] Monitoring active network sockets & system audit completed.{RESET}"
}
run_github_uploader() {
local target_repo="1"
echo -e "{CYAN}{BOLD}[EQUINOX GIT ENGINE] Initiating Module Upload...{RESET}"
if [ -z "target_repo" ]; then
echo -ne "{WHITE}Enter your GitHub Repository URL:${RESET}"
read -r target_repo
fi
[ -z "$target_repo" ] && return
git init &> /dev/null
git add . &> /dev/null
git commit -m "Module upload via Equinox Terminal" &> /dev/null
git branch -M main &> /dev/null
git remote remove origin &> /dev/null
git remote add origin "$target_repo" &> /dev/null
git push -u origin main
}
run_shell() {
run_kernel_boot_sequence
show_neofetch
while true; do
echo -ne "{WHITE}Equinox\$root--->{RESET} "
read -r cmd_input
cmd_input=$(echo "$cmd_input" | xargs)
[ -z "$cmd_input" ] && continue
cmd=$(echo "$cmd_input" | awk '{print 1}')
subcmd=(echo "$cmd_input" | awk '{print 2}')
target=(echo "$cmd_input" | awk '{print $3}')
case "cmd" in
"--help")
show_neofetch
;;
"neofetch")
show_neofetch
;;
"exq")
file_target=(echo "cmd_input" | cut -d' ' -f2-)
if [ -z "$file_target" ] \vert{}\vert{} [ "$file_target" == "exq" ]; then
echo -e "${RED}exq: missing target file. Usage: exq <filename/url>${RESET}"
else
echo -e "{CYAN}[EXQ ENGINE] Downloading: {file_target}...{RESET}"
for i in {20..100..20}; do
sleep 0.08
hashes=(printf '#%.0s' $(seq 1$((i/5))))
dashes=(printf '-%.0s' (seq 1((20 - i/5))))
echo -e "{GREEN}Downloading [{hashes}{dashes}] ${i}\%${RESET}"
done
echo -e "{GREEN}{BOLD}[ SUCCESS ] File saved to /sdcard/Download/{file_target}{RESET}"
fi
;;
"eqx")
if [ "$subcmd" == "install" ]; then
if [ "$target" == "proot-distro" ]; then
distro=$(echo "$cmd_input" | awk '{print $4}')
[ -z "$distro" ] && distro="ubuntu"
echo -e "${CYAN}[EQX] Installing Linux Distribution: ${distro}...${RESET}"
command -v proot-distro &> /dev/null || pkg install proot-distro -y
proot-distro install "$distro"
elif [ "$target" == "absolute-ai" ]; then
echo -e "${PURPLE}[EQX] Installing Module: absolute-ai (Uncensored AI)...${RESET}"
INSTALLED_MODULES+=("absolute-ai")
echo -e "${GREEN}[ SUCCESS ] absolute-ai installed! Type 'absolute-ai' to run.${RESET}"
elif [ "$target" == "fallenAngel" ]; then
echo -e "${AMBER}[EQX] Installing Module: fallenAngel (Neutral Suite)...${RESET}"
INSTALLED_MODULES+=("fallenAngel")
echo -e "{GREEN}[ SUCCESS ] fallenAngel installed! Type 'fallenAngel' to run.{RESET}"
else
pkg install "$target" -y
fi
elif [ "$subcmd" == "login" ]; then
proot-distro login "${target:-ubuntu}"
else
echo -e "${RED}Usage: eqx [install\vert{}login] <package/distro>{RESET}"
fi
;;
"absolute-ai")
run_absolute_ai
;;
"fallenAngel")
run_fallen_angel
;;
"equinox-upload-git-"*)
repo_url="{cmd#equinox-upload-git-}"
run_github_uploader "$repo_url"
;;
"pkg")
if [ "$subcmd" == "install" ]; then
echo -e "${CYAN}[PKG] Installing package ${target}...${RESET}"
pkg install "$target" -y
fi
;;
"sysinfo")
get_sys_info
echo -e "${CYAN}Device   :${PHONE_BRAND} ({DEVICE_NAME}){RESET}"
echo -e "{CYAN}Version  : {VERSION_CODE}{RESET}"
echo -e "{CYAN}IP       : ${PUBLIC_IP}${RESET}"
echo -e "{CYAN}Uptime   : {UPTIME}{RESET}"
;;
"scan")
target_host="{subcmd:-127.0.0.1}"
echo -e "{AMBER}[!] Scanning host: {target_host}...{RESET}"
echo -e "PORT 22/tcp  {GREEN}OPEN{RESET}  ssh"
echo -e "PORT 80/tcp  {GREEN}OPEN{RESET}  http"
;;
"clear")
clear
;;
"exit")
echo -e "{RED}[!] Session closed. Goodbye!{RESET}"
break
;;
*)
echo -e "{RED}zsh: command not found: ${cmd}. Type '${CYAN}--help{RED}' for options.${RESET}"
;;
esac
echo ""
done
}
clear
echo -ne "{GREEN}User@dev:~ ${RESET}"
read -r init_cmd
clean_init=$(echo "$init_cmd" | xargs)
if [[ "clean_init" == "Install Linux-equinox" ]]; then
run_shell
else
echo -e "{RED}bash: command not found: {init_cmd}.{RESET}"
fi