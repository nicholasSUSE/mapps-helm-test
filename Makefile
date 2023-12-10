helm package charts/CH1 -d packages && \
helm package charts/CH2 -d packages && \
helm repo index --url https://github.com/nicholasSUSE/mapps-helm-test .