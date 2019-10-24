apiVersion: apps/v1
kind: Deployment
metadata:
  name: phello
  annotations:
    flux.weave.works/automated: "true"
    flux.weave.works/tag.phello: regexp:^((?!tmp).)*$
spec:
  selector:
    matchLabels:
      app: phello
  template:
    metadata:
      labels:
        app: phello
    spec:
      containers:
      - name: hello
        image: __IMAGE_NAME__
