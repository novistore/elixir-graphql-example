import client from 'gql/client'
import cloneDeep from 'lodash/cloneDeep'

import createReviewMutation from 'mutations/review/create'

export const actions = {
  async create (store, input) {
    const {data} = await client.mutate({
      mutation: createReviewMutation,
      variables: { input }
    })

    return cloneDeep(data.review)
  }
}

export const namespaced = true
