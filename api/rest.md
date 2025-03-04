## What is a REST API?

A REST (Representational State Transfer) API is an architectural style for designing networked applications. It uses standard HTTP methods to interact with resources, making it simple, stateless, and scalable.

## What are the main principles of REST architecture?

1. Statelessness: Each request from a client contains all the information needed; the server does not store session state.
2. Client-Server: Separation of client and server for improved scalability and flexibility.
3. Uniform Interface: Consistent, standardized methods (e.g., HTTP verbs) across resources.
4. Resource-Based: Everything is a resource, accessible through unique URIs.
5. Cacheability: Responses can be cacheable to improve performance.
6. Layered System: Components operate independently, improving scalability.

## What is the difference between REST and SOAP?

| Feature     | REST                           | SOAP                                      |
| ----------- | ------------------------------ | ----------------------------------------- |
| Protocol    | Uses HTTP/HTTPS                | Uses various protocols (HTTP, SMTP, etc.) |
| Data Format | JSON, XML, HTML, etc.          | XML only                                  |
| Simplicity  | Lightweight and simple         | Complex, with strict standards            |
| Performance | Faster due to JSON and caching | Slower due to XML and overhead            |
| Use Case    | Web services, public APIs      | Enterprise-level, secure applications     |

## Explain the purpose of HTTP methods (GET, POST, PUT, PATCH, DELETE).

-   GET: Retrieve data (read-only, safe, idempotent).
-   POST: Create a new resource (not idempotent).
-   PUT: Update/replace a resource (idempotent).
-   PATCH: Partially update a resource (idempotent in some cases).
-   DELETE: Remove a resource (idempotent).

## What is an endpoint in a REST API?

An endpoint is a specific URL where an API can access resources. It is composed of a base URL and a path (e.g., `/api/users`).

## What are resources in REST?

Resources are entities (data) exposed by the API, such as users, products, or orders. Each resource is identified by a unique URI (e.g., `/api/users/1`).

## Explain the difference between PUT and PATCH.

-   PUT: Replaces the entire resource.
-   PATCH: Updates part of the resource.

Example:

-   PUT `/users/1` updates the whole user.
-   PATCH `/users/1` changes specific fields like the user's email.

## When should you use POST vs PUT?

-   POST: To create a new resource (e.g., `POST /users` creates a new user).
-   PUT: To update or replace an existing resource (e.g., `PUT /users/1` updates a user).

## What are the most commonly used HTTP status codes?

-   200 OK: Request successful.
-   201 Created: Resource successfully created.
-   204 No Content: Successful request, no content returned.
-   400 Bad Request: Invalid request by the client.
-   401 Unauthorized: Authentication required.
-   403 Forbidden: Access denied.
-   404 Not Found: Resource not found.
-   500 Internal Server Error: Server-side issue.

## What is idempotency in REST, and which methods are idempotent?

Idempotency means making the same request multiple times results in the same state on the server.

Idempotent Methods: GET, PUT, PATCH (in some cases), DELETE.

## How do you secure a REST API?

-   Use HTTPS to encrypt data.
-   Implement token-based authentication (e.g., JWT, OAuth).
-   Validate and sanitize user input.
-   Rate limiting and throttling.
-   Role-based access control (RBAC).

## What is the difference between authentication and authorization?

-   Authentication: Verifying the user's identity (e.g., logging in).
-   Authorization: Granting permissions to access resources (e.g., user roles).

## Explain OAuth 2.0 and how it is used in REST APIs.

OAuth 2.0 is an industry-standard protocol for secure authorization:

-   Client requests access.
-   Authorization Server verifies identity.
-   Access Token is provided to access protected resources.

## What is token-based authentication (e.g., JWT)?

A system where users authenticate once and receive a token (e.g., JWT) that they use to access API endpoints without re-authenticating.

## How do you prevent CORS issues in REST APIs?

-   Set the correct `Access-Control-Allow-Origin` headers.
-   Use middleware (e.g., CORS in Node.js).
-   Restrict allowed HTTP methods and headers.

## What are some common REST API vulnerabilities (e.g., SQL injection, CSRF, XSS)?

-   SQL Injection: Malicious queries via input fields.
-   CSRF (Cross-Site Request Forgery): Trick users into executing unwanted actions.
-   XSS (Cross-Site Scripting): Injecting malicious scripts into responses.

## What are RESTful best practices?

-   Use meaningful URIs (e.g., `/api/users`).
-   Use HTTP methods appropriately.
-   Return proper status codes.
-   Secure with HTTPS and authentication.

## How do you structure RESTful API URIs?

-   Use nouns for resources (e.g., `/api/products`).
-   Use plural names (e.g., `/api/users`).
-   Use sub-resources for relationships (e.g., `/users/1/orders`).

## What is HATEOAS (Hypermedia as the Engine of Application State)?

A REST principle where responses include links to navigate the API dynamically.

Example:

```json
{
    "user": {
        "id": 1,
        "name": "John",
        "links": [{ "rel": "orders", "href": "/users/1/orders" }]
    }
}
```

## What are query parameters vs. path parameters?

-   Path Parameters: Identify a resource (e.g., `/users/1`).
-   Query Parameters: Filter or modify the request (e.g., `/users?role=admin`).

## How do you handle pagination in a REST API?

Use query parameters:

-   `/products?page=2&limit=20`

Include pagination metadata:

```json
{
  "data": [...],
  "total": 100,
  "page": 2,
  "perPage": 20
}
```

## What is versioning in REST APIs, and what are the common strategies?

-   URI versioning: `/v1/users`
-   Header versioning: `Accept: application/vnd.company.v1`
-   Query parameter versioning: `/users?version=1`

## How do you optimize REST API performance?

-   Use caching.
-   Implement pagination.
-   Compress responses (e.g., gzip).
-   Database indexing.

## What is caching, and how does it improve REST APIs?

Caching stores responses to reduce load and improve speed. Use `Cache-Control` and `ETag` headers.

## What is the role of ETag headers in caching?

`ETag` is a unique identifier for a resource. It helps validate cached responses.

## How can you implement rate limiting in REST APIs?

-   Limit requests per user/IP (e.g., 100 requests/minute).
-   Use headers like `X-RateLimit-Limit`.

## How do you test a REST API?

-   Unit testing.
-   Integration testing.
-   Load testing.

## What are some tools for testing REST APIs? (e.g., Postman, cURL, Swagger)

-   Postman: GUI-based testing.
-   cURL: Command-line tool.
-   Swagger/OpenAPI: Documentation and testing.

## How do you log and monitor REST APIs in production?

-   Use structured logs.
-   Monitor performance metrics.

## What is a microservices architecture, and how does it relate to REST APIs?

A system of small, independent services communicating via REST APIs.

## Explain the differences between REST and GraphQL.

-   REST: Fixed endpoints, multiple requests.
-   GraphQL: Single endpoint, flexible queries.

## What is gRPC, and how is it different from REST?

-   gRPC: Binary protocol, faster, uses HTTP/2.
-   REST: Text-based, easier to integrate.
