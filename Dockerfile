FROM debian:stable-slim
# Install neovim
RUN apt-get update && \
    apt-get install -y tmux neovim && \
    apt-get install -y curl git build-essential

# Install plugins
COPY install_plugins.sh /usr/local/sbin/install_plugins.sh
RUN chmod +x /usr/local/sbin/install_plugins.sh && \
    /usr/local/sbin/install_plugins.sh

# Set nvim init script
COPY init.vim /root/.config/nvim/init.vim

# Include go in PATH
ENV PATH=$PATH:/usr/local/go/bin

# Copy entrypoint
COPY entrypoint.sh /usr/local/sbin/entrypoint.sh
RUN chmod +x /usr/local/sbin/entrypoint.sh

ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]
