## What is an API?

An API (Application Programming Interface) is a set of rules and protocols that allows different software applications to communicate with each other. It defines methods and data formats applications can use to request and exchange information.

## What are the different types of APIs?

- Open APIs (Public APIs): Available to external developers and third parties.

- Internal APIs (Private APIs): Restricted to internal systems and teams.

- Partner APIs: Shared with specific business partners with controlled access.

- Composite APIs: Combine multiple API calls into a single request for efficiency.

## What is the difference between synchronous and asynchronous APIs?

- Synchronous APIs: The client waits for the server to respond before continuing execution.

- Asynchronous APIs: The client does not wait; it receives the response later through callbacks or events.

## What is an API endpoint?

An API endpoint is a specific URL where an API provides access to a particular resource or service.
For example: https://api.example.com/users.

## What is an API key?

An API key is a unique identifier used to authenticate and authorize access to an API.
It is typically passed in the request header or as a query parameter.

## What is an API rate limit?

API rate limiting controls how many requests a client can make to an API within a specified time.
This protects servers from being overwhelmed and ensures fair usage.

## What are webhooks?

Webhooks are automated messages sent by an API to notify external services about events.
They enable real-time communication by sending POST requests to a specified endpoint.

## What is the difference between REST APIs and SOAP APIs?

- REST APIs: Use HTTP methods (GET, POST, etc.), lightweight, and commonly use JSON.

- SOAP APIs: Use XML format, follow a strict protocol (WS-Security), and are more complex.

## What is an API gateway?

An API gateway is an intermediary that manages and routes API requests.
It handles authentication, rate limiting, caching, and request transformation.

## What is API documentation?

API documentation provides detailed information about how to use the API, including available endpoints, request/response formats, authentication methods, and example code.

## What are the common API authentication methods?

- API Keys

- OAuth 2.0

- Basic Authentication

- Bearer Tokens

- JWT (JSON Web Tokens)

## What is an SDK?

An SDK (Software Development Kit) is a collection of tools, libraries, and documentation that helps developers interact with an API and integrate it into their applications.

## What is an API version?

API versioning allows managing changes without breaking existing client applications. Common strategies include versioning via URL (/v1/users), headers, or query parameters.

## What are microservices?

Microservices are an architectural style where applications are broken into small, independent services.
Each service handles a specific business function and communicates via APIs.

## What is GraphQL?

GraphQL is a query language for APIs that allows clients to request exactly the data they need.
It provides a flexible alternative to REST APIs by combining multiple resources in a single query.

## What is gRPC?

gRPC (gRPC Remote Procedure Call) is a high-performance framework for remote communication.
It uses Protocol Buffers (protobuf) for serialization and supports multiple languages.

## What is API throttling?

API throttling controls the rate of incoming requests to prevent abuse and overuse.
It can be enforced at different levels, such as per user or per IP address.

## What is a RESTful API?

A RESTful API follows REST (Representational State Transfer) principles, using stateless communication, resource-based URLs, and HTTP methods for CRUD operations.

## What is API mocking?

API mocking simulates API responses without calling the actual service.
It is useful for testing and development when the real API is unavailable.

## What are idempotent methods in APIs?

Idempotent methods produce the same result no matter how many times the request is repeated. Examples: GET, PUT, DELETE. Non-idempotent: POST.

## How do you monitor API performance?

Monitoring API performance involves tracking metrics like response times, error rates, and throughput using tools like Prometheus, Grafana, or API Gateway analytics.

## What is the difference between public and private APIs?

-- Public APIs: Accessible to external developers and third parties.

-- Private APIs: Restricted to internal use within an organization.

## What is an API response payload?

An API response payload is the data returned by the API in response to a client request.
It usually comes in JSON or XML format.

## How do you ensure backward compatibility in APIs?

Maintain backward compatibility by versioning the API, avoiding breaking changes,
and deprecating old features gradually with clear documentation.

## What are RESTful best practices?

Use clear and consistent naming for resources.

Implement proper HTTP methods and status codes.

Secure APIs with authentication and authorization.

Use pagination and filtering for large datasets.

Provide detailed API documentation.

## What is API pagination?

API pagination handles large datasets by breaking them into smaller pages.
Common techniques include using limit and offset parameters or cursors.

## What is a callback URL?

A callback URL is the endpoint where an API sends asynchronous responses or event notifications.
It is commonly used in OAuth flows and webhooks.
