import ApolloClient from 'apollo-client'

import { ApolloLink } from 'apollo-link'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'

const link = ApolloLink.from([
  new HttpLink({ uri: process.env['API_URL'] })
])

const client = new ApolloClient({
  link,
  cache: new InMemoryCache()
})

export default client
