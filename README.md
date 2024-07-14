# docker-sshd-example
An example of starting sshd with Docker.

For documentation, see 『[Docker: 開発用コンテナで sshd を起動してサーバー化する](https://zenn.dev/wsuzume/articles/7e61ed60bb8e78)』.

# Usage
If you want to introduce the feature into your environment, you can easily install it as follows.

```
[Dockefile]
---

COPY ./easy-install.sh /utils/
RUN /utils/easy-install.sh

COPY ./second-hook.d/ /usr/local/bin/second-hook.d/

# Configure container entrypoint
ENTRYPOINT ["tini", "-g", "--"]
```