#!/usr/bin/env bash

REMOTE_USER="vscode"

# Setup default shell
chsh -s /usr/bin/zsh "${REMOTE_USER}"

# Setup direnv
cat <<EOF >>"/home/${REMOTE_USER}/.bashrc"
eval "\$(direnv hook bash)"
EOF

cat <<EOF >>"/home/${REMOTE_USER}/.zshrc"
eval "\$(direnv hook zsh)"
EOF

# Setup starship
cat <<EOF >>"/home/${REMOTE_USER}/.bashrc"
eval "\$(starship init bash)"
EOF

cat <<EOF >>"/home/${REMOTE_USER}/.zshrc"
eval "\$(starship init zsh)"
EOF

# Setup shell history cache
mkdir -p "/shellhistory"

touch "/shellhistory/.bash_history"
touch "/shellhistory/.zsh_history"

chown -R "${REMOTE_USER}:" "/shellhistory"

cat <<EOF >>"/home/${REMOTE_USER}/.bashrc"
export HISTFILE='/shellhistory/.bash_history'
EOF

cat <<EOF >>"/home/${REMOTE_USER}/.zshrc"
export HISTFILE='/shellhistory/.zsh_history'
EOF

# Setup trunk cache
mkdir -p "/trunk"

chown -R "${REMOTE_USER}:" "/trunk"

cat <<EOF >>"/home/${REMOTE_USER}/.bashrc"
export TRUNK_CACHE='/trunk'
EOF

cat <<EOF >>"/home/${REMOTE_USER}/.zshrc"
export TRUNK_CACHE='/trunk'
EOF
