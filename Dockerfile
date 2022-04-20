FROM debian:stable-slim
# Install neovim
RUN apt-get update && \
    apt-get install -y neovim

# Install plugins
COPY install_plugins.sh /usr/local/sbin/install_plugins.sh
RUN chmod +x /usr/local/sbin/install_plugins.sh && \
    /usr/local/sbin/install_plugins.sh

# Set nvim init script
COPY init.vim /root/.config/nvim/init.vim

ENV PATH=$PATH:/usr/local/go/bin
ENTRYPOINT ["/usr/bin/nvim"]
