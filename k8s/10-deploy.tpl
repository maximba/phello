apiVersion: apps/v1
kind: Deployment
metadata:
  name: phello
  namespace: mmartin
spec:
  replicas: 1
  selector:
    matchLabels:
      app: phello
  template:
    metadata:
      labels:
        app: phello
    spec:
      containers:
      - name: phello
        image: __IMAGE_NAME__