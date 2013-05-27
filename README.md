## Bookings

### Overview

This app tracks bookings for a set of engineers and a set of clients. Each booking has an engineer, a client and a cost. Engineers each have a name and associated clients, and clients each have a name and associated engineers.

### Implementation Details

The engineer and client resources were created independently and each have their independent CRUD activities. The booking resource was created next with belongs to relationships to engineer and client. Each booking has access to all clients and all engineers. Since the clients and engineers are independent of each other and of the bookings, deleting a booking does not delete clients or engineers. After validation of cost was added to the booking, the last step was adding the has many through relationship to the engineer and client so that all associated clients are displayed on the individual page for the engineer and all associated engineers are displayed on the individual page for the client.