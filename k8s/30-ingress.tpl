apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: phello
  namespace: mmartin
  annotations:
    kubernetes.io/tls-acme: "true"
    kubernetes.io/ingress.class: "nginx"
spec:
  tls:
  - hosts:
    - __HOST_NAME__
    secretName: tls-gitlab-bxsoft
  rules:
  - host: __HOST_NAME__
    http:
      paths:
      - path: /
        backend:
          serviceName: phello
          servicePort: 8013

