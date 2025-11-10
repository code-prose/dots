#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Homebrew is installed
check_homebrew() {
    if ! command -v brew &> /dev/null; then
        print_error "Homebrew is not installed. Please install it first:"
        echo "Visit https://brew.sh/ or run:"
        echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
        exit 1
    fi
    print_success "Homebrew is installed"
}

# Install packages via Homebrew
install_packages() {
    print_info "Installing required packages via Homebrew..."

    local packages=(
        "ripgrep"
        "fzf"
        "neovim"
        "tmux"
        "git"
        "zsh"
        "eza"
        "zoxide"
        "neofetch"
        "node"
        "go"
    )

    for package in "${packages[@]}"; do
        if brew list "$package" &> /dev/null; then
            print_success "$package is already installed"
        else
            print_info "Installing $package..."
            brew install "$package"
            print_success "$package installed"
        fi
    done

    if brew list --cask alacritty &> /dev/null; then
        print_success "alacritty is already installed"
    else
        print_info "Installing alacritty..."
        brew install --cask alacritty
        print_success "alacritty installed"
    fi

    print_info "Installing FiraCode Nerd Font..."
    brew tap homebrew/cask-fonts 2> /dev/null || true
    if brew list --cask font-fira-code-nerd-font &> /dev/null; then
        print_success "font-fira-code-nerd-font is already installed"
    else
        brew install --cask font-fira-code-nerd-font
        print_success "font-fira-code-nerd-font installed"
    fi
}

install_tpm() {
    print_info "Installing Tmux Plugin Manager (TPM)..."
    local tpm_dir="$HOME/.tmux/plugins/tpm"

    if [ -d "$tpm_dir" ]; then
        print_warning "TPM is already installed at $tpm_dir"
        read -p "Do you want to update it? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_info "Updating TPM..."
            git -C "$tpm_dir" pull
            print_success "TPM updated"
        fi
    else
        git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
        print_success "TPM installed"
    fi
}

link_tmux_config() {
    print_info "Linking tmux configuration..."
    local tmux_conf="$HOME/.tmux.conf"
    local source_conf="$HOME/.config/tmux/.tmux.conf"

    if [ -f "$tmux_conf" ] && [ ! -L "$tmux_conf" ]; then
        print_warning "Backing up existing .tmux.conf to .tmux.conf.backup"
        mv "$tmux_conf" "$tmux_conf.backup"
    fi

    if [ -L "$tmux_conf" ]; then
        print_warning "Removing existing symlink"
        rm "$tmux_conf"
    fi

    ln -sf "$source_conf" "$tmux_conf"
    print_success "Tmux configuration linked"
}

setup_zsh() {
    print_info "Setting up zsh configuration..."
    local zshrc="$HOME/.zshrc"

    if [ -f "$zshrc" ] && grep -q "Source custom zsh configs" "$zshrc"; then
        print_success "Zsh configuration already setup in .zshrc"
        return
    fi

    if [ -f "$zshrc" ] && [ ! -L "$zshrc" ]; then
        print_warning "Backing up existing .zshrc to .zshrc.backup"
        cp "$zshrc" "$zshrc.backup"
    fi

    print_info "Adding custom zsh config sourcing to .zshrc..."
    cat >> "$zshrc" << 'EOF'

# Source custom zsh configs
for config_file in ~/.config/zshrc/*.zsh; do
  [ -f "$config_file" ] && source "$config_file"
done
EOF

    print_success "Zsh configuration setup complete"
}

make_scripts_executable() {
    print_info "Making scripts executable..."
    chmod +x "$HOME/.config/tmux/scripts/tmux-sessionizer"
    print_success "Scripts are now executable"
}

install_tmux_plugins() {
    print_info "Installing tmux plugins..."

    if ! command -v tmux &> /dev/null; then
        print_warning "Tmux is not installed. Skipping plugin installation."
        return
    fi

    print_info "Starting tmux server and installing plugins..."

    tmux start-server
    tmux new-session -d -s setup_session

    if [ -f "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]; then
        "$HOME/.tmux/plugins/tpm/bin/install_plugins"
        print_success "Tmux plugins installed"
    else
        print_warning "TPM install script not found. You may need to manually install plugins with Ctrl-a + I"
    fi

    tmux kill-session -t setup_session 2> /dev/null || true
}

install_nvim_plugins() {
    print_info "Installing Neovim plugins..."

    if ! command -v nvim &> /dev/null; then
        print_warning "Neovim is not installed. Skipping plugin installation."
        return
    fi

    print_info "This may take a few minutes..."
    nvim --headless "+Lazy! sync" +qa
    print_success "Neovim plugins installed"
}

# Main setup function
main() {
    echo -e "${GREEN}   Dotfiles Setup Script${NC}"
    echo ""

    check_homebrew

    read -p "Do you want to install all required packages? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install_packages
    else
        print_warning "Skipping package installation"
    fi

    install_tpm
    link_tmux_config
    setup_zsh
    make_scripts_executable

    read -p "Do you want to install tmux plugins now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install_tmux_plugins
    else
        print_warning "Skipping tmux plugin installation. Run 'Ctrl-a + I' in tmux later."
    fi

    read -p "Do you want to install Neovim plugins now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install_nvim_plugins
    else
        print_warning "Skipping Neovim plugin installation. Plugins will install on first launch."
    fi

    echo ""
    echo -e "${GREEN}   Setup Complete!${NC}"
    echo ""
    print_info "Next steps:"
    echo "  1. Restart your terminal or run: source ~/.zshrc"
    echo "  2. Open tmux and press 'Ctrl-a + I' if you skipped plugin installation"
    echo "  3. Open nvim to complete plugin installation if you skipped it"
    echo ""
}

# Run main function
main
