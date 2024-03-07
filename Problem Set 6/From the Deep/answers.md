# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

This approach of horizontal scaling is more common for programmers who want to safeguard data, and it can be more secure in case data on one server gets corrupted.
Pros: if one of those servers (boats, in our case) fails, some of the data can be recovered from other servers (boats).
Cons: it requires more resources, both financial and time-wise, as more servers (boats) need to be purchased and more time is needed to write additional code.

## Partitioning by Hour

Pros: easy to locate data and modify specific parts or the entire code according to the observation time frame. Facilitates data retrieval and modification, particularly during real-time monitoring scenarios.
Cons: data loss is more likely, especially for specific observation periods. If a server fails, it may be impossible to access data stored on that server.

## Partitioning by Hash Value

Pros: using hash functions can store data more securely. It also likely allows for faster uploading and extracting of data. If some observations are lost, it will only be lost in small parts, which allows for making intire observation using the remaining observations.
Cons: it may require more time and effort in coding, as programmers need to use hash functions to convert timestamps to hash values and back. It could also lead to buggy code and mistakes in writing the code.
