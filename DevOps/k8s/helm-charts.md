Helm-Charts
-----------------
## Helm Charts Objects
In Helm charts, an "object" is essentially a data structure that contains key-value pairs. These objects represent the different configuration elements that Helm uses when generating Kubernetes resource files. Helm's templating system provides several predefined objects (like `.Values`, `.Chart`, `.Release`, etc.) that you can use to customize your templates based on dynamic values.

Here are the main predefined objects in Helm charts:

1. **`.Values`**: Represents the content of `values.yaml`, which contains configuration data you can pass to the templates. For example, `{{ .Values.image.tag }}` accesses the `image.tag` field in `values.yaml`.

2. **`.Chart`**: Contains metadata about the chart itself, like its name, version, and description. For instance, `{{ .Chart.Name }}` gives the name of the chart.

3. **`.Release`**: Contains metadata about the Helm release, such as its name and namespace. For example, `{{ .Release.Name }}` will return the release name assigned by Helm.

4. **`.Capabilities`**: Provides information about the Kubernetes cluster's capabilities, allowing you to write templates compatible with different versions of Kubernetes.

5. **`.Template`**: Refers to metadata about the template, such as its name, which can be useful for debugging or conditional rendering.

These objects are accessible within templates (files ending in `.yaml` within the `templates` folder) and make it possible to dynamically adjust resources based on variables in the `values.yaml` or provided at install time. This object-oriented approach allows for modular and customizable configurations in Kubernetes deployments.