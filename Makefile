helm:
	helm package charts/CH1 -d packages && \
	helm package charts/CH2 -d packages && \
	helm package charts/CH3 -d packages && \
	helm package charts/CH4 -d packages && \
	helm package charts/CH5 -d packages && \
	helm package charts/CH6 -d packages && \
	helm package charts/CH7 -d packages && \
	helm package charts/CH8 -d packages && \
	helm package charts/CH9 -d packages && \
	helm package charts/CH10 -d packages && \
	helm package charts/CH11 -d packages && \
	helm package charts/CH12 -d packages && \
	helm package charts/CH13 -d packages && \
	helm package charts/CH14 -d packages && \
	helm package charts/CH15 -d packages && \
	helm repo index --url https://github.com/nicholasSUSE/mapps-helm-test .